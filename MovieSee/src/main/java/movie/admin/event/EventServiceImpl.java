package movie.admin.event;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

@Service
public class EventServiceImpl implements EventService {

	@Inject
	EventDAO eventDAO;

	@Override
	public int EventWrite(EventModel eventModel) throws Exception {

		String content = eventModel.getEvent_content().replace("\r\n", "<br/>"); // 줄바꿈
																				// 문자
																				// 처리

		eventModel.setEvent_content(content);

		return eventDAO.EventWrite(eventModel);
	}

	@Override
	public int EventGetSEQ() throws Exception {
		return eventDAO.EventGetSEQ();
	}

	@Override
	public List<EventModel> EventList_1(int start, int end, String searchOption, String keyword) throws Exception {
		return eventDAO.EventList_1(start, end, searchOption, keyword);
	}

	@Override
	public List<EventModel> EventList_2(int start, int end, String searchOption, String keyword) throws Exception {
		return eventDAO.EventList_2(start, end, searchOption, keyword);
	}

	@Override
	public List<EventModel> EventList_3(int start, int end, String searchOption, String keyword) throws Exception {
		return eventDAO.EventList_3(start, end, searchOption, keyword);
	}

	@Override
	public List<EventModel> EventList_4(int start, int end, String searchOption, String keyword) throws Exception {
		return eventDAO.EventList_4(start, end, searchOption, keyword);
	}

	@Override
	public List<EventModel> EventEndList(int start, int end, String searchOption, String keyword) throws Exception {
		return eventDAO.EventEndList(start, end, searchOption, keyword);
	}

	@Override
	public int count(String searchOption, String keyword) throws Exception {
		return eventDAO.count(searchOption, keyword);
	}

	@Override
	public void EventHitUpdate(int event_no, HttpSession session) throws Exception {

		long update_time = 0;

		if (session.getAttribute("update_time_" + event_no) != null) {

			update_time = (long) session.getAttribute("update_time_" + event_no);
		}

		long current_time = System.currentTimeMillis();
		if (current_time - update_time > 60 * 60 * 1000) {

			eventDAO.EventHitUpdate(event_no);

			session.setAttribute("update_time_" + event_no, current_time);
		}

	}

	@Override
	public EventModel EventView(int event_no) throws Exception {
		return eventDAO.EventView(event_no);
	}

	@Override
	public int EventUpdate(EventModel eventModel) throws Exception {

		String content = eventModel.getEvent_content().replace("\r\n", "<br/>");

		eventModel.setEvent_content(content);

		return eventDAO.EventUpdate(eventModel);
	}

	@Override
	public void EventDelete(int event_no) throws Exception {
		eventDAO.EventDelete(event_no);
	}

}
