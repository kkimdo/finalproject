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

import movie.faq.FaqModel;
import movie.faq.FaqService;

@Controller
@RequestMapping("/faq")
public class FaqController {

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "faqService")
	private FaqService faqService;

	// paging
	private int currentPage = 1; // 현재 페이지
	private int totalCount; // 총 게시물의 수
	private int blockCount = 4; // 현재 페이지에 보여줄 게시물의 갯수
	private int blockPage = 5; // 보여줄 페이지의 갯수

	ModelAndView mav = new ModelAndView();

	// 리스트
	@RequestMapping(value = "/faqList.mt", method = RequestMethod.GET)
	public ModelAndView FaqList(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();

		// 현재 페이지의 파라미터값이 null값이거나 값이 비어있거나 0이면 현재페이지를 1로 지정
		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			// 아니면~~currentPage 받아서 인트타입으로 지정한다.
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		// FaqModel 자바빈을 List에 faqList이름으로 담는다. 값은 null이다.
		List<FaqModel> faqList = null;

		mav.addObject("totalCount", totalCount);
		mav.addObject("currentPage", currentPage);
		mav.addObject("faqList", faqList);
		mav.setViewName("faqList");

		return mav;
	}

	// 글쓰기 폼
	@RequestMapping(value = "/faqWrite.see", method = RequestMethod.GET)
	public ModelAndView FaqWriteForm(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("faq/FaqWriteForm");
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
