package movie.admin.event;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import movie.common.paging.commonPaging;
import movie.validator.EventValidator;

@Controller
@RequestMapping("/admin")
public class EventController {

	Logger log = Logger.getLogger(this.getClass());

	@Inject
	private EventService eventService;

	private static final String uploadPath = "C:/github/finalproject/MovieSee/src/main/webapp/resources/uploads/event/";

	// 유효성 검사시 EventModel 객체로 리턴 해줘야함.
	@ModelAttribute
	public EventModel formBack() {
		return new EventModel();
	}

	@RequestMapping(value = "/eventWrite.see", method = RequestMethod.GET)
	public String EventWriteForm() {
		return "adminEventWrite";
	}

	// 다시 작업
	@RequestMapping(value = "/eventWrite.see", method = RequestMethod.POST)
	public ModelAndView EventWrite(@ModelAttribute("eventModel") EventModel eventModel,
			MultipartHttpServletRequest multipartHttpServletRequest, BindingResult result) throws Exception {

		int eventSeqNum = eventService.EventGetSEQ();
		eventModel.setEvent_no(eventSeqNum);

		MultipartFile multipartFile1 = multipartHttpServletRequest.getFile("poster_file");
		MultipartFile multipartFile2 = multipartHttpServletRequest.getFile("content_file");

		String poster_full_name = "";

		if (!multipartFile1.isEmpty()) {

			String poster_name = multipartFile1.getOriginalFilename();
			String poster_ext = poster_name.substring(poster_name.lastIndexOf('.') + 1);

			if (poster_ext != null && !poster_ext.equals("")) {

				poster_full_name = "eventPoster_" + eventSeqNum + "." + poster_ext;
				File file1 = new File(uploadPath + poster_full_name);

				if (!file1.exists()) {
					file1.mkdirs();
				}

				try {
					multipartFile1.transferTo(file1);
				} catch (Exception e) {
					e.printStackTrace();
				}

				eventModel.setEvent_poster_file(poster_full_name);
			}

		} else {

			eventModel.setEvent_poster_file(poster_full_name);
		}

		String content_full_name = "";

		if (!multipartFile2.isEmpty()) {

			String content_name = multipartFile2.getOriginalFilename();
			String content_ext = content_name.substring(content_name.lastIndexOf('.') + 1);

			if (content_ext != null && !content_ext.equals("")) {

				content_full_name = "eventContent_" + eventSeqNum + "." + content_ext;
				File file2 = new File(uploadPath + content_full_name);

				if (!file2.exists()) {
					file2.mkdirs();
				}

				try {
					multipartFile2.transferTo(file2);
				} catch (Exception e) {
					e.printStackTrace();
				}

				eventModel.setEvent_content_file(content_full_name);
			}

		} else {

			eventModel.setEvent_content_file(content_full_name);
		}

		ModelAndView mav = new ModelAndView();

		new EventValidator().validate(eventModel, result);
		if (result.hasErrors()) {
			mav.setViewName("adminEventWrite");
			return mav;
		}

		eventService.EventWrite(eventModel);

		mav.addObject("eventModel", eventModel);
		mav.setViewName("redirect:/admin/eventListMain.see");

		return mav;

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

		mav.addObject("map", map);
		mav.setViewName("adminEventListMain");

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

		mav.addObject("map", map);
		mav.setViewName("adminEventEndList");

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

		mav.addObject("map", map);
		mav.setViewName("adminEventList_1");

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

		mav.addObject("map", map);
		mav.setViewName("adminEventList_2");

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

		mav.addObject("map", map);
		mav.setViewName("adminEventList_3");

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

		mav.addObject("map", map);
		mav.setViewName("adminEventList_4");

		return mav;
	}

	@RequestMapping(value = "/eventView.see", method = RequestMethod.GET)
	public ModelAndView EventView(HttpServletRequest request, HttpSession session) throws Exception {

		int event_no = Integer.parseInt(request.getParameter("event_no"));

		EventModel eventModel = new EventModel();
		eventModel = eventService.EventView(event_no);

		eventService.EventHitUpdate(event_no, session);

		ModelAndView mav = new ModelAndView();
		mav.addObject("eventModel", eventModel);
		mav.setViewName("adminEventView");

		return mav;
	}

	// 게시글 수정 폼
	@RequestMapping(value = "/eventUpdate.see", method = RequestMethod.GET)
	public ModelAndView EventUpdateForm(@ModelAttribute("eventModel") EventModel eventModel) throws Exception {

		ModelAndView mav = new ModelAndView();

		eventModel = eventService.EventView(eventModel.getEvent_no());

		String content = eventModel.getEvent_content().replaceAll("<br/>", "\r\n");
		eventModel.setEvent_content(content);

		mav.addObject("eventModel", eventModel);

		mav.setViewName("adminEventUpdate");

		return mav;
	}

	// 게시글 수정
	@RequestMapping(value = "/eventUpdate.see", method = RequestMethod.POST)
	public ModelAndView EventUpdate(@ModelAttribute("eventModel") EventModel eventModel,
			MultipartHttpServletRequest multipartHttpServletRequest, BindingResult result) throws Exception {

		ModelAndView mav = new ModelAndView();
		
		new EventValidator().validate(eventModel, result);
		if (result.hasErrors()) {
			mav.setViewName("adminEventUpdate");
			return mav;
		}

		int eventSeqNum = eventService.EventGetSEQ();

		MultipartFile multipartFile1 = multipartHttpServletRequest.getFile("poster_file");
		MultipartFile multipartFile2 = multipartHttpServletRequest.getFile("content_file");

		if (!multipartFile1.isEmpty()) {

			String poster_name = multipartFile1.getOriginalFilename();
			String poster_ext = poster_name.substring(poster_name.lastIndexOf('.') + 1);

			if (poster_ext != null && !poster_ext.equals("")) {

				File deleteFile1 = new File(uploadPath + eventModel.getEvent_poster_file());
				deleteFile1.delete();

				String poster_full_name = "eventPoster_" + eventSeqNum + "." + poster_ext;
				File file1 = new File(uploadPath + poster_full_name);

				if (!file1.exists()) {
					file1.mkdirs();
				}

				try {
					multipartFile1.transferTo(file1);
				} catch (Exception e) {
					e.printStackTrace();
				}

				eventModel.setEvent_poster_file(poster_full_name);
			}

		} else {

			eventModel.setEvent_poster_file(eventModel.getEvent_poster_file());
		}

		if (!multipartFile2.isEmpty()) {

			String content_name = multipartFile2.getOriginalFilename();
			String content_ext = content_name.substring(content_name.lastIndexOf('.') + 1);

			if (content_ext != null && !content_ext.equals("")) {

				File deleteFile2 = new File(uploadPath + eventModel.getEvent_content_file());
				deleteFile2.delete();

				String content_full_name = "eventContent_" + eventSeqNum + "." + content_ext;
				File file2 = new File(uploadPath + content_full_name);

				if (!file2.exists()) {
					file2.mkdirs();
				}

				try {
					multipartFile2.transferTo(file2);
				} catch (Exception e) {
				}

				eventModel.setEvent_content_file(content_full_name);
			}

		} else {

			eventModel.setEvent_content_file(eventModel.getEvent_content_file());
		}

		eventService.EventUpdate(eventModel);

		mav.addObject("eventModel", eventModel);
		mav.setViewName("redirect:/admin/eventListMain.see");

		return mav;
	}

	// 게시글 삭제
	@RequestMapping(value = "/eventDelete.see")
	public String EventDelete(@RequestParam int event_no) throws Exception {

		eventService.EventDelete(event_no);

		return "redirect:/admin/eventListMain.see";
	}

}
