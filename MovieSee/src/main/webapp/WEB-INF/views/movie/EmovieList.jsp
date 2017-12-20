<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% String cp = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>오페라</title>
</head>
<body>

<div class="gnb">

	<ul>
		<li>
		<a href="<%=cp %>/reserve/movieTicketing.see" title="예매">예매</a>
		</li>

		<li class="active">
		<a href="<%=cp %>/aMovieList.see" title="영화">영화</a>
<div class="depth">

	<ul>
		<li class=""><a href="<%=cp %>/aMovieList.see" title="박스오피스">박스오피스</a></li>
		<li class=""><a href="<%=cp %>/bMovieList.see" title="아르떼">아르떼</a></li>
		<li class=""><a href="<%=cp %>/cMovieList.see" title="G시네마">G시네마</a></li>
		<li class=""><a href="<%=cp %>/dMovieList.see" title="중국영화상영관/영화제">중국영화상영관/영화제</a></li>
		<li class="active"><a href="<%=cp %>/eMovieList.see" title="오페라">오페라</a></li>
	</ul>
</div>
		</li>

		<li>
			<a href="<%=cp %>/aMovieTheater.see" title="영화관">영화관</a>
		</li>

		<li>
			<a href="http://event.lottecinema.co.kr/LCHS/Contents/Event/event-summary-list.aspx" title="이벤트">이벤트</a>
		</li>

		<li>
			<a href="http://www.lottecinema.co.kr/LCHS/Contents/Cinema-Mall/gift-shop.aspx" title="기프트샵">기프트샵</a>
		</li>
	</ul>
</div>
<div id="content">
<!-- 배너 이미지 -->
<div class="movie_trailer">
                <div class="movile_box">
                    <div class="prevNext">
                       <!--  <a href="javascript:void(0);" class="btnc_prev" style="display: none;">
                            <img src="/LCHS/Image/Btn/btnc_prev.png" alt="이전"></a>
                        <a href="javascript:void(0);" class="btnc_next" style="display: none;">
                            <img src="/LCHS/Image/Btn/btnc_next.png" alt="다음"></a> -->
                    </div>
                    <div class="control_navi">
                        <ul class="indicator">
                            <!--
                            <li><a href="javascript:void(0);">배너1</a></li>
							<li><a href="javascript:void(0);">배너2</a></li>
							<li class="on"><a href="#">배너3</a></li>
                            -->
                        </ul>
                        <div class="ctr_btn">
                          <!--   <a href="javascript:void(0);" class="rolling_play" style="display: none;">
                                <img src="/LCHS/Image/Btn/btn_m_play.png" alt="자동롤링 재생"></a>
                            <a href="javascript:vo]\id(0);" class="rolling_stop" style="display: none;">
                                <img src="/LCHS/Image/Btn/btn_m_stop.png" alt="자동롤링 멈춤"></a> -->
                        </div>
                    </div>
                    <ul class="bannerImg" id="ulMovieKeyValue">
                    <li class="active">
                    <img src="<%= cp %>/resources/upload/movie/movie_intro/${movieintroselect.movie_intro_opera_top}">
                    <span class="blind">극장에서즐기는오페라&amp;발레시리즈세계명작의생생한감동을지금느껴보세요</span>
                    </li>
                    </ul>
                </div>
            </div>

<!-- content 부분 -->
<div class="screen_cwrap">
<img src="<%= cp %>/resources/upload/movie/movie_intro/${movieintroselect.movie_intro_opera_content}" alt="대체 텍스트" longdesc="#message_gcinema">
<div id="message_gcinema" class="blind">

</div>
</div>

			
<!-- 하단 -->
<div class="screen_cwrap">
<div class="tab_content on">
<!-- 영화 LIST 출력 -->
	<ul class="curr_list movie_clist" id="arteMovieList">
	
<c:forEach var="movieoperaList" items="${movieoperaList}" varStatus="stat">
<c:url var="viewURL" value="/movieView.see">
	<c:param name="movie_no" value="${movieoperaList.movie_no }"/>
</c:url>
<c:url var="reserveURL" value="/movieTicketing.see">
	<c:param name="movie_no" value="${movieoperaList.movie_no}"/>
</c:url>
<li>
<div class="curr_box">
<span class="img">
	<a href=''>
	<img src="<%= cp %>/resources/upload/movie/main_movie/${movieoperaList.movie_poster}"></a>
</span>
</div>


	<!-- hover시 이미지 -->
<div class="layer_hover">
<a href="${reserveURL}" onclick="goToTiketing()" class="btn_reserve">예매하기</a>
<a href="${viewURL}" class="btn_View">상세보기</a>
</div>
<dl class="list_text">
	<dt>
		<a href='javascript:GoToMovie("12154");'><span class="grade_all">전체</span>${movieoperaList.movie_name}</a>
	</dt>
	<dd>
		<span class="rate">관람 평점 0.0%</span>
		<span class="list_score">관람평점 0.0</span>
	</dd>
</dl>
</li>
</c:forEach>		
</ul>

                    <div class="srchResult_none" style="display:none;" id="searchResultNone">
                        <span class="txt">상영 중인 영화가 없습니다.</span>
                    </div>
                </div>
                <div class="tab_content">
                </div>
            </div> 

</div>


</body>
</html>