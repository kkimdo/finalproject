package movie.notice;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import movie.common.paging.Paging;

@Controller //현재 클래스를 컨트롤러 빈(bean)으로 등록
@RequestMapping("/admin")
public class NoticeController {

	Logger log = Logger.getLogger(this.getClass());
	
	// 의존 관계 주입 => NoticeService 생성
	// IoC 의존관계 역전
	@Inject
	private NoticeService noticeService;
	
	private int currentPage = 1;
	private int totalCount; //전체 게시물의 수
	private int blockCount = 4; //한 페이지의 보여줄 게시물의 수
	private int blockPage = 5; //한 화면에 보여줄 페이지의 수
	private String pagingHtml;
	private Paging page; //공통 페이징 클래스의 변수
	
	//검색
	private int searchNum;
	private String isSearch;
	
	// 게시글 작성 화면
	// RequestMapping("admin/noticeWrite.see")
	// value="", method="전송방식"
	@RequestMapping(value="/noticeWrite.see", method=RequestMethod.GET)
	public String NoticeWriteForm(){
		return "admin/notice/AdminNoticeWrite"; //AdminNoticeWrite.jsp 로 이동
	}
	
	// 게시글 작성 처리
	@RequestMapping(value="/noticeWrite.see", method=RequestMethod.POST)
	public ModelAndView NoticeWrite(@ModelAttribute("noticeModel") NoticeModel noticeModel) throws Exception {
		ModelAndView mav = new ModelAndView();
	
		noticeService.NoticeWrite(noticeModel);
			
		mav.addObject("noticeModel", noticeModel); // 데이터를 저장
		mav.setViewName("redirect:/admin/noticeList.see"); // AdminNoticeList.jsp 로 redirect
		
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
		
		isSearch = request.getParameter("isSearch"); //검색 내용
		
		if(isSearch != null){
			
			searchNum = Integer.parseInt(request.getParameter("searchNum")); //'0'은 제목, '1'은 제목
			
			if(searchNum == 0){
				noticeList = noticeService.NoticeSearchList0(isSearch);
			}else if(searchNum == 1){
				noticeList = noticeService.NoticeSearchList1(isSearch);
			}
			
			totalCount = noticeList.size();
			
			//page 객체 생성 후 Paging에 인자 값 전달
			page = new Paging(currentPage, totalCount, blockCount, blockPage, "noticeList", searchNum, isSearch);
			
			//page 객체에 생성한 것들을 pagingHtml에 담는다.
			pagingHtml = page.getPagingHtml().toString();
			
			int lastCount = totalCount;
		
			if(page.getEndCount() < totalCount){
				lastCount = page.getEndCount() + 1;
			}
			
			noticeList = noticeList.subList(page.getStartCount(), lastCount);
			
			mav.addObject("searchNum", searchNum);
			mav.addObject("isSearch", isSearch);
			mav.addObject("totalCount", totalCount);
			mav.addObject("pagingHtml", pagingHtml);
			mav.addObject("currentPage", currentPage);
			mav.addObject("noticeList", noticeList);
			mav.setViewName("admin/notice/AdminNoticeList");
			
			return mav;
			
		}
		
		//검색 없을 때
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
	
	// 게시글 상세 내용 조회, 게시글 조회수 증가 처리
	// @RequestParam : get/post방식으로 전달된 변수 1개
	// HttpSession 세션 객체
	@RequestMapping(value="/noticeView.see")
	public ModelAndView NoticeView(@RequestParam int notice_no, HttpSession session){
		
//		System.out.println(notice_no + "notice_no");
//		System.out.println(session + "session");
		
		//조회수 증가 처리
		noticeService.NoticeHitUpdate(notice_no, session);
		//모델(데이터) + 뷰(화면) 을 함께 전달하는 객체
		ModelAndView mav = new ModelAndView();
		//뷰에 전달할 데이터
		mav.addObject("noticeModel", noticeService.NoticeView(notice_no));
		//뷰의 이름
		mav.setViewName("admin/notice/AdminNoticeView");
		
		return mav;
	}

	//게시글 수정 폼
	@RequestMapping(value="/noticeUpdate.see", method=RequestMethod.GET)
	public ModelAndView NoticeUpdateForm(@RequestParam int notice_no){

		ModelAndView mav = new ModelAndView();

		mav.addObject("noticeModel", noticeService.NoticeView(notice_no));
		mav.setViewName("admin/notice/AdminNoticeUpdate");
		
		return mav;

	}
	
	//게시글 수정
	//게시글 수정 폼에서 입력한 내용들은 @ModelAttribute NoticeModel noticeModel 로 전달 됨.
	@RequestMapping(value="/noticeUpdate.see", method=RequestMethod.POST)
	public ModelAndView NoticeUpdate(@ModelAttribute NoticeModel noticeModel){

		ModelAndView mav = new ModelAndView();

		mav.addObject("noticeModel", noticeService.NoticeUpdate(noticeModel));
		mav.setViewName("redirect:/admin/noticeList.see");

		return mav;

	}
	
	//게시글 삭제
	@RequestMapping(value="/noticeDelete.see")
	public String NoticeDelete(@RequestParam int notice_no){
		
		noticeService.NoticeDelete(notice_no);
		
		return "redirect:/admin/noticeList.see";
	}
	
}
