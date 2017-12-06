package movie.faq;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import movie.common.paging.Paging;


@Controller
@RequestMapping("/faq")
public class FaqController {

	Logger log = Logger.getLogger(this.getClass());

	@Inject
	private FaqService faqService;

	// paging
	private int currentPage = 1; // 현재 페이지
	private int totalCount; // 총 게시물의 수
	private int blockCount = 4; // 현재 페이지에 보여줄 게시물의 갯수
	private int blockPage = 5; // 보여줄 페이지의 갯수
	private String pagingHtml; // paging을 구현한 HTML
	private Paging page; // 페이징 클래스의 변수 선언

	// 검색
	private String isSearch;

	// 글 목록
	@RequestMapping(value = "/faqList.see")
	public ModelAndView FaqList(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();

		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {

			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		List<FaqModel> faqList = null;
		// 검색
		isSearch = request.getParameter("isSearch");
		// 검색했을 때
		if (isSearch != null) {

			faqList = faqService.FaqSearchList(isSearch);

			totalCount = faqList.size();
			page = new Paging(currentPage, totalCount, blockCount, blockPage, "faqList", isSearch);
			pagingHtml = page.getPagingHtml().toString();

			int lastCount = totalCount;

			if (page.getEndCount() < totalCount) {
				lastCount = page.getEndCount() + 1;
			}

			faqList = faqList.subList(page.getStartCount(), lastCount);

			mav.addObject("isSearch", isSearch);
			mav.addObject("totalCount", totalCount);
			mav.addObject("pagingHtml", pagingHtml);
			mav.addObject("currentPage", currentPage);
			mav.addObject("faqList", faqList);
			mav.setViewName("adminFaqList"); 

			return mav;
			

		}
		// 검색하지 않았을 때
		faqList = faqService.FaqList();
		
		totalCount = faqList.size();
		
		page = new Paging(currentPage, totalCount, blockCount, blockPage, "faqList");
		pagingHtml = page.getPagingHtml().toString();

		int lastCount = totalCount;

		if (page.getEndCount() < totalCount) {
			lastCount = page.getEndCount() + 1;
		}

		faqList = faqList.subList(page.getStartCount(), lastCount);

		mav.addObject("totalCount", totalCount);
		mav.addObject("pagingHtml", pagingHtml);
		mav.addObject("currentPage", currentPage);
		mav.addObject("faqList", faqList);
		mav.setViewName("adminFaqList"); 

		
		
		return mav;
		
		
	}

	// 게시글 작성 화면
	@RequestMapping(value = "/faqWrite.see", method = RequestMethod.GET)
	public String FaqWriteForm() {
		return "admin/faq/AdminFaqWrite"; // AdminFaqWrite.jsp 로 이동
	}

	// 게시글 작성 처리
	@RequestMapping(value = "/faqWrite.see", method = RequestMethod.POST)
	public ModelAndView FaqWrite(@ModelAttribute("faqModel") FaqModel faqModel) throws Exception {
		ModelAndView mav = new ModelAndView();

		faqService.FaqWrite(faqModel);

		mav.addObject("faqModel", faqModel); // 데이터를 저장
		mav.setViewName("redirect:/faq/faqList.see"); // AdminNoticeList.jsp 로 redirect

		return mav;
	}

	// 글 상세보기
	@RequestMapping(value = "/faqView.see")
	public ModelAndView FaqView(@RequestParam int faq_no, HttpSession session) {

		// 조회수 증가 처리
		faqService.FaqHitUpdate(faq_no, session);
		// 모델(데이터) + 뷰(화면) 을 함께 전달하는 객체
		ModelAndView mav = new ModelAndView();
		// 뷰에 전달할 데이터
		mav.addObject("faqModel", faqService.FaqView(faq_no));
		// 뷰의 이름
		mav.setViewName("adminFaqView");

		return mav;
	}

	// 게시글 수정 폼
	@RequestMapping(value = "/faqUpdate.see", method = RequestMethod.GET)
	public ModelAndView FaqUpdateForm(@RequestParam int faq_no) {

		ModelAndView mav = new ModelAndView();

		mav.addObject("faqModel", faqService.FaqView(faq_no));
		mav.setViewName("adminFaqUpdate");

		return mav;

	}

	// 게시글 수정
	@RequestMapping(value = "/faqUpdate.see", method = RequestMethod.POST)
	public ModelAndView FaqUpdate(@ModelAttribute FaqModel faqModel) {

		ModelAndView mav = new ModelAndView();

		mav.addObject("faqModel", faqService.FaqUpdate(faqModel));
		mav.setViewName("redirect:/faq/faqList.see");

		return mav;

	}

	// 게시글 삭제
	@RequestMapping(value = "/faqDelete.see")
	public String FaqDelete(@RequestParam int faq_no) {

		faqService.FaqDelete(faq_no);

		return "redirect:/faq/faqList.see";
	}

}
