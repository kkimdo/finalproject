package movie.event;

public interface EventDAO {
	
	//게시글 작성
	public int EventWrite(EventModel eventModel) throws Exception;

}
