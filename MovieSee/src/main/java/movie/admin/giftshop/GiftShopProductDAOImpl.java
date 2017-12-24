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
	public List<GiftShopProductModel> GiftShopList_1(int start, int end, String searchOption, String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);

		return sqlSessionTemplate.selectList("giftshop.gspList_1", map);
	}
	
	@Override
	public List<GiftShopProductModel> GiftShopList_2(int start, int end, String searchOption, String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);

		return sqlSessionTemplate.selectList("giftshop.gspList_2", map);
	
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
	
	@Override
	public GiftShopProductModel GiftShopViewProduct(int giftshop_product_no) {
		return sqlSessionTemplate.selectOne("giftshop.gspView", giftshop_product_no);
	}
	
	@Override
	public void GiftShopUpdateProduct(GiftShopProductModel giftShopProductModel) {
		sqlSessionTemplate.update("giftshop.gspUpdate", giftShopProductModel);
	}
	
	@Override
	public void GiftShopDeleteProduct(int giftshop_product_no) {
		sqlSessionTemplate.delete("giftshop.gspDelete", giftshop_product_no);
	}
	

}
