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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullAddr = ''; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수

						// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							fullAddr = data.roadAddress;

						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							fullAddr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
						if (data.userSelectedType === 'R') {
							//법정동명이 있을 경우 추가한다.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가한다.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						/*  document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용 */
						document.getElementById('member_addr').value = fullAddr;

						// 커서를 상세주소 필드로 이동한다.
						document.getElementById('member_addr').focus();
					}
				}).open();
	}
</script>
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
	<h1>관리자 - 회원정보수정</h1>
	<div class="admin_grp">
		<div class="admin_list">
			<ul>
				<li><a href="<%=cp%>/admin/movieList.see">상영작</a></li>
				<li><a href="<%=cp%>/admin/timeTableList.see">시간표관리</a></li>
				<li><a href="<%=cp%>/admin/bannerList.see">배너관리</a></li>
				<li><a href="<%=cp%>/admin/giftShopList.see">기프트샵</a></li>
				<li><a href="<%=cp%>/admin/eventListMain.see">이벤트</a></li>
				<li><a href="<%=cp%>/admin/noticeList.see">공지사항</a></li>
				<li><a href="<%=cp%>/admin/faqList.see">FAQ</a></li>
				<li><a href="<%=cp%>/admin/qnaList.see">Q&amp;A</a></li>
				<li class="on"><a href="<%=cp%>/admin/memberList.see">회원정보</a></li>
			</ul>
		</div>
		<div class="admin_ct">
			<div class="tabCont">
				<form:form commandName="member" action="memberUpdate.see"
					method="post" name="joinform">
					<div style="padding-top: 20px;"></div>
					<table>
						<tbody>
							<tr>
								<th scope="row">아이디</th>
								<td><form:input type="text" class="txt w200"
										path="member_id" required="true" placeholder="아이디를 입력해주세요."
										value="${member.member_id}" /> <strong class="pt_red ibk"><form:errors
											path="member_id" /></strong> <strong class="pt_red ibk"><form:errors
											element="member_id" /></strong></td>
							</tr>
							<tr>
								<th scope="row">비밀번호</th>
								<td><form:input type="password" class="txt w200"
										path="member_password1" required="true"
										placeholder="비밀번호를 입력해주세요." value="${member.member_password1}" />
									<strong class="pt_red ibk"><form:errors
											path="member_password1" /></strong></td>
							</tr>
							<tr>
								<th scope="row">비밀번호 확인</th>
								<td><form:input type="password" class="txt w200"
										path="member_password2" required="true"
										placeholder="비밀번호를를 입력해주세요."
										value="${member.member_password2}" /> <strong
									class="pt_red ibk"><form:errors
											path="member_password2" /></strong></td>
							</tr>
							<tr>
								<th scope="row">이름</th>
								<td><form:input type="text" class="txt w200"
										path="member_name" required="true" placeholder="이름을 입력해주세요."
										value="${member.member_name}" /> <strong class="pt_red ibk"><form:errors
											path="member_name" /></strong></td>
							</tr>

							<tr>
								<th scope="row">주소</th>
								<td><span class="bk"><form:input type="text"
											id="member_addr" class="txt" path="member_addr"
											value="${member.member_addr}" required="true"
											placeholder="상세주소까지 입력해주세요." /></span> <input type="button"
									class="button1" onclick="sample6_execDaumPostcode()" value="우편"
									style="background-color: #009bfa; border: none; color: white; padding: 15px 32px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px; margin: 15px 10px; cursor: pointer;" /><br>
								</td>
							</tr>
							<tr>
								<th scope="row">휴대폰</th>
								<td><form:input type="text" class="txt w200"
										path="member_phone" maxlength="11" required="true"
										placeholder="휴대폰 번호를 입력해주세요." value="${member.member_phone}" />
									<span class="ibk">" - " 없이 입력하세요.</span></td>
							</tr>
							<tr>
								<th scope="row">이메일</th>
								<td><form:input type="email" class="txt w200"
										path="member_email" required="true"
										placeholder="  이메일을 입력해주세요." value="${member.member_email}" />
									<strong class="pt_red ibk"><form:errors
											path="member_email" /></strong></td>
							</tr>
							<tr>
								<th scope="row">등급</th>
								<td><form:input type="text" class="txt w200"
										path="member_grade" required="true" placeholder="등급을 변경해주세요."
										value="${member.member_grade}" /> <strong class="pt_red ibk"><form:errors
											path="member_grade" /></strong></td>
							</tr>
							<form:input type="hidden" class="txt w200" path="member_no"
								required="true" placeholder="  이메일을 입력해주세요."
								value="${member.member_no}" />
						</tbody>

					</table>


			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="submit" value="수정" onclick="check_agreement()"
						style="background-color: #009bfa; border: none; color: white; padding: 15px 32px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px; margin: 15px 10px; cursor: pointer;" />

					<a
						href="/movie/admin/memberDelete.see?member_no=${member.member_no }"><input
						type="button" value="삭제"
						style="background-color: red; border: none; color: white; padding: 15px 32px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px; margin: 4px 2px; cursor: pointer;"></a>


					<a href="/movie/admin/memberList.see"><input type="button"
						value="취소"
						style="background-color: black; border: none; color: white; padding: 15px 32px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px; margin: 4px 2px; cursor: pointer;"></a>
						
				</form:form>
			</div>
		</div>
	</div>

</html>