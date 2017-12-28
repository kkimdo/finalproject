package movie.admin.member;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import movie.member.MemberModel;
import movie.member.MemberService;
import movie.common.paging.commonPaging;
import movie.validator.MemberValidator;

@Controller
@RequestMapping("/admin")
public class MemberAdminController {
	
	@Resource(name="memberService")
	private MemberService memberService;
	
	ModelAndView mav = new ModelAndView();
	
	
	// 회원 목록
	@RequestMapping(value = "/memberList.see")
	// @RequestParam(defaultValue="") ==> 기본값 할당 : 현재페이지를 1로 초기화
	public ModelAndView MemberList(@RequestParam(defaultValue = "member_no") String searchOption,
			@RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "1") int curPage)
			throws Exception {

		// 레코드의 갯수 계산
		int count = memberService.count(searchOption, keyword);

		// 페이지 나누기 관련 처리
		commonPaging c_Paging = new commonPaging(count, curPage);
		int start = c_Paging.getPageBegin();
		int end = c_Paging.getPageEnd();

		List<MemberModel> memberList = memberService.memberListAll(start, end, searchOption, keyword);

		// 데이터를 맵에 저장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberList", memberList);
		map.put("count", count);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("c_Paging", c_Paging);

		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map); // 맵에 저장된 데이터를 mav에 저장
		mav.setViewName("AdminMemberList"); // 

		return mav;
	}

	
	//정보 수정
	@RequestMapping("/memberModify.see")
	public ModelAndView memberModify(@ModelAttribute("member") MemberModel member, BindingResult result, HttpSession session) {
		
		if(session.getAttribute("session_member_id") == null) {
			mav.setViewName("common/loginConfirm");
			return mav;
		}
		
		MemberModel memberModel = new MemberModel();
		
		if(session.getAttribute("session_member_id") != null) {
			memberService.memberModify(member);
			mav.addObject("member", memberModel);
			mav.setViewName("redirect:/main.see");
			return mav;
		}
		
		mav.setViewName("common/loginConfirm");
		return mav;
	}
	
	//회원 탈퇴 폼
	@RequestMapping(value = "/memberDelete.see")
	public String memberDelete(@RequestParam int member_no) throws Exception {

		memberService.memberDelete(member_no);

		return "redirect:/admin/memberList.see";
	}
	
	//Admin memberView
	@RequestMapping(value = "/memberView.see", method = RequestMethod.GET)
	public ModelAndView memberView(@RequestParam int member_no, HttpSession session) throws Exception {

		// 모델(데이터) + 뷰(화면) 을 함께 전달하는 객체
		ModelAndView mav = new ModelAndView();
		// 뷰에 전달할 데이터

		mav.addObject("member",memberService.memberView(member_no));
		// 뷰의 이름
		mav.setViewName("AdminMemberView");

		return mav;
	}

	// 게시글 수정 폼에서 입력한 내용들은 @ModelAttribute NoticeModel noticeModel 로 전달 됨.
	@RequestMapping(value = "/memberUpdate.see", method = RequestMethod.POST)
	public ModelAndView memberUpdate(@ModelAttribute("memberModel") MemberModel member,
			BindingResult result) throws Exception {

		ModelAndView mav = new ModelAndView();

		new MemberValidator().validate(member, result);

		if (result.hasErrors()) {
			mav.setViewName("adminMemberUpdate");
			return mav;
		}
		
		memberService.memberModify(member);
		
		mav.setViewName("redirect:/admin/memberList.see");

		return mav;

	}

}
