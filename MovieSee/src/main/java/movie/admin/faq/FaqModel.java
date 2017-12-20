package movie.admin.faq;

import java.util.Date;

//faq 테이블의 도메인 클래스
public class FaqModel {
	
	private int faq_no;	//글 번호
	private String faq_subject; //글 제목
	private String faq_content; //글 내용
	private int faq_hit; //글 조회수
	private Date faq_date; //글 등록일
	private String faq_category; //글 카테고리
	
	public int getFaq_no() {
		return faq_no;
	}
	public void setFaq_no(int faq_no) {
		this.faq_no = faq_no;
	}
	public String getFaq_subject() {
		return faq_subject;
	}
	public void setFaq_subject(String faq_subject) {
		this.faq_subject = faq_subject;
	}
	public String getFaq_content() {
		return faq_content;
	}
	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}
	public int getFaq_hit() {
		return faq_hit;
	}
	public void setFaq_hit(int faq_hit) {
		this.faq_hit = faq_hit;
	}
	public Date getFaq_date() {
		return faq_date;
	}
	public void setFaq_date(Date faq_date) {
		this.faq_date = faq_date;
	}
	public String getFaq_category() {
		return faq_category;
	}
	public void setFaq_category(String faq_category) {
		this.faq_category = faq_category;
	}
	
	

}
