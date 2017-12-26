package movie.giftshop;

import java.util.List;

public interface MainGiftShopPurchaseDAO {

	// 상품 구매
	public void GiftShopPurchaseIt(MainGiftShopPurchaseModel mainGiftShopPurchaseModel);

	// 회원이 구매한 게시글 목록
	public List<MainGiftShopPurchaseModel> GiftShopPurchaseList(String userId, int start, int end, String searchOption,
			String keyword) throws Exception;

	// 회원이 구매한 게시글 레코드 개수
	public int GiftShopPurchaseMemberCount(String userId, String searchOption, String keyword) throws Exception;

	// 회원이 구매한 상품 개수만큼 상품 테이블의 개수에서 빼기
	public void GiftShopProductSub(int count, int giftshop_product_no);

	// 회원이 구매할 상품 테이블의 상품 개수
	public int GiftShopProductCount(int giftshop_product_no);

	// 회원이 구매한 상품 취소
	public int GiftShopPurchaseCancle(int giftpurchase_no);

	// 회원이 구매한 상품 취소 시, 상품 테이블의 개수에 더하기
	public void GiftShopProductPlus(int count, int giftshop_product_no);

	// 회원이 구매한 상품 상세보기
	public MainGiftShopPurchaseModel GiftShopPerchaseView(int giftpurchase_no);

	// 회원이 취소한 목록 = 'n'
	public List<MainGiftShopPurchaseModel> GiftShopPurchaseCancleList(String userId, int start, int end,
			String searchOption, String keyword) throws Exception;

	// 회원이 구매한 게시글 레코드 개수
	public int GiftShopPurchaseMemberCancleCount(String userId, String searchOption, String keyword) throws Exception;
}
