package movie.faq;

import java.util.List;

import javax.servlet.http.HttpSession;

import movie.notice.NoticeModel;

public interface FaqService {

			//데이터를 삽입하는 메소드(게시글 작성)
			public int FaqWrite(FaqModel faqModel);
			
			//모든 데이터를 가져와서 List<FaqModel>를 리턴하는 메소드(게시글 전체 목록)
			public List<FaqModel> FaqList();
			
			//faq_no을 이용하여 데이터를 검색하여 리턴하는 메소드(게시글 상세보기)
			public FaqModel FaqView(int faq_no);
			
			//faq_no을 이용하여 데이터의 조회수를 갱신하는 메소드(게시글 조회수 증가)
			public void FaqHitUpdate(int faq_no, HttpSession session);

			//데이터를 갱신하는 메소드(게시글 수정)
			public int FaqUpdate(FaqModel faqModel);
			
			//데이터를 삭제하는 메소드(게시글 삭제)
			public void FaqDelete(int faq_no);
			
			//검색
			public List<FaqModel> FaqSearchList(String isSearch);
				

	
}
