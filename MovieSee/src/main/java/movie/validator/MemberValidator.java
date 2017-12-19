package movie.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import movie.member.MemberModel;

public class MemberValidator implements Validator {

	@Override 
	public boolean supports(Class<?> clazz) {
		// 
		return MemberModel.class.isAssignableFrom(clazz);
	}
	
	@Override
	public void validate(Object target, Errors errors){
		MemberModel member = (MemberModel)target;
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "member_id", "member_id");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "member_password1", "member_password1");
		
		if(member.getMember_password1().equals(member.getMember_password2()) == false) {
			errors.rejectValue("member_password2", "member_Password2");
		}
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "member_name", "member_name");
		ValidationUtils.rejectIfEmpty(errors, "member_email", "member_email");
	}
	
}
