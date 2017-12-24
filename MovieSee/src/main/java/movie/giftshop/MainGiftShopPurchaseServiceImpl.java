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
	public List<MainGiftShopPurchaseModel> GiftShopPurchaseList(String userId) {
		return mainGiftShopPurchaseDAO.GiftShopPurchaseList(userId);
	}
	
}
