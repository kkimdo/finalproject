package movie.event;

import java.io.File;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin")
public class EventUpload {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@RequestMapping(value="/eventWrite.see", method=RequestMethod.GET)
	public String EventWriteForm(){
		return "/admin/event/AdminEventWrite";
	}
	
	@RequestMapping(value="/eventWrite.see", method=RequestMethod.POST)
	public ModelAndView EventWrite(MultipartHttpServletRequest multipartHttpServletRequest) throws Exception{
		
		MultipartFile multipartFile = multipartHttpServletRequest.getFile("imageFile");
		
		String savedName = multipartFile.getOriginalFilename();
		String uploadPath = multipartHttpServletRequest.getSession().getServletContext().getRealPath("uploads/event/");
		
		File file = new File(uploadPath + savedName);
        
		multipartFile.transferTo(file);
		
        ModelAndView mav = new ModelAndView();
        
        mav.addObject("savedName", savedName);
        mav.setViewName("/admin/event/AdminEventView");
        
        return mav;
	}

	
}
