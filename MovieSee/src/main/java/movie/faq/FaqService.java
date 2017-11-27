package movie.faq;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;



@Service
public class FaqService implements FaqDAO {

	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

	// 글 목록
	@Override
	public List<FaqModel> FaqList() {
		return sqlSessionTemplate.selectList("faq.faqList");
	}

	// 글 작성
	@Override
	public int FaqWrite(FaqModel faqModel) {
		return sqlSessionTemplate.insert("faq.faqWrite", faqModel);
	}

	// 글 상세보기
	@Override
	public FaqModel FaqView(int faq_no) {
		return sqlSessionTemplate.selectOne("faq.faqView", faq_no);
	}

	// 글 조회수 증가
	@Override
	public int FaqHitUpdate(int faq_no) {
		return sqlSessionTemplate.update("faq.faqHitUpdate", faq_no);
	}
}
