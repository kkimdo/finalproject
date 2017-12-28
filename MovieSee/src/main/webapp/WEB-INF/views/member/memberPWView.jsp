<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	String cp = request.getContextPath();
%>
<!DOCTYPE HTML>
<!-- 다음주소API -->
<head>
<title>MovieSee</title>
<script src="http://code.jquery.com/jquery-1.7.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

<style>
h2 {
	border-bottom: 2px solid black;
	margin-left: 50px;
	padding-bottom: 10px;
}

table {
	margin-left: 100px;
}

table th {
	padding-right: 50px;
}

table tr {
	border-bottom: 1px solid #d0d0d0;
}

table td {
	padding-top: 20px;
	padding-bottom: 20px;
}

/* input[type=submit]{
	margin-left : 200px;
	background-color: #009bfa; 
	border: none;
	color: white;
	padding: 20px 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 18px;
	margin: auto;
	cursor: pointer;
	width: 100px;
} */
input[type=text], input[type=password], input[type=email] {
	width: 300px;
	border: none;
	height: 40px;
	background-color: #e6e6e6;
}

.button {
	margin-left: 200px;
	background-color: black;
	border: none;
	color: white;
	padding: 20px 22px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 20px;
	cursor: pointer;
	width: 100px;
	padding-top: 5px;
}

.button1 {
	margin-left: 200px;
	background-color: #009bfa;
	border: none;
	color: white;
	padding: 10px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 12px;
	margin: 20px;
	cursor: pointer;
	width: 100px;
}
</style>
</head>

<h1>비밀번호 변경</h1>
<form:form commandName="member" action="/movie/member/memberPWUpdate.see" method="POST"
	name="joinform">
	<div style="padding-top: 20px;"></div>
	<table>
		<tbody>
		
			<tr>
				<th scope="row">비밀번호</th>
				<td><form:input type="text" class="txt w200"
						path="member_password1" required="true" 
						 />
				<form:errors
							path="member_password1" /></td>
			</tr>
						<tr>
				<th scope="row">비밀번호 확인</th>
				<td><form:input type="text" class="txt w200"
						path="member_password2" required="true"
						/>
				<form:errors
							path="member_password2" /></td>
			</tr>

		</tbody>
		<form:input type="hidden" class="txt w200"
						path="member_no" required="true" placeholder="  이메일을 입력해주세요."
						value="${member.member_no}" /> 
	</table>


			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="submit" value="확인" onclick="check_agreement()"
		style="background-color: #009bfa; border: none; color: white; padding: 15px 32px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px; margin: 15px 10px; cursor: pointer; padding-top: 5px;" />

	
	<a href="/movie/mypage/mypage.see"><input type="button"
		value="취소"
		style="background-color: black; border: none; color: white; padding: 15px 32px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px; margin: 4px 2px; cursor: pointer; padding-top: 5px;"></a>
	
</form:form>
</html>