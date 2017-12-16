package movie.qna;

import java.util.List;

import movie.faq.FaqModel;

public interface QnaService {

	// 게시글 전체 목록
	public List<QnaModel> QnaListAll(int start, int end, String searchOption, String keyword) throws Exception;

	// 데이터를 삽입하는 메소드(게시글 작성)
	public int QnaWrite(QnaModel qnaModel) throws Exception;

	// 게시글 레코드 갯수
	public int count(String searchOption, String keyword) throws Exception;

	// 글 상세보기
	public QnaModel QnaView(int qna_no) throws Exception;

	// 글 삭제
	public void QnaDelete(int qna_no) throws Exception;
	
	// 답변 작성
	public int QnaCommentWrite(QnaCommentModel qnaCommentModel) throws Exception;

}
