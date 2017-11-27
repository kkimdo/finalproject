package movie.notice;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service
public class NoticeService implements NoticeDAO{
	
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	//글 작성
	@Override
	public int NoticeWrite(NoticeModel noticeModel) {
		return sqlSessionTemplate.insert("notice.noticeWrite", noticeModel);
	}
	
	//글 목록
	@Override
	public List<NoticeModel> NoticeList() {
		return sqlSessionTemplate.selectList("notice.noticeList");
	}
	
	//글 상세보기
	@Override
	public NoticeModel NoticeView(int notice_no) {
		return sqlSessionTemplate.selectOne("notice.noticeView", notice_no);
	}
	
	//글 조회수 증가
	@Override
	public int NoticeHitUpdate(int notice_no) {
		return sqlSessionTemplate.update("notice.noticeHitUpdate", notice_no);
	}

}
