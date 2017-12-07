package movie.event;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin")
public class EventController {
	
	@RequestMapping(value="/eventWrite.see", method=RequestMethod.GET)
	public String EventWriteForm(){
		return "/admin/event/AdminEventWrite";
	}
	
	@RequestMapping(value="/eventWrite.see", method=RequestMethod.POST)
	public ModelAndView EventWrite(MultipartHttpServletRequest multipartHttpServletRequest) throws Exception{
		
		String filePath = "C:/Java/upload";
		Map<String, List<String>> fileNames = new HandlerFile(multipartHttpServletRequest, filePath).getUploadFileName();
		//실제저장 파일명과 원본 파일명 DB저장 처리
		
		ModelAndView mav = new ModelAndView();
	        
	    mav.addObject("oldNames", fileNames.get("oldNames"));
		mav.setViewName("/admin/event/AdminEventView");

		return mav;
		
	}

}
