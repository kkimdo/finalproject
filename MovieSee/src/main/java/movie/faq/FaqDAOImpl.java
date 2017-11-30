package movie.faq;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;


@Repository // 현재 클래스를 DAO bean으로 등록
public class FaqDAOImpl implements FaqDAO {

	@Inject
	private SqlSessionTemplate sqlSessionTemplate;

	// 데이터를 삽입하는 메소드(게시글 작성)
	@Override
	public int FaqWrite(FaqModel faqModel) {
		return sqlSessionTemplate.insert("faq.faqWrite", faqModel);
	}

	// 모든 데이터를 가져와서 List<FaqModel>를 리턴하는 메소드(게시글 전체 목록)
	@Override
	public List<FaqModel> FaqList() {
		return sqlSessionTemplate.selectList("faq.faqList");
	}

	// faq_no을 이용하여 데이터를 검색하여 리턴하는 메소드(게시글 상세보기)
	@Override
	public FaqModel FaqView(int faq_no) {
		return sqlSessionTemplate.selectOne("faq.faqView", faq_no);
	}

	// faq_no을 이용하여 데이터의 조회수를 갱신하는 메소드(게시글 조회수 증가)
	@Override
	public void FaqHitUpdate(int faq_no) {
		sqlSessionTemplate.update("faq.faqHitUpdate", faq_no);
	}

	// 데이터를 갱신하는 메소드(게시글 수정)
	@Override
	public int FaqUpdate(FaqModel faqModel) {
		return sqlSessionTemplate.update("faq.faqUpdate", faqModel);
	}

	// 데이터를 삭제하는 메소드(게시글 삭제)
	@Override
	public void FaqDelete(int faq_no) {
		sqlSessionTemplate.delete("faq.faqDelete", faq_no);

	}

	// 검색
	@Override
	public List<FaqModel> FaqSearchList(String isSearch) {
		return sqlSessionTemplate.selectList("faq.searchAll", "%" + isSearch + "%");
	}

}
