package movie.admin.notice;

import java.util.List;

//공지사항
public interface NoticeDAO {

	// 데이터를 삽입하는 메소드(게시글 작성)
	public int NoticeWrite(NoticeModel noticeModel) throws Exception;

	// 해당 게시글 번호
	public int NoticeGetSEQ() throws Exception;

	// 게시글 전체 목록
	public List<NoticeModel> NoticeListAll(int start, int end, String searchOption, String keyword) throws Exception;

	// 게시글 레코드 갯수
	public int count(String searchOption, String keyword) throws Exception;

	// notice_no을 이용하여 데이터를 검색하여 리턴하는 메소드(게시글 상세보기)
	public NoticeModel NoticeView(int notice_no) throws Exception;

	// notice_no을 이용하여 데이터의 조회수를 갱신하는 메소드(게시글 조회수 증가)
	public void NoticeHitUpdate(int notice_no) throws Exception;

	// 데이터를 갱신하는 메소드(게시글 수정)
	public int NoticeUpdate(NoticeModel noticeModel) throws Exception;

	// 데이터를 삭제하는 메소드(게시글 삭제)
	public void NoticeDelete(int notice_no) throws Exception;

	// 이전 글
	public NoticeModel NoticePrev(int notice_no) throws Exception;

	// 다음 글
	public NoticeModel NoticeNext(int notice_no) throws Exception;

}
