package movie.event;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import movie.common.paging.commonPaging;

@Controller
@RequestMapping("/admin")
public class EventController {

	Logger log = Logger.getLogger(this.getClass());

	@Inject
	private EventService eventService;
	private static final String ImagePath = "C:/github/finalproject/MovieSee/src/main/webapp/resources/uploads/event/";

	@RequestMapping(value = "/eventWrite.see", method = RequestMethod.GET)
	public String EventWriteForm() {
		return "adminEventWrite";
	}

	@RequestMapping(value = "/eventWrite.see", method = RequestMethod.POST)
	public ModelAndView EventWrite(@ModelAttribute("eventModel") EventModel eventModel,
			MultipartHttpServletRequest multipartHttpServletRequest) throws Exception {
		// String path =
		// multipartHttpServletRequest.getSession().getServletContext().getRealPath("/uploads/event/");

		int eventSeqName = eventService.EventGetSEQ();
		eventModel.setEvent_no(eventSeqName);

		MultipartFile multipartFile = multipartHttpServletRequest.getFile("imageFile");

		// log test
		log.info("파일이름 :" + multipartFile.getOriginalFilename());
		log.info("파일크기 : " + multipartFile.getSize());
		log.info("컨텐트 타입 : " + multipartFile.getContentType());

		String originalFileName = multipartFile.getOriginalFilename();
		String originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);

		if (originalFileExtension != "") {

			String storedFileName = "eventImage_" + eventSeqName + "." + originalFileExtension;

			File file = new File(ImagePath + storedFileName);

			System.out.println("storedFileName : " + storedFileName);

			multipartFile.transferTo(file);

			System.out.println("originalFileName : " + originalFileName);

			eventModel.setEvent_original_file_name(originalFileName);
			eventModel.setEvent_stored_file_name(storedFileName);
		}

		eventService.EventWrite(eventModel);

		ModelAndView mav = new ModelAndView();

		mav.addObject("eventModel", eventModel);
		mav.setViewName("redirect:/admin/eventList.see");

		return mav;

	}

	// 게시글 목록
	@RequestMapping(value = "/eventList.see")
	public ModelAndView EventList(@RequestParam(defaultValue = "event_subject") String searchOption,
			@RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "1") int curPage)
			throws Exception {

		// 레코드의 갯수 계산
		int count = eventService.count(searchOption, keyword);

		// 페이지 나누기 관련 처리
		commonPaging c_Paging = new commonPaging(count, curPage);
		int start = c_Paging.getPageBegin();
		int end = c_Paging.getPageEnd();

		List<EventModel> eventList = eventService.EventListAll(start, end, searchOption, keyword);

		// 데이터를 맵에 저장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("eventList", eventList);
		map.put("count", count);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("c_Paging", c_Paging);

		ModelAndView mav = new ModelAndView();

		mav.addObject("map", map);
		mav.setViewName("adminEventList");

		return mav;
	}

}
