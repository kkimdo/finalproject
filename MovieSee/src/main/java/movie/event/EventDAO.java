package movie.event;

public interface EventDAO {
	
	//게시글 작성
	public int EventWrite(EventModel eventModel) throws Exception;

	// 이벤트 해당 게시글 번호
	public int EventGetSEQ();
	
}
