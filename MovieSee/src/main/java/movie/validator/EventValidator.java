package movie.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import movie.admin.event.EventModel;

public class EventValidator implements Validator {
	
	@Override
	public boolean supports(Class<?> clazz) {
		return EventModel.class.isAssignableFrom(clazz);
	}
	
	@Override
	public void validate(Object target, Errors errors) {
		
		EventModel eventModel = (EventModel) target;
		
		if(eventModel.getEvent_subject() == null || eventModel.getEvent_subject().trim().isEmpty()) {
			errors.rejectValue("event_subject", "event_subject");
		}
		
		if(eventModel.getEvent_content() == null || eventModel.getEvent_content().trim().isEmpty()) {
			errors.rejectValue("event_content", "event_content");
		}
		
		if(eventModel.getEvent_start_date() == null || eventModel.getEvent_start_date().trim().isEmpty()) {
			errors.rejectValue("event_start_date", "event_start_date");
		}
		
		if(eventModel.getEvent_end_date() == null || eventModel.getEvent_end_date().trim().isEmpty()) {
			errors.rejectValue("event_end_date", "event_end_date");
		}
	}

}
