package movie.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import movie.common.paging.commonPaging;


@Controller //현재 클래스를 컨트롤러 빈(bean)으로 등록
@RequestMapping("/admin")
public class NoticeController {

	Logger log = Logger.getLogger(this.getClass());
	
	// 의존 관계 주입 => NoticeService 생성
	// IoC 의존관계 역전
	@Inject
	private NoticeService noticeService;
	
	private NoticeModel noticePrev = new NoticeModel();
	private int preNum = 0;
	
	private NoticeModel noticeNext = new NoticeModel();
	private int nextNum = 0;
	
	// 게시글 작성 화면
	// RequestMapping("admin/noticeWrite.see")
	// value="", method="전송방식"
	@RequestMapping(value="/noticeWrite.see", method=RequestMethod.GET)
	public String NoticeWriteForm(){
		return "adminNoticeWrite"; //tiles의 이름이 adminNoticeWrite로 이동
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
	
	// 게시글 목록
	@RequestMapping(value="/noticeList.see")
	// @RequestParam(defaultValue="") ==> 기본값 할당 : 현재페이지를 1로 초기화
	public ModelAndView NoticeList(@RequestParam(defaultValue="notice_subject") String searchOption,
									@RequestParam(defaultValue="") String keyword,
									@RequestParam(defaultValue="1") int curPage) throws Exception {
		
		//레코드의 갯수 계산
		int count = noticeService.count(searchOption, keyword);
		
		//페이지 나누기 관련 처리
		commonPaging c_Paging = new commonPaging(count, curPage);
		int start = c_Paging.getPageBegin();
		int end = c_Paging.getPageEnd();
		
		List<NoticeModel> noticeList = noticeService.NoticeListAll(start, end, searchOption, keyword);
		
		//데이터를 맵에 저장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("noticeList", noticeList);
		map.put("count", count); 
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("c_Paging", c_Paging);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map); //맵에 저장된 데이터를 mav에 저장
		mav.setViewName("adminNoticeList"); //뷰를 tiles의 이름이 adminNoticeList로 이동
		
		return mav;
	}
	
	// 게시글 상세 내용 조회, 게시글 조회수 증가 처리
	// @RequestParam : get/post방식으로 전달된 변수 1개
	// HttpSession 세션 객체
	@RequestMapping(value="/noticeView.see", method=RequestMethod.GET)
	public ModelAndView NoticeView(@RequestParam int notice_no, HttpSession session) throws Exception {
		
//		System.out.println(notice_no + "notice_no");
//		System.out.println(session + "session");
		
		//조회수 증가 처리
		noticeService.NoticeHitUpdate(notice_no, session);
		
		noticePrev = noticeService.NoticePrev(notice_no);
		noticeNext = noticeService.NoticeNext(notice_no);
		
		if(noticePrev != null){
			
			preNum = noticePrev.getNotice_prev();
			
		}
		
		if(noticeNext != null){
			
			nextNum = noticeNext.getNotice_next();
			
		}
		
		//모델(데이터) + 뷰(화면) 을 함께 전달하는 객체
		ModelAndView mav = new ModelAndView();
		//뷰에 전달할 데이터
		
		mav.addObject("noticeModel", noticeService.NoticeView(notice_no));
		
		mav.addObject("noticePrev", noticeService.NoticeView(preNum)); //이전글
		mav.addObject("noticeNext", noticeService.NoticeView(nextNum)); //다음글
		mav.addObject("preNum", preNum);
		mav.addObject("nextNum", nextNum);
		//뷰의 이름
		mav.setViewName("adminNoticeView");
		
		return mav;
	}

	//게시글 수정 폼
	@RequestMapping(value="/noticeUpdate.see", method=RequestMethod.GET)
	public ModelAndView NoticeUpdateForm(@RequestParam int notice_no) throws Exception{

		ModelAndView mav = new ModelAndView();

		mav.addObject("noticeModel", noticeService.NoticeView(notice_no));
		mav.setViewName("adminNoticeUpdate");
		
		return mav;

	}
	
	//게시글 수정
	//게시글 수정 폼에서 입력한 내용들은 @ModelAttribute NoticeModel noticeModel 로 전달 됨.
	@RequestMapping(value="/noticeUpdate.see", method=RequestMethod.POST)
	public ModelAndView NoticeUpdate(@ModelAttribute NoticeModel noticeModel) throws Exception{

		ModelAndView mav = new ModelAndView();

		mav.addObject("noticeModel", noticeService.NoticeUpdate(noticeModel));
		mav.setViewName("redirect:/admin/noticeList.see");

		return mav;

	}
	
	//게시글 삭제
	@RequestMapping(value="/noticeDelete.see")
	public String NoticeDelete(@RequestParam int notice_no) throws Exception{
		
		noticeService.NoticeDelete(notice_no);
		
		return "redirect:/admin/noticeList.see";
	}
	
}
