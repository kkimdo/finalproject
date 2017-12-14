package movie.event;

import java.util.List;

public interface EventDAO {
	
	//게시글 작성
	public int EventWrite(EventModel eventModel) throws Exception;
	
	//게시글 작성에 해당하는 파일 업로드
	public void EventUploadFile(String eventfile_original_file_name, String eventfile_stored_file_name, long eventfile_size);

	// 이벤트 해당 게시글 번호
	public int EventGetSEQ() throws Exception;
	
	//게시글 목록 (1.영화)
	public List<EventModel> EventList_1(int start, int end, String searchOption, String keyword) throws Exception;
		
	//게시글 목록 (2.시사회/무대인사)
	public List<EventModel> EventList_2(int start, int end, String searchOption, String keyword) throws Exception;
		
	//게시글 목록 (3.롯시NOW)
	public List<EventModel> EventList_3(int start, int end, String searchOption, String keyword) throws Exception;
		
	//게시글 목록 (4.제휴할인)
	public List<EventModel> EventList_4(int start, int end, String searchOption, String keyword) throws Exception;
			
	//게시글 레코드 갯수
	public int count(String searchOption, String keyword) throws Exception;
	
	//게시글 조회수 증가
	public void EventHitUpdate(int event_no) throws Exception;
		
	//게시글 상세보기
	public EventModel EventView(int event_no) throws Exception;
	
}
