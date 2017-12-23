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
	/* function btnWrite(){
	 var frm = document.form1;
	
	 if (frm.giftshop_product_name.value == "") {
	 alert("상품명을 입력해주세요");
	 frm.giftshop_product_name.foucs();
	 return false;
	
	 } else if (frm.giftshop_product_price.value == "") {
	 alert("상품 가격을 입력해주세요");
	 frm.giftshop_product_price.focus();
	 return false;
	
	 } else if (frm.giftshop_product_restrictions.value == "") {
	 alert("상품 구매제한을 입력해주세요");
	 frm.giftshop_product_restrictions.focus();
	 return false;
	
	 } else if (frm.giftshop_product_periodofuse.value == "") {
	 alert("상품 사용 기간을 입력해주세요");
	 frm.giftshop_product_periodofuse.focus();
	 return false;
	
	 } else if (frm.giftshop_product_desc1.value == "") {
	 alert("상품 사용 방법을 입력해주세요");
	 frm.giftshop_product_desc1.focus();
	 return false;
	
	 } else if (frm.giftshop_product_desc2.value == "") {
	 alert("상품 취소/환불 내용을 입력해주세요");
	 frm.giftshop_product_desc2.focus();
	 return false;
	
	 } else if (frm.giftshop_product_desc3.value == "") {
	 alert("상품 기타 내용을 입력해주세요");
	 frm.giftshop_product_desc3.focus();
	 return false;
	
	 } else if (frm.giftshop_product_url.value == "") {
	 alert("상품 이미지를 입력해주세요");
	 frm.giftshop_product_url.focus();
	 return false;
	
	 } else {
	
	 alert("상품이 정상적으로 등록 되었습니다.");
	 frm.submit();
	 }
	
	 return true;
	 }  */

/* 	$(function() {
		$('#content').keyup(function(e) {
			var content = $(this).val();
			$(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
			$('#counter').html(content.length + '/ 한글 2,000자');
		});
		$('#content').keyup();
	}); */
</script>

<title>기프트 샵</title>
</head>
<body>
	<div class="admin_grp">
		<div class="admin_list">
			<ul>
				<li><a href="<%=cp%>/admin/movieList.see">상영작</a></li>
				<li><a href="<%=cp%>/admin/timeTableList.see">시간표관리</a></li>
				<li><a href="<%=cp%>/admin/bannerList.see">베너관리</a></li>
				<li class="on"><a href="<%=cp%>/admin/giftShopList.see">기프트샵</a></li>
				<li><a href="<%=cp%>/admin/eventListMain.see">이벤트</a></li>
				<li><a href="<%=cp%>/admin/noticeList.see">공지사항</a></li>
				<li><a href="<%=cp%>/admin/faqList.see">FAQ</a></li>
				<li><a href="<%=cp%>/admin/qnaList.see">Q&amp;A</a></li>
				<li><a href="<%=cp%>/admin/memberList.see">회원정보</a></li>
			</ul>
		</div>
		<div class="admin_ct">
			<form:form commandName="giftShopProductModel" name="formWrite" action="giftShopWrite.see" method="post" enctype="multipart/form-data">
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
										<th scope="row"><label for="product"> 상품명 <span
												class="point_red" title="필수 입력">* </span>
										</label></th>
										<td><form:input name="giftshop_product_name" type="text" maxlength="40" id="product" class="ipt_txt03"
												path="giftshop_product_name" /> <font color="red">
												 <form:errors path="giftshop_product_name" /></font></td>
									</tr>
									<tr>
										<th scope="row"><label for="price"> 상품 판매 가격 <span
												class="point_red" title="필수 입력">* </span>
										</label></th>
										<td><form:input name="giftshop_product_price" type="text"
											maxlength="40" id="price" class="ipt_txt03" path="giftshop_product_price"/>
										</td>
									</tr>
									<tr>
									<tr>
										<th scope="row"><label for="restrictions"> 상품 구매 제한 <span
												class="point_red" title="필수 입력">* </span>
										</label></th>
										<td><form:input name="giftshop_product_restrictions" type="text" maxlength="40" id="restrictions" class="ipt_txt03"
												path="giftshop_product_restrictions" /> <font color="red">
												 <form:errors path="giftshop_product_restrictions" /></font></td>
									</tr>
									<tr>
										<th scope="row"><label for="periodofuse"> 상품 사용 기간 <span
												class="point_red" title="필수 입력">* </span>
										</label></th>
										<td><form:input name="giftshop_product_periodofuse" type="text" maxlength="40" id="periodofuse" class="ipt_txt03"
												path="giftshop_product_periodofuse" /> <font color="red">
												 <form:errors path="giftshop_product_periodofuse" /></font></td>
									</tr>
									<tr>
										<th scope="row">
											<label for="desc1"> 상품 사용 방법 <span
												class="point_red" title="필수 입력">*</span>
											</label>
										</th>
										<td><form:textarea name="giftshop_product_desc1"
												rows="10" cols="30" id="desc1" class="textarea01"
												path="giftshop_product_desc1"></form:textarea> <font
											color="red"> <form:errors
													path="giftshop_product_desc1" />
											</font>
											<div class="txt_wrap">
												<strong><span class="byte_txt" id="counter"></span></strong>
											</div>
										</td>
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
										<th scope="row"><label for="product_url">상품 이미지</label>
										</th>
										<td>
											<div>
												<input type="file" name="giftshop_product_file" id="product_url" />
											</div> <span class="txt_left"> </span>
										</td>
									</tr>
								</tbody>
							</table>
						</fieldset>
						<div class="btn_type_03">
							<a href="javascript:history.back()"
								class="btn btnC_03 btnP_04 mr10">
								<span>취소</span>
							</a> 
							<span class="btn btnC_04 btnP_04">
							 <input type="submit" value="등록" />
							</span>
						</div>
					</div>
				</div>
			</form:form>
		</div>
	</div>

</body>
</html>