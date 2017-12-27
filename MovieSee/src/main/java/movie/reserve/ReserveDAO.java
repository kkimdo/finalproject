package movie.reserve;

import java.util.List;

import movie.reserve.ReserveModel;
import movie.reserve.ReserveTimeTableModel;
import movie.admin.TimeTableModel;
import movie.movie.MovieModel;

public interface ReserveDAO {

	public List<ReserveTimeTableModel> timesearch(ReserveTimeTableModel timetableModel);
	
	public List<MovieModel> selectMovie_name();
	
	public List<ReserveTimeTableModel> timetable_list();
	
	public List<ReserveTimeTableModel> timetableSelect();
	
	public ReserveTimeTableModel timetable_no(int reserve_timetable_no);
	
	public MovieModel selectMovie_no(int timetable_movie_no);
	
	public void insertReserve(ReserveModel reserveModel);
	
	public void deleteReserve(int reserve_no);
	
	public Object amountDown(ReserveTimeTableModel reserveTimeTableModel);
	
	public ReserveModel selectReserve_no(int reserve_no);
	
}
