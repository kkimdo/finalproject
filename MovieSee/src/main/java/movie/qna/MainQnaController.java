package movie.qna;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
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

import movie.admin.qna.QnaCommentModel;
import movie.admin.qna.QnaModel;
import movie.admin.qna.QnaService;
import movie.common.paging.commonPaging;
import movie.movie.MovieBannerModel;
import movie.movie.MovieService;

@Controller
@RequestMapping("/qna")
public class MainQnaController {

	Logger log = Logger.getLogger(this.getClass());

	@Inject
	private QnaService qnaService;

	@Inject
	private MovieService movieService;

	// private static final String uploadPath = "C:/Users/user/Desktop/Geunjae
	// Final/finalproject/MovieSee/src/main/webapp/resources/uploads/qna/";
	private static final String uploadPath = "C:/github/finalproject/MovieSee/src/main/webapp/resources/uploads/qna/";

	// 글 목록
	@RequestMapping(value = "/qnaMemberList.see")
	// @RequestParam(defaultValue="") ==> 기본값 할당 : 현재페이지를 1로 초기화
	public ModelAndView QnaMemberList(@RequestParam(defaultValue = "qna_subject") String searchOption,
			@RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "1") int curPage,
			HttpSession session) throws Exception {

		ModelAndView mav = new ModelAndView();

		String qna_id = (String) session.getAttribute("session_member_id");

		// 로그인이 안되 있을 경우, 로그인 창으로 이동
		if (qna_id == null) {
			mav.setViewName("qna/QnaLoginConfirm");
			return mav;
		}

		int qnaMemberCount = qnaService.QnaMemberCount(qna_id, searchOption, keyword);

		commonPaging c_Paging = new commonPaging(qnaMemberCount, curPage);
		int start = c_Paging.getPageBegin();
		int end = c_Paging.getPageEnd();

		List<QnaModel> qnaMemberList = qnaService.QnaMemberList(qna_id, start, end, searchOption, keyword);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("qnaMemberList", qnaMemberList);
		map.put("qnaMemberCount", qnaMemberCount);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("c_Paging", c_Paging);

		MovieBannerModel bannerselect = movieService.banner_select();
		mav.addObject("bannerselect", bannerselect);
		mav.addObject("map", map); // 맵에 저장된 데이터를 mav에 저장
		mav.setViewName("qnaList");

		return mav;
	}

	@RequestMapping(value = "/qnaWrite.see", method = RequestMethod.GET)
	public ModelAndView QnaMemberWriteForm() {

		ModelAndView mav = new ModelAndView();

		MovieBannerModel bannerselect = movieService.banner_select();
		mav.addObject("bannerselect", bannerselect);
		mav.setViewName("qnaWrite");

		return mav;
	}

	// 게시글 작성 처리
	@RequestMapping(value = "/qnaWrite.see", method = RequestMethod.POST)
	public ModelAndView QnaMemberWrite(@ModelAttribute("qnaModel") QnaModel qnaModel, BindingResult result,
			MultipartHttpServletRequest multipartHttpServletRequest) throws Exception {

		int qnaSeqNum = qnaService.QnaGetSEQ();
		qnaModel.setQna_no(qnaSeqNum);

		MultipartFile multipartFile = multipartHttpServletRequest.getFile("qna_orgfile");

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
				qnaModel.setQna_savfile(orgfile_full_name); // savfile은
															// orgfile_full_name에
															// 저장
				qnaModel.setQna_orgfile(orgfile_name); // orgfile은 orgfile_name에
														// 저장
			}

		} else {

			qnaModel.setQna_savfile(orgfile_full_name);
			qnaModel.setQna_orgfile(orgfile_name);

		}

		ModelAndView mav = new ModelAndView();

		qnaService.QnaWrite(qnaModel);

		mav.addObject("qnaModel", qnaModel);
		mav.setViewName("redirect:/qna/qnaMemberList.see");

		return mav;

	}

	// 글 상세보기
	@RequestMapping(value = "/qnaMemberView.see", method = RequestMethod.GET)
	public ModelAndView QnaMemberView(@RequestParam int qna_no, @RequestParam(defaultValue = "1") int curPag,
			@RequestParam(defaultValue = "qna_subject") String searchOption,
			@RequestParam(defaultValue = "") String keyword, HttpSession session) throws Exception {

		// 댓글 갯수 계산
		int countReply = qnaService.countReply(qna_no, searchOption, keyword);

		// 페이지 나누기 관련 처리
		commonPaging c_Paging = new commonPaging(countReply, curPag);

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

		MovieBannerModel bannerselect = movieService.banner_select();
		mav.addObject("bannerselect", bannerselect);
		mav.setViewName("qnaView");

		return mav;
	}

	// 게시글 삭제
	@RequestMapping(value = "/qnaDelete.see")
	public String QnaDelete(@RequestParam int qna_no) throws Exception {

		qnaService.QnaDelete(qna_no);

		return "redirect:/qna/qnaMemberList.see";
	}

}