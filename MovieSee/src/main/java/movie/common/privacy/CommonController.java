package movie.common.privacy;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import movie.movie.MovieBannerModel;
import movie.movie.MovieService;

@Controller
@RequestMapping("/common")
public class CommonController {
	
	@Inject
	private MovieService movieService;
	
	@RequestMapping(value = "/privacy.see")
	public ModelAndView privacy(){
		
		ModelAndView mav = new ModelAndView();
		MovieBannerModel bannerselect = movieService.banner_select();
		mav.addObject("bannerselect", bannerselect);
		mav.setViewName("privacy");
		
		return mav;
	}
	
	@RequestMapping(value = "/memberClause.see")
	public ModelAndView memberClause(){

		ModelAndView mav = new ModelAndView();
		MovieBannerModel bannerselect = movieService.banner_select();
		mav.addObject("bannerselect", bannerselect);
		mav.setViewName("memberClause");
		
		return mav;
		
	}

}
