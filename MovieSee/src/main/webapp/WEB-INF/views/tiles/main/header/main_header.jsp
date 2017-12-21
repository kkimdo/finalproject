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
		<!-- 왼쪽상단 링크 -->
		<div class="laypop_evtFB">
			<a href="https://www.facebook.com/LotteCinema.kr" target="_blank"
				title="무비씨 페이스북 새창열림">무비씨 페이스북</a>
			<div class="laypop_FB" style="display: none;">최신 개봉작 속보, 시사회 초청
				이벤트!</div>
		</div>

		<!-- 왼쪽상단 링크 -->
		<div class="laypop_evtAPP sms-send-download-url2">
			<a class="app" href="javascript:;" title="무비씨 APP 설치안내">무비씨
				APP</a>
		</div>

		<div class="luncher">
			<ul>
				<c:if test="${session_member_name == null }">
					<li><a id="lbtnLogin" title="로그인"
						href="<%=cp%>/member/login.see">로그인</a></li>
					<li><a href="" title="회원가입">회원가입</a></li>
					<li><a href="<%=cp%>/faq/faqList.see" title="고객센터">고객센터</a></li>
				</c:if>

				<c:if test="${session_member_name != null }">
					<li>${session_member_name}&nbsp;님</li>
					<li><a href="<%=cp%>/mypage/mypage.see">MyPage</a></li>
					<c:if test="${session_member_name == 'admin' }">
						<li><a href="<%=cp%>/admin/movieList.see">관리자페이지</a></li>
					</c:if>
					<li><a href="<%=cp%>/member/logout.see" title="로그아웃">로그아웃</a></li>
					<li><a href="<%=cp%>/faq/faqList.see" title="고객센터">고객센터</a></li>
				</c:if>

			</ul>
		</div>




		<div class="logo">
			<!-- 2016.05.03 장착법 -->
			<h1>
				<a href="/movie/main.see"> <img
					src="http://caching.lottecinema.co.kr//Media/WebAdmin/23339c901d7942cc826af0dd27360b90.gif"
					id="imgLogo" alt="LOTTE CINEMA" title="LOTTE CINEMA"></a>
			</h1>
		</div>

		<div class="loginInfo" style="display: none;">
			<a href="javascript:void(0)" class="lF_login">로그인전</a>
			<div class="logingIF_in"></div>
		</div>
	</div>

</body>
</html>