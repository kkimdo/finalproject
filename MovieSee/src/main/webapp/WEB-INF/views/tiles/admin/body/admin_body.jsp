<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<script type="text/javascript">
	function del_check() {
		return (confirm("삭제 하겠습니까?"))
	}
</script>
<style>
/* li>a>img {
	width: 188px;
	height: 308px;
}

.curr_list {
	margin-left: -38px;
	min-height: 407px;
}

.movie_clist.curr_list>li {
	width: 230px;
	height: 337px;
	margin: 0 0 40px 20px;
} */
</style>
<div class="admin_grp">
	<div class="admin_list">
			<ul>
				<li class="on"><a href="<%=cp%>/admin/movieList.see">상영작</a></li>
				<li><a href="<%=cp%>/admin/timeTableList.see">시간표관리</a></li>
				<li><a href="<%=cp%>/admin/bannerList.see">배너관리</a></li>
				<li><a href="<%=cp%>/admin/giftShopList.see">기프트샵</a></li>
				<li><a href="<%=cp%>/admin/eventListMain.see">이벤트</a></li>
				<li><a href="<%=cp%>/admin/noticeList.see">공지사항</a></li>
				<li><a href="<%=cp%>/admin/faqList.see">FAQ</a></li>
				<li><a href="<%=cp%>/admin/qnaList.see">Q&amp;A</a></li>
				<li><a href="<%=cp%>/admin/memberList.see">회원정보</a></li>
			</ul>
		</div>
	<div class="admin_ct">

		<div class="movie_hover">

			<h3 class="sub_tit">상영작</h3>

			<ul class="curr_list movie_clist" id="ulMovieList">
				<c:forEach var="movielist" items="${movielist}" varStatus="stat">
					<li class=""><div class="curr_box">
							<c:url var="viewURL" value="/movieView.see">
								<c:param name="movie_no" value="${movielist.movie_no }" />
							</c:url>
							<c:url var="deleteURL" value="/admin/movieDelete.see">
								<c:param name="movie_no" value="${movielist.movie_no}" />
							</c:url>
							<c:url var="ModifyURL" value="/admin/movieUpdate.see">
								<c:param name="movie_no" value="${movielist.movie_no}" />
							</c:url>
							<span class="img"><a href="javascript:void(0);"><img
									src="<%= cp %>/resources/upload/movie/main_movie/${movielist.movie_poster}"></a></span>
						</div>
						<div class="layer_hover">
							<a href="${ModifyURL}" class="btn_modify">수정하기</a> <a
								href="${deleteURL}" onclick="goToTiketing()"
								class="btn_reserve">삭제하기</a> <a href="${viewURL}"
								class="btn_View">상세보기</a>
						</div> <c:set value="${movielist.movie_age}" var="movie_age" /> <c:set
							value="12" var="12" /> <c:set value="15" var="15" /> <c:set
							value="0" var="0" />
						<dl class="list_text">

							<!-- 1012 고도화 작업에 따른 태그 변경 -->
							<dt>
								<a href='javascript:GoToMovie("12154");'> <span> <c:choose>
											<c:when test="${movie_age eq '12' }">
												<img src="<%=cp%>/resources/upload/movie/btn/12.png">
											</c:when>
											<c:when test="${movie_age eq '15' }">
												<img src="<%=cp%>/resources/upload/movie/btn/15.png">
											</c:when>
											<c:otherwise>
												<img src="<%=cp%>/resources/upload/movie/btn/all.png">
											</c:otherwise>
										</c:choose>
								</span>${movielist.movie_name}</a>
							</dt>
							<dd>
									<span class="rate">예매율 ${movielist.movie_rate}
									%</span> <span class="list_score">&nbsp;|&nbsp;&nbsp;관람평점
									${movielist.movie_score} 점</span>
							</dd>
 						</dl>
 					</li> 
				</c:forEach>
			</ul>

			<%-- <ul class="curr_list movie_clist">
					<c:forEach var="movielist" items="${movielist}" varStatus="stat">

						<c:url var="viewURL" value="/movieView.see">
							<c:param name="movie_no" value="${movielist.movie_no }" />
						</c:url>
						<c:url var="deleteURL" value="/admin/movieDelete.see">
							<c:param name="movie_no" value="${movielist.movie_no}" />
						</c:url>
						<c:url var="ModifyURL" value="/admin/movieUpdate.see">
							<c:param name="movie_no" value="${movielist.movie_no}" />
						</c:url>

						<li class=""><a href="javascript:void(0)";> <img
								src="<%= cp %>/resources/upload/movie/main_movie/${movielist.movie_poster}">
						</a> <!-- <br/>
				<p><font size=2>&nbsp&nbsp&nbsp${movielist.movie_name}</font></p>
				<br/>
				<p>&nbsp&nbsp&nbsp${movielist.movie_date}</p> --> <p>${movielist.movie_name}</p>


							<div class="layer_hover">
								<a href="${ModifyURL}" class="btn_View">수정하기</a> <a
									href="${deleteURL}" class="btn_View"
									onclick="return del_check()">삭제하기</a>
								<a href="${viewURL}" class="btn_View">상세보기</a>
							</div></li>
					</c:forEach>
				</ul> --%>

		</div>
		<!-- // movie_list -->

		<div class="btn_type_03">
			<a href="<%=cp%>/admin/movieWrite.see" class="btn btnC_03 btnP_04">
				<span>글쓰기</span>
			</a>
		</div>

		<div class="paging">${pagingHtml}</div>

		<!-- paging 
		<div class="paging">
			<a href="#none" class="page prv">&lt;</a> <strong>1</strong> <a
				href="#none" class="page">2</a> <a href="#none" class="page">3</a> <a
				href="#none" class="page">4</a> <a href="#none" class="page">5</a> <a
				href="#none" class="page next">&gt;</a>
		</div>  paging -->
		<%-- <div class="paging">
			${pagingHtml}
		</div> --%>
	</div>
</div>