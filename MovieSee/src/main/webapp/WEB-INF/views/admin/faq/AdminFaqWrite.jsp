<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FAQ</title>
</head>
<body>

	<h3>글 쓰기</h3>
	<form action="faqWrite.see" method="post">
		<table>
			<tr>
				<td>제목</td>
				<td><input type="text" name="faq_subject" />
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="faq_content"></textarea></td>
			</tr>
		</table>
		<br /> <input type="submit" value="확인" />
	</form>
	
</body>
</html>