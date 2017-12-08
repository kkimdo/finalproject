package movie.event;

import java.util.List;

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
	public int EventGetSEQ() throws Exception{
		return eventDAO.EventGetSEQ();
	}
	
	@Override
	public List<EventModel> EventListAll(int start, int end, String searchOption, String keyword) throws Exception {
		return eventDAO.EventListAll(start, end, searchOption, keyword);
	}
	
	@Override
	public int count(String searchOption, String keyword) throws Exception {
		return eventDAO.count(searchOption, keyword);
	}
}
