package movie.movie;

import java.util.Date;

public class MovieCommentModel {
	
	private int comment_no;
	private int movie_no;
	private String cmter;
	private String commentt;
	private int movie_point;
	private Date cmt_date;
	
	public int getComment_no() {
		return comment_no;
	}
	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}
	public int getMovie_no() {
		return movie_no;
	}
	public void setMovie_no(int movie_no) {
		this.movie_no = movie_no;
	}
	public String getCmter() {
		return cmter;
	}
	public void setCmter(String cmter) {
		this.cmter = cmter;
	}
	public String getCommentt() {
		return commentt;
	}
	public void setCommentt(String commentt) {
		this.commentt = commentt;
	}
	public int getMovie_point() {
		return movie_point;
	}
	public void setMovie_point(int movie_point) {
		this.movie_point = movie_point;
	}
	public Date getCmt_date() {
		return cmt_date;
	}
	public void setCmt_date(Date cmt_date) {
		this.cmt_date = cmt_date;
	}
}
