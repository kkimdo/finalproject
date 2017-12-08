package movie.event;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository // 현재 클래스를 DAO bean 으로 등록
public class EventDAOImpl implements EventDAO{
	
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
	public List<EventModel> EventListAll(int start, int end, String searchOption, String keyword) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		
		map.put("start", start);
		map.put("end", end);
		
		return sqlSessionTemplate.selectList("event.eventListAll", map);
	}
	
	@Override
	public int count(String searchOption, String keyword) throws Exception {
		
		Map<String,String> map = new HashMap<String, String>();
		
		//검색 옵션, 키워드 맵에 저장
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		
		return sqlSessionTemplate.selectOne("event.count", map);
		
	}
}
