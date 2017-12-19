<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	String cp = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" type="text/css" href="<%= cp%>/resources/mscs/qna.css?ver=201712060002"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QNA</title>
</head>

<body>
	<fieldset>
		<table class="tbl_qnast03">
			<colgroup>
				<col style="width: 11%">
				<col style="width: 15%">
				<col style="width: 49%">
				<col style="width: 14%">
				<col style="width: 11%">
			</colgroup>

			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">아이디</th>
					<th scope="col">제목</th>
					<th scope="col">등록일</th>
				</tr>
			</thead>


		<tbody>
			<c:forEach var="qnaList" items="${map.qnaList}">
				<c:url var="viewURL" value="qnaView.see">
					<c:param name="qna_no" value="${qnaList.qna_no }" />
					<c:param name="currentPage" value="${currentPage }" />
				</c:url>
				<tr class="qna">

					<td>${qnaList.qna_no}</td>
					<td>${qnaList.qna_id}</td>
					<td><a href="${viewURL}">${qnaList.qna_subject }</a></td>
					<td><fmt:formatDate value="${qnaList.qna_date}"
							pattern="yyyy-MM-dd" /></td>
				</tr>
			</c:forEach>

		</tbody>
	</table>
</fieldset>
	
	<input type="button" onclick="location.href='qnaWrite.see'" value="글쓰기" />

</body>
</html>