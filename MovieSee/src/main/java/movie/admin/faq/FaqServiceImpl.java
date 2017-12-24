package movie.admin.faq;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;


@Service
public class FaqServiceImpl implements FaqService {

	@Inject
	FaqDAO faqDAO;

	// 게시글 작성
	@Override
	public int FaqWrite(FaqModel faqModel) throws Exception {

		// replace(A, B) A를 B로 변경
		String content = faqModel.getFaq_content().replaceAll("\r\n", "<br/>"); // 줄바꿈 문자 처리

		faqModel.setFaq_content(content);

		return faqDAO.FaqWrite(faqModel);
	}

	// 게시글 전체 목록
	@Override
	public List<FaqModel> FaqListAll(int start, int end, String searchOption, String keyword) throws Exception {
		return faqDAO.FaqListAll(start, end, searchOption, keyword);
	}

	// 게시글 레코드 갯수
	@Override
	public int count(String searchOption, String keyword) throws Exception {
		return faqDAO.count(searchOption, keyword);
	}

	// 게시글 상세보기
	@Override
	public FaqModel FaqView(int faq_no) throws Exception {
		return faqDAO.FaqView(faq_no);
	}

	// 게시글 조회수 증가
	@Override
	public void FaqHitUpdate(int faq_no, HttpSession session) throws Exception {

		long update_time = 0; // 세션에 저장된 조회시간 검색

		// 최초로 조회할 경우는 세션에 저장된 값이 없기 때문에 if문은 진입 안함
		if (session.getAttribute("update_time_" + faq_no) != null) {

			// 세션에서 읽어오기
			update_time = (long) session.getAttribute("update_time_" + faq_no);
		}

		// 시스템의 현재시간을 저장
		long current_time = System.currentTimeMillis();
		// 일정시간이 경과 후 조회수 증가 처리 24*60*60*1000(24시간)
		// 현재시간 - 열람시간 > 일정시간(조회수 증가가 가능하도록 지정한 시간)
		if (current_time - update_time > 60 * 60 * 1000) {

			faqDAO.FaqHitUpdate(faq_no);

			session.setAttribute("update_time_" + faq_no, current_time);
		}

	}

	// 게시글 수정
	@Override
	public int FaqUpdate(FaqModel faqModel) throws Exception {

		// 수정 다시
		String content = faqModel.getFaq_content().replaceAll("\r\n", "<br/>");

		faqModel.setFaq_content(content);

		return faqDAO.FaqUpdate(faqModel);

	}

	// 게시글 삭제
	@Override
	public void FaqDelete(int faq_no) throws Exception {

		faqDAO.FaqDelete(faq_no);

	}

}
