package movie.event;

import java.io.File;
import java.util.UUID;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
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
		
		String originalName = multipartFile.getOriginalFilename();
		String root = multipartHttpServletRequest.getSession().getServletContext().getRealPath("/");
		//String a = "C:/github/finalproject/MovieSee/src/main/webapp/";
		String savedPath = root + "resources/uploads/";
		byte[] fileData = multipartFile.getBytes();
		
		System.out.println("originalName : " + originalName);
		System.out.println("root : " + root);
		System.out.println("savedPath : " + savedPath);
		
		// uuid 생성(Universal Unique IDentifier, 범용 고유 식별자)
		UUID uuid = UUID.randomUUID();
		
		//랜덤 생성 + 파일 이름 저장
		String savedName = uuid.toString() + "_" + originalName;
		File file = new File(savedPath + savedName);
		// 임시디렉토리에 저장된 업로드된 파일을 지정된 디렉토리로 복사
        // FileCopyUtils.copy(바이트배열, 파일객체)
        FileCopyUtils.copy(fileData, file);
        
		multipartFile.transferTo(file);
		
        ModelAndView mav = new ModelAndView();
        
        mav.addObject("originalName", originalName);
        mav.setViewName("/admin/event/AdminEventView");
        
        return mav;
	}

	
}
