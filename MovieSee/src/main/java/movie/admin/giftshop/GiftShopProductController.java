package movie.admin.giftshop;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import movie.common.paging.commonPaging;
import movie.validator.GiftShopProductValidator;

@Controller
@RequestMapping("/admin")
public class GiftShopProductController {
	
	Logger log = Logger.getLogger(this.getClass());

	@Inject
	GiftShopProductService giftShopProductService;

	private static final String uploadPath = "C:/github/finalproject/MovieSee/src/main/webapp/resources/uploads/giftshop/";

	@ModelAttribute
	public GiftShopProductModel formBack(){
		return new GiftShopProductModel();
	}
	
	@RequestMapping(value = "/giftShopWrite.see", method = RequestMethod.GET)
	public String GiftShopWriteForm() {
		return "adminGiftShopWrite";
	}

	@RequestMapping(value = "/giftShopWrite.see", method = RequestMethod.POST)
	public ModelAndView GiftShopWrite(@ModelAttribute("giftShopProductModel") GiftShopProductModel giftShopProductModel, MultipartHttpServletRequest multipartHttpServletRequest, BindingResult result) throws Exception {

		ModelAndView mav = new ModelAndView();
		
		int giftSeqNum = giftShopProductService.GiftProductGetSEQ();
		giftShopProductModel.setGiftshop_product_no(giftSeqNum);
		
		MultipartFile multipartFile = multipartHttpServletRequest.getFile("product_file");
		System.out.println("asdasd" + multipartFile);

		String file_full_name = "";
		// 첨부파일(상품사진)이 있으면
		if (!multipartFile.isEmpty()) {
			String file_name = multipartFile.getOriginalFilename();
			String file_ext = file_name.substring(file_name.lastIndexOf('.') + 1);

			if (file_ext != null && !file_ext.equals("")) {
				file_full_name = "giftImage_" + giftSeqNum + "." + file_ext;
				File file = new File(uploadPath + file_full_name);

				if (!file.exists()) {
					file.mkdirs();
				}

				try {
					multipartFile.transferTo(file);
				} catch (Exception e) {
					e.printStackTrace();
				}
				giftShopProductModel.setGiftshop_product_file(file_full_name);

			}

		} else {
			giftShopProductModel.setGiftshop_product_file(file_full_name);

		}
		
		new GiftShopProductValidator().validate(giftShopProductModel, result);
		if (result.hasErrors()) {
			mav.setViewName("adminGiftShopWrite");
			return mav;
		}

		giftShopProductService.GiftShopProductWrite(giftShopProductModel);

		mav.setViewName("redirect:/admin/giftShopList.see");
		return mav;
	}
	
	@RequestMapping(value = "/giftShopList.see")
	public ModelAndView GiftShopListProduct(@RequestParam(defaultValue = "giftshop_product_name") String searchOption,
			@RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "1") int curPage)
			throws Exception {

		int count = giftShopProductService.count(searchOption, keyword);

		commonPaging c_Paging = new commonPaging(count, curPage);
		int start = c_Paging.getPageBegin();
		int end = c_Paging.getPageEnd();

		List<GiftShopProductModel> giftShopListProduct = giftShopProductService.GiftShopListProduct(start, end, searchOption, keyword);

		// 데이터를 맵에 저장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("giftShopListProduct", giftShopListProduct);
		map.put("count", count);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("c_Paging", c_Paging);

		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map); 
		mav.setViewName("adminGiftShopListProduct"); 

		return mav;
	}
	
	
	
	
}
