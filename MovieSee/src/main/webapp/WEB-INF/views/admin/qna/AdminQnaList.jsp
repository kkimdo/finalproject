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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QNA</title>
</head>

<body>
	<table>
		
			<tr>
				<td>번호</td>
				<td>아이디</td>
				<td>제목</td>
				<td>등록일</td>
			</tr>

		

		<c:forEach var="qnaList" items="${qnaList}" varStatus="stat">

			<c:url var="qnaViewURL" value="qnaView.see">
				<c:param name="qna_no" value="${qnaList.qna_no}" />
				<c:param name="currentPage" value="${currentPage}" />
			</c:url>

			<tr>
				<td>${qnaList.qna_no}</td>
				<td>${qnaList.qna_id}</td>
				<td><a href="${qnaViewURL}">${qnaList.qna_subject}</a></td>
				<td><fmt:formatDate value="${qnaList.qna_date}" pattern="yyyy-MM-dd" />
				</td>
			</tr>
			</c:forEach>

	</table>  
	<c:if test="${fn:length(qnaList) le 0}">
		<center>등록된 게시물이 없습니다.</center>
	</c:if> 
	${pagingHtml}
	<input type="button" onclick="location.href='qnaWrite.see'" value="글쓰기" />
	
</body>
</html>