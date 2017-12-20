package movie.admin.faq;

import java.util.List;

import javax.servlet.http.HttpSession;

public interface FaqService {

		// 게시글 전체 목록
		public List<FaqModel> FaqListAll(int start, int end, String searchOption, String keyword) throws Exception;
			
		// 글 작성
		public int FaqWrite(FaqModel faqModel) throws Exception;

		// 게시글 레코드 갯수
		public int count(String searchOption, String keyword) throws Exception;
			
		// 글 상세보기
		public FaqModel FaqView(int faq_no) throws Exception;
		
		// 글 조회수 증가
		public void FaqHitUpdate(int faq_no, HttpSession session) throws Exception;

		// 글 수정
		public int FaqUpdate(FaqModel faqModel) throws Exception;

		// 글 삭제
		public void FaqDelete(int faq_no) throws Exception;



	}
