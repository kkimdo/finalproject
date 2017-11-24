package movie.notice;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin")
public class NoticeController {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="noticeService")
	private NoticeService noticeService;
	
	//글쓰기 폼
	@RequestMapping(value="/noticeWrite.see", method=RequestMethod.GET)
	public ModelAndView NoticeWriteForm(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/notice/AdminNoticeWrite");
		return mav;
	}
	
	//글쓰기
	@RequestMapping(value="/noticeWrite.see", method=RequestMethod.POST)
	public ModelAndView NoticeWrite(@ModelAttribute("noticeModel") NoticeModel noticeModel, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
	
		noticeService.NoticeWrite(noticeModel);
			
		mav.addObject("noticeModel", noticeModel);
		mav.setViewName("redirect:/admin/notice/AdminNoticeList");
		
		return mav;
	}
	
}
