package movie.giftshop;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class MainGiftShopPurchaseServiceImpl implements MainGiftShopPurchaseService {

	@Inject
	MainGiftShopPurchaseDAO mainGiftShopPurchaseDAO;

	@Override
	public void GiftShopPurchaseIt(MainGiftShopPurchaseModel mainGiftShopPurchaseModel) {
		mainGiftShopPurchaseDAO.GiftShopPurchaseIt(mainGiftShopPurchaseModel);
	}

	@Override
	public List<MainGiftShopPurchaseModel> GiftShopPurchaseList(String userId, int start, int end, String searchOption,
			String keyword) throws Exception {
		return mainGiftShopPurchaseDAO.GiftShopPurchaseList(userId, start, end, searchOption, keyword);
	}

	@Override
	public int GiftShopPurchaseMemberCount(String userId, String searchOption, String keyword) throws Exception {
		return mainGiftShopPurchaseDAO.GiftShopPurchaseMemberCount(userId, searchOption, keyword);
	}

	@Override
	public void GiftShopProductSub(int count, int giftshop_product_no) {
		mainGiftShopPurchaseDAO.GiftShopProductSub(count, giftshop_product_no);

	}

	@Override
	public int GiftShopProductCount(int giftshop_product_no) {
		return mainGiftShopPurchaseDAO.GiftShopProductCount(giftshop_product_no);

	}

	@Override
	public int GiftShopPurchaseCancle(int giftpurchase_no) {
		return mainGiftShopPurchaseDAO.GiftShopPurchaseCancle(giftpurchase_no);
	}
	
	@Override
	public void GiftShopProductPlus(int count, int giftshop_product_no) {
		mainGiftShopPurchaseDAO.GiftShopProductPlus(count, giftshop_product_no);
	}
	
	@Override
	public MainGiftShopPurchaseModel GiftShopPerchaseView(int giftpurchase_no) {
		return mainGiftShopPurchaseDAO.GiftShopPerchaseView(giftpurchase_no);
	}
	
	@Override
	public List<MainGiftShopPurchaseModel> GiftShopPurchaseCancleList(String userId, int start, int end,
			String searchOption, String keyword) throws Exception {
		return mainGiftShopPurchaseDAO.GiftShopPurchaseCancleList(userId, start, end, searchOption, keyword);
	}
	
	@Override
	public int GiftShopPurchaseMemberCancleCount(String userId, String searchOption, String keyword) throws Exception {
		return mainGiftShopPurchaseDAO.GiftShopPurchaseMemberCancleCount(userId, searchOption, keyword);
	}
}
