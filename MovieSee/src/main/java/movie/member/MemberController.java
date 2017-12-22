package movie.member;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import movie.validator.MemberValidator;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Resource(name="memberService")
	private MemberService memberService;
	
	ModelAndView mav = new ModelAndView();
	
	
	// LoginPage
	@RequestMapping(value="login.see", method=RequestMethod.GET)
	public String loginForm() {
		return "login";
	}
	
	@RequestMapping(value="login.see", method=RequestMethod.POST)
	public ModelAndView memberLogin(HttpServletRequest request, MemberModel member) {
		
		MemberModel result = memberService.memberLogin(member);
		
		if(result!= null) {
			System.out.println("Login Done.");
			
			HttpSession session = request.getSession();
			
			session.setAttribute("mem", result);
			session.setAttribute("session_member_id", result.getMember_id());
			session.setAttribute("session_member_name", result.getMember_name());
			session.setAttribute("session_member_no", result.getMember_no());
			session.setAttribute("session_member_grade", result.getMember_grade());
			
			//추가
			session.setAttribute("session_member_email", result.getMember_email());
			session.setAttribute("session_member_phone", result.getMember_phone());
		
			mav.setViewName("redirect:/main.see");
			return mav;
		}
		
		mav.setViewName("member/loginError");
		return mav;
	}
	
	@RequestMapping("/logout.see")
	public ModelAndView memberLogout(HttpServletRequest request, MemberModel member) {
		HttpSession session = request.getSession(false);
		
		if(session != null) {
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
	
	//약관
	@RequestMapping("/member.see")
	public ModelAndView memberStep1() {
		mav.setViewName("member");
		return mav;
	}
	
	//정보입력
	@RequestMapping("/memberinfo.see")
	public ModelAndView memberStep2() {
		mav.setViewName("memberInfo");
		return mav;
	}
	
	//가입완료
	@RequestMapping("/memberEnd.see")
	public ModelAndView memberStep3(@ModelAttribute("member") MemberModel member, BindingResult result) {
		
		
		System.out.println(member.getMember_name());
		System.out.println(member.getMember_password1());
		//Validate Binding
		new MemberValidator().validate(member, result);
		
		if(result.hasErrors()) {
			mav.setViewName("memberInfo");
			return mav;
		} try {
			memberService.insertMember(member);
			mav.setViewName("memberEnd");
			return mav;
		} catch (DuplicateKeyException e) {
			result.reject("invalid" , null);
			mav.setViewName("memberInfo");
			return mav;
		}
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
	@RequestMapping("memberWith.see")
	public ModelAndView memberWidth() {
		mav.setViewName("memberwith");
		return mav;
	}
	
	@RequestMapping("/memberDelete.see")
	public ModelAndView memberDelete(@ModelAttribute("member") MemberModel member, BindingResult result, HttpServletRequest request, HttpSession session) {
		MemberModel memberModel;
		String member_id;
		String member_password1;
		int deleteCheck;
		
		member_password1 = request.getParameter("member_password1");
		
		member_id = session.getAttribute("session_member_id").toString();
		memberModel = (MemberModel)memberService.getMember(member_id);
		
		if(memberModel.getMember_password1().equals(member_password1)) {
			deleteCheck = 1;
			
			memberService.memberDelete("session_member_id");
			session.removeAttribute("session_member_id");
			session.removeAttribute("session_member_name");
			session.removeAttribute("session_member_no");
		} else {
			deleteCheck = -1;
		}
		
		mav.addObject("deleteCheck", deleteCheck);
		mav.setViewName("member/deleteResult");
		return mav;
	}
	
	@RequestMapping("/memberIdFind.see")
	public ModelAndView memberFindForm() {
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
		
		if(member == null) {
			memberFindChk = 0;
			mav.addObject("memberFindChk", memberFindChk);
			mav.setViewName("member/idFindError");
			return mav;
		} else {
			if(member.getMember_name().equals(member_name) && member.getMember_email().equals(member_email)) {
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
}
