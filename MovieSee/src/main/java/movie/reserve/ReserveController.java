package movie.reserve;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import movie.movie.MovieBannerModel;
import movie.movie.MovieModel;
import movie.movie.MovieService;

@Controller
@RequestMapping("/reserve")
public class ReserveController {

	private String start_time;
	String session_member_id;

	@Resource
	private MovieService movieService;

	@Resource
	private ReserveService reserveService;

	ReserveTimeTableModel reserveTimeTableModel = new ReserveTimeTableModel();

	// 스케쥴 등록
	@RequestMapping(value = "/movieTicketing.see", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView timeTableWrite(HttpServletRequest request, HttpSession session) throws ParseException {

		ModelAndView mv = new ModelAndView();
		// 모델등록
		ReserveTimeTableModel timetablemodel = new ReserveTimeTableModel();

		if (session.getAttribute("session_member_id") == null) {
			mv.setViewName("reserve/loginConfirm");

			return mv;
		}

		start_time = request.getParameter("start_time");
		if (start_time != null) {

			// detail 파라미터
			
			Date timetable_show_date = new SimpleDateFormat("yyyyMMdd").parse(request.getParameter("show_date"));
			 
			int timetable_movie_no = Integer.parseInt(request.getParameter("movie_no"));
			String timetable_start_time = request.getParameter("start_time");
			// 번호 이름 가져오기

			// timetable Model
			
			timetablemodel.setTimetable_movie_no(timetable_movie_no);
			timetablemodel.setTimetable_show_date(timetable_show_date);
			timetablemodel.setTimetable_start_time(timetable_start_time);

			List<ReserveTimeTableModel> timetable_list = reserveService.timetable_list(); // 번호-이름 선택
			List<ReserveTimeTableModel> timesearch = reserveService.timesearch(timetablemodel);
			
			MovieBannerModel bannerselect = movieService.banner_select();

			mv.addObject("timetable_list", timetable_list);
			mv.addObject("timetablelist", timesearch);
			mv.addObject("bannerselect", bannerselect);
			/* mv.addObject("timetableSelect", timetableSelect); */

			mv.setViewName("movieTicketing");
			return mv;
		}

		List<ReserveTimeTableModel> timetable_list = reserveService.timetable_list(); // 번호-이름 선택
		MovieBannerModel bannerselect = movieService.banner_select();

		mv.addObject("timetable_list", timetable_list);
		mv.addObject("bannerselect", bannerselect);

		mv.setViewName("movieTicketing");
		return mv;
	}

	// 주문2
	@RequestMapping(value = "/movieTicketing1.see", method = RequestMethod.GET)
	public ModelAndView movieTicketing1(HttpServletRequest request, MovieModel movieModel, HttpSession session)
			throws ParseException {

		ModelAndView mv = new ModelAndView();

		int timetable_movie_no = Integer.parseInt(request.getParameter("timetable_movie_no"));
		int timetable_no = Integer.parseInt(request.getParameter("timetable_no"));

		ReserveTimeTableModel reserveTimeTableModel = reserveService.timetable_no(timetable_no);
		MovieBannerModel bannerselect = movieService.banner_select();
		movieModel = reserveService.selectMovie_no(timetable_movie_no);

		mv.addObject("movieModel", movieModel);// 영화 thumnail 가져오기
		mv.addObject("reserve_seat", reserveTimeTableModel); // 예매정보
		mv.addObject("bannerselect", bannerselect); // 하단 배너

		mv.setViewName("movieTicketing1");
		return mv;
	}

	@RequestMapping(value = "/movieTicketing2.see", method = RequestMethod.GET)
	public ModelAndView movieTicketing2(HttpServletRequest request,	MovieModel movieModel,ReserveTimeTableModel reserveTimeTableModel) throws ParseException {

		ModelAndView mv = new ModelAndView();
		
		int timetable_movie_no = Integer.parseInt(request.getParameter("timetable_movie_no"));
		
		int timetable_no = reserveTimeTableModel.getTimetable_no();
		int adult_cnt = reserveTimeTableModel.getTimetable_adult_cnt();
		int child_cnt = reserveTimeTableModel.getTimetable_child_cnt();
		
		int adult_cnt1 = Integer.parseInt(request.getParameter("timetable_adult_cnt"));
		int child_cnt1 = Integer.parseInt(request.getParameter("timetable_child_cnt"));
		
		reserveTimeTableModel = reserveService.timetable_no(timetable_no);
		
		int Timetable_reserved_seat = reserveTimeTableModel.getTimetable_reserved_seat();
		
		if (adult_cnt1 + child_cnt1 == 0) {

			movieModel = reserveService.selectMovie_no(timetable_movie_no);
			reserveTimeTableModel = reserveService.timetable_no(timetable_no);

			mv.addObject("movieModel", movieModel); // 영화 thumnail 가져오기
			mv.addObject("reserveTimeTableModel", reserveTimeTableModel); // 영화 예매 숫자 및 타임테이블전체
			mv.setViewName("/reserve/ReserveNull");
			
		} else if (Timetable_reserved_seat < adult_cnt1 + child_cnt1) {

			movieModel = reserveService.selectMovie_no(timetable_movie_no);
			reserveTimeTableModel = reserveService.timetable_no(timetable_no);

			mv.addObject("movieModel", movieModel); // 영화 thumnail 가져오기
			mv.addObject("reserveTimeTableModel", reserveTimeTableModel); // 영화 예매 숫자 및 타임테이블전체
			mv.setViewName("/reserve/ReserveCheck");
			
		} else if (Timetable_reserved_seat >= adult_cnt1 + child_cnt1) {
			movieModel = reserveService.selectMovie_no(timetable_movie_no);
			reserveTimeTableModel = reserveService.timetable_no(timetable_no);
			/* memberModel = memberService.getMemeber(id); */
			reserveTimeTableModel.setTimetable_adult_cnt(adult_cnt);
			reserveTimeTableModel.setTimetable_child_cnt(child_cnt);
			MovieBannerModel bannerselect = movieService.banner_select();

			mv.addObject("movieModel", movieModel); // 영화 thumnail 가져오기
			mv.addObject("reserveTimeTableModel", reserveTimeTableModel); // 영화 예매 숫자 및 타임테이블전체
			mv.addObject("bannerselect", bannerselect); // 하단 배너
			mv.setViewName("movieTicketing2");
			
		}
		return mv;
	}

	@RequestMapping(value = "/reserveComplete.see", method = RequestMethod.POST)
	public ModelAndView reserveComplete(HttpServletRequest request, HttpSession session) throws ParseException {

		ModelAndView mv = new ModelAndView();

		session_member_id = (String) session.getAttribute("session_member_id");

		/* int reserve_no = Integer.parseInt(request.getParameter("reserve_no")); */
		String reserve_movie_name = request.getParameter("reserve_movie_name");
		int reserve_timetable_no = Integer.parseInt(request.getParameter("reserve_timetable_no"));
		String reserve_start_date = request.getParameter("reserve_start_date");
		String reserve_end_date = request.getParameter("reserve_end_date");
		String reserve_show_date = request.getParameter("reserve_show_date");
		String reserve_start_time = request.getParameter("reserve_start_time");
		String reserve_end_time = request.getParameter("reserve_end_time");
		int reserve_adult_amt = Integer.parseInt(request.getParameter("reserve_adult_amt"));
		int reserve_child_amt = Integer.parseInt(request.getParameter("reserve_child_amt"));
		int reserve_adult_cnt = Integer.parseInt(request.getParameter("reserve_adult_cnt"));
		int reserve_child_cnt = Integer.parseInt(request.getParameter("reserve_child_cnt"));
		String reserve_movie_poster = request.getParameter("reserve_movie_poster");
		String reserve_movie_age = request.getParameter("reserve_movie_age");
		
		ReserveModel reserveModel = new ReserveModel();

		/* reserveModel.setReserve_no(reserve_no); */
		reserveModel.setReserve_member_id(session_member_id);
		reserveModel.setReserve_movie_name(reserve_movie_name);
		reserveModel.setReserve_timetable_no(reserve_timetable_no);
		reserveModel.setReserve_start_date(reserve_start_date);
		reserveModel.setReserve_end_date(reserve_end_date);
		reserveModel.setReserve_show_date(reserve_show_date);
		reserveModel.setReserve_start_time(reserve_start_time);
		reserveModel.setReserve_end_time(reserve_end_time);
		reserveModel.setReserve_adult_amt(reserve_adult_amt);
		reserveModel.setReserve_child_amt(reserve_child_amt);
		reserveModel.setReserve_adult_cnt(reserve_adult_cnt);
		reserveModel.setReserve_child_cnt(reserve_child_cnt);
		reserveModel.setReserve_movie_poster(reserve_movie_poster);
		reserveModel.setReserve_movie_age(reserve_movie_age);

		ReserveTimeTableModel reserveTimeTableModel = reserveService.timetable_no(reserve_timetable_no);

		int amount = reserveTimeTableModel.getTimetable_reserved_seat() - reserve_adult_cnt - reserve_child_cnt;

		reserveTimeTableModel.setTimetable_reserved_seat(amount);

		reserveService.amountDown(reserveTimeTableModel);

		reserveService.updatemovierate(reserveTimeTableModel);
		reserveService.insertReserve(reserveModel);

		mv.setViewName("reserve/ReserveComplete");

		return mv;
	}

	@RequestMapping(value = "/reserveCancel.see")
	public ModelAndView reserveCancel(HttpServletRequest request) throws ParseException {

		ModelAndView mv = new ModelAndView();

		int reserve_no = Integer.parseInt(request.getParameter("reserve_no"));
		int timetable_no = Integer.parseInt(request.getParameter("reserve_timetable_no"));

		ReserveTimeTableModel reserveTimeTableModel = reserveService.timetable_no(timetable_no);
		ReserveModel reserveModel = reserveService.selectReserve_no(reserve_no);

		int amount = reserveTimeTableModel.getTimetable_reserved_seat() + reserveModel.getReserve_adult_cnt()
				+ reserveModel.getReserve_child_cnt();

		reserveTimeTableModel.setTimetable_reserved_seat(amount);

		reserveService.amountDown(reserveTimeTableModel);
		reserveService.updatemovierate(reserveTimeTableModel);

		reserveService.deleteReserve(reserve_no);

		mv.setViewName("redirect:/mypage/reserveList.see");
		return mv;
	}
}
