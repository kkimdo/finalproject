package movie.event;

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
	
}
