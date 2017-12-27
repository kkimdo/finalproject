package movie.event;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import movie.admin.event.EventModel;
import movie.admin.event.EventService;
import movie.common.paging.commonPaging;
import movie.movie.MovieBannerModel;
import movie.movie.MovieService;

@Controller
@RequestMapping("/event")
public class MainEventController {

	Logger log = Logger.getLogger(this.getClass());

	@Inject
	private EventService eventService;
	
	@Inject
	private MovieService movieService;

	@ModelAttribute
	public EventModel formBack() {
		return new EventModel();
	}

	// 게시글 목록 메인
	@RequestMapping(value = "/eventListMain.see")
	public ModelAndView EventListMain(@RequestParam(defaultValue = "event_subject") String searchOption,
			@RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "1") int curPage)
			throws Exception {

		// 레코드의 갯수 계산
		int count = eventService.count(searchOption, keyword);

		// 페이지 나누기 관련 처리
		commonPaging c_Paging = new commonPaging(count, curPage);
		int start = c_Paging.getPageBegin();
		int end = c_Paging.getPageEnd();

		// 1. 영화
		List<EventModel> eventList_1 = eventService.EventList_1(start, end, searchOption, keyword);
		// 2. 시사회/무대인사
		List<EventModel> eventList_2 = eventService.EventList_2(start, end, searchOption, keyword);
		// 3. 롯시NOW
		List<EventModel> eventList_3 = eventService.EventList_3(start, end, searchOption, keyword);
		// 4. 제휴할인
		List<EventModel> eventList_4 = eventService.EventList_4(start, end, searchOption, keyword);

		// 데이터를 맵에 저장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("eventList_1", eventList_1);
		map.put("eventList_2", eventList_2);
		map.put("eventList_3", eventList_3);
		map.put("eventList_4", eventList_4);
		map.put("count", count);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("c_Paging", c_Paging);

		ModelAndView mav = new ModelAndView();
		
		MovieBannerModel bannerselect = movieService.banner_select();
		mav.addObject("bannerselect", bannerselect);
		mav.addObject("map", map);
		mav.setViewName("eventListMain");

		return mav;
	}

	// 게시글 지난 이벤트
	@RequestMapping(value = "/eventEndList.see")
	public ModelAndView EventEndList(@RequestParam(defaultValue = "event_subject") String searchOption,
			@RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "1") int curPage)
			throws Exception {

		int count = eventService.count(searchOption, keyword);

		commonPaging c_Paging = new commonPaging(count, curPage);
		int start = c_Paging.getPageBegin();
		int end = c_Paging.getPageEnd();

		List<EventModel> eventEndList = eventService.EventEndList(start, end, searchOption, keyword);

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("eventEndList", eventEndList);
		map.put("count", count);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("c_Paging", c_Paging);

		ModelAndView mav = new ModelAndView();

		MovieBannerModel bannerselect = movieService.banner_select();
		mav.addObject("bannerselect", bannerselect);
		mav.addObject("map", map);
		mav.setViewName("eventEndList");

		return mav;
	}

	// 게시글 목록 1
	@RequestMapping(value = "/eventList_1.see")
	public ModelAndView EventList_1(@RequestParam(defaultValue = "event_subject") String searchOption,
			@RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "1") int curPage)
			throws Exception {

		int count = eventService.count(searchOption, keyword);

		commonPaging c_Paging = new commonPaging(count, curPage);
		int start = c_Paging.getPageBegin();
		int end = c_Paging.getPageEnd();

		// 1. 영화
		List<EventModel> eventList_1 = eventService.EventList_1(start, end, searchOption, keyword);

		// 데이터를 맵에 저장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("eventList_1", eventList_1);
		map.put("count", count);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("c_Paging", c_Paging);

		ModelAndView mav = new ModelAndView();
		
		MovieBannerModel bannerselect = movieService.banner_select();
		mav.addObject("bannerselect", bannerselect);
		mav.addObject("map", map);
		mav.setViewName("eventList_1");

		return mav;
	}

	// 게시글 목록 2
	@RequestMapping(value = "/eventList_2.see")
	public ModelAndView EventList_2(@RequestParam(defaultValue = "event_subject") String searchOption,
			@RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "1") int curPage)
			throws Exception {

		int count = eventService.count(searchOption, keyword);

		commonPaging c_Paging = new commonPaging(count, curPage);
		int start = c_Paging.getPageBegin();
		int end = c_Paging.getPageEnd();

		// 2. 시사회/무대인사
		List<EventModel> eventList_2 = eventService.EventList_2(start, end, searchOption, keyword);

		// 데이터를 맵에 저장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("eventList_2", eventList_2);
		map.put("count", count);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("c_Paging", c_Paging);

		ModelAndView mav = new ModelAndView();

		MovieBannerModel bannerselect = movieService.banner_select();
		mav.addObject("bannerselect", bannerselect);
		mav.addObject("map", map);
		mav.setViewName("eventList_2");

		return mav;
	}

	// 게시글 목록 3
	@RequestMapping(value = "/eventList_3.see")
	public ModelAndView EventList_3(@RequestParam(defaultValue = "event_subject") String searchOption,
			@RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "1") int curPage)
			throws Exception {

		int count = eventService.count(searchOption, keyword);

		commonPaging c_Paging = new commonPaging(count, curPage);
		int start = c_Paging.getPageBegin();
		int end = c_Paging.getPageEnd();

		// 3. 롯시NOW
		List<EventModel> eventList_3 = eventService.EventList_3(start, end, searchOption, keyword);

		// 데이터를 맵에 저장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("eventList_3", eventList_3);
		map.put("count", count);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("c_Paging", c_Paging);

		ModelAndView mav = new ModelAndView();

		MovieBannerModel bannerselect = movieService.banner_select();
		mav.addObject("bannerselect", bannerselect);
		mav.addObject("map", map);
		mav.setViewName("eventList_3");

		return mav;
	}

	// 게시글 목록 4
	@RequestMapping(value = "/eventList_4.see")
	public ModelAndView EventList_4(@RequestParam(defaultValue = "event_subject") String searchOption,
			@RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "1") int curPage)
			throws Exception {

		int count = eventService.count(searchOption, keyword);

		commonPaging c_Paging = new commonPaging(count, curPage);
		int start = c_Paging.getPageBegin();
		int end = c_Paging.getPageEnd();

		// 4. 제휴할인
		List<EventModel> eventList_4 = eventService.EventList_4(start, end, searchOption, keyword);

		// 데이터를 맵에 저장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("eventList_4", eventList_4);
		map.put("count", count);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("c_Paging", c_Paging);

		ModelAndView mav = new ModelAndView();

		MovieBannerModel bannerselect = movieService.banner_select();
		mav.addObject("bannerselect", bannerselect);
		mav.addObject("map", map);
		mav.setViewName("eventList_4");

		return mav;
	}

	@RequestMapping(value = "/eventView.see", method = RequestMethod.GET)
	public ModelAndView EventView(HttpServletRequest request, HttpSession session) throws Exception {

		int event_no = Integer.parseInt(request.getParameter("event_no"));

		EventModel eventModel = new EventModel();
		eventModel = eventService.EventView(event_no);

		eventService.EventHitUpdate(event_no, session);

		ModelAndView mav = new ModelAndView();
		
		MovieBannerModel bannerselect = movieService.banner_select();
		mav.addObject("bannerselect", bannerselect);
		mav.addObject("eventModel", eventModel);
		mav.setViewName("eventView");

		return mav;
	}

}
