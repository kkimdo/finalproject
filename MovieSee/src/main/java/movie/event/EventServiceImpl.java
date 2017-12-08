package movie.event;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class EventServiceImpl implements EventService{
	
	@Inject
	EventDAO eventDAO;

	@Override
	public int EventWrite(EventModel eventModel) throws Exception {
		
		String content = eventModel.getEvent_content().replace("\r\n","<br>"); //줄바꿈 문자 처리
		
		eventModel.setEvent_content(content);
		
		return eventDAO.EventWrite(eventModel);
	}
	
	@Override
	public int EventGetSEQ() {
		return eventDAO.EventGetSEQ();
	}
}
