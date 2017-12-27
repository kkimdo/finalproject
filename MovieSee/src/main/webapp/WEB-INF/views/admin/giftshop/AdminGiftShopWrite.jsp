<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">

	$(function() {
		$('#content').keyup(function(e) {
			var content = $(this).val();
			$(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
			$('#counter').html(content.length + '/ 한글 2,000자');
		});
		$('#content').keyup();
	});
	
	//입력한 숫자가 숫자인지 확인
	function showKeyCode(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if( ( keyID >=48 && keyID <= 57 ) || ( keyID >=96 && keyID <= 105 ) )
		{
			return;
		}
		else
		{
			return false;
		}
	}
	
	//숫자가 아닌 문자 제거
	function onlyNumber(event){
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
			return;
		else
			return false;
	}
	function removeChar(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
			return;
		else
			event.target.value = event.target.value.replace(/[^0-9]/g, "");
	}
</script>

<title>기프트 샵</title>
</head>
<body>
	<div class="admin_grp">
		<div class="admin_list">
			<ul>
				<li><a href="<%=cp%>/admin/movieList.see">상영작</a></li>
				<li><a href="<%=cp%>/admin/timeTableList.see">시간표관리</a></li>
				<li><a href="<%=cp%>/admin/bannerList.see">배너관리</a></li>
				<li class="on"><a href="<%=cp%>/admin/giftShopList.see">기프트샵</a></li>
				<li><a href="<%=cp%>/admin/eventListMain.see">이벤트</a></li>
				<li><a href="<%=cp%>/admin/noticeList.see">공지사항</a></li>
				<li><a href="<%=cp%>/admin/faqList.see">FAQ</a></li>
				<li><a href="<%=cp%>/admin/qnaList.see">Q&amp;A</a></li>
				<li><a href="<%=cp%>/admin/memberList.see">회원정보</a></li>
			</ul>
		</div>
		<div class="admin_ct">
			<form:form commandName="giftShopProductModel"
				action="giftShopWrite.see" method="post"
				enctype="multipart/form-data" name="form1">
				<div class="tabCont">
					<div>
						<fieldset>
							<legend>기프트샵상품입력</legend>
							<div class="titYtxt mt50">
								<h3 class="mem_tit">기프트샵 상품 등록</h3>
								<span><strong title="필수항목">*</strong> 표시 항목은 필수 입력 항목입니다.</span>
							</div>

							<table class="tbl_style01">

								<caption>기프트샵 상품 작성란</caption>
								<colgroup>
									<col style="width: 13%">
									<col style="width: *">
								</colgroup>

								<tbody>
									<tr>
									<th scope="row">상품 종류 <span class="point_red" title="필수 입력">*</span>
									</th>
									<td>
									<span class="ipt_radio mr40"> <input
											type="radio" id="giftshop_category1" name="giftshop_product_category"
											value="영화 관람권" checked="checked"> <label
											for="giftshop_category1">영화 관람권</label>
									</span> 
									<span class="ipt_radio mr40"> <input type="radio"
											id="giftshop_category2" name="giftshop_product_category" value="매점 상품권">
											<label for="giftshop_category2">매점 상품권</label>
									</span>
									</td>
									</tr>
									<tr>
										<th scope="row"><label for="product"> 상품명 <span
												class="point_red" title="필수 입력">* </span>
										</label></th>
										<td><form:input name="giftshop_product_name" type="text"
												maxlength="40" id="product" class="ipt_txt03"
												path="giftshop_product_name" /> <font color="red"> <form:errors
													path="giftshop_product_name" /></font></td>
									</tr>
									<tr>
										<th scope="row"><label for="price"> 상품 판매 가격 <span
												class="point_red" title="필수 입력">* </span>
										</label></th>
										<td><input name="giftshop_product_price" type="text"
											maxlength="40" id="price" class="ipt_txt03" onkeydown="return showKeyCode(event)"
												 onkeyup='removeChar(event)' style='ime-mode:disabled;'
											/>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="count"> 상품 판매 수량 <span
												class="point_red" title="필수 입력">* </span>
										</label></th>
										<td><input name="giftshop_product_count" type="text"
											maxlength="40" id="count" class="ipt_txt03" onkeydown="return showKeyCode(event)"
												 onkeyup='removeChar(event)' style='ime-mode:disabled;'
											/>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="components"> 상품 구매
												품 <span class="point_red" title="필수 입력">* </span>
										</label></th>
										<td><form:input name="giftshop_product_components"
												type="text" maxlength="40" id="components"
												class="ipt_txt03" path="giftshop_product_components" /> <font
											color="red"> <form:errors
													path="giftshop_product_components" /></font></td>
									</tr>
									<tr>
										<th scope="row"><label for="restrictions"> 상품 구매
												제한 <span class="point_red" title="필수 입력">* </span>
										</label></th>
										<td><form:input name="giftshop_product_restrictions"
												type="text" maxlength="40" id="restrictions"
												class="ipt_txt03" path="giftshop_product_restrictions" /> <font
											color="red"> <form:errors
													path="giftshop_product_restrictions" /></font></td>
									</tr>
									<tr>
										<th scope="row"><label for="periodofuse"> 상품 사용
												기간 <span class="point_red" title="필수 입력">* </span>
										</label></th>
										<td><form:input name="giftshop_product_periodofuse"
												type="text" maxlength="40" id="periodofuse"
												class="ipt_txt03" path="giftshop_product_periodofuse" /> <font
											color="red"> <form:errors
													path="giftshop_product_periodofuse" /></font></td>
									</tr>
									<%-- <tr>
									<th scope="row"><label for="start_date"> 상품 사용 기간(시작)
											<span class="point_red" title="필수 입력">*</span>
									</label></th>
									<td><form:input name="giftshop_product_startdate" type="text"
											maxlength="40" id="start_date" class="ipt_txt03"
											path="giftshop_product_startdate" /> <font color="red"> <form:errors
												path="giftshop_product_startdate" />
									</font></td>
									</tr>
									<tr>
									<th scope="row"><label for="end_date"> 상품 사용 기간(종료) <span
											class="point_red" title="필수 입력">*</span>
									</label></th>
									<td><form:input name="giftshop_product_enddate" type="text"
											maxlength="40" id="end_date" class="ipt_txt03"
											path="giftshop_product_enddate" /> <font color="red"> <form:errors
												path="giftshop_product_enddate" />
									</font></td>
									</tr> --%>
									<tr>
										<th scope="row"><label for="desc1"> 상품 사용 방법 <span
												class="point_red" title="필수 입력">*</span>
										</label></th>
										<td><form:textarea name="giftshop_product_desc1"
												rows="10" cols="30" id="desc1" class="textarea01"
												path="giftshop_product_desc1"></form:textarea> <font
											color="red"> <form:errors
													path="giftshop_product_desc1" />
										</font>
											<div class="txt_wrap">
												<strong><span class="byte_txt" id="counter"></span></strong>
											</div></td>
									</tr>
									<tr>
										<th scope="row"><label for="desc2"> 상품 취소/환불 내용 <span
												class="point_red" title="필수 입력">*</span>
										</label></th>
										<td><form:textarea name="giftshop_product_desc2"
												rows="10" cols="30" id="desc2" class="textarea01"
												path="giftshop_product_desc2"></form:textarea> <font
											color="red"> <form:errors
													path="giftshop_product_desc2" />
										</font>
											<div class="txt_wrap">
												<strong><span class="byte_txt" id="counter"></span></strong>
											</div></td>
									</tr>
									<tr>
										<th scope="row"><label for="desc3"> 상품 기타 내용 <span
												class="point_red" title="필수 입력">*</span>
										</label></th>
										<td><form:textarea name="giftshop_product_desc3"
												rows="10" cols="30" id="desc3" class="textarea01"
												path="giftshop_product_desc3"></form:textarea> <font
											color="red"> <form:errors
													path="giftshop_product_desc3" />
										</font>
											<div class="txt_wrap">
												<strong><span class="byte_txt" id="counter"></span></strong>
											</div></td>
									</tr>
									<tr>
										<th scope="row"><label for="fileUpload2">상품 이미지</label></th>
										<td>
											<div>
												<input type="file" name="product_file" id="fileUpload2" />
											</div> <span class="txt_left"> </span>
										</td>
									</tr>
								</tbody>
							</table>
						</fieldset>
						<div class="btn_type_03">
							<a href="javascript:history.back()"
								class="btn btnC_03 btnP_04 mr10"> <span>취소</span>
							</a> <span class="btn btnC_04 btnP_04"> <input type="submit"
								value="등록" />
							</span>
						</div>
					</div>
				</div>
			</form:form>
		</div>
	</div>

</body>
</html>