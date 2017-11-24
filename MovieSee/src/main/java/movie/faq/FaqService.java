package movie.faq;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service
public class FaqService implements FaqDAO {

	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int faqWrite(FaqModel faqModel) {
		return sqlSessionTemplate.insert("faq.faqWrite", faqModel);
	}
	
}
