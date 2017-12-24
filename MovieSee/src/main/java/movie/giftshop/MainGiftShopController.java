package movie.giftshop;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import movie.admin.giftshop.GiftShopProductModel;
import movie.admin.giftshop.GiftShopProductService;
import movie.common.paging.commonPaging;

@Controller
@RequestMapping("/gift")
public class MainGiftShopController {
	
	Logger log = Logger.getLogger(this.getClass());

	@Inject
	GiftShopProductService giftShopProductService;
	
	@Inject
	MainGiftShopPurchaseService mainGiftShopPurchaseService;

	
	@RequestMapping(value = "/giftShopList.see")
	public ModelAndView GiftShopListProduct(@RequestParam(defaultValue = "giftshop_product_name") String searchOption,
			@RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "1") int curPage)
			throws Exception {

		int count = giftShopProductService.count(searchOption, keyword);

		commonPaging c_Paging = new commonPaging(count, curPage);
		int start = c_Paging.getPageBegin();
		int end = c_Paging.getPageEnd();

		List<GiftShopProductModel> giftShopList_1 = giftShopProductService.GiftShopList_1(start, end, searchOption, keyword);
		List<GiftShopProductModel> giftShopList_2 = giftShopProductService.GiftShopList_2(start, end, searchOption, keyword);

		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("giftShopList_1", giftShopList_1);
		map.put("giftShopList_2", giftShopList_2);
		map.put("count", count);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("c_Paging", c_Paging);

		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map); 
		mav.setViewName("giftShopList"); 

		return mav;
	}
	
	@RequestMapping(value = "/giftShopView.see", method = RequestMethod.GET)
	public ModelAndView GiftShopViewProduct(@RequestParam int giftshop_product_no) throws Exception {

		ModelAndView mav = new ModelAndView();

		mav.addObject("giftShopProductModel", giftShopProductService.GiftShopViewProduct(giftshop_product_no));
		mav.setViewName("giftShopView");

		return mav;
	}
	
	//구매
	@RequestMapping("/purchaseIt.see")
    public ModelAndView PurchaseIt(@ModelAttribute("mainGiftShopPurchaseModel") MainGiftShopPurchaseModel mainGiftShopPurchaseModel, 
    		HttpServletRequest request, HttpSession session){
		
		String userId = (String) session.getAttribute("session_member_id");
		String sum = request.getParameter("sum");
		int count = Integer.parseInt(request.getParameter("amount"));
		
		mainGiftShopPurchaseModel.setGiftpurchase_member_id(userId);
		mainGiftShopPurchaseModel.setGiftpurchase_count(count);
		mainGiftShopPurchaseModel.setGiftpurchase_price(sum);

        mainGiftShopPurchaseService.GiftShopPurchaseIt(mainGiftShopPurchaseModel);
        
        ModelAndView mav = new ModelAndView();
        mav.setViewName("redirect:/gift/purchaseList.see");
        return mav;
    }
	
	@RequestMapping("/purchaseList.see")
    public ModelAndView list(HttpSession session, ModelAndView mav){
        
		String userId = (String) session.getAttribute("session_member_id"); // session에 저장된 userId
        
        List<MainGiftShopPurchaseModel> purchaseList = mainGiftShopPurchaseService.GiftShopPurchaseList(userId); // 구매 정보 

        mav.addObject("purchaseList", purchaseList);
		mav.setViewName("giftShopPurchaseList");
        
        return mav;
    }
	
	@RequestMapping("/purchaseIt_test.see")
	public String purchaseIt_test(){
		return "giftShopList";
	}
	
}
