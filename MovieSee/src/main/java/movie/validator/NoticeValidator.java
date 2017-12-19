package movie.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import movie.admin.notice.NoticeModel;

public class NoticeValidator implements Validator{
	
	@Override
	public boolean supports(Class<?> clazz) {
		return NoticeModel.class.isAssignableFrom(clazz);
	}
	
	@Override
	public void validate(Object target, Errors errors) {
		/*ValidationUtils.rejectIfEmptyOrWhitespace(errors, "notice_subject", "notice_subject");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "notice_content", "notice_content");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "notice_area", "notice_area");*/
		
		NoticeModel noticeModel = (NoticeModel) target;
		
		if(noticeModel.getNotice_subject() == null || noticeModel.getNotice_subject().trim().isEmpty()) {
			errors.rejectValue("notice_subject", "notice_subject");
		}
		
		if(noticeModel.getNotice_content() == null || noticeModel.getNotice_content().trim().isEmpty()) {
			errors.rejectValue("notice_content", "notice_content");
		}
		
		if(noticeModel.getNotice_area() == null || noticeModel.getNotice_area().trim().isEmpty()) {
			errors.rejectValue("notice_area", "notice_area");
		}
	}

}
