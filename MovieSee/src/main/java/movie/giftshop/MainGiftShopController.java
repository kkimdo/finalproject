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
import movie.movie.MovieBannerModel;
import movie.movie.MovieService;

@Controller
@RequestMapping("/gift")
public class MainGiftShopController {

	Logger log = Logger.getLogger(this.getClass());

	@Inject
	GiftShopProductService giftShopProductService;

	@Inject
	MainGiftShopPurchaseService mainGiftShopPurchaseService;
	
	@Inject
	private MovieService movieService;

	@RequestMapping(value = "/giftShopList.see")
	public ModelAndView GiftShopListProduct(@RequestParam(defaultValue = "giftshop_product_name") String searchOption,
			@RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "1") int curPage)
			throws Exception {

		int count = giftShopProductService.count(searchOption, keyword);

		commonPaging c_Paging = new commonPaging(count, curPage);
		int start = c_Paging.getPageBegin();
		int end = c_Paging.getPageEnd();

		List<GiftShopProductModel> giftShopList_1 = giftShopProductService.GiftShopList_1(start, end, searchOption,
				keyword);
		List<GiftShopProductModel> giftShopList_2 = giftShopProductService.GiftShopList_2(start, end, searchOption,
				keyword);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("giftShopList_1", giftShopList_1);
		map.put("giftShopList_2", giftShopList_2);
		map.put("count", count);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("c_Paging", c_Paging);

		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map);
		MovieBannerModel bannerselect = movieService.banner_select();
		mav.addObject("bannerselect", bannerselect);
		mav.setViewName("giftShopList");

		return mav;
	}

	@RequestMapping(value = "/giftShopView.see", method = RequestMethod.GET)
	public ModelAndView GiftShopViewProduct(@RequestParam int giftshop_product_no) throws Exception {

		ModelAndView mav = new ModelAndView();

		mav.addObject("giftShopProductModel", giftShopProductService.GiftShopViewProduct(giftshop_product_no));
		MovieBannerModel bannerselect = movieService.banner_select();
		mav.addObject("bannerselect", bannerselect);
		mav.setViewName("giftShopView");

		return mav;
	}

	// 구매
	@RequestMapping("/purchaseIt.see")
	public ModelAndView PurchaseIt(
			@ModelAttribute("mainGiftShopPurchaseModel") MainGiftShopPurchaseModel mainGiftShopPurchaseModel,
			HttpServletRequest request, HttpSession session) {

		ModelAndView mav = new ModelAndView();

		String userId = (String) session.getAttribute("session_member_id");
		int sum = Integer.parseInt(request.getParameter("sum")); // 구매한 상품 수량 * 상품 가격 = 합계
		int count = Integer.parseInt(request.getParameter("amount")); // 구매한 상품 수량
		int giftshop_product_no = Integer.parseInt(request.getParameter("giftshop_product_no"));
		//System.out.println("상품 번호 " + giftshop_product_no);

		// 구매할 상품 총 개수
		int totalNum = mainGiftShopPurchaseService.GiftShopProductCount(giftshop_product_no);
		//System.out.println("상품 총 개수 " + totalNum);

		// 구매하는 상품이 총 상품수보다 작거나 같으면
		if (totalNum >= count) {

			mainGiftShopPurchaseModel.setGiftpurchase_member_id(userId);
			mainGiftShopPurchaseModel.setGiftpurchase_count(count);
			mainGiftShopPurchaseModel.setGiftpurchase_price(sum);

			mainGiftShopPurchaseService.GiftShopPurchaseIt(mainGiftShopPurchaseModel); // 구매
			mainGiftShopPurchaseService.GiftShopProductSub(count, giftshop_product_no); // 구매한

			// 구매하는 상품이 총 상품 수보다 크면
		} else if (totalNum < count) {

			mav.setViewName("/giftshop/GiftShopPurchaseCheck");
			return mav;

			// 상품 수 없으면
		} else if (totalNum == 0 && totalNum < 0) {

			mav.setViewName("/giftshop/GiftShopPurchaseNull");
			return mav;
		}

		MovieBannerModel bannerselect = movieService.banner_select();
		mav.addObject("bannerselect", bannerselect);
		mav.setViewName("redirect:/gift/purchaseMemberList.see");
		return mav;
	}
	
	//구매 상품 상세보기
	@RequestMapping(value = "/purchaseMemberView.see", method = RequestMethod.GET)
	public ModelAndView PurchaseView(@RequestParam int giftpurchase_no) throws Exception {

		ModelAndView mav = new ModelAndView();

		mav.addObject("mainGiftShopPurchaseModel", mainGiftShopPurchaseService.GiftShopPerchaseView(giftpurchase_no));
		MovieBannerModel bannerselect = movieService.banner_select();
		mav.addObject("bannerselect", bannerselect);
		mav.setViewName("giftShopPurchaseView");

		return mav;
	}

	@RequestMapping("/purchaseMemberList.see")
	public ModelAndView PurchaseList(@RequestParam(defaultValue = "giftpurchase_product_name") String searchOption,
			@RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "1") int curPage, HttpSession session) throws Exception {

		String userId = (String) session.getAttribute("session_member_id"); 

		ModelAndView mav = new ModelAndView();
		
		// 로그인이 안되 있을 경우, 로그인 창으로 이동
		if (userId == null) {
			mav.setViewName("/giftshop/GiftShopPurchaseLoginConfirm");
			return mav;
		}

		int mgsMemberCount = mainGiftShopPurchaseService.GiftShopPurchaseMemberCount(userId, searchOption, keyword);

		commonPaging c_Paging = new commonPaging(mgsMemberCount, curPage);
		int start = c_Paging.getPageBegin();
		int end = c_Paging.getPageEnd();

		List<MainGiftShopPurchaseModel> purchaseList = mainGiftShopPurchaseService.GiftShopPurchaseList(userId, start, end, searchOption, keyword);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("purchaseList", purchaseList);
		map.put("mgsMemberCount", mgsMemberCount);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("c_Paging", c_Paging);
		
		MovieBannerModel bannerselect = movieService.banner_select();
		mav.addObject("bannerselect", bannerselect);
		mav.addObject("map", map);
		mav.setViewName("giftShopPurchaseList");

		return mav;
	}
	
	//구매 취소
	@RequestMapping(value = "/purchaseCancle.see")
	public String PurchaseCancle(HttpServletRequest request) {
		
		int count = Integer.parseInt(request.getParameter("giftpurchase_count"));
		//System.out.println("취소하는 상품 개수 : " + count );
		
		int giftpurchase_no = Integer.parseInt(request.getParameter("giftpurchase_no"));
		//System.out.println("취소하는 구매 번호 : " + giftpurchase_no);
		
		int giftshop_product_no = Integer.parseInt(request.getParameter("giftshop_product_no"));
		//System.out.println("취소하는 상품 번호 : " + giftshop_product_no);
		
		mainGiftShopPurchaseService.GiftShopPurchaseCancle(giftpurchase_no);
		mainGiftShopPurchaseService.GiftShopProductPlus(count, giftshop_product_no);

		return "redirect:/gift/purchaseMemberList.see";
	}
	
	//구매 취소 목록
	@RequestMapping("/purchaseMemberCancleList.see")
	public ModelAndView PurchaseCancleList(@RequestParam(defaultValue = "giftpurchase_product_name") String searchOption,
			@RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "1") int curPage, HttpSession session) throws Exception {

		String userId = (String) session.getAttribute("session_member_id"); 

		ModelAndView mav = new ModelAndView();
		
		// 로그인이 안되 있을 경우, 로그인 창으로 이동
		if (userId == null) {
			mav.setViewName("/giftshop/GiftShopPurchaseLoginConfirm");
			return mav;
		}

		// 취소 개수
		int mgsMemberCancleCount = mainGiftShopPurchaseService.GiftShopPurchaseMemberCancleCount(userId, searchOption, keyword);

		commonPaging c_Paging = new commonPaging(mgsMemberCancleCount, curPage);
		int start = c_Paging.getPageBegin();
		int end = c_Paging.getPageEnd();

		List<MainGiftShopPurchaseModel> purchaseCancleList = mainGiftShopPurchaseService.GiftShopPurchaseCancleList(userId, start, end, searchOption, keyword);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("purchaseCancleList", purchaseCancleList);
		map.put("mgsMemberCancleCount", mgsMemberCancleCount);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("c_Paging", c_Paging);

		MovieBannerModel bannerselect = movieService.banner_select();
		mav.addObject("bannerselect", bannerselect);
		mav.addObject("map", map);
		mav.setViewName("giftShopPurchaseCancleList");

		return mav;
	}
	
}
