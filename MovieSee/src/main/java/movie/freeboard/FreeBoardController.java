package movie.freeboard;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import movie.common.paging.commonPaging;
import movie.movie.MovieBannerModel;
import movie.movie.MovieService;
import movie.validator.FreeBoardValidator;

@Controller
@RequestMapping("/free")
public class FreeBoardController {

	Logger log = Logger.getLogger(this.getClass());

	@Inject
	private FreeBoardService freeBoardService;
	
	@Inject
	private MovieService movieService;

	// 유효성 검사시 FreeBoardModel 객체로 리턴 해줘야함.
	@ModelAttribute
	public FreeBoardModel formBack() {
		return new FreeBoardModel();
	}

	@RequestMapping(value = "/freeBoardWrite.see", method = RequestMethod.GET)
	public ModelAndView FreeBoardWriteForm(HttpSession session) {
		
		String freeboard_id = (String) session.getAttribute("session_member_id");
		ModelAndView mav = new ModelAndView();
		
		if(freeboard_id == null){
			
			mav.setViewName("freeboard/FreeBoardLoginCheck");
			return mav;
			
		}
		
		MovieBannerModel bannerselect = movieService.banner_select();
		mav.addObject("bannerselect", bannerselect);
		mav.setViewName("freeBoardWrite");
		
		return mav;
	}

	@RequestMapping(value = "/freeBoardWrite.see", method = RequestMethod.POST)
	public ModelAndView FreeBoardWrite(@ModelAttribute("freeBoardModel") FreeBoardModel freeBoardModel,
			BindingResult result) throws Exception {

		ModelAndView mav = new ModelAndView();

		// noticeModel를 유효성 검사 객체로 담고, 결과를 result로 도출
		new FreeBoardValidator().validate(freeBoardModel, result);
		if (result.hasErrors()) {
			mav.setViewName("freeBoardWrite");
			return mav;
		}

		freeBoardModel.setFreeboard_re_step(0);
		freeBoardService.FreeBoardWrite(freeBoardModel);
		MovieBannerModel bannerselect = movieService.banner_select();
		mav.addObject("bannerselect", bannerselect);

		mav.setViewName("redirect:/free/freeBoardList.see");

		return mav;
	}

	// 게시글 목록
	@RequestMapping(value = "/freeBoardList.see")
	public ModelAndView FreeBoardList(@RequestParam(defaultValue = "freeboard_subject") String searchOption,
			@RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "1") int curPage)
			throws Exception {

		// 레코드의 갯수 계산
		int count = freeBoardService.count(searchOption, keyword);

		// 페이지 나누기 관련 처리
		commonPaging c_Paging = new commonPaging(count, curPage);
		int start = c_Paging.getPageBegin();
		int end = c_Paging.getPageEnd();

		List<FreeBoardModel> freeBoardList = freeBoardService.FreeBoardListAll(start, end, searchOption, keyword);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("freeBoardList", freeBoardList);
		map.put("count", count);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("c_Paging", c_Paging);

		ModelAndView mav = new ModelAndView();
		MovieBannerModel bannerselect = movieService.banner_select();
		mav.addObject("bannerselect", bannerselect);
		mav.addObject("map", map);
		mav.setViewName("freeBoardList");

		return mav;
	}

	// 게시글 상세보기
	@RequestMapping(value = "/freeBoardView.see")
	public ModelAndView FreeBoardView(HttpServletRequest request, HttpSession session) throws Exception {

		int freeboard_no = Integer.parseInt(request.getParameter("freeboard_no"));
		String freeboard_id = (String) session.getAttribute("session_member_id");
		ModelAndView mav = new ModelAndView();
		
		if(freeboard_id == null){
			
			mav.setViewName("freeboard/FreeBoardLoginCheck");
			return mav;
			
		}
		
		freeBoardService.FreeBoardHitUpdate(freeboard_no, session);
		FreeBoardModel freeBoardModel = freeBoardService.FreeBoardView(freeboard_no);

		if (freeBoardModel.getFreeboard_ref() == freeBoardModel.getFreeboard_no()) {
			mav.addObject("ref", 0);
		} else {
			mav.addObject("ref", 1);
		}

		MovieBannerModel bannerselect = movieService.banner_select();
		mav.addObject("bannerselect", bannerselect);
		mav.addObject("freeBoardModel", freeBoardModel);
		mav.setViewName("freeBoardView");
		return mav;
	}

	@RequestMapping(value = "/freeBoardDelete.see")
	public ModelAndView FreeBoardDelete(FreeBoardModel freeBoardModel, HttpServletRequest request) throws Exception {

		int deleteCheck;

		int freeboard_no = Integer.parseInt(request.getParameter("freeboard_no"));
		String freeboard_passwd = request.getParameter("freeboard_passwd");
		//System.out.println("비밀번호 : " + freeboard_passwd);

		freeBoardModel = freeBoardService.FreeBoardView(freeboard_no);
		ModelAndView mav = new ModelAndView();

		if (freeBoardModel.getFreeboard_passwd().equals(freeboard_passwd)) {

			if (freeBoardModel.getFreeboard_ref() == freeBoardModel.getFreeboard_no()) {

				// 원본 글
				deleteCheck = 1;
				freeBoardService.FreeBoardDelete(freeBoardModel.getFreeboard_ref());

			} else {

				// 답변 글
				deleteCheck = 1;
				freeBoardService.FreeRefDelete(freeboard_no);
			}

		} else {

			deleteCheck = -1;
			mav.setViewName("/free/freeBoardCheckForm.see");

		}

		MovieBannerModel bannerselect = movieService.banner_select();
		mav.addObject("bannerselect", bannerselect);
		mav.addObject("deleteCheck", deleteCheck);
		mav.setViewName("freeboard/FreeBoardDeleteResult");
		return mav;

	}

	@RequestMapping(value = "/freeBoardCheckForm.see", method = RequestMethod.GET)
	public ModelAndView FreeBoardCheck(HttpServletRequest request) throws Exception {

		String freeboard_no = request.getParameter("freeboard_no");

		ModelAndView mav = new ModelAndView();

		MovieBannerModel bannerselect = movieService.banner_select();
		mav.addObject("bannerselect", bannerselect);
		mav.addObject("freeboard_no", freeboard_no);
		mav.setViewName("freeboard/FreeBoardCheck");
		return mav;
	}

	@RequestMapping(value = "/freeBoardWriteReply.see", method = RequestMethod.GET)
	public ModelAndView FreeBoardWriteReplyForm(FreeBoardModel freeboardModel, HttpServletRequest request, HttpSession session)
			throws Exception {

		int freeboard_no = Integer.parseInt(request.getParameter("freeboard_no"));
		String freeboard_id = (String) session.getAttribute("session_member_id");
		ModelAndView mav = new ModelAndView();
		
		if(freeboard_id == null){
			
			mav.setViewName("freeboard/FreeBoardLoginCheck");
			return mav;
			
		}
	
		freeboardModel = freeBoardService.FreeBoardView(freeboard_no);

		freeboardModel.setFreeboard_re_step(1);

		MovieBannerModel bannerselect = movieService.banner_select();
		mav.addObject("bannerselect", bannerselect);
		mav.addObject("freeboardModel", freeboardModel);
		mav.setViewName("freeBoardReply");

		return mav;
	}

	@RequestMapping(value = "/freeBoardReplySuccess.see")
	public ModelAndView FreeBoardWriteReply(@ModelAttribute("freeBoardModel") FreeBoardModel freeBoardModel,
			HttpServletRequest request) throws Exception {

		int freeboard_no = Integer.parseInt(request.getParameter("freeboard_no"));

		freeBoardModel.setFreeboard_ref(freeboard_no);
		freeBoardModel.setFreeboard_re_step(1);

		freeBoardService.FreeBoardWriteReply(freeBoardModel);

		ModelAndView mav = new ModelAndView();

		MovieBannerModel bannerselect = movieService.banner_select();
		mav.addObject("bannerselect", bannerselect);
		mav.setViewName("redirect:/free/freeBoardList.see");

		return mav;
	}

	@RequestMapping(value = "/freeBoardUpdate.see", method = RequestMethod.GET)
	public ModelAndView FreeBoardUpdateForm(@ModelAttribute("freeBoardModel") FreeBoardModel freeBoardModel,
			HttpServletRequest request, HttpSession session) throws Exception {

		int freeboard_no = Integer.parseInt(request.getParameter("freeboard_no"));
		String freeboard_id = (String) session.getAttribute("session_member_id");
		ModelAndView mav = new ModelAndView();
		
		if(freeboard_id == null){
			
			mav.setViewName("freeboard/FreeBoardLoginCheck");
			return mav;
			
		}
		freeBoardModel = freeBoardService.FreeBoardView(freeboard_no);

		String content = freeBoardModel.getFreeboard_content().replaceAll("<br/>", "\r\n");
		freeBoardModel.setFreeboard_content(content);

		MovieBannerModel bannerselect = movieService.banner_select();
		mav.addObject("bannerselect", bannerselect);
		mav.addObject("freeBoardModel", freeBoardModel);
		mav.setViewName("freeBoardUpdate");
		return mav;
	}

	@RequestMapping(value = "/freeBoardUpdate.see", method = RequestMethod.POST)
	public ModelAndView FreeBoardUpdate(@ModelAttribute("freeBoardModel") FreeBoardModel freeBoardModel,
			HttpServletRequest request) throws Exception {

		ModelAndView mav = new ModelAndView();

		freeBoardService.FreeBoardUpdate(freeBoardModel);

		MovieBannerModel bannerselect = movieService.banner_select();
		mav.addObject("bannerselect", bannerselect);
		mav.setViewName("redirect:/free/freeBoardList.see");

		return mav;
	}

	@RequestMapping(value = "/freeBoardUpdateCheck.see")
	public ModelAndView FreeBoardUpdateCheck(@ModelAttribute("freeBoardModel") FreeBoardModel freeBoardModel,
			HttpServletRequest request) throws Exception {

		int updateCheck;

		int freeboard_no = Integer.parseInt(request.getParameter("freeboard_no"));
		String input_passwd = request.getParameter("freeboard_passwd"); // 입력한
																		// 비밀 번호
																		// 값.
		ModelAndView mav = new ModelAndView();

		FreeBoardModel freeBoardModel2 = new FreeBoardModel();
		freeBoardModel2 = freeBoardService.FreeBoardView(freeboard_no);

		// 해당하는 글의 비밀 번호와 입력한 비밀번호와 비교
		if (freeBoardModel2.getFreeboard_passwd().equals(input_passwd)) {
			updateCheck = 1;

		} else {
			updateCheck = -1;
		}

		MovieBannerModel bannerselect = movieService.banner_select();
		mav.addObject("bannerselect", bannerselect);
		mav.addObject("freeBoardModel", freeBoardModel);
		mav.addObject("updateCheck", updateCheck);

		mav.setViewName("freeboard/FreeBoardUpdateResult");
		return mav;
	}

	// 게시글 삭제
	@RequestMapping(value = "/freeBoardAdminDelete.see")
	public ModelAndView FreeBoardAdminDelete(FreeBoardModel freeBoardModel, HttpServletRequest request)
			throws Exception {

		int freeboard_no = Integer.parseInt(request.getParameter("freeboard_no"));
		freeBoardModel = freeBoardService.FreeBoardView(freeboard_no);

		ModelAndView mav = new ModelAndView();

		if (freeBoardModel.getFreeboard_ref() == freeBoardModel.getFreeboard_no()) {
			freeBoardService.FreeBoardAdminDelete(freeBoardModel.getFreeboard_ref());

		} else {
			freeBoardService.FreeRefAdminDelete(freeboard_no);
		}
		
		MovieBannerModel bannerselect = movieService.banner_select();
		mav.addObject("bannerselect", bannerselect);
		mav.setViewName("redirect:/free/freeBoardList.see");
		return mav;

	}

}
