package movie.reserve;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import movie.reserve.ReserveModel;
import movie.reserve.ReserveTimeTableModel;
import movie.movie.MovieModel;

@Service
public class ReserveService implements ReserveDAO{

	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<ReserveTimeTableModel> timesearch(ReserveTimeTableModel timetablemodel) {
		return sqlSessionTemplate.selectList("reserve.timesearch", timetablemodel);
	}

	public List<MovieModel> selectMovie_name() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("reserve.selectMovie_name");
	}
	
	//시간표 조회
	public List<ReserveTimeTableModel> timetable_list() {
		return sqlSessionTemplate.selectList("reserve.selectMovie_name");
		// TODO Auto-generated method stub
	}
	
	public List<ReserveTimeTableModel> timetableSelect() {
		return sqlSessionTemplate.selectList("reserve.timetableSelect");
		// TODO Auto-generated method stub	
	}
	
	public ReserveTimeTableModel timetable_no(int timetable_no) {
		return sqlSessionTemplate.selectOne("reserve.timetable_no", timetable_no);
		// TODO Auto-generated method stub	
	}
	
	public MovieModel selectMovie_no(int timetable_movie_no) {
		return sqlSessionTemplate.selectOne("reserve.selectMovie_no", timetable_movie_no);
		// TODO Auto-generated method stub	
	}
	
	// 예매 등록 
	public void insertReserve(ReserveModel reserveModel) {
		sqlSessionTemplate.insert("reserve.insertReserve", reserveModel);
	}
}
