package movie.qna;

public interface QnaService {

	// 데이터를 삽입하는 메소드(게시글 작성)
	public int QnaWrite(QnaModel noticeModel) throws Exception;
}
