package movie.admin;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import movie.admin.AdminMovieModel;
import movie.reserve.ReserveTimeTableModel;
import movie.movie.MovieBannerModel;
import movie.movie.MovieModel;

@Service
public class AdminService implements AdminDAO{ 

	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	
	public boolean timeDetailDelete(int time_detail_no) {
		sqlSessionTemplate.delete("admin.timeDetailDelete", time_detail_no);
		return true;
	}
	// movie테이블에서 영화이름,번호 리스트 뽑아오기
	public List<AdminMovieModel> selectmovie_name() {
		return sqlSessionTemplate.selectList("admin.selectMovie_name");
	}
	
	// 번호로 이름 가져오기
	public AdminMovieModel searchname(int timetable_movie_no) {
		return sqlSessionTemplate.selectOne("admin.searchname", timetable_movie_no);
	}
	
	public boolean movieWrite(MovieModel movieModel) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.insert("movie.movieWrite", movieModel);
		return true;
	}
	
	public boolean movieUpdate(MovieModel movieModel) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.update("movie.movieUpdate",movieModel);
		return true;
	}
	
	//시간표 등록
	public boolean timeDetailInsert(ReserveTimeTableModel timetablemodel) {
		sqlSessionTemplate.insert("admin.timetableInsert", timetablemodel);
		return true;
	}
	
	//시간표 조회
	public List<ReserveTimeTableModel> timetable_list() {
		return sqlSessionTemplate.selectList("admin.timetableSelect");
		// TODO Auto-generated method stub
		
	}
	
	//시간표 삭제
		public boolean timetableDelete(int timetable_no) {
			sqlSessionTemplate.delete("admin.timetableDelete", timetable_no);
			return true;
	}
		
	//이벤트 & 배너 조회
		public MovieBannerModel bannerList() {
			return sqlSessionTemplate.selectOne("movie.selectBanner");
		}
	/*	public boolean timeDetailInsert(ReserveModel detailModel) {
			sqlSessionTemplate.insert("admin.timeDetailInsert", detailModel);
			return true;
		}*/
		
		
		public MovieBannerModel bannerView() {
			return sqlSessionTemplate.selectOne("movie.selectBanner");
		}
		
		public boolean bannerUpdate(MovieBannerModel movieBannerModel) {
			// TODO Auto-generated method stub
			return false;
		}
	}
