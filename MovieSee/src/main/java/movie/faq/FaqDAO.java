package movie.faq;

import java.util.List;

import movie.faq.FaqModel;
import movie.notice.NoticeModel;

public interface FaqDAO {
	// 글 목록
	public List<FaqModel> FaqList(); 

	// 글 작성
	public int FaqWrite(FaqModel faqModel); 

	// 글 상세보기
	public FaqModel	FaqView(int faq_no);

	// 글 조회 수 증가
	public int FaqHitUpdate(int faq_no);
}
