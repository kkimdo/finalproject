package movie.admin.qna;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import movie.common.paging.commonPaging;

@Controller // 현재 클래스를 컨트롤러 빈(bean)으로 등록
@RequestMapping("/admin")
public class QnaController {

	Logger log = Logger.getLogger(this.getClass());

	@Inject
	private QnaService qnaService;

	@Resource(name = "downloadView")
	private org.springframework.web.servlet.View downloadView;

	//private static final String uploadPath = "C:/Users/user/Desktop/Geunjae Final/finalproject/MovieSee/src/main/webapp/resources/uploads/qna/";
	private static final String uploadPath = "C:/github/finalproject/MovieSee/src/main/webapp/resources/uploads/qna/";

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
		qnaList = qnaService.QnaListAll(start, end, searchOption, keyword);

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
	// RequestMapping("admin/qnaWrite.see")
	// value="", method="전송방식"
	@RequestMapping(value = "/qnaWrite.see", method = RequestMethod.GET)
	public String QnaWriteForm() {
		return "adminQnaWrite"; // tiles 이름이 adminQnaWrite 로 이동
	}

	// 게시글 작성 처리
	@RequestMapping(value = "/qnaWrite.see", method = RequestMethod.POST)
	public ModelAndView QnaWrite(@ModelAttribute("qnaModel") QnaModel qnaModel, BindingResult result,
			MultipartHttpServletRequest multipartHttpServletRequest) throws Exception {

		int qnaSeqNum = qnaService.QnaGetSEQ();
		qnaModel.setQna_no(qnaSeqNum);

		MultipartFile multipartFile = multipartHttpServletRequest.getFile("qna_orgfile");
		System.out.println("asdasd" + multipartFile);

		String orgfile_full_name = "";
		String orgfile_name = "";

		if (!multipartFile.isEmpty()) {

			orgfile_name = multipartFile.getOriginalFilename();
			System.out.println("실제 파일 명 : " + orgfile_full_name);
			String orgfile_ext = orgfile_name.substring(orgfile_name.lastIndexOf('.') + 1);
			System.out.println("중복 안되게 파일 명 : " + orgfile_ext);

			if (orgfile_ext != null && !orgfile_ext.equals("")) {

				orgfile_full_name = "qnaOrgfile_" + qnaSeqNum + "." + orgfile_ext;
				File file = new File(uploadPath + orgfile_full_name);

				if (!file.exists()) {
					file.mkdirs();
				}

				try {
					multipartFile.transferTo(file);
				} catch (Exception e) {
					e.printStackTrace();
				}

				System.out.println("실제 파일 명 : " + orgfile_full_name);
				qnaModel.setQna_savfile(orgfile_full_name); // savfile은 orgfile_full_name에 저장
				qnaModel.setQna_orgfile(orgfile_name); // orgfile은 orgfile_name에 저장
			}

		} else {

			qnaModel.setQna_savfile(orgfile_full_name);
			qnaModel.setQna_orgfile(orgfile_name);

		}

		ModelAndView mav = new ModelAndView();

		mav.addObject("qnaModel", qnaService.QnaWrite(qnaModel)); // 데이터를 저장
		mav.setViewName("redirect:/admin/qnaList.see");

		return mav;

	}

	// 글 상세보기
	@RequestMapping(value = "/qnaView.see", method = RequestMethod.GET)
	public ModelAndView QnaView(@RequestParam int qna_no, @RequestParam(defaultValue = "1") int curPag,
			@RequestParam(defaultValue = "qna_subject") String searchOption,
			@RequestParam(defaultValue = "") String keyword, HttpSession session) throws Exception {

		// 댓글 갯수 계산
		int countReply = qnaService.countReply(qna_no, searchOption, keyword);

		// 페이지 나누기 관련 처리
		commonPaging c_Paging = new commonPaging(countReply, curPag);

		// 모델(데이터) + 뷰(화면) 을 함께 전달하는 객체
		ModelAndView mav = new ModelAndView();

		List<QnaCommentModel> QnaCommentList = qnaService.CommentList(qna_no);
		QnaCommentList = qnaService.CommentList(qna_no);

		// 뷰에 전달할 데이터
		mav.addObject("qna_no", qna_no);
		mav.addObject("countReply", countReply);
		mav.addObject("searchOption", searchOption);
		mav.addObject("keyword", keyword);
		mav.addObject("c_Paging", c_Paging);
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

		return "redirect:/admin/qnaList.see";
	}

	// 댓글 입력
	@RequestMapping(value = "/qnaCommentWrite.see")
	public ModelAndView CommentInsert(HttpServletRequest request, HttpSession session) throws Exception {

		ModelAndView mav = new ModelAndView();
		QnaCommentModel qnaCommentModel = new QnaCommentModel();

		int qna_no = Integer.parseInt(request.getParameter("qna_no"));

		// 리스트 넘버를 파라미터값으로 받는다
		qnaCommentModel
				.setQna_comment_content(request.getParameter("qna_comment_content").replaceAll("\r\n", "<br />"));
		qnaCommentModel.setQna_no(qna_no);

		qnaService.CommentInsert(qnaCommentModel);

		mav.addObject("qnaCommentModel", qnaCommentModel);
		mav.setViewName("redirect:qnaView.see?qna_no=" + qna_no);

		return mav;
	}

	// 댓글 삭제
	@RequestMapping(value = "/qnaCommentDelete.see", method = RequestMethod.GET)
	public ModelAndView CommentDelete(HttpServletRequest request) throws Exception {

		ModelAndView mav = new ModelAndView();
		/* QnaCommentModel qnaCommentModel = new QnaCommentModel(); */

		int qna_no = Integer.parseInt(request.getParameter("qna_no"));
		int qna_comment_no = Integer.parseInt(request.getParameter("qna_comment_no"));
		/*
		 * qnaCommentModel.setQna_comment_no(qna_comment_no);
		 */
		// System.out.println("asdasd" + qna_comment_no);
		qnaService.CommentDelete(qna_comment_no);

		mav.setViewName("redirect:/admin/qnaView.see?qna_no=" + qna_no);

		return mav;
	}

	@RequestMapping(value = "/fileDownload.see", method = RequestMethod.GET)
	public ModelAndView FileDownload(HttpServletRequest request) {

		String downloadName = request.getParameter("qna_orgfile");
		System.out.println(downloadName);

		File file = new File(uploadPath, downloadName);

		return new ModelAndView("fileDownloadView", "fileDownload", file);

	}

}
