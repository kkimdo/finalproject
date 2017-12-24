package movie.admin.giftshop;

import java.util.Date;

public class GiftShopProductModel {
	
	private int giftshop_product_no; //상품 번호
	private String giftshop_product_name; //상품 이름
	private int giftshop_product_price; //상품 판매 가격
	private String giftshop_product_file; //상품 이미지
	private String giftshop_product_restrictions;  //상품 구매 제한
	private String giftshop_product_periodofuse; //상품 사용 기간
	private String giftshop_product_desc1; //상품 사용 방법
	private String giftshop_product_desc2; //상품 취소/환불 내용
	private String giftshop_product_desc3; //상품 기타 내용
	private Date giftshop_product_date; //상품 등록 일
	private String giftshop_product_category; //영화 관람권 아니면 매점 상품권
	private String giftshop_product_components; //상품 구성품
	private int giftshop_product_count; //상품 수량
	
	public int getGiftshop_product_no() {
		return giftshop_product_no;
	}
	public void setGiftshop_product_no(int giftshop_product_no) {
		this.giftshop_product_no = giftshop_product_no;
	}
	public String getGiftshop_product_name() {
		return giftshop_product_name;
	}
	public void setGiftshop_product_name(String giftshop_product_name) {
		this.giftshop_product_name = giftshop_product_name;
	}
	public int getGiftshop_product_price() {
		return giftshop_product_price;
	}
	public void setGiftshop_product_price(int giftshop_product_price) {
		this.giftshop_product_price = giftshop_product_price;
	}
	public String getGiftshop_product_file() {
		return giftshop_product_file;
	}
	public void setGiftshop_product_file(String giftshop_product_file) {
		this.giftshop_product_file = giftshop_product_file;
	}
	public String getGiftshop_product_restrictions() {
		return giftshop_product_restrictions;
	}
	public void setGiftshop_product_restrictions(String giftshop_product_restrictions) {
		this.giftshop_product_restrictions = giftshop_product_restrictions;
	}
	public String getGiftshop_product_periodofuse() {
		return giftshop_product_periodofuse;
	}
	public void setGiftshop_product_periodofuse(String giftshop_product_periodofuse) {
		this.giftshop_product_periodofuse = giftshop_product_periodofuse;
	}
	public String getGiftshop_product_desc1() {
		return giftshop_product_desc1;
	}
	public void setGiftshop_product_desc1(String giftshop_product_desc1) {
		this.giftshop_product_desc1 = giftshop_product_desc1;
	}
	public String getGiftshop_product_desc2() {
		return giftshop_product_desc2;
	}
	public void setGiftshop_product_desc2(String giftshop_product_desc2) {
		this.giftshop_product_desc2 = giftshop_product_desc2;
	}
	public String getGiftshop_product_desc3() {
		return giftshop_product_desc3;
	}
	public void setGiftshop_product_desc3(String giftshop_product_desc3) {
		this.giftshop_product_desc3 = giftshop_product_desc3;
	}
	public Date getGiftshop_product_date() {
		return giftshop_product_date;
	}
	public void setGiftshop_product_date(Date giftshop_product_date) {
		this.giftshop_product_date = giftshop_product_date;
	}
	public String getGiftshop_product_category() {
		return giftshop_product_category;
	}
	public void setGiftshop_product_category(String giftshop_product_category) {
		this.giftshop_product_category = giftshop_product_category;
	}
	public String getGiftshop_product_components() {
		return giftshop_product_components;
	}
	public void setGiftshop_product_components(String giftshop_product_components) {
		this.giftshop_product_components = giftshop_product_components;
	}
	public int getGiftshop_product_count() {
		return giftshop_product_count;
	}
	public void setGiftshop_product_count(int giftshop_product_count) {
		this.giftshop_product_count = giftshop_product_count;
	}
	
}
