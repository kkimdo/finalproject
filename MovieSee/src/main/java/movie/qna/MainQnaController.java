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

@Controller
@RequestMapping("/qna")
public class MainQnaController {

	Logger log = Logger.getLogger(this.getClass());

	@Inject
	private QnaService qnaService;
	
	private static final String uploadPath = "C:/github/finalproject/MovieSee/src/main/webapp/resources/uploads/qna/";
	// 글 목록
	//@RequestMapping(value = "/qnaList.see")
	// @RequestParam(defaultValue="") ==> 기본값 할당 : 현재페이지를 1로 초기화
	public ModelAndView QnaList(@RequestParam(defaultValue = "qna_subject") String searchOption,
								@RequestParam(defaultValue = "") String keyword, 
								@RequestParam(defaultValue = "1") int curPage) throws Exception {

		/*// 레코드의 갯수 계산
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
		map.put("c_Paging", c_Paging);*/

		ModelAndView mav = new ModelAndView();
		//mav.addObject("map", map); // 맵에 저장된 데이터를 mav에 저장
		//mav.setViewName("qnaList");

		return mav;
	}

	@RequestMapping(value = "/qnaWrite.see", method = RequestMethod.GET)
	public String QnaWriteForm() {
		return "qnaWrite";
	}

	// 게시글 작성 처리
	@RequestMapping(value = "/qnaWrite.see", method = RequestMethod.POST)
	public ModelAndView QnaWrite(@ModelAttribute("qnaModel") QnaModel qnaModel, BindingResult result,
			MultipartHttpServletRequest multipartHttpServletRequest) throws Exception {
		
		int qnaSeqNum = qnaService.QnaGetSEQ();
		qnaModel.setQna_no(qnaSeqNum);

		MultipartFile multipartFile = multipartHttpServletRequest.getFile("qna_orgfile");

		String orgfile_full_name = "";

		if (!multipartFile.isEmpty()) {

			String orgfile_name = multipartFile.getOriginalFilename();
			String orgfile_ext = orgfile_name.substring(orgfile_name.lastIndexOf('.') + 1);

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

				qnaModel.setQna_orgfile(orgfile_full_name);
			}

		} else {

			qnaModel.setQna_orgfile(orgfile_full_name);
		}

		ModelAndView mav = new ModelAndView();
		
		mav.addObject("qnaModel", qnaService.QnaWrite(qnaModel)); //데이터를 저장
		mav.setViewName("redirect:/qna/qnaMyList.see"); //문의 내역

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
		mav.setViewName("qnaView");

		return mav;
	}
}