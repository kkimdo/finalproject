<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Header</title>
</head>
<body>

	<div class="header">

		<div class="luncher">
			<ul>
				<c:if test="${session_member_id == null }">
					<li><a id="lbtnLogin" title="로그인"
						href="<%=cp%>/member/login.see">로그인</a></li>
					<li><a href="<%=cp%>/member/member.see" title="회원가입">회원가입</a></li>
					<li><a href="<%=cp%>/faq/faqList.see" title="고객센터">고객센터</a></li>
				</c:if>

				<c:if test="${session_member_id != null }">
					<li><strong>${session_member_name}&nbsp;님 환영합니다.</strong></li>
					<c:if test="${session_member_grade eq 0 }">
					<li><a href="<%=cp%>/mypage/mypage.see">마이시네마</a></li>
					</c:if>
					<c:if test="${session_member_id == 'admin' }">
						<li><a href="<%=cp%>/admin/movieList.see">관리자페이지</a></li>
					</c:if>
					<li><a href="<%=cp%>/member/logout.see" title="로그아웃">로그아웃</a></li>
					<li><a href="<%=cp%>/faq/faqList.see" title="고객센터">고객센터</a></li>
				</c:if>

			</ul>
		</div>




		<div class="logo">
			<h1>
				<a href="/movie/main.see"> <img
					src="<%=cp%>/resources/upload/movie/main_logo/moviesee2.png"
					id="imgLogo" alt="MOVIESEE" title="MOVIE SEE"></a>
			</h1>
		</div>

		<div class="loginInfo" style="display: none;">
			<a href="javascript:void(0)" class="lF_login">로그인전</a>
			<div class="logingIF_in"></div>
		</div>
	</div>

</body>
</html>