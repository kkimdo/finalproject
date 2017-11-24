package movie.notice;

import java.util.List;

//공지사항
public interface NoticeDAO {
	
	//글 작성
	public int noticeWrite(NoticeModel noticeModel);
	
	//글 리스트
//	public List<NoticeModel> noticeList();
	

}
