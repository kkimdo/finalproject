package movie.admin;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class TimeTableModel {
	int timetable_no;
	int timetable_movie_no;
	String timetable_movie_name;
	Date timetable_start_date;
	Date timetable_end_date;
	@DateTimeFormat(pattern="yyyyMMdd")
	Date timetable_show_date;
	int timetable_reserved_seat;
	int timetable_total_seat;
	String timetable_start_time;
	String timetable_end_time;
	int timetable_adult_amt;
	int timetable_child_amt;
	
	public int getTimetable_no() {
		return timetable_no;
	}
	public void setTimetable_no(int timetable_no) {
		this.timetable_no = timetable_no;
	}
	public int getTimetable_movie_no() {
		return timetable_movie_no;
	}
	public void setTimetable_movie_no(int timetable_movie_no) {
		this.timetable_movie_no = timetable_movie_no;
	}
	public String getTimetable_movie_name() {
		return timetable_movie_name;
	}
	public void setTimetable_movie_name(String timetable_movie_name) {
		this.timetable_movie_name = timetable_movie_name;
	}
	public Date getTimetable_start_date() {
		return timetable_start_date;
	}
	public void setTimetable_start_date(Date timetable_start_date) {
		this.timetable_start_date = timetable_start_date;
	}
	public Date getTimetable_end_date() {
		return timetable_end_date;
	}
	public void setTimetable_end_date(Date timetable_end_date) {
		this.timetable_end_date = timetable_end_date;
	}
	public Date getTimetable_show_date() {
		return timetable_show_date;
	}
	public void setTimetable_show_date(Date timetable_show_date) {
		this.timetable_show_date = timetable_show_date;
	}
	public int getTimetable_reserved_seat() {
		return timetable_reserved_seat;
	}
	public void setTimetable_reserved_seat(int timetable_reserved_seat) {
		this.timetable_reserved_seat = timetable_reserved_seat;
	}
	public int getTimetable_total_seat() {
		return timetable_total_seat;
	}
	public void setTimetable_total_seat(int timetable_total_seat) {
		this.timetable_total_seat = timetable_total_seat;
	}
	public String getTimetable_start_time() {
		return timetable_start_time;
	}
	public void setTimetable_start_time(String timetable_start_time) {
		this.timetable_start_time = timetable_start_time;
	}
	public String getTimetable_end_time() {
		return timetable_end_time;
	}
	public void setTimetable_end_time(String timetable_end_time) {
		this.timetable_end_time = timetable_end_time;
	}
	public int getTimetable_adult_amt() {
		return timetable_adult_amt;
	}
	public void setTimetable_adult_amt(int timetable_adult_amt) {
		this.timetable_adult_amt = timetable_adult_amt;
	}
	public int getTimetable_child_amt() {
		return timetable_child_amt;
	}
	public void setTimetable_child_amt(int timetable_child_amt) {
		this.timetable_child_amt = timetable_child_amt;
	}
}
