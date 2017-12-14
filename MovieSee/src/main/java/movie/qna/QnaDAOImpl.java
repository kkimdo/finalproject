package movie.qna;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;


@Repository // 현재 클래스를 DAO bean으로 등록
public class QnaDAOImpl implements QnaDAO {

	@Inject
	private SqlSessionTemplate sqlSessionTemplate;

	// 데이터를 삽입하는 메소드(게시글 작성)
	@Override
	public int QnaWrite(QnaModel qnaModel) throws Exception {
		return sqlSessionTemplate.insert("qna.qnaWrite", qnaModel);
	}

	// 모든 데이터를 가져와서 List<QnaModel>를 리턴하는 메소드(게시글 전체 목록)
	@Override
	public List<QnaModel> QnaListAll(int start, int end, String searchOption, String keyword) throws Exception {

		// 검색 옵션,키워드 맵에 저장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);

		// between #{start} and #{end} 에 입력될 값을 맵에 저장
		map.put("start", start);
		map.put("end", end);

		return sqlSessionTemplate.selectList("qna.qnaListAll", map);
	}
	
	@Override
	public int count(String searchOption, String keyword) throws Exception {
		
		Map<String,String> map = new HashMap<String, String>();
		
		//검색 옵션, 키워드 맵에 저장
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		
		return sqlSessionTemplate.selectOne("qna.count", map);
	}
}
