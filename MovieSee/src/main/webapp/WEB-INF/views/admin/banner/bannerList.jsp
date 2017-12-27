<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% String cp = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>현재 배너</title>
</head>
<body>
<div class="admin_grp">



<div class="admin_list">
		<ul>
			<li><a href="<%=cp%>/admin/movieList.see">상영작</a></li>
			<li><a href="<%=cp%>/admin/timeTableList.see">시간표관리</a></li>
			<li class="on"><a href="<%=cp%>/admin/bannerList.see">배너관리</a></li>
			<li><a href="<%=cp%>/admin/giftShopList.see">기프트샵</a></li>
			<li><a href="<%=cp%>/admin/eventListMain.see">이벤트</a></li>
			<li><a href="<%=cp%>/admin/noticeList.see">공지사항</a></li>
			<li><a href="<%=cp%>/admin/faqList.see">FAQ</a></li>
			<li><a href="<%=cp%>/admin/qnaList.see">Q&amp;A</a></li>
			<li><a href="<%=cp%>/admin/memberList.see">회원정보</a></li>
		</ul>
	</div>
	
	<!-- Event배너 -->
<div class="eventBxMain">
<h2>
	<strong>Today Event</strong>
</h2>
<div class="eventBxMain_in">

<div class="flbx">

<ul class="fl">
<li class="pbBn">
	<img src="<%= cp %>/resources/upload/movie/main_movie/${bannerselect.banner_left}">
</li>

<li>
	<img src="<%= cp %>/resources/upload/movie/main_movie/${bannerselect.banner_left1}">
</li>
</ul> <!-- flbx까지 -->

<ul class="fr">
<li class="pbBn">
	<img src="<%= cp %>/resources/upload/movie/main_movie/${bannerselect.banner_center}">
</li>

<li>
	<img src="<%= cp %>/resources/upload/movie/main_movie/${bannerselect.banner_center1}">
</li>
</ul>

<a href="javascript:void(0);" class="pbBnT">
	<img src="<%= cp %>/resources/upload/movie/main_movie/${bannerselect.banner_bottom}">
</a>
</div>

<ul class="fr">

<li class="pbBn">
<img src="<%= cp %>/resources/upload/movie/main_movie/${bannerselect.banner_right}">
</li>




<li>
<img src="<%= cp %>/resources/upload/movie/main_movie/${bannerselect.banner_right1}">
</li>

</ul>
</div>
</div>

	<div id="footer">
	
	 <div class="footBnImg">
        <div class="bnBxMain">
            <div>
                <!-- 20170112 - 신규 광고 스크립트 -->
                <!-- 20170726 - 광고 주석 복원 -->
                <!-- javascript에서 그림 변환시켜줌 -->
                                <!-- <script type="text/javascript" src="http://nvapi.feeldmc.com/ad/p/in/v1_0/imp?slotid=stw_lottelotte_4"></script> -->
                                <img src="<%= cp %>/resources/upload/movie/main_movie/${bannerselect.banner_footer}" style="width:980;height:180;border:0px">
            </div>
        </div>
    </div>
    <!--// 배너 -->
                <!-- 온라인광고 신규 2017-06 -->
		        <div class="ad-banner full_banner banner_type02" style="background-color: rgb(231, 244, 252); background-image: url(&quot;http://caching2.lottecinema.co.kr/lotte_image/2017/bg_01.jpg&quot;); background-repeat: repeat-x; margin: 0px auto;"><!-- 수정 20170926 -->
			        <div class="wrap_banner">
				      <!-- 20170726 - 광고 복원 -->
				      <!-- javascript에서 그림변환시켜줌 -->
                               <!--  <script type="text/javascript" src="http://nvapi.feeldmc.com/ad/p/in/v1_0/imp?slotid=stw_lottelotte_21"></script> -->
                                <div style="width:980px;margin:0 auto">
                                <img src="<%= cp %>/resources/upload/movie/main_movie/${bannerselect.banner_footer1}" style="width:980;height:240;border:0px"></div>
			        </div>
		        </div>
		        
		        </div>
		        
		       <div class="btn_type_03">
				<a href="<%=cp%>/admin/bannerUpdate.see" class="btn btnC_03 btnP_04">
					<span>수정하기</span>
				</a>
			</div>
		        
		        </div>
</body>
</html>