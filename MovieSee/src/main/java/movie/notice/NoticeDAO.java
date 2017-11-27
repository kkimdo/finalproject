package movie.notice;

import java.util.List;

//공지사항
public interface NoticeDAO {
	
	//글 작성
	public int NoticeWrite(NoticeModel noticeModel);
	
	//글 리스트
	public List<NoticeModel> NoticeList();
	
	//글 상세보기
	public NoticeModel NoticeView(int notice_no);
	
	//글 조회 수 증가
	public int NoticeHitUpdate(int notice_no);

}
