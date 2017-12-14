package movie.qna;

import java.util.List;

public interface QnaDAO {

		// 게시글 전체 목록
		public List<QnaModel> QnaListAll(int start, int end, String searchOption, String keyword) throws Exception;
	
		//데이터를 삽입하는 메소드(게시글 작성)
		public int QnaWrite(QnaModel qnaModel) throws Exception;
		
		// 게시글 레코드 갯수
		public int count(String searchOption, String keyword) throws Exception;
}
