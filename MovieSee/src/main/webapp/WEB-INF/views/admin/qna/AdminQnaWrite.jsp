<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QNA</title>
</head>
<body>
	
		<form action="qnaWrite.see" method="post" enctype="multipart/form-data">
			<div class="titYtxt">
				<h3 class="mem_tit">회원정보</h3>
					<span><strong title="필수항목">*</strong> 표시 항목은 필수 입력 항목입니다.</span>
			</div>
			<table>
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
				<td><input type="text" name="qna_phone" maxlength="11" /> <span>
						"-" 없이 입력하세요.</span>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="qna_email" />
			</tr>
		
			<h3>문의내용</h3>
			<tr>
				<td>문의 종류</td>
				<td><input type="radio" name="qna_question_kinds" value="1"
					checked="checked"><label>문의</label> <input type="radio"
					name="qna_question_kinds" value="2" checked="checked"><label>칭찬</label>
					<input type="radio" name="qna_question_kinds" value="3"
					checked="checked"><label>불만</label> <input type="radio"
					name="qna_question_kinds" value="4" checked="checked"><label>건의</label>
				</td>
			</tr>
			<tr>
				<td>문의분류</td>
				<td><select name="qna_category" size="1">
						<option value="1" selected>영화관 문의</option>
						<option value="2">영화문의</option>
						<option value="3">회원 및 포인트 문의</option>
						<option value="4">결제 및 관람권 문의</option>
						<option value="5">이벤트/시사회/무대인사 문의</option>
						<option value="6">홈페이지/모바일 이용관련 문의</option>
				</select>
				</td>
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
			<tr>
				<td>제목</td>
				<td><input type="text" name="qna_subject" />
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="qna_content"></textarea></td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td><input type="file" name="qna_orgfile"/><span class="date">&nbsp;&nbsp;*&nbsp;임의로 파일명이 변경될 수 있습니다.</span></td>	
			</tr>
			
		</table>
		<input type="submit" value="확인" />
	</form>
</body>
</html>