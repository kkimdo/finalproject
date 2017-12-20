package movie.freeboard;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

@Service
public class FreeBoardServiceImpl implements FreeBoardService {

	@Inject
	FreeBoardDAO freeBoardDAO;

	@Override
	public int FreeBoardWrite(FreeBoardModel freeBoardModel) throws Exception {

		String content = freeBoardModel.getFreeboard_content().replaceAll("\r\n", "<br/>");
		freeBoardModel.setFreeboard_content(content);

		return freeBoardDAO.FreeBoardWrite(freeBoardModel);
	}

	@Override
	public int count(String searchOption, String keyword) throws Exception {
		return freeBoardDAO.count(searchOption, keyword);
	}

	@Override
	public List<FreeBoardModel> FreeBoardListAll(int start, int end, String searchOption, String keyword)
			throws Exception {
		return freeBoardDAO.FreeBoardListAll(start, end, searchOption, keyword);
	}

	@Override
	public FreeBoardModel FreeBoardView(int freeboard_no) throws Exception {
		return freeBoardDAO.FreeBoardView(freeboard_no);
	}

	@Override
	public void FreeBoardHitUpdate(int freeboard_no, HttpSession session) throws Exception {
		
		long update_time = 0; // 세션에 저장된 조회시간 검색

		// 최초로 조회할 경우는 세션에 저장된 값이 없기 때문에 if문은 진입 안함
		if (session.getAttribute("update_time_" + freeboard_no) != null) {

			// 세션에서 읽어오기
			update_time = (long) session.getAttribute("update_time_" + freeboard_no);
		}

		// 시스템의 현재시간을 저장
		long current_time = System.currentTimeMillis();
		// 일정시간이 경과 후 조회수 증가 처리 24*60*60*1000(24시간)
		// 현재시간 - 열람시간 > 일정시간(조회수 증가가 가능하도록 지정한 시간)
		if (current_time - update_time > 60 * 60 * 1000) {

			freeBoardDAO.FreeBoardHitUpdate(freeboard_no);

			session.setAttribute("update_time_" + freeboard_no, current_time);
		}

	}
	
	@Override
	public int FreeRefDelete(int freeboard_no) throws Exception {
		return freeBoardDAO.FreeRefDelete(freeboard_no);
	}
	
	@Override
	public int FreeBoardDelete(int freeboard_ref) throws Exception {
		return freeBoardDAO.FreeBoardDelete(freeboard_ref);
	}
	
	@Override
	public int FreeBoardWriteReply(FreeBoardModel freeBoardModel) throws Exception {
		
		String content = freeBoardModel.getFreeboard_content().replaceAll("\r\n", "<br/>");
		freeBoardModel.setFreeboard_content(content);
		
		return freeBoardDAO.FreeBoardWriteReply(freeBoardModel);
	}
	
	@Override
	public int FreeBoardUpdate(FreeBoardModel freeBoardModel) throws Exception {
		
		String content = freeBoardModel.getFreeboard_content().replaceAll( "\r\n", "<br/>");
		freeBoardModel.setFreeboard_content(content);
		
		return freeBoardDAO.FreeBoardUpdate(freeBoardModel);
	}
	
	@Override
	public int FreeRefAdminDelete(int freeboard_no) throws Exception {
		return freeBoardDAO.FreeRefAdminDelete(freeboard_no);
	}
	
	@Override
	public int FreeBoardAdminDelete(int freeboard_ref) throws Exception {
		return freeBoardDAO.FreeBoardAdminDelete(freeboard_ref);
	}
	

}
