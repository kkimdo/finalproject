package movie.event;

public class EventUploadFile {
	
	private int eventfile_num;
	private String eventfile_original_file_name; //실제 파일 이름
	private String eventfile_stored_file_name; //중복 처리를 예방하여 저장한 파일 이름
	private long eventfile_size;
	private int event_no; //이벤트 게시판 번호
	
	public int getEventfile_num() {
		return eventfile_num;
	}
	public void setEventfile_num(int eventfile_num) {
		this.eventfile_num = eventfile_num;
	}
	public String getEventfile_original_file_name() {
		return eventfile_original_file_name;
	}
	public void setEventfile_original_file_name(String eventfile_original_file_name) {
		this.eventfile_original_file_name = eventfile_original_file_name;
	}
	public String getEventfile_stored_file_name() {
		return eventfile_stored_file_name;
	}
	public void setEventfile_stored_file_name(String eventfile_stored_file_name) {
		this.eventfile_stored_file_name = eventfile_stored_file_name;
	}
	public long getEventfile_size() {
		return eventfile_size;
	}
	public void setEventfile_size(long eventfile_size) {
		this.eventfile_size = eventfile_size;
	}
	public int getEvent_no() {
		return event_no;
	}
	public void setEvent_no(int event_no) {
		this.event_no = event_no;
	}
	
	

}
