<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>영화 상세보기</title>
<script type="text/javascript">
	//코멘트 처리
	var onComment = function() {
		var form = $('.commentForm')[0];
		form.action = 'commentWrite.see';
		form.submit();
	};
</script>
<style> /* 댓글 */
.btn-primary1 {
	color: #fff;
	background-color: #2a2e33;
	border-color: #2a2e33;
}

.reply_write {
	position: relative;
	top: 0;
	left: 0;
	padding-right: 110px;
}

.btn1 {
	width: 80px;
	height: 70px;
}

.soyoon li {
	display: inline !important;
	float: left !important;
}

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
	-webkit-box-shadow: 1px 1px 1px 0px rgba(235, 235, 235, 1);
	-moz-box-shadow: 1px 1px 1px 0px rgba(235, 235, 235, 1);
	box-shadow: 1px 1px 1px 0px rgba(235, 235, 235, 1);
}
</style>
</head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=cp%>/w3.css">
<link rel="stylesheet" type="text/css"
	href="<%=cp%>/resources/css/w3.css?ver=20171212" />
<link rel="stylesheet" type="text/css"
	href="<%=cp%>/resources/css/reset.css?ver=20171219" />
<style>
.mySlides {
	display: none
}

.demo {
	cursor: pointer
}
</style>

<body>
	<div class="gnb">
		<ul>
			<li><a href="<%=cp%>/reserve/movieTicketing.see" title="예매">예매</a>
				<div class="depth"></div>
				<ul>
					<li></li>
					<li></li>
					<li></li>
				</ul></li>

			<li class="active"><a href="<%=cp%>/aMovieList.see" title="영화">영화</a>
				<div class="depth">

					<ul>
						<li class=""><a href="<%=cp%>/aMovieList.see" title="박스오피스">박스오피스</a></li>
						<li class=""><a href="<%=cp%>/bMovieList.see" title="아르떼">아르떼</a></li>
						<li class=""><a href="<%=cp%>/cMovieList.see" title="G시네마">G시네마</a></li>
						<li class=""><a href="<%=cp%>/dMovieList.see"
							title="중국영화상영관/영화제">중국영화상영관/영화제</a></li>
						<li class=""><a href="<%=cp%>/eMovieList.see" title="오페라">오페라</a></li>
					</ul>
				</div></li>

			<li><a href="<%=cp%>/aMovieTheater.see" title="영화관">영화관</a>
				<div class="depth"></div></li>

			<li><a href="<%=cp%>/event/eventListMain.see" title="이벤트">이벤트</a>
			</li>

			<li><a href="<%=cp%>/gift/giftShopList.see" title="기프트샵">기프트샵</a></li>

		</ul>
	</div>

	<div id="container" class="sub">
		<%-- <c:forEach var="movieModel" items="${movieModel}" varStatus="stat"> --%>
		<!-- content -->
		<div id="content">
            <div class="w3-content" style="max-width: 900px">
               <img class="mySlides" src="<%= cp %>/resources/upload/movie/main_movie/${movieModel.movie_stillcut}" style="width: 100%" onerror="this.src='<%= cp %>/resources/upload/movie/movie_type/no.png'">
               <img class="mySlides" src="<%= cp %>/resources/upload/movie/main_movie/${movieModel.movie_stillcut1}" style="width: 100%" onerror="this.src='<%= cp %>/resources/upload/movie/movie_type/no.png'">
               <img class="mySlides" src="<%= cp %>/resources/upload/movie/main_movie/${movieModel.movie_stillcut2}" style="width: 100%" onerror="this.src='<%= cp %>/resources/upload/movie/movie_type/no.png'">
               <img class="mySlides" src="<%= cp %>/resources/upload/movie/main_movie/${movieModel.movie_stillcut3}" style="width: 100%" onerror="this.src='<%= cp %>/resources/upload/movie/movie_type/no.png'">
               <img class="mySlides" src="<%= cp %>/resources/upload/movie/main_movie/${movieModel.movie_stillcut4}" style="width: 100%" onerror="this.src='<%= cp %>/resources/upload/movie/movie_type/no.png'">
               
               <div class="w3-row-padding w3-section">
                  <div class="w3-col s4">
                     <img class="demo w3-opacity w3-hover-opacity-off" src="<%= cp %>/resources/upload/movie/main_movie/${movieModel.movie_stillcut}" style="width: 100%"
                        onclick="currentDiv(1)" onerror="this.src='<%= cp %>/resources/upload/movie/movie_type/no.png'">
                  </div>
                  <div class="w3-col s4">
                     <img class="demo w3-opacity w3-hover-opacity-off" src="<%= cp %>/resources/upload/movie/main_movie/${movieModel.movie_stillcut1}" style="width: 100%"
                        onclick="currentDiv(2)" onerror="this.src='<%= cp %>/resources/upload/movie/movie_type/no.png'">
                  </div>
                  <div class="w3-col s4">
                     <img class="demo w3-opacity w3-hover-opacity-off" src="<%= cp %>/resources/upload/movie/main_movie/${movieModel.movie_stillcut2}" style="width: 100%"
                        onclick="currentDiv(3)" onerror="this.src='<%= cp %>/resources/upload/movie/movie_type/no.png'">
                  </div>
                  <div class="w3-col s4">
                     <img class="demo w3-opacity w3-hover-opacity-off" src="<%= cp %>/resources/upload/movie/main_movie/${movieModel.movie_stillcut3}" style="width: 100%"
                        onclick="currentDiv(4)" onerror="this.src='<%= cp %>/resources/upload/movie/movie_type/no.png'">
                  </div>
                  <div class="w3-col s4">
                     <img class="demo w3-opacity w3-hover-opacity-off" src="<%= cp %>/resources/upload/movie/main_movie/${movieModel.movie_stillcut4}" style="width: 100%"
                        onclick="currentDiv(5)" onerror="this.src='<%= cp %>/resources/upload/movie/movie_type/no.png'">
                  </div>
               </div>
            </div>

			<!-- wide_info_area -->
			<div class="wide_info_area">
				<!--             
<span>
   <script type="text/javascript" src="http://share.naver.net/js/naver_sharebutton.js"></script>
   <script type="text/javascript">
   new ShareNaver.makeButton({"type": "b" , "title":"MovieSee[공유하기]"});
   </script> -->
				</span>

				<!-- 정보 시작부분 -->
				<c:set value="${movieModel.movie_age}" var="movie_age" />
				<c:set value="12" var="12" />
				<c:set value="15" var="15" />
				<c:set value="0" var="0" />

				<!-- 스페셜 상영관 -->
				<c:set value="${movieModel.movie_superG}" var="movie_superG" />
				<c:set value="${movieModel.movie_super}" var="movie_super" />
				<c:set value="${movieModel.movie_4D}" var="movie_4D" />
				<c:set value="${movieModel.movie_superS}" var="movie_superS" />
				<c:set value="${movieModel.movie_private}" var="movie_private" />
				<c:set value="${movieModel.movie_family}" var="movie_family" />
				<c:set value="${movieModel.movie_couple}" var="movie_couple" />
				<c:set value="${movieModel.movie_biz}" var="movie_biz" />
				<c:set value="on" var="on" />
				<c:set value="off" var="off" />

				<div class="wide_inner">
					<div class="wide_top">

						<div class="thumb">

							<span class="img"><img
								src="<%= cp %>/resources/upload/movie/main_movie/${movieModel.movie_poster}"></span>


							<a href="<%=cp%>/reserve/movieTicketing.see"
								class="btn_reserve Lang-LBL0000">예매하기</a>
							<!-- style="display: inline-block;" -->
						</div>
						<div class="info_main">
							<div class="info_data">
								<h2 class="info_tit">${movieModel.movie_name}</h2>
							</div>
							<ul class="ranking_list">
								<li><strong class="rate_tit Lang-LBL0000">예매율</strong> <span
									class="rate_txt"> <em class="num">${movieModel.movie_rate}%</em>
								</span></li>

								<%-- <c:if test="${fn:length(commentlist) ge 0}">
         <p class="reply_num"> </p>
      </c:if>  --%>
								<%-- <c:forEach var="commentlist" items="${commentlist}" varStatus="stat"> --%>
								<li id="score"><strong class="score_member">관람평점</strong> <span
									class=""> <span class="starinner" style="width: 0%;"></span>
								</span> <span class="num">${movieModel.movie_score} 점</span></li>
								<%-- </c:forEach> --%>
							</ul>
							<dl class="info_spec" id="dSpec0">
								<dt>등급</dt>
								<dd id="dVClass">
									<c:choose>
										<c:when test="${movie_age eq '12' }">
											<p>12세 관람가</p>
										</c:when>
										<c:when test="${movie_age eq '15' }">
											<p>15세 관람가</p>
										</c:when>
										<c:otherwise>
											<p>전체 관람가</p>
										</c:otherwise>
									</c:choose>
								</dd>
								<dt>개봉일</dt>
								<dd id="dReleaseDate">
									<fmt:formatDate value="${movieModel.movie_date }"
										pattern="yyyy.MM.dd"></fmt:formatDate>
								</dd>

								<dt>기본정보</dt>
								<dd id="dBaseInfo">${movieModel.movie_genre}</dd>
							</dl>
							<dl class="info_spec" id="dSpec1">
								<dt>타입</dt>
								<dd>${movieModel.movie_type}</dd>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<dt>공유하기</dt>
								<dd>
									&nbsp;&nbsp;
									<script type="text/javascript"
										src="http://share.naver.net/js/naver_sharebutton.js"></script>
									<script type="text/javascript">
										new ShareNaver.makeButton({
											"type" : "c",
											"title" : "MovieSee[공유하기]"
										});
									</script>
								</dd>
							</dl>

							<ul class="sns_list">
								<li></li>
							</ul>
							<strong class="info_stit Lang-LBL0000">스페셜관 상영정보</strong>
							<ul class="info_slist" id="ulSpecial">

								<li><c:choose>
										<c:when test="${movie_superG eq 'on' }">
											<img
												src="<%=cp%>/resources/upload/movie/movie_type/superG_on.jpg">
										</c:when>
										<c:when test="${movie_superG eq 'off' }">
											<img
												src="<%=cp%>/resources/upload/movie/movie_type/superG_off.jpg">
										</c:when>
										<c:otherwise>
											<img
												src="<%=cp%>/resources/upload/movie/movie_type/superG_off.jpg">
										</c:otherwise>
									</c:choose></li>
								<li><c:choose>
										<c:when test="${movie_super eq 'on' }">
											<img
												src="<%=cp%>/resources/upload/movie/movie_type/super_on.jpg">
										</c:when>
										<c:when test="${movie_super eq 'off' }">
											<img
												src="<%=cp%>/resources/upload/movie/movie_type/super_off.jpg">
										</c:when>
										<c:otherwise>
											<img
												src="<%=cp%>/resources/upload/movie/movie_type/super_off.jpg">
										</c:otherwise>
									</c:choose></li>
								<li><c:choose>
										<c:when test="${movie_4D eq 'on' }">
											<img
												src="<%=cp%>/resources/upload/movie/movie_type/super4D_on.jpg">
										</c:when>
										<c:when test="${movie_4D eq 'off' }">
											<img
												src="<%=cp%>/resources/upload/movie/movie_type/super4D_off.jpg">
										</c:when>
										<c:otherwise>
											<img
												src="<%=cp%>/resources/upload/movie/movie_type/super4D_off.jpg">
										</c:otherwise>
									</c:choose></li>
								<li><c:choose>
										<c:when test="${movie_superS eq 'on' }">
											<img
												src="<%=cp%>/resources/upload/movie/movie_type/superS_on.jpg">
										</c:when>
										<c:when test="${movie_superS eq 'off' }">
											<img
												src="<%=cp%>/resources/upload/movie/movie_type/superS_off.jpg">
										</c:when>
										<c:otherwise>
											<img
												src="<%=cp%>/resources/upload/movie/movie_type/superS_off.jpg">
										</c:otherwise>
									</c:choose></li>
								<li><c:choose>
										<c:when test="${movie_private eq 'on' }">
											<img
												src="<%=cp%>/resources/upload/movie/movie_type/private_on.jpg">
										</c:when>
										<c:when test="${movie_private eq 'off' }">
											<img
												src="<%=cp%>/resources/upload/movie/movie_type/private_off.jpg">
										</c:when>
										<c:otherwise>
											<img
												src="<%=cp%>/resources/upload/movie/movie_type/private_off.jpg">
										</c:otherwise>
									</c:choose></li>
								<li><c:choose>
										<c:when test="${movie_couple eq 'on' }">
											<img
												src="<%=cp%>/resources/upload/movie/movie_type/couple_on.jpg">
										</c:when>
										<c:when test="${movie_couple eq 'off' }">
											<img
												src="<%=cp%>/resources/upload/movie/movie_type/couple_off.jpg">
										</c:when>
										<c:otherwise>
											<img
												src="<%=cp%>/resources/upload/movie/movie_type/couple_off.jpg">
										</c:otherwise>
									</c:choose></li>
								<li><c:choose>
										<c:when test="${movie_family eq 'on' }">
											<img
												src="<%=cp%>/resources/upload/movie/movie_type/family_on.jpg">
										</c:when>
										<c:when test="${movie_family eq 'off' }">
											<img
												src="<%=cp%>/resources/upload/movie/movie_type/family_off.jpg">
										</c:when>
										<c:otherwise>
											<img
												src="<%=cp%>/resources/upload/movie/movie_type/family_off.jpg">
										</c:otherwise>
									</c:choose></li>
								<li><c:choose>
										<c:when test="${movie_biz eq 'on' }">
											<img
												src="<%=cp%>/resources/upload/movie/movie_type/biz_on.jpg">
										</c:when>
										<c:when test="${movie_biz eq 'off' }">
											<img
												src="<%=cp%>/resources/upload/movie/movie_type/biz_off.jpg">
										</c:when>
										<c:otherwise>
											<img
												src="<%=cp%>/resources/upload/movie/movie_type/biz_off.jpg">
										</c:otherwise>
									</c:choose></li>
							</ul>
						</div>
					</div>

					<div class="obj_section">
						<h3 class="obj_tit Lang-LBL0000">시놉시스</h3>
						<p class="obj_txt" id="pSynopsis">
							<b>${movieModel.movie_story}</b>
						</p>
					</div>

					<div class="score" id="divScoreBoard" style="display: none;">



					</div>
				</div>

			</div>
			<!--// wide_info_area -->

			<!-- mpeople_wrap -->
			<div class="mpeople_wrap">
				<div class="mpeople_inner">
					<h3 class="mpeople_tit Lang-LBL0000">감독 및 출연</h3>


					<div class="slide_mbox">
						<a href="#" class="btn_prev" style="display: none;"> <img
							src="<%=cp%>/resources/upload/movie/btn/btn_slide_prev.png"
							alt="이전">
						</a>


						<div class="slide_spot">
							<ul id="ulCasting">
								<li style="left: 0px;">
									<div class="pic">
										<span class="mask"></span>
										<%-- <c:if test="${fn:length(movie_director_picture) le 0}">
                                    <img src="<%= cp %>/resources/upload/movie/movie_type/movie_no_casting.jpg">
                                 </c:if> --%>
										<img
											src="<%= cp %>/resources/upload/movie/main_movie/${movieModel.movie_director_picture}"
											onerror="this.src='<%= cp %>/resources/upload/movie/movie_type/movie_no_casting.jpg'">
									</div>
									<p class="name">${movieModel.movie_director}</p>
									<p class="role">감독</p>
								</li>

								<li style="left: 168px;">
									<div class="pic">
										<span class="mask"></span> <img
											src="<%= cp %>/resources/upload/movie/main_movie/${movieModel.movie_actor_picture}"
											onerror="this.src='<%= cp %>/resources/upload/movie/movie_type/movie_no_casting.jpg'">
										<%-- <c:if test="${fn:length(movie_actor_picture) le 0}">
                                    <img src="<%= cp %>/resources/upload/movie/movie_type/movie_no_casting.jpg">
                                 </c:if> --%>
									</div>
									<p class="name">${movieModel.movie_actor}</p>
									<p class="role">배우</p>
								</li>

								<li style="left: 336px;">
									<div class="pic">

										<span class="mask"></span> <img
											src="<%= cp %>/resources/upload/movie/main_movie/${movieModel.movie_actor_picture1}"
											onerror="this.src='<%= cp %>/resources/upload/movie/movie_type/movie_no_casting.jpg'">

									</div>
									<p class="name">${movieModel.movie_actor1}</p>
									<p class="role">배우</p>
								</li>

								<li style="left: 504px;">
									<div class="pic">
										<span class="mask"></span> <img
											src="<%= cp %>/resources/upload/movie/main_movie/${movieModel.movie_actor_picture2}"
											onerror="this.src='<%= cp %>/resources/upload/movie/movie_type/movie_no_casting.jpg'">
										<%-- <c:if test="${fn:length(movie_actor_picture2) le 0}">
                                    <img src="<%= cp %>/resources/upload/movie/movie_type/movie_no_casting.jpg">
                                    </c:if> --%>
									</div>
									<p class="name">${movieModel.movie_actor2}</p>
									<p class="role">배우</p>
								</li>

								<li style="left: 672px;">
									<div class="pic">
										<span class="mask"></span> <img
											src="<%=cp%>/resources/upload/movie/movie_type/img_non_actor.jpg">
									</div>
									<p class="name">${movieModel.movie_company}</p>
									<p class="role">제작사</p>
								</li>
							</ul>
						</div>

					</div>
				</div>
			</div>
			<!--//  mpeople_wrap -->
			<!-- review_wrap -->
			<div class="review_wrap" id="divReview">
				<div class="review_top">
					<h3 class="review_tit Lang-LBL0000">평점 및 영화 리뷰</h3>
					<p class="review_etc Lang-LBL0000">영화 후기를 공유해주세요!</p>
				</div>
				<div id="wrapper">
					<div id="page-wrapper">


						<!-- 코멘트 달기 -->
						<div class="inner">
							<!-- reply_grp -->
							<%-- <p class="reply_num">
               댓글 수: <strong>${cmtcount}</strong>
               </p>  --%>

							<form class="commentForm" method="post">
								<input type="hidden" name="view_no"
									value="${movieModel.movie_no}" />



								<div class="reply_grp">
									<div class="reply_form">

										<div class="reply_write">
											<c:if test="${session_member_id == null}">
												<input type="text"
													style="align: center; margin: 10px; width: 950px; height: 55px;"
													value="로그인 후  댓글 작성이 가능합니다." readonly="readonly" />
											</c:if>
											<c:if test="${session_member_id != null}">
												<div class="soyoon" style="align: center">

													<ul>
														<li>&nbsp;&nbsp; <input type="radio"
															name="movie_point" value="1" height="1" checked=""
															class="radio"> <img
															src="<%=cp%>/resources/upload/movie/movie_type/star_on1.gif"
															border="0"><img
															src="<%=cp%>/resources/upload/movie/movie_type/star_off1.gif"
															border="0"><img
															src="<%=cp%>/resources/upload/movie/movie_type/star_off1.gif"
															border="0"><img
															src="<%=cp%>/resources/upload/movie/movie_type/star_off1.gif"
															border="0"><img
															src="<%=cp%>/resources/upload/movie/movie_type/star_off1.gif"
															border="0">
														</li>

														<li><input type="radio" name="movie_point" value="2"
															height="1" class="radio"> <img
															src="<%=cp%>/resources/upload/movie/movie_type/star_on1.gif"
															border="0"><img
															src="<%=cp%>/resources/upload/movie/movie_type/star_on1.gif"
															border="0"><img
															src="<%=cp%>/resources/upload/movie/movie_type/star_off1.gif"
															border="0"><img
															src="<%=cp%>/resources/upload/movie/movie_type/star_off1.gif"
															border="0"><img
															src="<%=cp%>/resources/upload/movie/movie_type/star_off1.gif"
															border="0"></li>

														<li><input type="radio" name="movie_point" value="3"
															height="1" class="radio"> <img
															src="<%=cp%>/resources/upload/movie/movie_type/star_on1.gif"
															border="0"><img
															src="<%=cp%>/resources/upload/movie/movie_type/star_on1.gif"
															border="0"><img
															src="<%=cp%>/resources/upload/movie/movie_type/star_on1.gif"
															border="0"><img
															src="<%=cp%>/resources/upload/movie/movie_type/star_off1.gif"
															border="0"><img
															src="<%=cp%>/resources/upload/movie/movie_type/star_off1.gif"
															border="0"></li>

														<li><input type="radio" name="movie_point" value="4"
															height="1" class="radio"> <img
															src="<%=cp%>/resources/upload/movie/movie_type/star_on1.gif"
															border="0"><img
															src="<%=cp%>/resources/upload/movie/movie_type/star_on1.gif"
															border="0"><img
															src="<%=cp%>/resources/upload/movie/movie_type/star_on1.gif"
															border="0"><img
															src="<%=cp%>/resources/upload/movie/movie_type/star_on1.gif"
															border="0"><img
															src="<%=cp%>/resources/upload/movie/movie_type/star_off1.gif"
															border="0"></li>
														<li><input type="radio" name="movie_point" value="5"
															height="1" class="radio"> <img
															src="<%=cp%>/resources/upload/movie/movie_type/star_on1.gif"
															border="0"><img
															src="<%=cp%>/resources/upload/movie/movie_type/star_on1.gif"
															border="0"><img
															src="<%=cp%>/resources/upload/movie/movie_type/star_on1.gif"
															border="0"><img
															src="<%=cp%>/resources/upload/movie/movie_type/star_on1.gif"
															border="0"><img
															src="<%=cp%>/resources/upload/movie/movie_type/star_on1.gif"
															border="0"></li>
													</ul>
												</div>

												<div class="textarea_grp" style="width: 1000px;">
													<textarea name="commentt"
														style="margin: 10px; width: 874px; height: 71px;"></textarea>
													<button type="button" class="btn1 btn-primary1"
														onclick="onComment()">입력</button>
												</div>
											</c:if>
										</div>

									</div>




									<c:if test="${fn:length(commentlist) ge 0}">
										<p class="reply_num"></p>
									</c:if>
									<c:forEach var="commentlist" items="${commentlist}"
										varStatus="stat">



										<div class="reply_view">
											<div class="reply_tit">
												<div class="tit">
													<strong>${commentlist.cmter}</strong>님
													<div class="so">
														<c:if test='${commentlist.movie_point == 1}'>
      &nbsp;<img
																src="<%=cp%>/resources/upload/movie/movie_type/star_on2.gif"
																border="0" />
															<img
																src="<%=cp%>/resources/upload/movie/movie_type/star_off2.gif"
																border="0" />
															<img
																src="<%=cp%>/resources/upload/movie/movie_type/star_off2.gif"
																border="0" />
															<img
																src="<%=cp%>/resources/upload/movie/movie_type/star_off2.gif"
																border="0" />
															<img
																src="<%=cp%>/resources/upload/movie/movie_type/star_off2.gif"
																border="0" />
														</c:if>
														<c:if test='${commentlist.movie_point == 2}'>
     &nbsp; <img
																src="<%=cp%>/resources/upload/movie/movie_type/star_on2.gif"
																border="0">
															<img
																src="<%=cp%>/resources/upload/movie/movie_type/star_on2.gif"
																border="0">
															<img
																src="<%=cp%>/resources/upload/movie/movie_type/star_off2.gif"
																border="0">
															<img
																src="<%=cp%>/resources/upload/movie/movie_type/star_off2.gif"
																border="0">
															<img
																src="<%=cp%>/resources/upload/movie/movie_type/star_off2.gif"
																border="0">
														</c:if>
														<c:if test='${commentlist.movie_point == 3}'>
     &nbsp; <img
																src="<%=cp%>/resources/upload/movie/movie_type/star_on2.gif"
																border="0">
															<img
																src="<%=cp%>/resources/upload/movie/movie_type/star_on2.gif"
																border="0">
															<img
																src="<%=cp%>/resources/upload/movie/movie_type/star_on2.gif"
																border="0">
															<img
																src="<%=cp%>/resources/upload/movie/movie_type/star_off2.gif"
																border="0">
															<img
																src="<%=cp%>/resources/upload/movie/movie_type/star_off2.gif"
																border="0">
														</c:if>
														<c:if test='${commentlist.movie_point == 4}'>
     &nbsp; <img
																src="<%=cp%>/resources/upload/movie/movie_type/star_on2.gif"
																border="0">
															<img
																src="<%=cp%>/resources/upload/movie/movie_type/star_on2.gif"
																border="0">
															<img
																src="<%=cp%>/resources/upload/movie/movie_type/star_on2.gif"
																border="0">
															<img
																src="<%=cp%>/resources/upload/movie/movie_type/star_on2.gif"
																border="0">
															<img
																src="<%=cp%>/resources/upload/movie/movie_type/star_off2.gif"
																border="0">
														</c:if>
														<c:if test='${commentlist.movie_point == 5}'>
       &nbsp; <img
																src="<%=cp%>/resources/upload/movie/movie_type/star_on2.gif"
																border="0">
															<img
																src="<%=cp%>/resources/upload/movie/movie_type/star_on2.gif"
																border="0">
															<img
																src="<%=cp%>/resources/upload/movie/movie_type/star_on2.gif"
																border="0">
															<img
																src="<%=cp%>/resources/upload/movie/movie_type/star_on2.gif"
																border="0">
															<img
																src="<%=cp%>/resources/upload/movie/movie_type/star_on2.gif"
																border="0">
														</c:if>
														<fmt:formatDate value="${commentlist.cmt_date}"
															pattern="yy.MM.dd"></fmt:formatDate>
													</div>

												</div>

												<c:if test="${session_member_id == commentlist.cmter}">
													<a
														href="commentDelete.see?comment_no=${commentlist.comment_no}&movie_no=${movieModel.movie_no}"
														class="btn btnC_01 btnP_02"> <span
														class="btn btnC_05 reply_btn">삭제</span>
													</a>
												</c:if>
												<c:if test="${session_member_id == 'admin'}">
													<a
														href="commentDelete.see?comment_no=${commentlist.comment_no}&movie_no=${movieModel.movie_no}"
														class="btn btnC_01 btnP_02"> <span
														class="btn btnC_05 reply_btn">삭제</span>
													</a>
												</c:if>
											</div>

											<div class="reply_cts">
												<p>${commentlist.commentt}</p>
											</div>
										</div>

									</c:forEach>

								</div>
								<!-- // reply_grp -->

								<div class="paging">${pagingHtml2 }</div>

							</form>
						</div>
					</div>
				</div>

				<div class="warn_sbox">
					<strong class="warn_tit">유의사항</strong>
					<!-- 0313 수정 -->
					<ul class="warn_list">
						<li>리뷰 작성에 대한 L.POINT는 익일 적립되며, 관람 후 초기 1회에 대해서만 적립됩니다.</li>
						<li>수정/삭제 후 재등록 시에는 포인트 적립이 되지 않습니다.</li>
						<li>리뷰는 관람 내역당 1회만 작성 가능하며, 상영 종료된 영화의 리뷰는 작성 불가합니다.</li>
						<li>작성하신 리뷰는 마이시네마 &gt; 무비히스토리 &gt; 나의 리뷰에서 확인하실 수 있습니다.</li>
						<li>관람 평점은 롯데시네마에서 실제 관람한 회원의 평점입니다.</li>

					</ul>
					<!-- //0313 수정 -->
				</div>

				<!-- banner_wrap -->

				<!-- //banner_wrap -->
			</div>
			<!-- //review_wrap -->


			<!-- event_fwrap -->

			<!-- //event_fwrap -->
		</div>
		<%-- </c:forEach> --%>
	</div>

	<script>
		var slideIndex = 1;
		showDivs(slideIndex);

		function plusDivs(n) {
			showDivs(slideIndex += n);
		}

		function currentDiv(n) {
			showDivs(slideIndex = n);
		}

		function showDivs(n) {
			var i;
			var x = document.getElementsByClassName("mySlides");
			var dots = document.getElementsByClassName("demo");
			if (n > x.length) {
				slideIndex = 1
			}
			if (n < 1) {
				slideIndex = x.length
			}
			for (i = 0; i < x.length; i++) {
				x[i].style.display = "none";
			}
			for (i = 0; i < dots.length; i++) {
				dots[i].className = dots[i].className.replace(
						" w3-opacity-off", "");
			}
			x[slideIndex - 1].style.display = "block";
			dots[slideIndex - 1].className += " w3-opacity-off";
		}
	</script>
</body>
</html>