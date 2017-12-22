package movie.admin.giftshop;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class GiftShopProductDAOImpl implements GiftShopProductDAO {

	@Inject
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<GiftShopProductModel> GiftShopListProduct(int start, int end, String searchOption, String keyword) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);

		return sqlSessionTemplate.selectList("giftshop.gspListProduct", map);
	}

	@Override
	public int count(String searchOption, String keyword) {

		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);

		return sqlSessionTemplate.selectOne("giftshop.count", map);
	}

	@Override
	public int GiftProductGetSEQ() {
		return sqlSessionTemplate.selectOne("giftshop.gspGetSEQ");
	}

	@Override
	public int GiftShopProductWrite(GiftShopProductModel giftShopProductModel) {
		return sqlSessionTemplate.insert("giftshop.gspWrite", giftShopProductModel);
	}

}
