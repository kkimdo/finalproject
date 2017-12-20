package movie.reserve;

import java.util.List;

import movie.reserve.ReserveModel;
import movie.reserve.ReserveTimeTableModel;
import movie.movie.MovieModel;

public interface ReserveDAO {

	public List<ReserveTimeTableModel> timesearch(ReserveTimeTableModel timetableModel);
	
	public List<MovieModel> selectMovie_name();
	
	public List<ReserveTimeTableModel> timetable_list();
	
	public List<ReserveTimeTableModel> timetableSelect();
	
	public ReserveTimeTableModel timetable_no(int timetable_no);
	
	public MovieModel selectMovie_no(int timetable_movie_no);
	
	public void insertReserve(ReserveModel reserveModel);
}
