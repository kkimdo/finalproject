package movie.faq;

import java.util.List;

import movie.faq.FaqModel;

public interface FaqDAO {

	
	public List<FaqModel> FaqList(); // 글 목록

	public int FaqWrite(FaqModel faqModel); // 글 작성
}
