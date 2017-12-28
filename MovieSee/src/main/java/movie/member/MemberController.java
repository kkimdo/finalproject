package movie.member;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import movie.movie.MovieBannerModel;
import movie.movie.MovieService;
import movie.validator.MemberValidator;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Resource(name = "memberService")
	private MemberService memberService;
	
	@Inject
	private MovieService movieService;

	ModelAndView mav = new ModelAndView();

	// LoginPage
	@RequestMapping(value = "login.see", method = RequestMethod.GET)
	public ModelAndView loginForm() {
		
		ModelAndView mav = new ModelAndView();
		MovieBannerModel bannerselect = movieService.banner_select();
		mav.addObject("bannerselect", bannerselect);
		mav.setViewName("login");
		
		return mav;
	}

	@RequestMapping(value = "login.see", method = RequestMethod.POST)
	public ModelAndView memberLogin(HttpServletRequest request, MemberModel member) {

		MemberModel result = memberService.memberLogin(member);

		MovieBannerModel bannerselect = movieService.banner_select();
		
		if (result != null) {
			System.out.println("Login Done.");

			HttpSession session = request.getSession();

			session.setAttribute("mem", result);
			session.setAttribute("session_member_id", result.getMember_id());
			session.setAttribute("session_member_name", result.getMember_name());
			session.setAttribute("session_member_password1", result.getMember_password1());
			session.setAttribute("session_member_password2", result.getMember_password2());
			session.setAttribute("session_member_no", result.getMember_no());
			session.setAttribute("session_member_grade", result.getMember_grade());

			System.out.println("세션 넘버" + (int) session.getAttribute("session_member_no"));
			System.out.println("세션 넘버" + session.getAttribute("session_member_password1"));

			
			// Admin 로그인 관리자 페이지 바로 가기
			if (result.getMember_grade() == 1) {

				mav.setViewName("redirect:/admin/movieList.see");
				return mav;

			}

			else {
				mav.setViewName("redirect:/main.see");
				return mav;
			}
		}

		mav.addObject("bannerselect", bannerselect);
		mav.setViewName("member/loginError");
		return mav;
	}

	@RequestMapping("/logout.see")
	public ModelAndView memberLogout(HttpServletRequest request, MemberModel member) {
		HttpSession session = request.getSession(false);

		if (session != null) {
			System.out.println("Logout Done.");
			session.invalidate();
		}

		mav.setViewName("redirect:/main.see");
		return mav;
	}

	@ModelAttribute("member")
	public MemberModel formBack() {
		return new MemberModel();
	}

	// 약관
	@RequestMapping("/member.see")
	public ModelAndView memberStep1() {
		
		MovieBannerModel bannerselect = movieService.banner_select();
		mav.addObject("bannerselect", bannerselect);
		mav.setViewName("member");
		return mav;
	}

	// 정보입력
	@RequestMapping("/memberinfo.see")
	public ModelAndView memberStep2() {
		
		MovieBannerModel bannerselect = movieService.banner_select();
		mav.addObject("bannerselect", bannerselect);
		mav.setViewName("memberInfo");
		return mav;
	}

	// 가입완료
	@RequestMapping("/memberEnd.see")
	public ModelAndView memberStep3(@ModelAttribute("member") MemberModel member, BindingResult result) {

		System.out.println(member.getMember_name());
		System.out.println(member.getMember_password1());
		// Validate Binding
		new MemberValidator().validate(member, result);

		if (result.hasErrors()) {
			mav.setViewName("memberInfo");
			return mav;
		}
		try {
			// 가입 성공시 바로 메인화면으로
			memberService.insertMember(member);
			mav.setViewName("main");
			return mav;
		} catch (DuplicateKeyException e) {
			result.reject("invalid", null);
			mav.setViewName("memberInfo");
			return mav;
		}
	}

	// Member View
	@RequestMapping(value = "/memberView.see", method = RequestMethod.GET)
	public ModelAndView memberView(@RequestParam int member_no, HttpSession session) throws Exception {

		ModelAndView mav = new ModelAndView();

		MovieBannerModel bannerselect = movieService.banner_select();
		mav.addObject("bannerselect", bannerselect);
		mav.addObject("member", memberService.memberView(member_no));
		// 뷰의 이름
		mav.setViewName("memberView");

		return mav;
	}

	@RequestMapping(value = "/memberUpdate.see", method = RequestMethod.POST)
	public ModelAndView memberUpdate(@ModelAttribute("memberModel") MemberModel member, BindingResult result)
			throws Exception {

		ModelAndView mav = new ModelAndView();

		System.out.println(member.getMember_password1());
		System.out.println(member.getMember_password2());

		new MemberValidator().validate(member, result);

		if (result.hasErrors()) {
			mav.setViewName("main");
			return mav;
		}

		memberService.memberModify(member);

		mav.setViewName("redirect:/mypage/reserveList.see");

		return mav;

	}

	// Member View
	@RequestMapping(value = "/memberPWView.see", method = RequestMethod.GET)
	public ModelAndView memberPWView(@RequestParam int member_no, HttpSession session) throws Exception {

		ModelAndView mav = new ModelAndView();

		mav.addObject("member", memberService.memberView(member_no));
		// 뷰의 이름
		MovieBannerModel bannerselect = movieService.banner_select();
		mav.addObject("bannerselect", bannerselect);
		mav.setViewName("memberPWView");

		return mav;
	}

	@RequestMapping(value = "/memberPWUpdate.see", method = RequestMethod.POST)
	public ModelAndView memberPWUpdate(@ModelAttribute("memberModel") MemberModel member, BindingResult result)
			throws Exception {

		ModelAndView mav = new ModelAndView();

		System.out.println(member.getMember_password1());
		System.out.println(member.getMember_password2());
		System.out.println("member_no" + member.getMember_no());

		/*
		 * new MemberValidator().validate(member, result);
		 * 
		 * if (result.hasErrors()) { mav.setViewName("main"); return mav; }
		 */

		memberService.memberPWUpdate(member);

		mav.setViewName("redirect:/mypage/reserveList.see");

		return mav;

	}

	// 회원 정보 수정
	@RequestMapping("/memberModify.see")
	public ModelAndView memberModify(@ModelAttribute("member") MemberModel member, BindingResult result,
			HttpSession session) {

		/*
		 * if(session.getAttribute("session_member_id") == null) {
		 * mav.setViewName("common/loginConfirm"); return mav; }
		 */
		MemberModel memberModel = new MemberModel();

		if (session.getAttribute("session_member_id") != null) {
			memberService.memberModify(member);
			mav.addObject("member", memberModel);
			mav.setViewName("redirect:/main.see");
			return mav;
		}

		mav.setViewName("main.see");
		return mav;
	}

	// 회원 탈퇴 폼
	@RequestMapping("memberWith.see")
	public ModelAndView memberWidth() {
		
		MovieBannerModel bannerselect = movieService.banner_select();
		mav.addObject("bannerselect", bannerselect);
		mav.setViewName("memberwith");
		return mav;
	}

	@RequestMapping("/memberDelete.see")
	public ModelAndView memberDelete(@ModelAttribute("member") MemberModel member, BindingResult result,
			HttpServletRequest request, HttpSession session) {
		MemberModel memberModel;
		String member_id;
		String member_password1;
		int member_no;
		int deleteCheck;
		
		System.out.println("session pass" + session.getAttribute("session_member_password1"));
		member_password1 = (String) session.getAttribute("session_member_password1");
		member_id = session.getAttribute("session_member_id").toString();
		member_no = (int)session.getAttribute("session_member_no");
		
		
		System.out.println("member_id : " + member_id);
		System.out.println("member_password1 : " + member_password1);
		
		memberModel = (MemberModel) memberService.getMember(member_id);

		if (memberModel.getMember_password1().equals(member_password1)) {
			deleteCheck = 1;

			session.removeAttribute("session_member_id");
			session.removeAttribute("session_member_name");
			session.removeAttribute("session_member_no");
			
			memberService.memberDelete(member_no);
		} else {
			deleteCheck = -1;
		}

		mav.addObject("deleteCheck", deleteCheck);
		mav.setViewName("member/deleteResult");
		return mav;
	}

	@RequestMapping("/memberIdFind.see")
	public ModelAndView memberFindForm() {
		
		MovieBannerModel bannerselect = movieService.banner_select();
		mav.addObject("bannerselect", bannerselect);
		mav.setViewName("idFind");
		return mav;
	}

	@RequestMapping("/memberIdFindAction.see")
	public ModelAndView memberFind(@ModelAttribute("member") MemberModel member, HttpServletRequest request) {
		int memberFindChk;
		String member_name = request.getParameter("member_name");
		String member_email = request.getParameter("member_email");

		member.setMember_name(member_name);
		member.setMember_email(member_email);

		member = memberService.idFindByName(member);

		if (member == null) {
			memberFindChk = 0;
			
			mav.addObject("memberFindChk", memberFindChk);
			mav.setViewName("member/idFindError");
			return mav;
		} else {
			if (member.getMember_name().equals(member_name) && member.getMember_email().equals(member_email)) {
				memberFindChk = 1;
				mav.addObject("member", member);
				mav.addObject("memberFindChk", memberFindChk);
				mav.setViewName("idFindOk");
				return mav;
			} else {
				memberFindChk = -1;
				mav.addObject("memberFindChk", memberFindChk);
				mav.setViewName("member/idFindError");
				return mav;
			}
		}

	}

	// FindId
	@RequestMapping(value = "memberFindId.see", method = RequestMethod.GET)
	public Object memberFindId() {

		ModelAndView mav = new ModelAndView();

		MovieBannerModel bannerselect = movieService.banner_select();
		mav.addObject("bannerselect", bannerselect);
		mav.setViewName("memberFindId");

		return mav;
	}

	@RequestMapping(value = "memberFindId.see", method = RequestMethod.POST)
	public ModelAndView memberFindId(MemberModel member) {

		MemberModel result = memberService.memberFindId(member);

		if(result == null) {
			
			mav.setViewName("/member/resultFalse");
			
		} else {
		
		mav.addObject("member", result);
		/*
		 * if(result!= null) { System.out.println("Login Done."); else {
		 * mav.setViewName("redirect:/main.see"); return mav; } }
		 */

		mav.setViewName("memberFindId");
		}
		return mav;
		
	}

	// FindPw
	@RequestMapping(value = "memberFindPw.see", method = RequestMethod.GET)
	public Object memberFindPw() {

		ModelAndView mav = new ModelAndView();

		MovieBannerModel bannerselect = movieService.banner_select();
		mav.addObject("bannerselect", bannerselect);
		mav.setViewName("memberFindPw");

		return mav;
	}

	@RequestMapping(value = "memberFindPw.see", method = RequestMethod.POST)
	public ModelAndView memberFindPw(MemberModel member) {

		
		System.out.println("name"+member.getMember_name());
		System.out.println("email"+member.getMember_email());
		System.out.println("id"+member.getMember_id());
		
		MemberModel result = memberService.memberFindPw(member);

		if(result == null) {
			mav.setViewName("/member/resultFalse");
		} else {
			
		
		mav.addObject("member", result);

		mav.setViewName("memberFindPw");
		}
		return mav;
	}
}