package movie.movie;

import java.util.List;

import movie.reserve.ReserveTimeTableModel;

public interface MovieDAO {

	List<MovieModel> movieList();
	
	List<MovieModel> movieScore();
	
	public List<MovieModel> movieRate();

	MovieBannerModel banner_select(); 
	
	List<MovieModel> movieList_one(int movie_no);
	
	MovieIntroModel movieintro_Select();
	
	List<MovieModel> movieBoxofficeList();
	
	List<MovieModel> movieArteList();
	
	List<MovieModel> movieGcinemaList();
	
	List<MovieModel> movieChinamovieList();
	
	public boolean movieDelete(int no);
	
	public Object writecomment(MovieCommentModel movieCommentModel);

	public List<MovieCommentModel> commentList(int movie_num);

	public Object deletecomment(MovieCommentModel movieCommentModel);
	
	public MovieModel updatemovieScore(MovieModel movieModel);
	
}
