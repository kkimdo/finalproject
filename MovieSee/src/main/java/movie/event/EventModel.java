package movie.event;

import org.springframework.web.multipart.MultipartFile;

public class EventModel {
	
	private int event_no;
	private String event_subject;
	private String event_content;
	private String event_start_date;
	private String event_end_date;
	private int event_hit;
	private String event_category;
	
	private MultipartFile[] file1;
	
	public int getEvent_no() {
		return event_no;
	}
	public void setEvent_no(int event_no) {
		this.event_no = event_no;
	}
	public String getEvent_subject() {
		return event_subject;
	}
	public void setEvent_subject(String event_subject) {
		this.event_subject = event_subject;
	}
	public String getEvent_content() {
		return event_content;
	}
	public void setEvent_content(String event_content) {
		this.event_content = event_content;
	}
	public String getEvent_start_date() {
		return event_start_date;
	}
	public void setEvent_start_date(String event_start_date) {
		this.event_start_date = event_start_date;
	}
	public String getEvent_end_date() {
		return event_end_date;
	}
	public void setEvent_end_date(String event_end_date) {
		this.event_end_date = event_end_date;
	}
	public int getEvent_hit() {
		return event_hit;
	}
	public void setEvent_hit(int event_hit) {
		this.event_hit = event_hit;
	}
	public String getEvent_category() {
		return event_category;
	}
	public void setEvent_category(String event_category) {
		this.event_category = event_category;
	}
	public MultipartFile[] getFile1() {
		return file1;
	}
	public void setFile1(MultipartFile[] file1) {
		this.file1 = file1;
	}
	
}
