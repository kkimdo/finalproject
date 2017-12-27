package movie.reserve;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import movie.reserve.ReserveModel;
import movie.reserve.ReserveTimeTableModel;
import movie.admin.TimeTableModel;
import movie.movie.MovieModel;

@Service
public class ReserveService implements ReserveDAO {

	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

	public List<ReserveTimeTableModel> timesearch(ReserveTimeTableModel timetablemodel) {
		return sqlSessionTemplate.selectList("reserve.timesearch", timetablemodel);
	}

	public List<MovieModel> selectMovie_name() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("reserve.selectMovie_name");
	}

	// 시간표 조회
	public List<ReserveTimeTableModel> timetable_list() {
		return sqlSessionTemplate.selectList("reserve.selectMovie_name");
		// TODO Auto-generated method stub
	}

	public List<ReserveTimeTableModel> timetableSelect() {
		return sqlSessionTemplate.selectList("reserve.timetableSelect");
		// TODO Auto-generated method stub
	}

	public ReserveTimeTableModel timetable_no(int reserve_timetable_no) {
		return sqlSessionTemplate.selectOne("reserve.timetable_no", reserve_timetable_no);
		// TODO Auto-generated method stub
	}

	public ReserveModel selectReserve_no(int reserve_no) {
		return sqlSessionTemplate.selectOne("reserve.selectReserve_no", reserve_no);
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

	// 예매 취소
	public void deleteReserve(int reserve_no) {
		sqlSessionTemplate.delete("reserve.deleteReserve", reserve_no);
	}

	// 수량 증감
	public Object amountDown(ReserveTimeTableModel reserveTimeTableModel) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("reserve.amountDown", reserveTimeTableModel);
	}

	// 영화 예매율
	public ReserveTimeTableModel updatemovierate(ReserveTimeTableModel reserveTimeTableModel) {
		return sqlSessionTemplate.selectOne("reserve.updatemovierate", reserveTimeTableModel);
	}
}
