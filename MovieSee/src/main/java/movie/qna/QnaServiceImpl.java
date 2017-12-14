package movie.qna;

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
}
