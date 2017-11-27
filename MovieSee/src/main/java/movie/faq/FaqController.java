package movie.faq;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import movie.common.paging.Paging;

@Controller
@RequestMapping("/faq")
public class FaqController {

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "faqService")
	private FaqService faqService; //필드 선언

	// paging
	private int currentPage = 1; // 현재 페이지
	private int totalCount; // 총 게시물의 수
	private int blockCount = 4; // 현재 페이지에 보여줄 게시물의 갯수
	private int blockPage = 5; // 보여줄 페이지의 갯수
	private String pagingHtml; // paging을 구현한 HTML
	private Paging page; // 페이징 클래스의 변수 선언

	ModelAndView mav = new ModelAndView();

	// 글 목록
	@RequestMapping(value = "/faqList.see", method = RequestMethod.GET)
	public ModelAndView FaqList(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();

		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
	
		List<FaqModel> faqList = null;

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
		mav.setViewName("faqList");

		return mav;
	}

	// 글쓰기 폼
	@RequestMapping(value = "/faqWrite.see", method = RequestMethod.GET)
	public ModelAndView FaqWriteForm(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/faq/AdminFaqWrite");
		return mav;
	}

	// 글쓰기
	@RequestMapping(value = "/faqWrite.see", method = RequestMethod.POST)
	public ModelAndView FaqWrite(@ModelAttribute("faqModel") FaqModel faqModel, HttpServletRequest request)
			throws Exception {
		ModelAndView mav = new ModelAndView();

		faqService.FaqWrite(faqModel);

		mav.addObject("faqModel", faqModel);
		mav.setViewName("faq/FaqSuccess");

		return mav;
	}

}
