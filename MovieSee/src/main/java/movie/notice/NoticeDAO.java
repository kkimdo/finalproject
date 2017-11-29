package movie.notice;

import java.util.List;

//공지사항
public interface NoticeDAO {
	
	//데이터를 삽입하는 메소드(게시글 작성)
	public int NoticeWrite(NoticeModel noticeModel);
			
	//모든 데이터를 가져와서 List<NoticeModel>를 리턴하는 메소드(게시글 전체 목록)
	public List<NoticeModel> NoticeList();
			
	//notice_no을 이용하여 데이터를 검색하여 리턴하는 메소드(게시글 상세보기)
	public NoticeModel NoticeView(int notice_no);
			
	//notice_no을 이용하여 데이터의 조회수를 갱신하는 메소드(게시글 조회수 증가)
	public void NoticeHitUpdate(int notice_no);

	//데이터를 갱신하는 메소드(게시글 수정)
	public int NoticeUpdate(NoticeModel noticeModel);
			
	//데이터를 삭제하는 메소드(게시글 삭제)
	public void NoticeDelete(int notice_no);
	
	//isSearch를 이용하여 검색의 해당되는 데이터를 불러오는 메소드(게시글 제목으로 검색)
	public List<NoticeModel> NoticeSearchList0(String isSearch);
	
	//isSearch를 이용하여 검색의 해당되는 데이터를 불러오는 메소드(게시글 내용으로 검색)
	public List<NoticeModel> NoticeSearchList1(String isSearch);
	
}
