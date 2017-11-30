package movie.notice;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

@Service 
public class NoticeServiceImpl implements NoticeService {
	
	@Inject
	NoticeDAO noticeDAO;
	
	//게시글 작성
	@Override
	public int NoticeWrite(NoticeModel noticeModel) {
		
		//replace(A, B) A를 B로 변경
		String content = noticeModel.getNotice_content().replaceAll("\r\n","<br>"); //줄바꿈 문자 처리
		
		noticeModel.setNotice_content(content);
		
		return noticeDAO.NoticeWrite(noticeModel);
	}
	
	//게시글 전체 목록
	@Override
	public List<NoticeModel> NoticeListAll(int start, int end, String searchOption, String keyword) {
		return noticeDAO.NoticeListAll(start, end, searchOption, keyword);
	}
	
	//게시글 상세보기
	@Override
	public NoticeModel NoticeView(int notice_no) {
		return noticeDAO.NoticeView(notice_no);
	}
	
	//게시글 조회수 증가
	@Override
	public void NoticeHitUpdate(int notice_no, HttpSession session) {
		
		long update_time = 0; //세션에 저장된 조회시간 검색
		
		//최초로 조회할 경우는 세션에 저장된 값이 없기 때문에 if문은 진입 안함
		if(session.getAttribute("update_time_" + notice_no) != null){
			
								//세션에서 읽어오기
			update_time = (long)session.getAttribute("update_time_" + notice_no);
		}
		
		//시스템의 현재시간을 저장
		long current_time = System.currentTimeMillis();
		//일정시간이 경과 후 조회수 증가 처리 24*60*60*1000(24시간)
		//현재시간 - 열람시간 > 일정시간(조회수 증가가 가능하도록 지정한 시간)
		if(current_time - update_time > 60*60*1000){
			
			noticeDAO.NoticeHitUpdate(notice_no);
			
			//세션에 시간을 저장 : "update_time_" + notice_no 는 다른 변수와 중복되지 않게 한것
			session.setAttribute("update_time_" + notice_no, current_time);
		}
		
	}
	
	//게시글 수정
	@Override
	public int NoticeUpdate(NoticeModel noticeModel) {
		
		String content = noticeModel.getNotice_content().replace("\r\n","<br>");
		
		noticeModel.setNotice_content(content);
		
		return noticeDAO.NoticeUpdate(noticeModel);
		
	}
	
	//게시글 삭제
	@Override
	public void NoticeDelete(int notice_no) {
		noticeDAO.NoticeDelete(notice_no);
		
	}

}
