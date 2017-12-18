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

}
