package movie.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import movie.freeboard.FreeBoardModel;


public class FreeBoardValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		return FreeBoardModel.class.isAssignableFrom(clazz);
	}
	
	@Override
	public void validate(Object target, Errors errors) {
		
		FreeBoardModel freeBoardModel = (FreeBoardModel) target;
		
		if(freeBoardModel.getFreeboard_name() == null || freeBoardModel.getFreeboard_name().trim().isEmpty()) {
			errors.rejectValue("freeboard_name", "freeboard_name");
		}
		
		if(freeBoardModel.getFreeboard_passwd() == null || freeBoardModel.getFreeboard_passwd().trim().isEmpty()) {
			errors.rejectValue("freeboard_passwd", "freeboard_passwd");
		}
		
		if(freeBoardModel.getFreeboard_subject() == null || freeBoardModel.getFreeboard_subject().trim().isEmpty()) {
			errors.rejectValue("freeboard_subject", "freeboard_subject");
		}
		
		if(freeBoardModel.getFreeboard_content() == null || freeBoardModel.getFreeboard_content().trim().isEmpty()) {
			errors.rejectValue("freeboard_content", "freeboard_content");
		}
	}
}
