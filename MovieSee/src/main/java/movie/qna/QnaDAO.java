package movie.qna;


public interface QnaDAO {

	
	//데이터를 삽입하는 메소드(게시글 작성)
		public int QnaWrite(QnaModel qnaModel) throws Exception;
}
