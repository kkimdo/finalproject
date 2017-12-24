package movie.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import movie.admin.giftshop.GiftShopProductModel;

public class GiftShopProductValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		return GiftShopProductModel.class.isAssignableFrom(clazz);
	}
	
	@Override
	public void validate(Object target, Errors errors) {
		
		GiftShopProductModel giftShopProductModel = (GiftShopProductModel) target;
		
		if(giftShopProductModel.getGiftshop_product_name() == null || giftShopProductModel.getGiftshop_product_name().trim().isEmpty()) {
			errors.rejectValue("giftshop_product_name", "giftshop_product_name");
		}
		if(giftShopProductModel.getGiftshop_product_restrictions() == null || giftShopProductModel.getGiftshop_product_restrictions().trim().isEmpty()) {
			errors.rejectValue("giftshop_product_restrictions", "giftshop_product_restrictions");
		}
		if(giftShopProductModel.getGiftshop_product_periodofuse() == null || giftShopProductModel.getGiftshop_product_periodofuse().trim().isEmpty()) {
			errors.rejectValue("giftshop_product_periodofuse", "giftshop_product_periodofuse");
		}
		if(giftShopProductModel.getGiftshop_product_desc1() == null || giftShopProductModel.getGiftshop_product_desc1().trim().isEmpty()) {
			errors.rejectValue("giftshop_product_desc1", "giftshop_product_desc1");
		}
		if(giftShopProductModel.getGiftshop_product_desc2() == null || giftShopProductModel.getGiftshop_product_desc2().trim().isEmpty()) {
			errors.rejectValue("giftshop_product_desc2", "giftshop_product_desc2");
		}
		if(giftShopProductModel.getGiftshop_product_desc3() == null || giftShopProductModel.getGiftshop_product_desc3().trim().isEmpty()) {
			errors.rejectValue("giftshop_product_desc3", "giftshop_product_desc3");
		}
		if(giftShopProductModel.getGiftshop_product_components() == null || giftShopProductModel.getGiftshop_product_components().trim().isEmpty()) {
			errors.rejectValue("giftshop_product_components", "giftshop_product_components");
		}
	}
}
