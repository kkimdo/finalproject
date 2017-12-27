package movie.admin.qna;

import java.util.List;


public interface QnaService {

	// 게시글 전체 목록
	public List<QnaModel> QnaListAll(int start, int end, String searchOption, String keyword) throws Exception;
	
	// 해당 게시글 번호
	public int QnaGetSEQ() throws Exception;

	// 데이터를 삽입하는 메소드(게시글 작성)
	public int QnaWrite(QnaModel qnaModel) throws Exception;

	// 게시글 레코드 갯수
	public int count(String searchOption, String keyword) throws Exception;
	
	// 글 상세보기
	public QnaModel QnaView(int qna_no) throws Exception;

	// 글 삭제
	public void QnaDelete(int qna_no) throws Exception;

	// 댓글 목록
	public List<QnaCommentModel> CommentList(int qna_no) throws Exception;

	// 댓글 레코드 갯수
	public int countReply(int qna_no, String searchOption, String keyword) throws Exception;
		
	// 댓글 입력
	public void CommentInsert(QnaCommentModel qnaCommentModel) throws Exception;

	// 댓글 삭제
	public void CommentDelete(int qna_comment_no) throws Exception;
	
	// 회원이 문의한 게시판 목록
	public List<QnaModel> QnaMemberList(String qna_id, int start, int end, String searchOption, String keyword) throws Exception;

	// 회원이 문의한 게시글 레코드 갯수
	public int QnaMemberCount(String qna_id, String searchOption, String keyword) throws Exception;


}
