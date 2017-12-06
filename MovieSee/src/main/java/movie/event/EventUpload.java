package movie.event;

import java.io.File;
import java.util.Iterator;

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
		
		String originalName = "";
		String root = multipartHttpServletRequest.getSession().getServletContext().getRealPath("/");
		String uploadPath = root + "resources/uploads/";
		
		System.out.println("root : " + root);
		System.out.println("uploadPath : " + uploadPath);
		
		File dir = new File(root);
        if(!dir.isDirectory()){
            dir.mkdir();
        }
        
        Iterator<String> files = multipartHttpServletRequest.getFileNames();
       
        while(files.hasNext()){
        	
            String uploadFile = files.next();
                         
            MultipartFile mFile = multipartHttpServletRequest.getFile(uploadFile);
            
            String fileName = mFile.getOriginalFilename();
            System.out.println("실제 파일 이름 : " +fileName);
            
            originalName = System.currentTimeMillis()+"."
                    +fileName.substring(fileName.lastIndexOf(".")+1);
             
            try {
            	
            	mFile.transferTo(new File(uploadPath + originalName));
            
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        ModelAndView mav = new ModelAndView();
        
        mav.addObject("originalName", originalName);
        mav.setViewName("/admin/event/AdminEventView");
        
        return mav;
	}

	
}
