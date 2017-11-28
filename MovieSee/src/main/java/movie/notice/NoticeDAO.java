package movie.notice;

import java.util.List;

//공지사항
public interface NoticeDAO {
	
	//데이터를 삽입하는 메소드(작성)
	public int NoticeWrite(NoticeModel noticeModel);
	
	//모든 데이터를 가져와서 List<NoticeModel>를 리턴하는 메소드(목록)
	public List<NoticeModel> NoticeList();
	
	//notice_no을 이용하여 데이터를 검색하여 리턴하는 메소드(상세보기)
	public NoticeModel NoticeView(int notice_no);
	
	//notice_no을 이용하여 데이터의 조회수를 갱신하는 메소드(조회수 증가)
	public int NoticeHitUpdate(int notice_no);

	//데이터를 갱신하는 메소드(수정)
	public int NoticeUpdate(NoticeModel noticeModel);

}
