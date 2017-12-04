<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>qna</title>
</head>
<body>
	<form action="qnaWrite.see" method="post">
		<table>
			<h3>회원정보</h3>
			<tr>
				<td>성명</td>
				<td><input type="text" name="qna_name" />
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="qna_id" />
			</tr>
			<tr>
				<td>연락처</td>
				<td><input type="text" name="qna_phone" maxlength="11" /> 
				<span> "-" 없이 입력하세요.</span>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="qna_email" />
			</tr>
			<h3>문의내용</h3>
			<tr>
				<td>문의 종류</td>
				<td><input type="radio" name="qna_category" value="1" checked="checked"><label>문의</label>
				<input type="radio" name="qna_category" value="2" checked="checked"><label>칭찬</label>
				<input type="radio" name="qna_category" value="3" checked="checked"><label>불만</label>
				<input type="radio" name="qna_category" value="4" checked="checked"><label>건의</label></td>
			</tr>
			<tr>
			<td>지역선택</td>
			<td><select name="qna_area" size="1">
				<option value="1" selected>서울</option>
				<option value="2">경기</option>
				<option value="3">부산</option>
			</select>
			<td>
			</tr>	
				</table>

				<br /> <input type="submit" value="확인" />
			</form>
</body>
</html>