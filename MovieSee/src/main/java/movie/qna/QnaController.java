package movie.qna;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
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
		// 뷰에 전달할 데이터
		mav.addObject("qnaModel", qnaService.QnaView(qna_no));
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

	//답변 작성
	@RequestMapping(value = "/qnaCommentWrite.see", method = RequestMethod.GET)
	public String QnaCommentWriteForm() {
		return "admin/qna/AdminQnaCommentWrtie"; /// AdminQnaView.jsp 로 이동
	}

}