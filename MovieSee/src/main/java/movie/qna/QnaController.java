package movie.qna;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import movie.common.paging.commonPaging;


@Controller // 현재 클래스를 컨트롤러 빈(bean)으로 등록
@RequestMapping("/qna")
public class QnaController {

	Logger log = Logger.getLogger(this.getClass());

	@Inject
	private QnaService qnaService;

	// 글 목록
	@RequestMapping(value = "/qnaList.see")
	// @RequestParam(defaultValue="") ==> 기본값 할당 : 현재페이지를 1로 초기화
	public ModelAndView QnaList(@RequestParam(defaultValue = "qna_subject") String searchOption,
			@RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "1") int curPage)
			throws Exception {

		// 레코드의 갯수 계산
		int count = qnaService.count(searchOption, keyword);

		// 페이지 나누기 관련 처리
		commonPaging c_Paging = new commonPaging(count, curPage);
		int start = c_Paging.getPageBegin();
		int end = c_Paging.getPageEnd();

		List<QnaModel> qnaList = qnaService.QnaListAll(start, end, searchOption, keyword);

		// 데이터를 맵에 저장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("qnaList", qnaList);
		map.put("count", count);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("c_Paging", c_Paging);

		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map); // 맵에 저장된 데이터를 mav에 저장
		mav.setViewName("adminQnaList");

		return mav;
	}

	// 게시글 작성 화면
	// RequestMapping("qna/qnaWrite.see")
	// value="", method="전송방식"
	@RequestMapping(value = "/qnaWrite.see", method = RequestMethod.GET)
	public String QnaWriteForm() {
		return "adminQnaWrite"; // tiles 이름이 adminQnaWrite 로 이동
	}

	// 게시글 작성 처리
	@RequestMapping(value = "/qnaWrite.see", method = RequestMethod.POST)
	public ModelAndView QnaWrite(@ModelAttribute("qnaModel") QnaModel qnaModel) throws Exception {

		/*
		 * MultipartFile multipartFile =
		 * multipartHttpServletRequest.getFile("qna_orgfile");
		 * 
		 * log.info("파일이름 :" + multipartFile.getOriginalFilename()); log.info("파일크기 : "
		 * + multipartFile.getSize()); log.info("컨텐트 타입 : " +
		 * multipartFile.getContentType());
		 * 
		 * //String path =
		 * multipartHttpServletRequest.getSession().getServletContext().getRealPath(
		 * "/uploads/qna/"); String path = "C:/Java/upload"; String fullName = "";
		 * 
		 * 
		 * try {
		 * 
		 * // uuid 생성(Universal Unique IDentifier, 범용 고유 식별자) UUID uuid =
		 * UUID.randomUUID();
		 * 
		 * String qna_savfile = "qnaImg" + "_" + uuid.toString() + "_"; String
		 * qna_orgfile = multipartFile.getOriginalFilename();
		 * 
		 * System.out.println("qna_orgfile : " + qna_orgfile);
		 * System.out.println("qna_savfile : " + qna_savfile);
		 * 
		 * if (qna_orgfile != null && ! qna_orgfile.equals("")) {
		 * 
		 * fullName = qna_savfile + qna_orgfile; File file = new File(path + fullName);
		 * System.out.println("path : " + path); System.out.println("fullName : " +
		 * fullName);
		 * 
		 * if (!file.exists()) { file.mkdirs(); }
		 * 
		 * multipartFile.transferTo(file);
		 * 
		 * qnaModel.setQna_orgfile(qna_orgfile); qnaModel.setQna_savfile(fullName);
		 * 
		 * }
		 * 
		 * } catch (Exception e) { e.printStackTrace();
		 * 
		 * }
		 */

		ModelAndView mav = new ModelAndView();

		mav.addObject("qnaModel", qnaService.QnaWrite(qnaModel));
		mav.setViewName("redirect:/qna/qnaList.see");

		return mav;

	}

	// 글 상세보기
	@RequestMapping(value = "/qnaView.see", method = RequestMethod.GET)
	public ModelAndView QnaView(@RequestParam int qna_no, HttpSession session) throws Exception {

		// 모델(데이터) + 뷰(화면) 을 함께 전달하는 객체
		ModelAndView mav = new ModelAndView();

		List<QnaCommentModel> QnaCommentList = qnaService.CommentList(qna_no);
		QnaCommentList = qnaService.CommentList(qna_no);

		// 뷰에 전달할 데이터
		mav.addObject("qnaModel", qnaService.QnaView(qna_no));
		mav.addObject("QnaCommentList", QnaCommentList);
		// 뷰의 이름
		mav.setViewName("adminQnaView");

		return mav;
	}

	// 게시글 삭제
	@RequestMapping(value = "/qnaDelete.see")
	public String QnaDelete(@RequestParam int qna_no) throws Exception {

		qnaService.QnaDelete(qna_no);

		return "redirect:/qna/qnaList.see";
	}

	// 댓글 입력
	@RequestMapping(value = "/qnaCommentWrite.see")
	public ModelAndView CommentInsert(HttpServletRequest request, HttpSession session) throws Exception {

		ModelAndView mav = new ModelAndView();
		QnaCommentModel qnaCommentModel = new QnaCommentModel();
		
		int qna_no = Integer.parseInt(request.getParameter("qna_no"));
		
		// 리스트 넘버를 파라미터값으로 받는다
		qnaCommentModel.setQna_comment_content(request.getParameter("qna_comment_content").replaceAll("\r\n", "<br />"));
		qnaCommentModel.setQna_no(qna_no);

		qnaService.CommentInsert(qnaCommentModel);
		
		mav.addObject("qnaCommentModel", qnaCommentModel);
		mav.setViewName("redirect:qnaView.see?qna_no=" + qna_no);

		return mav;
	}
	//댓글 수정
	@RequestMapping(value="/qnaCommentUpdate.see", method = RequestMethod.GET)
    public ResponseEntity<String> CommentUpdate(@PathVariable("qna_comment_no") int qna_comment_no, @RequestBody QnaCommentModel qnaCommentModel ){
        ResponseEntity<String> entity = null;
        try {
        	qnaCommentModel.setQna_comment_no(qna_comment_no);
            qnaService.CommentUpdate(qnaCommentModel);
            // 댓글 수정이 성공하면 성공 상태메시지 저장
            entity = new ResponseEntity<String>("success", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            // 댓글 수정이 실패하면 실패 상태메시지 저장
            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        // 수정 처리 HTTP 상태 메시지 리턴
        return entity;
    }
    
	
	// 댓글 삭제
	@RequestMapping(value = "/qnaCommentDelete.see", method = RequestMethod.GET)
	public ModelAndView CommentDelete(HttpServletRequest request) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		/*QnaCommentModel qnaCommentModel = new QnaCommentModel();*/
		
		int qna_no = Integer.parseInt(request.getParameter("qna_no"));
		int qna_comment_no = Integer.parseInt(request.getParameter("qna_comment_no"));
		/*
		qnaCommentModel.setQna_comment_no(qna_comment_no);*/
		//System.out.println("asdasd" + qna_comment_no);
		qnaService.CommentDelete(qna_comment_no);
		
		mav.setViewName("redirect:/qna/qnaView.see?qna_no=" + qna_no);
		
		
		return mav;
	}

}
