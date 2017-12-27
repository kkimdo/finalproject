package movie.faq;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import movie.admin.faq.FaqModel;
import movie.admin.faq.FaqService;
import movie.common.paging.commonPaging;
import movie.movie.MovieBannerModel;
import movie.movie.MovieService;

@Controller
@RequestMapping("/faq")
public class MainFaqController {

	Logger log = Logger.getLogger(this.getClass());

	@Inject
	private FaqService faqService;

	@Inject
	private MovieService movieService;
	
	// 글 목록
	@RequestMapping(value = "/faqList.see")
	// @RequestParam(defaultValue="") ==> 기본값 할당 : 현재페이지를 1로 초기화
	public ModelAndView FaqList(@RequestParam(defaultValue = "faq_subject") String searchOption,
			@RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "1") int curPage)
			throws Exception {

		// 레코드의 갯수 계산
		int count = faqService.count(searchOption, keyword);

		// 페이지 나누기 관련 처리
		commonPaging c_Paging = new commonPaging(count, curPage);
		int start = c_Paging.getPageBegin();
		int end = c_Paging.getPageEnd();

		List<FaqModel> faqList = faqService.FaqListAll(start, end, searchOption, keyword);

		// 데이터를 맵에 저장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("faqList", faqList);
		map.put("count", count);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("c_Paging", c_Paging);

		ModelAndView mav = new ModelAndView();
		
		MovieBannerModel bannerselect = movieService.banner_select();
		mav.addObject("bannerselect", bannerselect);
		mav.addObject("map", map); // 맵에 저장된 데이터를 mav에 저장
		mav.setViewName("faqList"); // 뷰를 tiles의 이름이 faqList로 이동

		return mav;
	}

	// 글 상세보기
	@RequestMapping(value = "/faqView.see", method = RequestMethod.GET)
	public ModelAndView FaqView(@RequestParam int faq_no, HttpSession session) throws Exception {

		// 조회수 증가 처리
		faqService.FaqHitUpdate(faq_no, session);
		// 모델(데이터) + 뷰(화면) 을 함께 전달하는 객체
		ModelAndView mav = new ModelAndView();
		// 뷰에 전달할 데이터
		
		MovieBannerModel bannerselect = movieService.banner_select();
		mav.addObject("bannerselect", bannerselect);
		mav.addObject("faqModel", faqService.FaqView(faq_no));
		// 뷰의 이름
		mav.setViewName("faqView");

		return mav;
	}
}
