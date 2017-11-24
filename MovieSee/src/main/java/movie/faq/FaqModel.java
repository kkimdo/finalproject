package movie.faq;

import java.util.Date;

public class FaqModel {
	
	private int faq_no;
	private String faq_subject;
	private String faq_content;
	private int faq_hit;
	private Date faq_date;
	
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
	
	

}