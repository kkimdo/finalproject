package movie.admin.notice;

import java.util.Date;

//notice 테이블의 도메인 클래스
public class NoticeModel {
	
	private int notice_no; //글 번호
	private String notice_subject; //글 제목
	private String notice_content; //글 내용
	private String notice_hit; //글 조회수
	private Date notice_date; //글 등록 일
	private String notice_area; //글의 해당 지역
	private String notice_content_file; //내용 이미지
	
	private int notice_prev;
	private String notice_prev_subject;
	
	private int notice_next;
	private String notice_next_subject;
	
	public int getNotice_no() {
		return notice_no;
	}
	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}
	public String getNotice_subject() {
		return notice_subject;
	}
	public void setNotice_subject(String notice_subject) {
		this.notice_subject = notice_subject;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public String getNotice_hit() {
		return notice_hit;
	}
	public void setNotice_hit(String notice_hit) {
		this.notice_hit = notice_hit;
	}
	public Date getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(Date notice_date) {
		this.notice_date = notice_date;
	}
	public String getNotice_area() {
		return notice_area;
	}
	public void setNotice_area(String notice_area) {
		this.notice_area = notice_area;
	}
	public int getNotice_prev() {
		return notice_prev;
	}
	public void setNotice_prev(int notice_prev) {
		this.notice_prev = notice_prev;
	}
	public String getNotice_prev_subject() {
		return notice_prev_subject;
	}
	public void setNotice_prev_subject(String notice_prev_subject) {
		this.notice_prev_subject = notice_prev_subject;
	}
	public int getNotice_next() {
		return notice_next;
	}
	public void setNotice_next(int notice_next) {
		this.notice_next = notice_next;
	}
	public String getNotice_next_subject() {
		return notice_next_subject;
	}
	public void setNotice_next_subject(String notice_next_subject) {
		this.notice_next_subject = notice_next_subject;
	}
	public String getNotice_content_file() {
		return notice_content_file;
	}
	public void setNotice_content_file(String notice_content_file) {
		this.notice_content_file = notice_content_file;
	}
	
}
