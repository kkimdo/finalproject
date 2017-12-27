package movie.mypage;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import movie.reserve.ReserveModel;

@Service
public class MypageService implements MypageDAO {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;

	public List<ReserveModel> reserveList(String session_member_id) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("reserve.reserveList", session_member_id);
	}
}
