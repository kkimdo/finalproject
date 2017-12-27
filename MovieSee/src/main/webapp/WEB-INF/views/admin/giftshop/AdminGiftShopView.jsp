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
    	location.href="<%=cp%>/admin/giftShopList.see";
    	}
    	
	function btnUpdate(){
		location.href="<%=cp%>/admin/giftShopUpdate.see?giftshop_product_no=${giftShopProductModel.giftshop_product_no}";
		}
	  
	function btnDelete() {
		if (confirm("정말 삭제하시겠습니까?") == true) { //확인
			location.href ="<%=cp%>/admin/giftShopDelete.see?giftshop_product_no=${giftShopProductModel.giftshop_product_no}";
		} else { //취소
			return;
		}
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
			<div class="tabCont">
				<fieldset>
					<legend>상품 정보</legend>
					<div class="titYtxt">
						<h3 class="mem_tit">상품 정보</h3>
					</div>
					<table class="tbl_style01">
						<colgroup>
							<col style="width: 13%">
							<col style="width: *">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><label for="category"> 상품 종류 </label></th>
								<td id="category">${giftShopProductModel.giftshop_product_category}</td>
							</tr>
							<tr>
								<th scope="row"><label for="name"> 상품명 </label></th>
								<td id="name">${giftShopProductModel.giftshop_product_name}</td>
							</tr>
							<tr>
								<th scope="row"><label for="price"> 상품 판매 가격 </label></th>
								<td id="price"><fmt:formatNumber value="${giftShopProductModel.giftshop_product_price}" pattern="###,###,###"/>원</td>
							</tr>
							<tr>
								<th scope="row"><label for="count"> 상품 판매 수량 </label></th>
								<td id="count">${giftShopProductModel.giftshop_product_count}개</td>
							</tr>
							<tr>
								<th scope="row"><label for="components"> 상품 구성 품 </label></th>
								<td id="components">${giftShopProductModel.giftshop_product_components}</td>
							</tr>
							
							<tr>
								<th scope="row"><label for="rest"> 상품 구매 제한 </label></th>
								<td id="rest">${giftShopProductModel.giftshop_product_restrictions}</td>
							</tr>
							<tr>
								<th scope="row"><label for="peri"> 상품 사용 기간 </label></th>
								<td id="peri">${giftShopProductModel.giftshop_product_periodofuse}</td>
							</tr>
							<tr>
								<th scope="row"><label for="desc1"> 상품 사용 방법 </label></th>
								<td id="desc1">${giftShopProductModel.giftshop_product_desc1}</td>
							</tr>
							<tr>
								<th scope="row"><label for="desc2"> 상품 취소/환불 내용 </label></th>
								<td id="desc2">${giftShopProductModel.giftshop_product_desc2}</td>
							</tr>
							<tr>
								<th scope="row"><label for="desc3"> 상품 기타 내용 </label></th>
								<td id="desc3">${giftShopProductModel.giftshop_product_desc3}</td>
							</tr>
							<tr>
								<th scope="row"><label for="fileUpload2"> 상품 이미지 </label></th>
								<td id="fileUpload2"><c:if
										test="${giftShopProductModel.giftshop_product_file ne null }">
										<img border="0" hspace="0"
											src="<%= cp %>/resources/uploads/giftshop/${giftShopProductModel.giftshop_product_file}">
									</c:if> <c:if
										test="${giftShopProductModel.giftshop_product_file eq null }">
								첨부 파일이 없습니다.
								</c:if></td>
							</tr>
						</tbody>
					</table>
				</fieldset>
			</div>
			
			<div class="btn_type_03">
					<span class="btn btnC_03 btnP_04 mr10"> <input type="button"
						onclick="btnList();" value="목록" />
					</span> <span class="btn btnC_04 btnP_04"> <input type="button"
						onclick="btnUpdate();" value="수정" />
					</span> 
					<span class="btn btnC_04 btnP_04" style="padding-left: 10px;">
						<input type="button" onclick="btnDelete();" value="삭제" />
					</span>
			</div>
		</div>
	</div>

</body>
</html>