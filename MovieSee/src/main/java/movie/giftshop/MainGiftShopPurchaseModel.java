package movie.giftshop;

import java.util.Date;

public class MainGiftShopPurchaseModel {

	private int giftpurchase_no; // 구매 번호
	private int giftshop_product_no;// 상품 번호
	private String giftpurchase_member_id; // 구매한 사용자 ID
	private String giftpurchase_product_name; // 구매한 상품 이름
	private int giftpurchase_count; // 구매한 수량
	private int giftpurchase_price; // 구매한 총 가격
	private Date giftpurchase_date; // 구매한 날짜
	private String giftpurchase_delshow; // 구매 취소 유무를 y, n 표시
	private String giftpurchase_product_image; // 구매한 상품 이미지

	public int getGiftpurchase_no() {
		return giftpurchase_no;
	}

	public void setGiftpurchase_no(int giftpurchase_no) {
		this.giftpurchase_no = giftpurchase_no;
	}

	public int getGiftshop_product_no() {
		return giftshop_product_no;
	}

	public void setGiftshop_product_no(int giftshop_product_no) {
		this.giftshop_product_no = giftshop_product_no;
	}

	public String getGiftpurchase_member_id() {
		return giftpurchase_member_id;
	}

	public void setGiftpurchase_member_id(String giftpurchase_member_id) {
		this.giftpurchase_member_id = giftpurchase_member_id;
	}

	public String getGiftpurchase_product_name() {
		return giftpurchase_product_name;
	}

	public void setGiftpurchase_product_name(String giftpurchase_product_name) {
		this.giftpurchase_product_name = giftpurchase_product_name;
	}

	public int getGiftpurchase_count() {
		return giftpurchase_count;
	}

	public void setGiftpurchase_count(int giftpurchase_count) {
		this.giftpurchase_count = giftpurchase_count;
	}

	public int getGiftpurchase_price() {
		return giftpurchase_price;
	}

	public void setGiftpurchase_price(int giftpurchase_price) {
		this.giftpurchase_price = giftpurchase_price;
	}

	public Date getGiftpurchase_date() {
		return giftpurchase_date;
	}
	
	public void setGiftpurchase_date(Date giftpurchase_date) {
		this.giftpurchase_date = giftpurchase_date;
	}
	
	public String getGiftpurchase_delshow() {
		return giftpurchase_delshow;
	}
	
	public void setGiftpurchase_delshow(String giftpurchase_delshow) {
		this.giftpurchase_delshow = giftpurchase_delshow;
	}
	
	public String getGiftpurchase_product_image() {
		return giftpurchase_product_image;
	}
	
	public void setGiftpurchase_product_image(String giftpurchase_product_image) {
		this.giftpurchase_product_image = giftpurchase_product_image;
	}
}
