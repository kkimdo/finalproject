<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript">
	function btnList(){
    	location.href="<%=cp%>/gift/giftShopList.see";
	}

	var sell_price; //가격
	var amount; //개수
	var maxAmount = 5; //최대 5개 까지 갯수
	function init() {
		sell_price = document.form.sell_price.value;
		amount = document.form.amount.value;
		document.form.sum.value = sell_price;
		change();
	}

	function add() {
		hm = document.form.amount;
		sum = document.form.sum;
		hm.value++;
		
		if (hm.value > maxAmount) {
			alert("5개까지만 가능");
			hm.value--;
		}
		sum.value = parseInt(hm.value) * sell_price;
	}

	function del() {
		hm = document.form.amount;
		sum = document.form.sum;
		if (hm.value > 1) {
			hm.value--;
			sum.value = parseInt(hm.value) * sell_price;
		}
	}

	function change() {
		hm = document.form.amount;
		sum = document.form.sum;

		if (hm.value < 0) {
			hm.value = 0;
		}
		sum.value = parseInt(hm.value) * sell_price;
	}
	
	function purchase(){
		
		
		
		document.insertForm.submit();
	}
</script>

<title>기프트 샵</title>
</head>
<body onload="init();">
	<div class="gnb">
		<ul>
			<li><a href="<%=cp%>/reserve/movieTicketing.see" title="예매">예매</a>
				<div class="depth"></div>
				<ul>
					<li></li>
					<li></li>
					<li></li>
				</ul></li>

			<li><a href="<%=cp%>/aMovieList.see" title="영화">영화</a>
				<div class="depth">

					<ul>
						<li class="active"><a href="<%=cp%>/aMovieList.see"
							title="박스오피스">박스오피스</a></li>
						<li class=""><a href="<%=cp%>/bMovieList.see" title="아르떼">아르떼</a></li>
						<li class=""><a href="<%=cp%>/cMovieList.see" title="G시네마">G시네마</a></li>
						<li class=""><a href="<%=cp%>/dMovieList.see"
							title="중국영화상영관/영화제">중국영화상영관/영화제</a></li>
						<li class=""><a href="<%=cp%>/eMovieList.see" title="오페라">오페라</a></li>
					</ul>
				</div></li>

			<li><a href="<%=cp%>/aMovieTheater.see" title="영화관">영화관</a>
				<div class="depth"></div>
			</li>

			<li><a href="<%=cp%>/event/eventListMain.see"
				title="이벤트">이벤트</a>
			</li>
			<li class="active"><a href="<%=cp%>/gift/giftShopList.see" title="기프트샵">기프트샵</a>
			</li>

		</ul>
	</div>
	<div id="container" class="subGnbNo">
		<!-- content -->
		<div id="content">
			<div class="detail_twrap">
				<div class="detail_inner">

					<div class="product_box">
						<!--  product_left -->
						<div class="product_left">
							<!--  slide_dBox -->
							<div class="slide_dBox">
								<a href="javascript:void(0)" class="btn_prev" id="btnp_prev"
									style="display: none;"><img
									src="/movie/images/btn/btn_d_prev.png" alt="이전"></a> <a
									href="javascript:void(0)" class="btn_next" id="btnp_next"
									style="display: none;"><img
									src="/movie/images/btn/btn_d_next.png" alt="다음"></a>
								<div class="control_navi">
									<ul class="indicator"></ul>
								</div>
								<div class="slide_in">
									<ul class="slide_List" id="ulMovieKeyValue">
										<li class="active" style="left: 0px;"><a
											href="javascript:void(0)"><img
												src="${giftShopProductModel.giftshop_product_file}"
												alt="Alt" border="0"></a></li>
									</ul>
								</div>
							</div>
							<!-- // slide_dBox -->

							<!-- detail_sec -->
							<div class="detail_sec">
								<!-- product_add -->
								<dl class="product_add">
									<dt id="packageItemsTitle">구성품</dt>
									<dd id="packageItems">${giftShopProductModel.giftshop_product_components}</dd>
									<dt class="grpDisplayDate" style="display: none;">구매가능기간</dt>
									<dd class="grpDisplayDate" style="display: none;"
										id="displayDate">${giftShopProductModel.giftshop_product_periodofuse}</dd>
									<dt class="grpCustomerBuyRestrictionsName">구매제한</dt>
									<dd class="grpCustomerBuyRestrictionsName"
										id="customerBuyRestrictionsName">${giftShopProductModel.giftshop_product_restrictions}</dd>
									<dt class="grpUseRestrictionsDayName">사용기간</dt>
									<dd class="grpUseRestrictionsDayName"
										id="useRestrictionsDayName">${giftShopProductModel.giftshop_product_periodofuse}</dd>
									<dt class="grpItemMemo" style="display: none;">설명</dt>
									<dd class="grpItemMemo" id="itemMemo" style="display: none;"></dd>
								</dl>
								<!--// product_add -->
								<div id="unUseCinema"></div>

								<h3 class="detail_tit">이용안내</h3>
								<table border="1" class="tbl_detail">
									<caption>이용안내표</caption>
									<colgroup>
										<col style="width: 161px">
										<col style="width: auto">
									</colgroup>
									<tbody id="useInfo">
										<tr>
											<th scope="row">사용방법</th>
											<td>
												<ul class="trafficMemo">
													<font face="나눔고딕">
														${giftShopProductModel.giftshop_product_desc1} </font>
												</ul>
											</td>
										</tr>
										<tr>
											<th scope="row">취소/환불</th>
											<td>
												<ul class="trafficMemo">
													<p>
														<font face="나눔고딕">
															${giftShopProductModel.giftshop_product_desc2} </font>
													</p>
												</ul>
											</td>
										</tr>
										<tr>
											<th scope="row">기타</th>
											<td>
												<ul class="trafficMemo">
													<font face="나눔고딕">
														<p>${giftShopProductModel.giftshop_product_desc3}</p>
													</font>
												</ul>
											</td>
										</tr>
									</tbody>
								</table>

							</div>
							<!-- // detail_sec -->
						</div>
						<!--//  product_left -->

						<!--  product_right -->
						<form name="form" method="post" action="<%=cp%>/gift/purchaseIt.see">
							<input type="hidden" name="giftpurchase_member_id" value="${session_member_id}" />
							<input type="hidden" name="giftshop_product_no" value="${giftShopProductModel.giftshop_product_no}" />
							<input type="hidden" name="giftpurchase_product_name" value="${giftShopProductModel.giftshop_product_name}" />
							<input type="hidden" name="giftpurchase_product_image" value="${giftShopProductModel.giftshop_product_file}" />
							<div class="product_right">
								<h2 class="datail_title itemName" id="itemName">${giftShopProductModel.giftshop_product_category}</h2>
								<dl class="p_box">
									<dt>판매가</dt>
									<dd>

										<em><span id="sellPrice"> <fmt:formatNumber
													value="${giftShopProductModel.giftshop_product_price}"
													pattern="###,###,###" />
										</span> 원</em>
									</dd>
								</dl>
								<div class="product_scroll">
									<div class="pro_case2">
										<strong class="pro_tit">수량</strong> <input type="hidden"
											name="sell_price"
											value="${giftShopProductModel.giftshop_product_price}" />
										<div class="amount">
											<input type="text" value="1" name="amount" onchange="change();"
												readonly /> <a href="javascript:add()"> <img
												src="/movie/images/btn/btn_s_plus02.gif" alt="수량증가">
											</a> <a href="javascript:del()"> <img
												src="/movie/images/btn/btn_s_minus02.gif" alt="수량감소">
											</a>
										</div>
									</div>
								</div>
								<div class="total">
									<strong>합계</strong> <em> <span id="totalSellPrice">
											<input type="text" name="sum" size="11" readonly />
									</span>
									</em>
								</div>
						</form>
							<div class="btn_box">
							<input type="submit" value="바로 구매" class="btnc_confirm fr"/>
							</div>
							<div class="btn_box">
							<a href="javascript:void(0)" class="btnc_list"
								onclick="btnList();">상품 리스트</a>
							</div>
						
					</div>
				</div>
			</div>
		</div>

		<div class="quick_ver2" id="quick" style="top: 186.25px;">
			<!-- [D] 접근성 관련 : 스크립트로 탭키이동시 foucs in, focus out  제어 필요 -->
			<ul>
				<li><a
					href="<%=cp%>/reserve/movieTicketing.see"
					title="빠른예매"><span><img
							src="http://caching.lottecinema.co.kr//Media/WebAdmin/a021109040b34b989bf01bacf6263973.jpg"
							alt="빠른예매"></span></a></li>
				<li><a
					href="<%=cp%>/mypage/reserveList.see"
					title="예매내역"><span><img
							src="http://caching.lottecinema.co.kr//Media/WebAdmin/1ec48d357ba44dbeaa0ef261d93e4003.jpg"
							alt="예매내역"></span></a></li>
				<li><a
					href="<%=cp%>/faq/faqList.see"
					title="고객센터"><span><img
							src="http://caching.lottecinema.co.kr//Media/WebAdmin/47141787f65643938247e12b5f5c9d75.jpg"
							alt="고객센터"></span></a></li>
				<li><a
					href="<%=cp%>/movie/aMovieTheater.see"
					title="스페셜관"><span><img
							src="http://caching.lottecinema.co.kr//Media/WebAdmin/1066bda3e3c1448f81cdbb07aeea257b.jpg"
							alt="스페셜관"></span></a></li>
			</ul>
		</div>
	</div>

</body>
</html>