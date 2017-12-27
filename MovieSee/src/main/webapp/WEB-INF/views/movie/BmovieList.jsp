<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% String cp = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아르떼</title>
<style>
.paging strong {
    color: #fff;
    background: #009bd7;
    border: 1px solid #009bd7;
}
.paging a, .paging strong {
    display: inline-block;
    width: 36px;
    height: 32px;
    line-height: 28px;
    font-size: 14px;
    border: 1px solid #e0e0e0;
    margin-left: 5px;
    -webkit-border-radius: 3px;
    -moz-border-radius: 3px;
    border-radius: 3px;
    -webkit-box-shadow: 1px 1px 1px 0px rgba(235,235,235,1);
    -moz-box-shadow: 1px 1px 1px 0px rgba(235,235,235,1);
    box-shadow: 1px 1px 1px 0px rgba(235,235,235,1);
</style>
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
		<li class="active"><a href="<%=cp %>/bMovieList.see" title="아르떼">아르떼</a></li>
		<li class=""><a href="<%=cp %>/cMovieList.see" title="G시네마">G시네마</a></li>
		<li class=""><a href="<%=cp %>/dMovieList.see" title="중국영화상영관/영화제">중국영화상영관/영화제</a></li>
		<li class=""><a href="<%=cp %>/eMovieList.see" title="오페라">오페라</a></li>
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
						<!-- <a href="javascript:void(0);" class="btnc_prev" style="display: none;"><img src="/LCHS/Image/Btn/btnc_prev.png" alt="이전"></a>
						<a href="javascript:void(0);" class="btnc_next" style="display: none;"><img src="/LCHS/Image/Btn/btnc_next.png" alt="다음"></a> -->
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
							<a href="javascript:void(0);" class="rolling_play" style="display: none;"><img src="/LCHS/Image/Btn/btn_m_play.png" alt="자동롤링 재생"></a>
							<a href="javascript:void(0);" class="rolling_stop" style="display: none;"><img src="/LCHS/Image/Btn/btn_m_stop.png" alt="자동롤링 멈춤"></a>
						</div>
					</div>
					<ul class="bannerImg" id="ulMovieKeyValue">
					<li class="active" style="background: url(&quot;undefined&quot;) 50% 0px no-repeat; left: 0px;"><img src="<%= cp %>/resources/upload/movie/movie_intro/${movieintroselect.movie_intro_arte_top}" alt="">
					<span class="blind">undefined</span>
					</li>
					</ul>
				</div>
			</div>

	<!-- content 부분 -->
<div class="screen_cwrap">

<div class="tab_content on">
<!-- 영화 LIST 출력 -->
	<ul class="curr_list movie_clist" id="arteMovieList">
	
<c:forEach var="moviearteList" items="${moviearteList}" varStatus="stat">

<c:set value="${moviearteList.movie_age}" var="movie_age" />
<c:set value="12" var="12" />
<c:set value="15" var="15" />
<c:set value="0" var="0" />

<c:url var="viewURL" value="/movieView.see">
	<c:param name="movie_no" value="${moviearteList.movie_no }"/>
</c:url>
<c:url var="reserveURL" value="/movieTicketing.see">
	<c:param name="movie_no" value="${moviearteList.movie_no}"/>
</c:url>

<li>
<div class="curr_box">
<span class="img">
	<a href=''>
	<img src="<%= cp %>/resources/upload/movie/main_movie/${moviearteList.movie_poster}"></a>
</span>
<%-- 	<c:if test="${fn:length(moviearteList) le 0}">
		<tr>
		<td colspan="13" class="tac">등록된 스케쥴이 없습니다.</td>
		</tr>
	</c:if> --%>
</div>

	<!-- hover시 이미지 -->
<div class="layer_hover">
<a href="${reserveURL}" onclick="goToTiketing()" class="btn_reserve">예매하기</a>
<a href="${viewURL}" class="btn_View">상세보기</a>
</div>
<dl class="list_text">
	<dt>
		<a href='javascript:GoToMovie("12154");'>
      	<span>
      		<c:choose>
      			<c:when test="${movie_age eq '12' }">
      				<img src="<%= cp %>/resources/upload/movie/btn/12.png">
      			</c:when>
      			<c:when test="${movie_age eq '15' }">
      				<img src="<%= cp %>/resources/upload/movie/btn/15.png">
      			</c:when>
      			<c:otherwise>
      				<img src="<%= cp %>/resources/upload/movie/btn/all.png">
      			</c:otherwise>
			</c:choose>      	
      	</span>&nbsp;&nbsp;${moviearteList.movie_name}</a>
	</dt>
	<dd>
		 <span class="rate">예매율  ${moviearteList.movie_rate} %</span>
      <span class="list_score">&nbsp;|&nbsp;&nbsp;관람평점 ${moviearteList.movie_score} 점</span>
	</dd>
</dl>
</li>
</c:forEach>	
<c:if test="${fn:length(moviearteList) le 0}">
	<div class="srchResult_none"  id="searchResultNone">
                        <span class="txt">상영 중인 영화가 없습니다.</span>
                    </div> 
</c:if>	
</ul>
						
						
						
						
                    
<!-- <a href="javascript:void(0);" class="btn_view" id="btnMore" style="display: block;"><span>더보기</span></a>        -->  
</div>
<div class="paging">
		${pagingHtml}
		</div>
<div class="tab_content">			
</div>
</div>

</div>
</body>
</html>