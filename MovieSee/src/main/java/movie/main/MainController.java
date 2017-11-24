package movie.main;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

//근재
@Controller
public class MainController {

	Logger log = Logger.getLogger(this.getClass());
	
	@RequestMapping("main.see")
	public ModelAndView mainView(HttpServletRequest request){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main");
		return mav;
		
	}
	
}
