package movie.notice;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import movie.common.paging.Paging;

@Controller
@RequestMapping("/admin")
public class NoticeController {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="noticeService")
	private NoticeService noticeService;
	
	private int currentPage = 1;
	private int totalCount; //전체 게시물의 수
	private int blockCount = 4; //한 페이지의 보여줄 게시물의 수
	private int blockPage = 5; //한 화면에 보여줄 페이지의 수
	private String pagingHtml;
	private Paging page; //공통 페이징 클래스의 변수
	
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
	
	//글 목록
	@RequestMapping(value="/noticeList.see", method=RequestMethod.GET)
	public ModelAndView NoticeList(HttpServletRequest request){
		
		ModelAndView mav = new ModelAndView();
		
		if(request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty() ||
				request.getParameter("currentPage").equals("0")){
			
			currentPage = 1;
			
		}else{
			
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			
		}
		
		
		return mav;
		
	}
	
	
}
