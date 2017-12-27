package movie.main;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import movie.movie.MovieModel;
import movie.movie.MovieService;
import movie.movie.MovieBannerModel;

@Controller
public class MainController {

	
	@Resource
	MovieService movieService;
	
	Logger log = Logger.getLogger(this.getClass());
		
	@RequestMapping("/main.see")
	public ModelAndView mainView(HttpServletRequest request){
		
		
		ModelAndView mv = new ModelAndView();
		List<MovieModel> movieScore = movieService.movieScore();
		List<MovieModel> movieRate = movieService.movieRate(); 
		List<MovieModel> movieList = movieService.movieList();
		MovieBannerModel bannerselect = movieService.banner_select();
		
		mv.addObject("movieRate", movieRate);
		mv.addObject("movieScore", movieScore);
		mv.addObject("list", movieList);
		mv.addObject("bannerselect", bannerselect);
		
		mv.setViewName("main");
		return mv;
		
	}
	
}
