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

<title>footer</title>
</head>
<body>
	<div id="footer">
		<!-- 배너 -->
		<div class="footBnImg">
			<div class="bnBxMain">
				<div>
					<!-- <script type="text/javascript" src="http://nvapi.feeldmc.com/ad/p/in/v1_0/imp?slotid=stw_lottelotte_4"></script> -->
					<img src="<%= cp %>/resources/upload/movie/main_movie/${bannerselect.banner_footer}"
						style="width: 980; height: 180; border: 0px">
				</div>
			</div>
		</div>
		<!--// 배너 -->
		<!-- 온라인광고 신규 2017-06 -->
		<div class="ad-banner full_banner banner_type02"
			style="background-color: rgb(231, 244, 252); background-image: url(&quot;http://caching2.lottecinema.co.kr/lotte_image/2017/bg_01.jpg&quot;); background-repeat: repeat-x; margin: 0px auto;">
			<!-- 수정 20170926 -->
			<div class="wrap_banner">
				<!-- 20170726 - 광고 복원 -->
				<!-- javascript에서 그림변환시켜줌 -->
				<!--  <script type="text/javascript" src="http://nvapi.feeldmc.com/ad/p/in/v1_0/imp?slotid=stw_lottelotte_21"></script> -->
				<div style="width: 980px; margin: 0 auto">
					<img
						src="<%= cp %>/resources/upload/movie/main_movie/${bannerselect.banner_footer1}"
						style="width: 980; height: 240; border: 0px">
				</div>
			</div>
		</div>


		<div class="footer_inner">
			<!-- 20150818 추가 -->
			<div class="footer_tit">
				<span class="footer_logo"> <!-- <img src="/LCHS/Image/logo_footer.gif?v=17111301" alt="LOTTE CINEMA"> --></span>
				<div class="footer_box"></div>
			</div>
			<ul class="footer_link">
				<li><a href="<%=cp%>/common/memberClause.see" title="회원약관">회원약관</a></li>
				<li class="active"><a href="<%=cp%>/common/privacy.see"
					title="개인정보처리방침">개인정보처리방침</a></li>

			</ul>
			<div class="company_info">
				<address>서울특별시 송파구 올림픽로 269(신천동, 무비씨캐슬골드) 4층 무비씨</address>
				<span>고객센터 1544-8855</span>
				<ul>
					<li>대표이사 강희태</li>
					<li>사업자등록번호 215-85-13462</li>
					<li>통신판매업신고번호 제1557호</li>
					<li>개인정보 보호책임자 상무 오희성</li>
				</ul>
			</div>
			<p class="copy">COPYRIGHT© MOVIE SEE ALL RIGHT RESERVED.</p>
		</div>

		<div class="footer_Awrap">
			<ul class="footer_award">
				<!-- 0324 추가 -->
				<li><img
					src="<%=cp%>/resources/upload/movie/main_footer/Footer_award01_NCSI.gif"
					alt="NCSI 영화관 부문 2년 연속 1위"></li>
				<!--20170323 sunho alt 값 이미지 수정-->
				<!-- //0324 추가 -->
				<!-- 
                        <!-- 수정 20171109 -->
				<li><img
					src="<%=cp%>/resources/upload/movie/main_footer/footer_award01.gif"
					alt="KCSI 영화관부문 5년 연속 1위(총10회)"></li>
				<li><img
					src="<%=cp%>/resources/upload/movie/main_footer/footer_award02.gif"
					alt="KS-SQI 영화관부문 6년 연속 1위(총9회)"></li>
				<!-- 수정 20171109 -->
				<li><img
					src="<%=cp%>/resources/upload/movie/main_footer/footer_award03.gif"
					alt="올해의 브랜드대상 영화관 부문 10년 연속 1휘"></li>
				<!-- //0314 수정 -->
				<li><img
					src="<%=cp%>/resources/upload/movie/main_footer/footer_award04.gif"
					alt="그린스타 영화관 부문 4년 연속 1위"></li>
				<!-- 0310 alt 수정 -->
				<li><img
					src="<%=cp%>/resources/upload/movie/main_footer/footer_award10.gif"
					alt="대한민국 브랜드 스타 영화관 부문 1위"></li>
				<!-- 0407 수정 -->
				<li><img
					src="<%=cp%>/resources/upload/movie/main_footer/footer_award07.gif"
					alt="가족친화 인증기업 선정"></li>
				<!--20170717  sunho  웹접근성 인증마크 링크 수정 -->
				<li><a title="새창"
					href="http://www.wa.or.kr/board/list.asp?BoardID=0006"
					target="_blank"><img
						src="<%=cp%>/resources/upload/movie/main_footer/footer_award08.gif"
						alt="(사)한국장애인단체총연합회 한국웹접근성인증평가원 웹 접근성 우수사이트 인증마크(WA인증마크)"></a></li>

			</ul>
		</div>


	</div>
</body>
</html>