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
												src="http://caching.lottecinema.co.kr//Media/WebAdmin/68a09c3084a34f1898207e06ac9ff038.jpg"
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

		<!-- sweet_box -->
		<!-- <div class="sweet_box" id="recommendationDiv" style="display: none">
				<h3 class="map_tit" id="recommendationTitle"></h3>
				<ul class="product_slist" id="recommendationList">
				</ul>
			</div> -->
	</div>
	</div>

</body>
</html>