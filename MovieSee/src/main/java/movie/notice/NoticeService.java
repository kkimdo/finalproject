package movie.notice;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service
public class NoticeService implements NoticeDAO{
	
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int NoticeWrite(NoticeModel noticeModel) {
		return sqlSessionTemplate.insert("notice.noticeWrite", noticeModel);
	}
	
	@Override
	public List<NoticeModel> NoticeList() {
		return sqlSessionTemplate.selectList("notice.noticeList");
	}

}
