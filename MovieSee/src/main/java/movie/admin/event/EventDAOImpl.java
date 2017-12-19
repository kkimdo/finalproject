package movie.admin.event;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository // 현재 클래스를 DAO bean 으로 등록
public class EventDAOImpl implements EventDAO {

	@Inject
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public int EventWrite(EventModel eventModel) throws Exception {
		return sqlSessionTemplate.insert("event.eventWrite", eventModel);
	}

	@Override
	public int EventGetSEQ() {
		return sqlSessionTemplate.selectOne("event.eventGetSEQ");
	}

	@Override
	public List<EventModel> EventList_1(int start, int end, String searchOption, String keyword) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("searchOption", searchOption);
		map.put("keyword", keyword);

		map.put("start", start);
		map.put("end", end);

		return sqlSessionTemplate.selectList("event.eventList_1", map);
	}

	@Override
	public List<EventModel> EventList_2(int start, int end, String searchOption, String keyword) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("searchOption", searchOption);
		map.put("keyword", keyword);

		map.put("start", start);
		map.put("end", end);

		return sqlSessionTemplate.selectList("event.eventList_2", map);
	}

	@Override
	public List<EventModel> EventList_3(int start, int end, String searchOption, String keyword) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("searchOption", searchOption);
		map.put("keyword", keyword);

		map.put("start", start);
		map.put("end", end);

		return sqlSessionTemplate.selectList("event.eventList_3", map);
	}

	@Override
	public List<EventModel> EventList_4(int start, int end, String searchOption, String keyword) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("searchOption", searchOption);
		map.put("keyword", keyword);

		map.put("start", start);
		map.put("end", end);

		return sqlSessionTemplate.selectList("event.eventList_4", map);
	}
	
	@Override
	public List<EventModel> EventEndList(int start, int end, String searchOption, String keyword) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("searchOption", searchOption);
		map.put("keyword", keyword);

		map.put("start", start);
		map.put("end", end);

		return sqlSessionTemplate.selectList("event.eventEndList", map);
	}

	@Override
	public int count(String searchOption, String keyword) throws Exception {

		Map<String, String> map = new HashMap<String, String>();

		// 검색 옵션, 키워드 맵에 저장
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);

		return sqlSessionTemplate.selectOne("event.count", map);

	}

	@Override
	public void EventHitUpdate(int event_no) throws Exception {
		sqlSessionTemplate.update("event.eventHitUpdate", event_no);

	}

	@Override
	public EventModel EventView(int event_no) throws Exception {
		return sqlSessionTemplate.selectOne("event.eventView", event_no);
	}
	
	@Override
	public int EventUpdate(EventModel eventModel) throws Exception {
		return sqlSessionTemplate.update("event.eventUpdate", eventModel);
	}
	
	@Override
	public void EventDelete(int event_no) throws Exception {
		sqlSessionTemplate.delete("event.eventDelete", event_no);
	}

}
