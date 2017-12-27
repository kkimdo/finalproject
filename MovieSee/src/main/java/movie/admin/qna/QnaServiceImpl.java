package movie.admin.qna;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;


@Service
public class QnaServiceImpl implements QnaService {

	@Inject
	QnaDAO qnaDAO;

	// 게시글 작성
	@Override
	public int QnaWrite(QnaModel qnaModel) throws Exception {

		// replace(A, B) A를 B로 변경
		String content = qnaModel.getQna_content().replaceAll("\r\n", "<br>"); // 줄바꿈 문자 처리

		qnaModel.setQna_content(content);

		return qnaDAO.QnaWrite(qnaModel);
	}

	@Override
	public int QnaGetSEQ() throws Exception {
		return qnaDAO.QnaGetSEQ();
	}

	// 게시글 전체 목록
	@Override
	public List<QnaModel> QnaListAll(int start, int end, String searchOption, String keyword) throws Exception {
		return qnaDAO.QnaListAll(start, end, searchOption, keyword);
	}

	// 게시글 레코드 갯수
	@Override
	public int count(String searchOption, String keyword) throws Exception {
		return qnaDAO.count(searchOption, keyword);
	}

	// 게시글 상세보기
	@Override
	public QnaModel QnaView(int qna_no) throws Exception {
		return qnaDAO.QnaView(qna_no);
	}

	// 게시글 삭제
	@Override
	public void QnaDelete(int qna_no) throws Exception {
		qnaDAO.QnaDelete(qna_no);

	}

	// 댓글 목록
	@Override
	public List<QnaCommentModel> CommentList(int qna_no) throws Exception {
		return qnaDAO.CommentList(qna_no);
	}

	// 게시글 레코드 갯수
	@Override
	public int countReply(int qna_no, String searchOption, String keyword) throws Exception {
		return qnaDAO.countReply(qna_no, searchOption, keyword);
		}
	
	// 댓글 작성
	@Override
	public void CommentInsert(QnaCommentModel qnaCommentModel) throws Exception {
		qnaDAO.CommentInsert(qnaCommentModel);
	}

	// 댓글 삭제
	@Override
	public void CommentDelete(int qna_comment_no) throws Exception {
		qnaDAO.CommentDelete(qna_comment_no);

	}
	
	@Override
	public List<QnaModel> QnaMemberList(String qna_id, int start, int end, String searchOption, String keyword) throws Exception {
		return qnaDAO.QnaMemberList(qna_id, start, end, searchOption, keyword);
	}

	@Override
	public int QnaMemberCount(String qna_id, String searchOption, String keyword) throws Exception {
		return qnaDAO.QnaMemberCount(qna_id, searchOption, keyword);
	}
}
