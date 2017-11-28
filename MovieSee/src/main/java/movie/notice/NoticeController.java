package movie.notice;

import java.util.List;

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
		mav.setViewName("redirect:/admin/noticeList.see");
		
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
		
		List<NoticeModel> noticeList = null;
		noticeList = noticeService.NoticeList();
		
		totalCount = noticeList.size();
		
		//page 객체 생성 후 Paging에 인자 값 전달
		page = new Paging(currentPage, totalCount, blockCount, blockPage, "noticeList");
		//page 객체에 생성한 것들을 pagingHtml에 담는다.
		pagingHtml = page.getPagingHtml().toString();
		
		int lastCount = totalCount;
	
		if(page.getEndCount() < totalCount){
			lastCount = page.getEndCount() + 1;
		}
		
		noticeList = noticeList.subList(page.getStartCount(), lastCount);
		
		mav.addObject("totalCount", totalCount);
		mav.addObject("pagingHtml", pagingHtml);
		mav.addObject("currentPage", currentPage);
		mav.addObject("noticeList", noticeList);
		mav.setViewName("admin/notice/AdminNoticeList");
		
		return mav;
		
	}
	
	//글 상세보기
	@RequestMapping(value="/noticeView.see")
	public ModelAndView NoticeView(HttpServletRequest request){
	
		ModelAndView mav = new ModelAndView();
		
		int notice_no = Integer.parseInt(request.getParameter("notice_no"));
		
		NoticeModel noticeModel = new NoticeModel();
		
		noticeModel = noticeService.NoticeView(notice_no); 
		noticeService.NoticeHitUpdate(notice_no);
		
		mav.addObject("currentPage", currentPage);
		mav.addObject("noticeModel", noticeModel);
		mav.setViewName("admin/notice/AdminNoticeView");
		
		return mav;
	}

	//글 수정 폼
	@RequestMapping(value="/noticeUpdate.see", method=RequestMethod.GET)
	public ModelAndView NoticeUpdateForm(NoticeModel noticeModel, HttpServletRequest request){

		ModelAndView mav = new ModelAndView();

		int notice_no = Integer.parseInt(request.getParameter("notice_no"));
		noticeModel = noticeService.NoticeView(notice_no);

		mav.addObject("noticeModel", noticeModel);
		mav.setViewName("admin/notice/AdminNoticeUpdate");

		return mav;

	}
	
	//글 수정
	@RequestMapping(value="/noticeUpdate.see", method=RequestMethod.POST)
	public ModelAndView NoticeUpdate(NoticeModel noticeModel, HttpServletRequest request){

		ModelAndView mav = new ModelAndView();

		noticeService.NoticeUpdate(noticeModel);

		mav.addObject("noticeModel", noticeModel);
		mav.setViewName("redirect:/admin/noticeList.see");

		return mav;

	}
	
}
