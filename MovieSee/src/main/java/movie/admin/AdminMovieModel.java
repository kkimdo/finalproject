package movie.admin;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class AdminMovieModel {
	
	private int movie_no;
	private String movie_name;
	private String movie_director;
	private String movie_director_picture;
	private String movie_actor;
	private String movie_actor1;
	private String movie_actor2;
	private String movie_actor_picture;
	private String movie_actor_picture1;
	private String movie_actor_picture2;
	private String movie_company;
	private String movie_story;
	private String movie_poster;
	private String movie_stillcut;
	private String movie_stillcut1;
	private String movie_stillcut2;
	private String movie_stillcut3;
	private String movie_stillcut4;
	private String movie_genre;
	private String movie_age;
	@DateTimeFormat(pattern="yyyyMMdd")
	private Date movie_date;
	private Date movie_regdate;
	private String movie_type;
	private String movie_intro;
	
	public int getMovie_no() {
		return movie_no;
	}
	public void setMovie_no(int movie_no) {
		this.movie_no = movie_no;
	}
	public String getMovie_name() {
		return movie_name;
	}
	public void setMovie_name(String movie_name) {
		this.movie_name = movie_name;
	}
	public String getMovie_director() {
		return movie_director;
	}
	public void setMovie_director(String movie_director) {
		this.movie_director = movie_director;
	}
	public String getMovie_director_picture() {
		return movie_director_picture;
	}
	public void setMovie_director_picture(String movie_director_picture) {
		this.movie_director_picture = movie_director_picture;
	}
	public String getMovie_actor() {
		return movie_actor;
	}
	public void setMovie_actor(String movie_actor) {
		this.movie_actor = movie_actor;
	}
	public String getMovie_actor1() {
		return movie_actor1;
	}
	public void setMovie_actor1(String movie_actor1) {
		this.movie_actor1 = movie_actor1;
	}
	public String getMovie_actor2() {
		return movie_actor2;
	}
	public void setMovie_actor2(String movie_actor2) {
		this.movie_actor2 = movie_actor2;
	}
	public String getMovie_actor_picture() {
		return movie_actor_picture;
	}
	public void setMovie_actor_picture(String movie_actor_picture) {
		this.movie_actor_picture = movie_actor_picture;
	}
	public String getMovie_actor_picture1() {
		return movie_actor_picture1;
	}
	public void setMovie_actor_picture1(String movie_actor_picture1) {
		this.movie_actor_picture1 = movie_actor_picture1;
	}
	public String getMovie_actor_picture2() {
		return movie_actor_picture2;
	}
	public void setMovie_actor_picture2(String movie_actor_picture2) {
		this.movie_actor_picture2 = movie_actor_picture2;
	}
	public String getMovie_company() {
		return movie_company;
	}
	public void setMovie_company(String movie_company) {
		this.movie_company = movie_company;
	}
	public String getMovie_story() {
		return movie_story;
	}
	public void setMovie_story(String movie_story) {
		this.movie_story = movie_story;
	}
	public String getMovie_poster() {
		return movie_poster;
	}
	public void setMovie_poster(String movie_poster) {
		this.movie_poster = movie_poster;
	}
	public String getMovie_stillcut() {
		return movie_stillcut;
	}
	public void setMovie_stillcut(String movie_stillcut) {
		this.movie_stillcut = movie_stillcut;
	}
	public String getMovie_stillcut1() {
		return movie_stillcut1;
	}
	public void setMovie_stillcut1(String movie_stillcut1) {
		this.movie_stillcut1 = movie_stillcut1;
	}
	public String getMovie_stillcut2() {
		return movie_stillcut2;
	}
	public void setMovie_stillcut2(String movie_stillcut2) {
		this.movie_stillcut2 = movie_stillcut2;
	}
	public String getMovie_stillcut3() {
		return movie_stillcut3;
	}
	public void setMovie_stillcut3(String movie_stillcut3) {
		this.movie_stillcut3 = movie_stillcut3;
	}
	public String getMovie_stillcut4() {
		return movie_stillcut4;
	}
	public void setMovie_stillcut4(String movie_stillcut4) {
		this.movie_stillcut4 = movie_stillcut4;
	}
	public String getMovie_genre() {
		return movie_genre;
	}
	public void setMovie_genre(String movie_genre) {
		this.movie_genre = movie_genre;
	}
	public String getMovie_age() {
		return movie_age;
	}
	public void setMovie_age(String movie_age) {
		this.movie_age = movie_age;
	}
	public Date getMovie_date() {
		return movie_date;
	}
	public void setMovie_date(Date movie_date) {
		this.movie_date = movie_date;
	}
	public Date getMovie_regdate() {
		return movie_regdate;
	}
	public void setMovie_regdate(Date movie_regdate) {
		this.movie_regdate = movie_regdate;
	}
	public String getMovie_type() {
		return movie_type;
	}
	public void setMovie_type(String movie_type) {
		this.movie_type = movie_type;
	}
	public String getMovie_intro() {
		return movie_intro;
	}
	public void setMovie_intro(String movie_intro) {
		this.movie_intro = movie_intro;
	}
}