package movie.event;

import java.io.File;
import java.util.Date;
import java.util.UUID;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin")
public class EventController {

	Logger log = Logger.getLogger(this.getClass());

	/*
	 * @Inject private EventService eventService;
	 */

	@RequestMapping(value = "/eventWrite.see", method = RequestMethod.GET)
	public String EventWriteForm() {
		return "/admin/event/AdminEventWrite";
	}

	@RequestMapping(value="/eventWrite.see", method=RequestMethod.POST)
	public ModelAndView EventWrite(@ModelAttribute("eventModel") EventModel eventModel, 
				@RequestParam Date event_start_date, @RequestParam Date event_end_date, MultipartHttpServletRequest multipartHttpServletRequest) throws Exception{
		
		MultipartFile multipartFile = multipartHttpServletRequest.getFile("imageFile");
		
		log.info("파일이름 :" + multipartFile.getOriginalFilename());
		log.info("파일크기 : " + multipartFile.getSize());
		log.info("컨텐트 타입 : " + multipartFile.getContentType());
		
		String path = multipartHttpServletRequest.getSession().getServletContext().getRealPath("/uploads/event/");
		String fullName = "";
		
		try{
			
			// uuid 생성(Universal Unique IDentifier, 범용 고유 식별자)
			UUID uuid = UUID.randomUUID();
			
			String savedName = "eventImg"+ "_" + uuid.toString()+ "_";
			String originalName = multipartFile.getOriginalFilename();
			
			System.out.println("originalName : " + originalName);
			
			if(originalName != null && !originalName.equals("")){
				
				fullName = savedName + originalName;
				File file = new File(path + fullName);
				System.out.println("path : " + path);
				System.out.println("fullName : " + fullName);
				
				if(!file.exists()){
					file.mkdirs();
				}
				
				multipartFile.transferTo(file);
				
				eventModel.setEvent_img(fullName);
					
			}
				
		}catch(Exception e){
			e.printStackTrace();
			
		}
		
		 ModelAndView mav = new ModelAndView();
	      
		 mav.addObject("fullName", fullName);
	     mav.setViewName("/admin/event/AdminEventView");
	      
	     return mav;
	      
	}
	
	
}
