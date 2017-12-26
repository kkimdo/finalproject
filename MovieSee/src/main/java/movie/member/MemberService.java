package movie.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service
public class MemberService implements MemberDAO{
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;

	//로그인
	@Override
	public MemberModel memberLogin(MemberModel member) {
		return sqlSessionTemplate.selectOne("member.login", member);
	}

	//아이디찾기
	@Override
	public MemberModel getMember(String member_id) {
		return sqlSessionTemplate.selectOne("member.getMember", member_id);
	}

	//회원정보 입력
	@Override
	public Object insertMember(MemberModel member) {
		return sqlSessionTemplate.insert("member.insertMember", member);
	}

	//이름으로 아이디  암호 찾기
	@Override
	public MemberModel idFindByName(MemberModel member) {
		return sqlSessionTemplate.selectOne("member.idfind", member);
	}

	//회원수정
	@Override
	public Object memberModify(MemberModel member) {
		return sqlSessionTemplate.update("member.updateMember", member);
	}
	
	public Object memberPWUpdate(MemberModel member) {
		System.out.println("Template");
		return sqlSessionTemplate.update("member.updatePWMember", member);
	}

	@Override
	public Object memberDelete(int member_no) {
		return sqlSessionTemplate.delete("member.deleteMember", member_no);
	}

	@Override
	public Object memberView(int member_no) throws Exception {
		return sqlSessionTemplate.selectOne("member.memberView", member_no);
	}

	@Override
	public int count(String searchOption, String keyword) throws Exception {
		
		Map<String,String> map = new HashMap<String, String>();
		
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		
		return sqlSessionTemplate.selectOne("member.count", map);
	}

	@Override
	public List<MemberModel> memberListAll(int start, int end, String searchOption, String keyword) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		
		map.put("start", start);
		map.put("end", end);
		
		return sqlSessionTemplate.selectList("member.memberListAll", map);
	}

	@Override
	public MemberModel memberFindId(MemberModel member) {
		return sqlSessionTemplate.selectOne("member.memberFindId", member);
		
	}

	@Override
	public MemberModel memberFindPw(MemberModel member) {
		return sqlSessionTemplate.selectOne("member.memberFindPw", member);
		
	}
	

	
	
	
	

}
