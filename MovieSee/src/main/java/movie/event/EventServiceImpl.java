package movie.event;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class EventServiceImpl implements EventService{
	
	@Inject
	EventDAO eventDAO;

	@Override
	public int EventWrite(EventModel eventModel) throws Exception {
		return eventDAO.EventWrite(eventModel);
	}
	
}
