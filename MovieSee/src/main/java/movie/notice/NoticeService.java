package movie.notice;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service
public class NoticeService implements NoticeDAO{
	
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int noticeWrite(NoticeModel noticeModel) {
		return sqlSessionTemplate.insert("notice.noticeWrite", noticeModel);
	}
	
	

}
