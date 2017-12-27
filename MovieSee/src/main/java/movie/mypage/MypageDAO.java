package movie.mypage;

import java.util.List;

import movie.reserve.ReserveModel;

public interface MypageDAO {

	public List<ReserveModel> reserveList(String session_member_id);
}
