package movie.admin.qna;

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

	@Override
	public int QnaGetSEQ() throws Exception {
		return sqlSessionTemplate.selectOne("qna.qnaGetSEQ");
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

		Map<String, Object> map = new HashMap<String, Object>();

		// 검색 옵션, 키워드 맵에 저장

		map.put("searchOption", searchOption);
		map.put("keyword", keyword);

		return sqlSessionTemplate.selectOne("qna.count", map);
	}

	
	// qna_no을 이용하여 데이터를 검색하여 리턴하는 메소드(게시글 상세보기)
	@Override
	public QnaModel QnaView(int qna_no) throws Exception {
		return sqlSessionTemplate.selectOne("qna.qnaView", qna_no);
	}

	// 데이터를 삭제하는 메소드(게시글 삭제)
	@Override
	public void QnaDelete(int qna_no) {
		sqlSessionTemplate.delete("qna.qnaDelete", qna_no);
	}

	// 댓글 목록
	@Override
	public List<QnaCommentModel> CommentList(int qna_no) throws Exception {
		return sqlSessionTemplate.selectList("qna.qnaCommentList", qna_no);
	}

	@Override
	public int countReply(int qna_no, String searchOption, String keyword) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();

		// 검색 옵션, 키워드 맵에 저장
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("qna_no", qna_no);
		return sqlSessionTemplate.selectOne("qna.countReply", map);
	}
	// 댓글 작성
	@Override
	public void CommentInsert(QnaCommentModel qnaCommentModel) throws Exception {
		sqlSessionTemplate.insert("qna.qnaCommentWrite", qnaCommentModel);
	}

	// 댓글 삭제
	@Override
	public void CommentDelete(int qna_comment_no) throws Exception {
		sqlSessionTemplate.delete("qna.qnaCommentDelete", qna_comment_no);

	}

	@Override
	public List<QnaModel> QnaMemberList(String qna_id, int start, int end, String searchOption, String keyword)
			throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("qna_id", qna_id);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);

		map.put("start", start);
		map.put("end", end);

		return sqlSessionTemplate.selectList("qna.qnaMemberList", map);
	}

	@Override
	public int QnaMemberCount(String qna_id, String searchOption, String keyword) throws Exception {
		
		Map<String, String> map = new HashMap<String, String>();

		map.put("qna_id", qna_id);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);

		return sqlSessionTemplate.selectOne("qna.qnaMemberCount", map);
	}

}