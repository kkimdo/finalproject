package movie.admin.qna;

public class QnaCommentModel {
	
	private int qna_comment_no; //답변 번호
	private int qna_no; //답변해야하는 해당 게시글 번호
	private String qna_comment_content; //답변 내용
	
	public int getQna_comment_no() {
		return qna_comment_no;
	}
	public void setQna_comment_no(int qna_comment_no) {
		this.qna_comment_no = qna_comment_no;
	}
	public int getQna_no() {
		return qna_no;
	}
	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}
	public String getQna_comment_content() {
		return qna_comment_content;
	}
	public void setQna_comment_content(String qna_comment_content) {
		this.qna_comment_content = qna_comment_content;
	}
}
