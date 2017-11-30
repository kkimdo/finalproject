package movie.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository // 현재 클래스를 DAO bean으로 등록
public class NoticeDAOImpl implements NoticeDAO {

	@Inject
	private SqlSessionTemplate sqlSessionTemplate;
	
	//데이터를 삽입하는 메소드(게시글 작성)
	@Override
	public int NoticeWrite(NoticeModel noticeModel) {
		return sqlSessionTemplate.insert("notice.noticeWrite", noticeModel);
	}
	
	//게시글 전체 목록
	@Override
	public List<NoticeModel> NoticeListAll(int start, int end, String searchOption, String keyword) {
	
		//검색 옵션,키워드 맵에 저장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		
		//between #{start} and #{end} 에 입력될 값을 맵에 저장
		map.put("start", start);
		map.put("end", end);
		
		return sqlSessionTemplate.selectList("notice.noticeListAll", map);
	}
	
	//notice_no을 이용하여 데이터를 검색하여 리턴하는 메소드(게시글 상세보기)
	@Override
	public NoticeModel NoticeView(int notice_no) {
		return sqlSessionTemplate.selectOne("notice.noticeView", notice_no);
	}
	
	//notice_no을 이용하여 데이터의 조회수를 갱신하는 메소드(게시글 조회수 증가)
	@Override
	public void NoticeHitUpdate(int notice_no) {
		sqlSessionTemplate.update("notice.noticeHitUpdate", notice_no);
	}

	//데이터를 갱신하는 메소드(게시글 수정)
	@Override
	public int NoticeUpdate(NoticeModel noticeModel){
		return sqlSessionTemplate.update("notice.noticeUpdate", noticeModel);
	}
	
	//데이터를 삭제하는 메소드(게시글 삭제)
	@Override
	public void NoticeDelete(int notice_no) {
		sqlSessionTemplate.delete("notice.noticeDelete", notice_no);
		
	}
	
	
}
