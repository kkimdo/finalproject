package movie.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import movie.notice.NoticeModel;

public class NoticeValidator implements Validator{
	
	@Override
	public boolean supports(Class<?> clazz) {
		return NoticeModel.class.isAssignableFrom(clazz);
	}
	
	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "notice_subject", "notice_subject");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "notice_content", "notice_content");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "notice_area", "notice_area");
	}

}
