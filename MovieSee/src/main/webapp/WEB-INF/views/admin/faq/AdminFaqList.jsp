<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FAQ</title>
</head>
<body>


	<table>	
		<c:forEach var="faqList" items="${faqList}" varStatus="stat">
			
			<c:url var="faqViewURL" value="faqView.see">
				<c:param name="faq_no" value="${faqList.faq_no}" />
				<c:param name="currentPage" value="${currentPage}" />
			</c:url>
			
			<tr>
				<td>번호</td>
				<td>제목</td>
				<td>등록일</td>
				<td>조회수</td>
			</tr>
		
			<tr>
				<td>${faqList.faq_no}</td>
				<td><a href="${faqViewURL}">${faqList.faq_subject}</a></td>
				<td><fmt:formatDate value="${faqList.faq_date}" pattern="yyyy-MM-dd" /></td>
				<td>${faqList.faq_hit}</td>
			</tr>
		</c:forEach>
	</table> 
	
	<!-- faqList가 0보다 작거나 같을 경우 -->
	<c:if test="${fn:length(faqList) le 0}" >
		<center>등록된 게시물이 없습니다.</center>
	</c:if>
	
	${pagingHtml}
</body>
</html>