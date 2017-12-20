package movie.freeboard;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository // 현재 클래스를 DAO bean으로 등록
public class FreeBoardDAOImpl implements FreeBoardDAO {

	@Inject
	private SqlSessionTemplate sqlSessionTemplate;

	// 게시글 작성
	@Override
	public int FreeBoardWrite(FreeBoardModel freeBoardModel) throws Exception {
		return sqlSessionTemplate.insert("freeboard.freeBoardWrite", freeBoardModel);
	}

	@Override
	public int count(String searchOption, String keyword) throws Exception {

		Map<String, String> map = new HashMap<String, String>();

		// 검색 옵션, 키워드 맵에 저장
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);

		return sqlSessionTemplate.selectOne("freeboard.count", map);
	}

	// 게시글 전체 목록
	@Override
	public List<FreeBoardModel> FreeBoardListAll(int start, int end, String searchOption, String keyword)
			throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);

		map.put("start", start);
		map.put("end", end);

		return sqlSessionTemplate.selectList("freeboard.freeBoardListAll", map);
	}
	
	@Override
	public FreeBoardModel FreeBoardView(int freeboard_no) throws Exception {
		return sqlSessionTemplate.selectOne("freeboard.freeBoardView", freeboard_no);
	}
	
	@Override
	public void FreeBoardHitUpdate(int freeboard_no) throws Exception {
		sqlSessionTemplate.update("freeboard.freeBoardHitUpdate", freeboard_no);
	}

	@Override
	public int FreeRefDelete(int freeboard_no) throws Exception {
		return sqlSessionTemplate.delete("freeboard.freeRefDelete", freeboard_no);
	}
	
	@Override
	public int FreeBoardDelete(int freeboard_ref) throws Exception {
		return sqlSessionTemplate.delete("freeboard.freeBoardDelete", freeboard_ref);
	}
	
	@Override
	public int FreeBoardWriteReply(FreeBoardModel freeBoardModel) throws Exception {
		return sqlSessionTemplate.insert("freeboard.freeBoardWriteReply", freeBoardModel);
	}
	
	@Override
	public int FreeBoardUpdate(FreeBoardModel freeBoardModel) throws Exception {
		return sqlSessionTemplate.update("freeboard.freeBoardUpdate", freeBoardModel);
	}
	
	@Override
	public int FreeRefAdminDelete(int freeboard_no) throws Exception {
		return sqlSessionTemplate.delete("freeboard.freeRefAdminDelete", freeboard_no);
	}
	
	@Override
	public int FreeBoardAdminDelete(int freeboard_ref) throws Exception {
		return sqlSessionTemplate.delete("freeboard.freeBoardAdminDelete", freeboard_ref);
	}
	
}
