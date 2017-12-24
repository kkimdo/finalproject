package movie.giftshop;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MainGiftShopPurchaseDAOImpl implements MainGiftShopPurchaseDAO{

	@Inject
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public void GiftShopPurchaseIt(MainGiftShopPurchaseModel mainGiftShopPurchaseModel) {
		sqlSessionTemplate.insert("giftshop.mgsIt", mainGiftShopPurchaseModel);
		
	}
	
	@Override
	public List<MainGiftShopPurchaseModel> GiftShopPurchaseList(String userId) {
		return sqlSessionTemplate.selectList("giftshop.mgsList", userId);
	}
	
}
