package movie.event;

import java.util.List;

public interface EventDAO {
	
	//게시글 작성
	public int EventWrite(EventModel eventModel) throws Exception;

	// 이벤트 해당 게시글 번호
	public int EventGetSEQ() throws Exception;
	
	//게시글 전체 목록
	public List<EventModel> EventListAll(int start, int end, String searchOption, String keyword) throws Exception;
			
	//게시글 레코드 갯수
	public int count(String searchOption, String keyword) throws Exception;
	
}
