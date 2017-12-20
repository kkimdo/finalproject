package movie.freeboard;

import java.util.List;

import javax.servlet.http.HttpSession;

public interface FreeBoardService {

	// 게시글 작성
	public int FreeBoardWrite(FreeBoardModel freeBoardModel) throws Exception;

	// 게시글 레코드 갯수
	public int count(String searchOption, String keyword) throws Exception;

	// 게시글 전체 목록
	public List<FreeBoardModel> FreeBoardListAll(int start, int end, String searchOption, String keyword)
			throws Exception;

	// 게시글 상세보기
	public FreeBoardModel FreeBoardView(int freeboard_no) throws Exception;

	// 게시글 조회수 증가
	public void FreeBoardHitUpdate(int freeboard_no, HttpSession session) throws Exception;

	// 답변 글 삭제
	public int FreeRefDelete(int freeboard_no) throws Exception;

	// 원본 글 삭제
	public int FreeBoardDelete(int freeboard_ref) throws Exception;

	// 답변글 작성
	public int FreeBoardWriteReply(FreeBoardModel freeBoardModel) throws Exception;

	// 게시글 수정
	public int FreeBoardUpdate(FreeBoardModel freeBoardModel) throws Exception;

	// admin 답변 글 삭제
	public int FreeRefAdminDelete(int freeboard_no) throws Exception;

	// admin 원본 글 삭제
	public int FreeBoardAdminDelete(int freeboard_ref) throws Exception;

}
