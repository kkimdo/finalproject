package movie.freeboard;

import java.util.Date;

public class FreeBoardModel {
	
	private int freeboard_no; //글 번호
	private String freeboard_subject; //글 제목
	private String freeboard_content; //글 내용
	private String freeboard_name; //글 작성자 이름
	private String freeboard_passwd; //글 비밀 번호
	private int freeboard_hit; //글 조회수
	private Date freeboard_date; //글 등록 일
	private int freeboard_ref; 
	private int freeboard_re_step;
	
	public int getFreeboard_no() {
		return freeboard_no;
	}
	public void setFreeboard_no(int freeboard_no) {
		this.freeboard_no = freeboard_no;
	}
	public String getFreeboard_subject() {
		return freeboard_subject;
	}
	public void setFreeboard_subject(String freeboard_subject) {
		this.freeboard_subject = freeboard_subject;
	}
	public String getFreeboard_content() {
		return freeboard_content;
	}
	public void setFreeboard_content(String freeboard_content) {
		this.freeboard_content = freeboard_content;
	}
	public String getFreeboard_name() {
		return freeboard_name;
	}
	public void setFreeboard_name(String freeboard_name) {
		this.freeboard_name = freeboard_name;
	}
	public String getFreeboard_passwd() {
		return freeboard_passwd;
	}
	public void setFreeboard_passwd(String freeboard_passwd) {
		this.freeboard_passwd = freeboard_passwd;
	}
	public int getFreeboard_hit() {
		return freeboard_hit;
	}
	public void setFreeboard_hit(int freeboard_hit) {
		this.freeboard_hit = freeboard_hit;
	}
	public Date getFreeboard_date() {
		return freeboard_date;
	}
	public void setFreeboard_date(Date freeboard_date) {
		this.freeboard_date = freeboard_date;
	}
	public int getFreeboard_ref() {
		return freeboard_ref;
	}
	public void setFreeboard_ref(int freeboard_ref) {
		this.freeboard_ref = freeboard_ref;
	}
	public int getFreeboard_re_step() {
		return freeboard_re_step;
	}
	public void setFreeboard_re_step(int freeboard_re_step) {
		this.freeboard_re_step = freeboard_re_step;
	}
	
	

}
