package movie.member;

public interface MemberDAO {
	
	//로그인
	public MemberModel memberLogin(MemberModel member);
	
	//아이디찾기
	public MemberModel getMember(String member_id);
	
	//가입
	public Object insertMember(MemberModel member);
	
	//이름으로 아이디찾기
	public MemberModel idFindByName(MemberModel member);
	
	//수정하기
	public Object memberModify(MemberModel member);
	
	//삭제하기
	public Object memberDelete(String member_id);

}
