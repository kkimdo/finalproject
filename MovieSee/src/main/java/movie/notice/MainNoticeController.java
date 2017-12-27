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

import movie.admin.notice.NoticeModel;
import movie.admin.notice.NoticeService;
import movie.common.paging.commonPaging;
import movie.movie.MovieBannerModel;
import movie.movie.MovieService;

@Controller
@RequestMapping("/notice")
public class MainNoticeController {

	Logger log = Logger.getLogger(this.getClass());

	@Inject
	private NoticeService noticeService;
	
	@Inject
	private MovieService movieService;

	private NoticeModel noticePrev = new NoticeModel();
	private int preNum = 0;

	private NoticeModel noticeNext = new NoticeModel();
	private int nextNum = 0;

	@ModelAttribute
	public NoticeModel formBack() {
		return new NoticeModel();
	}

	// 게시글 목록
	@RequestMapping(value = "/noticeList.see")
	// @RequestParam(defaultValue="") ==> 기본값 할당 : 현재페이지를 1로 초기화
	public ModelAndView NoticeList(@RequestParam(defaultValue = "notice_subject") String searchOption,
			@RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "1") int curPage)
			throws Exception {

		// 레코드의 갯수 계산
		int count = noticeService.count(searchOption, keyword);

		// 페이지 나누기 관련 처리
		commonPaging c_Paging = new commonPaging(count, curPage);
		int start = c_Paging.getPageBegin();
		int end = c_Paging.getPageEnd();

		List<NoticeModel> noticeList = noticeService.NoticeListAll(start, end, searchOption, keyword);

		// 데이터를 맵에 저장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("noticeList", noticeList);
		map.put("count", count);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("c_Paging", c_Paging);

		ModelAndView mav = new ModelAndView();
		
		MovieBannerModel bannerselect = movieService.banner_select();
		mav.addObject("bannerselect", bannerselect);
		mav.addObject("map", map);
		mav.setViewName("noticeList");

		return mav;
	}

	@RequestMapping(value = "/noticeView.see", method = RequestMethod.GET)
	public ModelAndView NoticeView(@RequestParam int notice_no, HttpSession session) throws Exception {

		// 조회수 증가 처리
		noticeService.NoticeHitUpdate(notice_no, session);

		noticePrev = noticeService.NoticePrev(notice_no);
		noticeNext = noticeService.NoticeNext(notice_no);

		if (noticePrev != null) {
			preNum = noticePrev.getNotice_prev();
		}

		if (noticeNext != null) {
			nextNum = noticeNext.getNotice_next();
		}

		// 모델(데이터) + 뷰(화면) 을 함께 전달하는 객체
		ModelAndView mav = new ModelAndView();
		// 뷰에 전달할 데이터

		mav.addObject("noticeModel", noticeService.NoticeView(notice_no));

		mav.addObject("noticePrev", noticeService.NoticeView(preNum)); // 이전글
		mav.addObject("noticeNext", noticeService.NoticeView(nextNum)); // 다음글
		mav.addObject("preNum", preNum);
		mav.addObject("nextNum", nextNum);
		// 뷰의 이름
		
		MovieBannerModel bannerselect = movieService.banner_select();
		mav.addObject("bannerselect", bannerselect);
		mav.setViewName("noticeView");

		return mav;
	}

}
