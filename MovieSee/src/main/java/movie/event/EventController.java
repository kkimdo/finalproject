package movie.event;

import java.io.File;
import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

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
		//String path = multipartHttpServletRequest.getSession().getServletContext().getRealPath("/uploads/event/");
		
		int eventSeqName = eventService.EventGetSEQ();
		eventModel.setEvent_no(eventSeqName);
		
		MultipartFile multipartFile = multipartHttpServletRequest.getFile("imageFile");
		
		// log test
		log.info("파일이름 :" + multipartFile.getOriginalFilename());
		log.info("파일크기 : " + multipartFile.getSize());
		log.info("컨텐트 타입 : " + multipartFile.getContentType());
		
		String originalFileName = multipartFile.getOriginalFilename();
		String originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
		
		if(originalFileExtension != ""){
			
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
		mav.setViewName("adminEventView"); //tiles name

		return mav;

	}

}
