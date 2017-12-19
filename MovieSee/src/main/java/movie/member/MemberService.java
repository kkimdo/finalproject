package movie.member;

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
		return sqlSessionTemplate.update("member.updaterMember", member);
	}

	@Override
	public Object memberDelete(String member_id) {
		return sqlSessionTemplate.delete("member.deleteMember", member_id);
	}
	
	

}
