package movie.qna;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service 
public class QnaServiceImpl implements QnaService {
	
	@Inject
	QnaDAO qnaDAO;
	
	//게시글 작성
	@Override
	public int QnaWrite(QnaModel qnaModel) throws Exception {
		
		//replace(A, B) A를 B로 변경
		String content = qnaModel.getQna_content().replaceAll("\r\n","<br>"); //줄바꿈 문자 처리
		
		qnaModel.setQna_content(content);
		
		return qnaDAO.QnaWrite(qnaModel);
	}
}
