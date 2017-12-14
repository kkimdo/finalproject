<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3>FAQ</h3>
	<form action="faqUpdate.see" method="post">
		<input type="hidden" name="faq_no" value="${faqModel.faq_no}" /> <input
			type="hidden" name="currentPage" value="${currentPage}" />
		<table>
			<tr>
				<td>제목</td>
				<td><input type="text" name="faq_subject"
					value="${faqModel.faq_subject}" /></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="faq_content">${faqModel.faq_content}</textarea></td>
			</tr>
		</table>
		<br /> <input type="submit" value="작성" />
	</form>

</body>
</html>