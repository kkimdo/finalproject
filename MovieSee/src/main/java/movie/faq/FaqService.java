package movie.faq;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;


@Service
public  class FaqService implements FaqDAO {

	@Resource
	private SqlSessionTemplate sqlSessionTemplate; 
	
	

	@Override
	public List<FaqModel> FaqList() { //글 목록
		return sqlSessionTemplate.selectList("faq.faqList");
	}


	
	@Override
	public int FaqWrite(FaqModel faqModel) { //글 작성
		return sqlSessionTemplate.insert("faq.faqWrite", faqModel);
	}
	
}
