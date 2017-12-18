package movie.freeboard;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import movie.common.paging.commonPaging;

@Controller
@RequestMapping("/free")
public class FreeBoardController {

	private final Logger log = Logger.getLogger(this.getClass());

	@Inject
	private FreeBoardService freeBoardService;

	@RequestMapping(value = "/freeBoardWrite.see", method = RequestMethod.GET)
	public String FreeBoardWriteForm() {
		return "freeBoardWrite";
	}

	@RequestMapping(value = "/freeBoardWrite.see", method = RequestMethod.POST)
	public String FreeBoardWrite(@ModelAttribute("freeBoardModel") FreeBoardModel freeBoardModel) throws Exception {

		freeBoardModel.setFreeboard_re_step(0);
		freeBoardService.FreeBoardWrite(freeBoardModel);

		return "redirect:/free/freeBoardList.see";
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
		mav.addObject("map", map);
		mav.setViewName("freeBoardList");

		return mav;
	}

	// 게시글 상세보기
	@RequestMapping(value = "/freeBoardView.see")
	public ModelAndView FreeBoardView(HttpServletRequest request, HttpSession session) throws Exception {

		int freeboard_no = Integer.parseInt(request.getParameter("freeboard_no"));
		
		freeBoardService.FreeBoardHitUpdate(freeboard_no, session);
		FreeBoardModel freeBoardModel = freeBoardService.FreeBoardView(freeboard_no);
		ModelAndView mav = new ModelAndView();
		
		if (freeBoardModel.getFreeboard_ref() == freeBoardModel.getFreeboard_no()) {
			mav.addObject("ref", 0);
		} else {
			mav.addObject("ref", 1);
		}

		mav.addObject("freeBoardModel", freeBoardModel);
		mav.setViewName("freeBoardView");
		return mav;
	}

}
