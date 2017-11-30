package movie.notice;

import java.util.List;

import javax.servlet.http.HttpSession;

public interface NoticeService {
	
	//데이터를 삽입하는 메소드(게시글 작성)
	public int NoticeWrite(NoticeModel noticeModel);
		
	//게시글 전체 목록
	public List<NoticeModel> NoticeListAll(int start, int end, String searchOption, String keyword);
	
	//notice_no을 이용하여 데이터를 검색하여 리턴하는 메소드(게시글 상세보기)
	public NoticeModel NoticeView(int notice_no);
		
	//notice_no을 이용하여 데이터의 조회수를 갱신하는 메소드(게시글 조회수 증가)
	public void NoticeHitUpdate(int notice_no, HttpSession session);

	//데이터를 갱신하는 메소드(게시글 수정)
	public int NoticeUpdate(NoticeModel noticeModel);
		
	//데이터를 삭제하는 메소드(게시글 삭제)
	public void NoticeDelete(int notice_no);
	
}

