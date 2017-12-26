package movie.giftshop;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MainGiftShopPurchaseDAOImpl implements MainGiftShopPurchaseDAO {

	@Inject
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void GiftShopPurchaseIt(MainGiftShopPurchaseModel mainGiftShopPurchaseModel) {
		sqlSessionTemplate.insert("giftshop.mgsIt", mainGiftShopPurchaseModel);

	}

	@Override
	public List<MainGiftShopPurchaseModel> GiftShopPurchaseList(String userId, int start, int end, String searchOption,
			String keyword) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("giftpurchase_member_id", userId);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);

		map.put("start", start);
		map.put("end", end);

		return sqlSessionTemplate.selectList("giftshop.mgsMemberList", map);
	}

	@Override
	public int GiftShopPurchaseMemberCount(String userId, String searchOption, String keyword) throws Exception {

		Map<String, String> map = new HashMap<String, String>();

		map.put("giftpurchase_member_id", userId);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);

		return sqlSessionTemplate.selectOne("giftshop.mgsMemberCount", map);
	}

	@Override
	public void GiftShopProductSub(int count, int giftshop_product_no) {

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("count", count);
		map.put("giftshop_product_no", giftshop_product_no);

		sqlSessionTemplate.update("giftshop.mgsSub", map);
	}

	@Override
	public int GiftShopProductCount(int giftshop_product_no) {
		return sqlSessionTemplate.selectOne("giftshop.mgsProductCount", giftshop_product_no);
	}

	@Override
	public int GiftShopPurchaseCancle(int giftpurchase_no) {
		return sqlSessionTemplate.update("giftshop.mgsMemberDel", giftpurchase_no);
	}

	@Override
	public void GiftShopProductPlus(int count, int giftshop_product_no) {

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("count", count);
		map.put("giftshop_product_no", giftshop_product_no);

		sqlSessionTemplate.update("giftshop.mgsPlus", map);
	}

	@Override
	public MainGiftShopPurchaseModel GiftShopPerchaseView(int giftpurchase_no) {
		return sqlSessionTemplate.selectOne("giftshop.mgsView", giftpurchase_no);
	}

	@Override
	public List<MainGiftShopPurchaseModel> GiftShopPurchaseCancleList(String userId, int start, int end,
			String searchOption, String keyword) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("giftpurchase_member_id", userId);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);

		map.put("start", start);
		map.put("end", end);

		return sqlSessionTemplate.selectList("giftshop.mgsMemberCancleList", map);
	}

	@Override
	public int GiftShopPurchaseMemberCancleCount(String userId, String searchOption, String keyword) throws Exception {
		
		Map<String, String> map = new HashMap<String, String>();

		map.put("giftpurchase_member_id", userId);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);

		return sqlSessionTemplate.selectOne("giftshop.mgsMemberCancleCount", map);
	}

}
