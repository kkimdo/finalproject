package movie.admin.giftshop;

import java.util.List;

public interface GiftShopProductService {
	
	//상품 목록
	public List<GiftShopProductModel> GiftShopListProduct(int start, int end, String searchOption, String keyword);
	
	//상품 레코드 개수
	public int count(String searchOption, String keyword);
	
	//상품 번호
	public int GiftProductGetSEQ();
	
	//상품 등록
	public int GiftShopProductWrite(GiftShopProductModel giftShopProductModel);

	//상품 상세 보기
	
}
