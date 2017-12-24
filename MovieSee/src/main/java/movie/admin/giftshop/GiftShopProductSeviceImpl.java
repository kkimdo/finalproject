package movie.admin.giftshop;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class GiftShopProductSeviceImpl implements GiftShopProductService {
	
	@Inject
	GiftShopProductDAO giftShopProductDAO;
	
	@Override
	public List<GiftShopProductModel> GiftShopListProduct(int start, int end, String searchOption, String keyword) {
		return giftShopProductDAO.GiftShopListProduct(start, end, searchOption, keyword);
	}
	
	@Override
	public List<GiftShopProductModel> GiftShopList_1(int start, int end, String searchOption, String keyword) {
		return giftShopProductDAO.GiftShopList_1(start, end, searchOption, keyword);
	}
	
	@Override
	public List<GiftShopProductModel> GiftShopList_2(int start, int end, String searchOption, String keyword) {
		return giftShopProductDAO.GiftShopList_2(start, end, searchOption, keyword);
	}
	
	@Override
	public int count(String searchOption, String keyword) {
		return giftShopProductDAO.count(searchOption, keyword);
	}
	
	@Override
	public int GiftProductGetSEQ() {
		return giftShopProductDAO.GiftProductGetSEQ();
	}
	
	@Override
	public int GiftShopProductWrite(GiftShopProductModel giftShopProductModel) {
		
		String desc1 = giftShopProductModel.getGiftshop_product_desc1().replaceAll("\r\n", "<br/>"); //줄바꿈 문자 처리
		String desc2 = giftShopProductModel.getGiftshop_product_desc2().replaceAll("\r\n", "<br/>"); //줄바꿈 문자 처리
		String desc3 = giftShopProductModel.getGiftshop_product_desc3().replaceAll("\r\n", "<br/>"); //줄바꿈 문자 처리
		
		giftShopProductModel.setGiftshop_product_desc1(desc1);
		giftShopProductModel.setGiftshop_product_desc2(desc2);
		giftShopProductModel.setGiftshop_product_desc3(desc3);
		
		return giftShopProductDAO.GiftShopProductWrite(giftShopProductModel);
		
	}
	
	@Override
	public GiftShopProductModel GiftShopViewProduct(int giftshop_product_no) {
		return giftShopProductDAO.GiftShopViewProduct(giftshop_product_no);
	}
	
	@Override
	public void GiftShopUpdateProduct(GiftShopProductModel giftShopProductModel) {
		giftShopProductDAO.GiftShopUpdateProduct(giftShopProductModel);
	}
	
	@Override
	public void GiftShopDeleteProduct(int giftshop_product_no) {
		giftShopProductDAO.GiftShopDeleteProduct(giftshop_product_no);
	}
	
}
