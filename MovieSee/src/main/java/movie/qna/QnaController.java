package movie.qna;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller //현재 클래스를 컨트롤러 빈(bean)으로 등록
@RequestMapping("/qna")
public class QnaController {

	Logger log = Logger.getLogger(this.getClass());
	
	// 의존 관계 주입 => QnaService 생성
	// IoC 의존관계 역전
	@Inject
	private QnaService qnaService;
	
	// 게시글 작성 화면
	// RequestMapping("qna/qnaWrite.see")
	// value="", method="전송방식"
	@RequestMapping(value="/qnaWrite.see", method=RequestMethod.GET)
	public String QnaWriteForm(){
		return "admin/qna/AdminQnaWrite"; ///AdminQnaWrite.jsp 로 이동
	}
}
	/*// 게시글 작성 처리
	@RequestMapping(value="/qnaWrite.see", method=RequestMethod.POST)
	public ModelAndView QnaeWrite(@ModelAttribute("qnaModel") QnaModel noticeModel) throws Exception {
		ModelAndView mav = new ModelAndView();
	
		qnaService.QnaWrite(qnaModel);
			
		mav.addObject("qnaModel", qnaModel); // 데이터를 저장
		mav.setViewName("redirect:/qna/qnaList.see"); // AdminNoticeList.jsp 로 redirect
		
		return mav;
	}*/