package movie.faq;

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
	
	@Resource(name="faqService")
	private FaqService faqService;
	
	//글쓰기 폼
	@RequestMapping(value="/faqWrite.see", method=RequestMethod.GET)
	public ModelAndView FaqWriteForm(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("faq/FaqWriteForm");
		return mav;
	}
	
	//글쓰기
	@RequestMapping(value="/faqWrite.see", method=RequestMethod.POST)
	public ModelAndView FaqWrite(@ModelAttribute("faqModel") FaqModel faqModel, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
	
		faqService.faqWrite(faqModel);
			
		mav.addObject("faqModel", faqModel);
		mav.setViewName("faq/FaqSuccess");
		
		return mav;
	}
	
}
