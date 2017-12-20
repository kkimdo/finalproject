<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp = request.getContextPath();
%>

<script type="text/javascript">
	function del_check() {
		return (confirm("삭제 하겠습니까?"))
	}
</script>

<div class="admin_grp">
	<div class="admin_list">
		<ul>
			<li class="on"><a href="<%=cp%>/admin/movieList.see">상영작</a></li>
			<li><a href="<%=cp%>/admin/timeTableList.see">시간표관리</a></li>
			<li><a href="<%=cp%>/admin/bannerList.see">베너관리</a></li>
			<li><a href="<%=cp%>/admin/magazineList.see">MAGAZINE</a></li>
			<li><a href="<%=cp%>/admin/eventListMain.see">이벤트</a></li>
			<li><a href="<%=cp%>/admin/noticeList.see">공지사항</a></li>
			<li><a href="<%=cp %>/admin/qnaList.see">Q & A</a></li>
			<li><a href="<%=cp%>/admin/memberList.see">회원정보</a></li>
		</ul>
	</div>
	<div class="admin_ct">
		<div class="slidePoster">
<div class="slide">
<ul style="left:0px;">
<c:forEach var="movielist" items="${movielist}" varStatus="stat" >
<c:url var="viewURL" value="/movieView.see">
	<c:param name="movie_no" value="${movielist.movie_no }"/>
</c:url>
<%-- <c:url var="reserveURL" value="/movieTicketing.see">
	<c:param name="movie_no" value="${movielist.movie_no}"/>
</c:url> --%>
<c:url var="deleteURL" value="/admin/movieDelete.see" >
	<c:param name="movie_no" value="${movielist.movie_no}" />							
</c:url>	
<c:url var="ModifyURL" value="/admin/movieUpdate.see" >
	<c:param name="movie_no" value="${movielist.movie_no}" />							
</c:url>

<li class="">
<a href="javascript:void(0)";>
<img src="<%= cp %>/resources/upload/movie/main_movie/${movielist.movie_poster}">
</a>
<%-- <div class="explan">
	<p>
	<strong>감독</strong> : ${movielist.movie_director}
	</p>
	<p>
	<strong>개봉</strong> : <fmt:formatDate value="${movielist.movie_date }" pattern="yyyy.MM.dd"></fmt:formatDate>
	</p>
	</div> --%>
<div class="layer_hover">

<a href="${ModifyURL}" class="btn_View">수정하기</a>
<a href="${deleteURL}" class="btn_View" onclick="return del_check()">삭제하기</a>
<%-- <a href="${reserveURL}" onclick="goToTiketing()" class="btn_reserve">예매하기</a> --%>
<a href="${viewURL}" class="btn_View">상세보기</a>

</div>
</li>
</c:forEach>
</ul>
</div><!-- // movie_list -->
			<div class="btn_type_03">
				<a href="<%=cp%>/admin/movieWrite.see" class="btn btnC_03 btnP_04">
					<span>글쓰기</span>
				</a>
			</div>
		
		<!-- paging 
		<div class="paging">
			<a href="#none" class="page prv">&lt;</a> <strong>1</strong> <a
				href="#none" class="page">2</a> <a href="#none" class="page">3</a> <a
				href="#none" class="page">4</a> <a href="#none" class="page">5</a> <a
				href="#none" class="page next">&gt;</a>
		</div>  paging -->
		<div class="paging">
			${pagingHtml}
		</div>
	</div>
</div>
</div>