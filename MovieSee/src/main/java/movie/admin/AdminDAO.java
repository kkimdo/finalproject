package movie.admin;

import java.util.List;

import movie.reserve.ReserveTimeTableModel;
import movie.movie.MovieBannerModel;
import movie.movie.MovieModel;

public interface AdminDAO {

	public boolean timeDetailDelete(int time_detail_no);
	
	public List<AdminMovieModel> selectmovie_name();
	
	public boolean movieWrite(MovieModel movieModel);
	
	public List<ReserveTimeTableModel> timetable_list();
	
	public boolean timetableDelete(int timetable_no);
	
	public boolean movieUpdate(MovieModel movieModel);
	
	public MovieBannerModel bannerList();

	public MovieBannerModel bannerView();
	
	public boolean bannerUpdate(MovieBannerModel movieBannerModel); 
	
	public AdminMovieModel searchname(int timetable_movie_no);
	
}
