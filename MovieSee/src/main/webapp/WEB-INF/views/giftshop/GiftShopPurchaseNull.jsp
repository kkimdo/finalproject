<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String cp = request.getContextPath();
%>
<script type="text/javascript">
	alert("죄송합니다. 상품 재고가 없습니다.");
	location.href = "<%= cp %>/gift/giftShopView.see";
</script>