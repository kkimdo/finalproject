package movie.giftshop;

import java.util.List;

public interface MainGiftShopPurchaseDAO {

	// 상품 구매
	public void GiftShopPurchaseIt(MainGiftShopPurchaseModel mainGiftShopPurchaseModel);

	// 구매 상품 목록
	public List<MainGiftShopPurchaseModel> GiftShopPurchaseList(String userId);

}
