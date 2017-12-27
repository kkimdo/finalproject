package movie.mypage;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import movie.member.MemberService;
import movie.movie.MovieBannerModel;
import movie.movie.MovieService;
import movie.reserve.ReserveModel;


@Controller
@RequestMapping("/mypage")
public class MypageController {

	ModelAndView mav = new ModelAndView();

	@Resource
	private MemberService memberService;
	@Resource
	private MovieService movieService;
	@Resource
	private MypageService mypageService;

	String session_member_id;
	
	Logger log = Logger.getLogger(this.getClass());

	@RequestMapping(value = "/reserveList.see")
	public ModelAndView reserveList(HttpServletRequest request, HttpSession session) {
		ModelAndView mv = new ModelAndView();

		String session_member_id = (String) session.getAttribute("session_member_id");
		
		if (session.getAttribute("session_member_id") == null) {
	         mv.setViewName("reserve/loginConfirm");

	         return mv;
	      }
		
		List<ReserveModel> reserveList= mypageService.reserveList(session_member_id);
		MovieBannerModel bannerselect = movieService.banner_select(); // 하단 배너

		mav.addObject("bannerselect", bannerselect);
		mv.addObject("reserveList", reserveList);
		mv.setViewName("reserveList");
		return mv;
	}
	

	@RequestMapping(value = "/reserveCancel.see")
	public ModelAndView reserveCancel(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();

		MovieBannerModel bannerselect = movieService.banner_select();

		mv.addObject("bannerselect", bannerselect);
		mv.setViewName("reserveCancel");
		return mv;
	}

	@RequestMapping(value = "/vip.see")
	public ModelAndView vip(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();

		MovieBannerModel bannerselect = movieService.banner_select();

		mv.addObject("bannerselect", bannerselect);
		mv.setViewName("vip");
		return mv;
	}

	@RequestMapping(value = "/movieHistory.see")
	public ModelAndView movieHistory(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();

		MovieBannerModel bannerselect = movieService.banner_select();

		mv.addObject("bannerselect", bannerselect);
		mv.setViewName("movieHistory");
		return mv;
	}

	@RequestMapping(value = "/qna.see")
	public ModelAndView qna(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();

		MovieBannerModel bannerselect = movieService.banner_select();

		mv.addObject("bannerselect", bannerselect);
		mv.setViewName("qna");
		return mv;
	}

	@RequestMapping(value = "/mypage.see")
	public ModelAndView mypage(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();

		MovieBannerModel bannerselect = movieService.banner_select();

		mv.addObject("bannerselect", bannerselect);
		mv.setViewName("mypage");
		return mv;
	}

}