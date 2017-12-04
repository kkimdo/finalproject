package movie.qna;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;


@Repository // 현재 클래스를 DAO bean으로 등록
public class QnaDAOImpl implements QnaDAO {

	@Inject
	private SqlSessionTemplate sqlSessionTemplate;
	
	//데이터를 삽입하는 메소드(게시글 작성)
	@Override
	public int QnaWrite(QnaModel qnaModel) throws Exception {
		return sqlSessionTemplate.insert("qna.qnaWrite", qnaModel);
	}
}
