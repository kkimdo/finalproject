package movie.admin.qna;

import java.util.Date;

//qna 테이블의 도메인 클래스
public class QnaModel {
	
	private int qna_no; //글 번호
	private String qna_id; //회원 아이디 
	private String qna_name; //회언 이름
	private String qna_phone; //회원 폰번호
	private String qna_email; //회원 이메일
	private String qna_question_kinds; //문의 종류
	private String qna_category; //문의 분류
	private String qna_area; //해당 지역
	private String qna_subject; //글 제목
	private String qna_content; //글 내용
	private String qna_orgfile; //실제 파일 이름
	private String qna_savfile; //중복되지않게 하는 파일이름  
	private Date qna_date; //글 등록일

	
	public int getQna_no() {
		return qna_no;
	}
	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}
	public String getQna_id() {
		return qna_id;
	}
	public void setQna_id(String qna_id) {
		this.qna_id = qna_id;
	}
	public String getQna_name() {
		return qna_name;
	}
	public void setQna_name(String qna_name) {
		this.qna_name = qna_name;
	}
	public String getQna_phone() {
		return qna_phone;
	}
	public void setQna_phone(String qna_phone) {
		this.qna_phone = qna_phone;
	}
	public String getQna_email() {
		return qna_email;
	}
	public void setQna_email(String qna_email) {
		this.qna_email = qna_email;
	}
	public String getQna_question_kinds() {
		return qna_question_kinds;
	}
	public void setQna_question_kinds(String qna_question_kinds) {
		this.qna_question_kinds = qna_question_kinds;
	}
	public String getQna_category() {
		return qna_category;
	}
	public void setQna_category(String qna_category) {
		this.qna_category = qna_category;
	}
	public String getQna_area() {
		return qna_area;
	}
	public void setQna_area(String qna_area) {
		this.qna_area = qna_area;
	}
	public String getQna_subject() {
		return qna_subject;
	}
	public void setQna_subject(String qna_subject) {
		this.qna_subject = qna_subject;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public String getQna_orgfile() {
		return qna_orgfile;
	}
	public void setQna_orgfile(String qna_orgfile) {
		this.qna_orgfile = qna_orgfile;
	}
	public Date getQna_date() {
		return qna_date;
	}
	public void setQna_date(Date qna_date) {
		this.qna_date = qna_date;
	}
	public String getQna_savfile() {
		return qna_savfile;
	}
	public void setQna_savfile(String qna_savfile) {
		this.qna_savfile = qna_savfile;
	}

	
}
