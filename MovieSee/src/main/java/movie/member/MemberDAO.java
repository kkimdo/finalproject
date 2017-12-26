package movie.member;

import java.util.List;

public interface MemberDAO {
	
	//로그인
	public MemberModel memberLogin(MemberModel member);
	
	//아이디찾기
	public MemberModel getMember(String member_id);
	
	//가입
	public Object insertMember(MemberModel member);
	
	//이름으로 아이디찾기
	public MemberModel idFindByName(MemberModel member);
	
	
	public Object memberPWUpdate(MemberModel member);
	
	//수정하기
	public Object memberModify(MemberModel member);
	
	//삭제하기
	public Object memberDelete(int member_no);
	
	//회원정보보기
	public Object memberView(int member_no) throws Exception;
	
	//회원 명수
	public int count(String searchOption, String keyword) throws Exception;
	
	//회원 전체 목록
	public List<MemberModel> memberListAll(int start, int end, String searchOption, String keyword) throws Exception;
	
	//이름과 이메일로 아이디찾기
	public Object memberFindId(MemberModel member);
	
	//이름과 이메일과 아이디로 암호찾기
	public Object memberFindPw(MemberModel member);
}
