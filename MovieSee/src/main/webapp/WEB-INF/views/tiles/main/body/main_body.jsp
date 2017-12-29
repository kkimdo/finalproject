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
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<title>MovieSee</title>
<script src="<%=cp%>/resources/js/design-1.0.min.js?ver=20171221"></script>
<style>
.btn_reserve1 {
	position: absolute;
	left: 0;
	bottom: 0;
	display: block;
	width: 100%;
	background: #ee1c25;
	color: #fff;
	height: 64px;
	line-height: 64px;
	font-weight: bold;
	font-size: 16px;
	text-align: center;
}

.main_key_visual .office .officeCont .officeRk li {
	overflow: hidden;
	height: 45px;
	padding: 2px 0px 0;
	box-sizing: border-box;
}

.tabs-1 {
	padding-top: 20px;
}

.tabs-2 {
	padding-top: 20px;
}

.officeRk li {
	overflow: hidden;
	height: 48px;
	padding: -1px 10px 0;
	box-sizing: border-box;
}

.officeRk li .tit {
	float: left;
	display: table;
	height: 30px;
	color: #1a1917;
	font-size: 14px;
	font-weight: bold;
	letter-spacing: -0.5px;
}

.officeRk li .memRk {
	float: right;
	display: inline-block;
	height: 30px;
	line-height: 30px;
	color: #666;
	font-size: 13px;
}

.officeRk li .tit em {
	display: inline-block;
	vertical-align: middle;
	height: 30px;
	line-height: 30px;
	padding-right: 5px;
	font-family: 'linlivertine';
	font-style: italic;
	font-weight: bold;
	font-size: 20px;
}

.officeTab li a {
	display: inline-block;
	padding-bottom: 3px;
	padding-top: 3px;
	color: black;
}
</style>

</head>
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

			<li class=""><a href="<%=cp%>/aMovieList.see" title="영화">영화</a>
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
				<div class="depth">
					<ul>
						<li><a href="<%=cp%>/event/eventList_1.see" title="영화">영화</a></li>
						<li><a href="<%=cp%>/event/eventList_2.see" title="시사회/무대인사">시사회/무대인사</a></li>
						<li><a href="<%=cp%>/event/eventList_3.see" title="롯시NOW">롯시NOW</a></li>
						<li><a href="<%=cp%>/event/eventList_4.see" title="제휴할인">제휴할인</a></li>
					</ul>
				</div></li>
			<li><a href="<%=cp%>/gift/giftShopList.see" title="기프트샵">기프트샵</a>
			</li>

		</ul>
	</div>
	<div id="container" class="main">

		<div class="mKeyVi">
			<div class="main_key_visual">
				<div class="event" style="right: 1020px;">
					<ul>
						<li style="right: 0px;"><a href="javascript:void(0);"
							onclick="goEventDetail('201170016917001','117')"> <img
								src="http://caching.lottecinema.co.kr//Media/WebAdmin/51b6cb04964f45d3aaa5a3076891dc11.jpg"
								alt="디즈니매니아라면 역대급 경품을 GET하라!"></a></li>
					</ul>
				</div>

				<div id="tabs" style="left: 0px;">
					<div class="office">
						<div class="officeTop">
							<h2 style="color: white">BOX OFFICE</h2>
							<ul class="officeTab">
								<li><a href="#tabs-1">예매순</a></li>
								<li><a href="#tabs-2">평점순</a></li>
							</ul>
						</div>
						<div id="tabs-1">
							<c:forEach var="movieRate" items="${movieRate}" varStatus="stat"
								begin="0" end="9">
								<c:url var="viewURL" value="/movieView.see">
									<c:param name="movie_no" value="${movieRate.movie_no }" />
								</c:url>

								<c:set value="${movieRate.movie_age}" var="movie_age" />
								<c:set value="12" var="12" />
								<c:set value="15" var="15" />
								<c:set value="0" var="0" />
								<ol class="officeRk">
									<div class="blind">
										<h3>예매순</h3>
									</div>
									<li class=""><a href="${viewURL}"
										onmouseover="currentMovie(this)"
										onclick="goToTiketing('11981')" class="tit"> <em>
												${stat.count}. </em> <span> <c:choose>
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
										</span> <span class="mvTit">
												&nbsp;&nbsp;${movieRate.movie_name} </span>
									</a> <span class="memRk">예매율<em>${movieRate.movie_rate}
												%</em></span></li>
								</ol>
							</c:forEach>
						</div>

						<div id="tabs-2">
							<c:forEach var="movieScore" items="${movieScore}"
								varStatus="stat" begin="0" end="9">
								<c:url var="viewURL" value="/movieView.see">
									<c:param name="movie_no" value="${movieScore.movie_no }" />
								</c:url>

								<c:set value="${movieScore.movie_age}" var="movie_age" />
								<c:set value="12" var="12" />
								<c:set value="15" var="15" />
								<c:set value="0" var="0" />
								<ol class="officeRk">
									<div class="blind">
										<h3>평점순</h3>
									</div>
									<li class=""><a href="${viewURL}"
										onmouseover="currentMovie(this)"
										onclick="goToTiketing('11981')" class="tit"> <em>
												${stat.count}. </em> <span> <c:choose>
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
										</span> <span class="mvTit">
												&nbsp;&nbsp;${movieScore.movie_name} </span>
									</a> <span class="memRk">관람평점<em>${movieScore.movie_score}</em></span></li>
								</ol>
							</c:forEach>
						</div>

						<a href="<%=cp%>/reserve/movieTicketing.see" class="btn_reserve1">예매하기</a>
					</div>

				</div>
				<div class="trailer" style="left: 335px;">
					<ul>
						<li style="left: 0px;">



							<div class="swiper-container_main swiper-container-horizontal">
								<div class="swiper-wrapper"
									style="transition-duration: 0ms; transform: translate3d(-1145px, 0px, 0px);">
									<div
										class="swiper-slide swiper-slide-duplicate swiper-slide-prev"
										data-swiper-slide-index="5"
										style="width: 1115px; margin-right: 30px;">
										<div
											style="width: 1115px; height: 645px; background: url(http://caching2.lottecinema.co.kr/lotte_image/2017/Gintama/Gintama_1115645.jpg) 50% 0px no-repeat;">
											<p tabindex="0"
												style="width: 135px; height: 135px; cursor: pointer; position: absolute; left: 255px; top: 255px;"
												onkeyup="javascript:adi_lottecinema_20171123_23_fn_MoviePlay(1)"
												onclick="javascript:adi_lottecinema_20171123_23_fn_MoviePlay(2)"
												title="은혼 12월 7일 대개봉! 은혼 액션, 모험, 코미디 일본 131분 12세 이상 관람가 상세보기"
												재생”=""></p>
											<p tabindex="0"
												style="width: 150px; height: 50px; cursor: pointer; position: absolute; left: 455px; top: 555px;"
												onkeyup="javascript:adi_lottecinema_20171123_23_bannerlink_top(1)"
												onclick="javascript:adi_lottecinema_20171123_23_bannerlink_top(2)"
												title="은혼 12월 7일 대개봉! 은혼 액션, 모험, 코미디 일본 131분 12세 이상 관람가 상세보기"
												재생”=""></p>
										</div>
									</div>
									<div class="swiper-slide swiper-slide-active"
										data-swiper-slide-index="0"
										style="width: 1115px; margin-right: 30px;">
										<div
											style="width: 1115px; height: 645px; background: url(http://caching2.lottecinema.co.kr/lotte_image/2017/Showman/Showman_1115645.jpg) 50% 0px no-repeat;">
											<p tabindex="0"
												style="width: 135px; height: 135px; cursor: pointer; position: absolute; left: 255px; top: 255px;"
												onkeyup="javascript:adi_lottecinema_20171201_66_fn_MoviePlay(1)"
												onclick="javascript:adi_lottecinema_20171201_66_fn_MoviePlay(2)"
												title="아카데미 음악상 수상 라라랜드 작사팀 OST 불가능한 꿈, 그 이상의 쇼! 위대한 쇼맨 위대한 쇼맨 드라마, 뮤지컬 미국 104분 관람등급 미정 12월 대개봉 상세보기"
												재생”=""></p>
											<p tabindex="0"
												style="width: 150px; height: 50px; cursor: pointer; position: absolute; left: 455px; top: 555px;"
												onkeyup="javascript:adi_lottecinema_20171201_66_bannerlink_top(1)"
												onclick="javascript:adi_lottecinema_20171201_66_bannerlink_top(2)"
												title="아카데미 음악상 수상 라라랜드 작사팀 OST 불가능한 꿈, 그 이상의 쇼! 위대한 쇼맨 위대한 쇼맨 드라마, 뮤지컬 미국 104분 관람등급 미정 12월 대개봉 상세보기"
												재생”=""></p>
										</div>
									</div>
									<div class="swiper-slide swiper-slide-next"
										data-swiper-slide-index="1"
										style="width: 1115px; margin-right: 30px;">
										<div
											style="width: 1115px; height: 645px; background: url(http://caching2.lottecinema.co.kr/lotte_image/2017/WithGod/WithGod_1115645.jpg) 50% 0px no-repeat;">
											<p tabindex="0"
												style="width: 135px; height: 135px; cursor: pointer; position: absolute; left: 255px; top: 255px;"
												onkeyup="javascript:adi_lottecinema_20171201_17_fn_MoviePlay(1)"
												onclick="javascript:adi_lottecinema_20171201_17_fn_MoviePlay(2)"
												title="신과 함께 죄와 벌 12월 20일 대개봉 신과함께-죄와 벌 판타지, 드라마 한국 139분 12세이상관람가 상세보기"
												재생”=""></p>
											<p tabindex="0"
												style="width: 150px; height: 50px; cursor: pointer; position: absolute; left: 455px; top: 555px;"
												onkeyup="javascript:adi_lottecinema_20171201_17_bannerlink_top(1)"
												onclick="javascript:adi_lottecinema_20171201_17_bannerlink_top(2)"
												title="신과 함께 죄와 벌 12월 20일 대개봉 신과함께-죄와 벌 판타지, 드라마 한국 139분 12세이상관람가 상세보기"
												재생”=""></p>
										</div>
									</div>
									<div class="swiper-slide" data-swiper-slide-index="2"
										style="width: 1115px; margin-right: 30px;">
										<div
											style="width: 1115px; height: 645px; background: url(http://caching2.lottecinema.co.kr/lotte_image/2017/MonsterFamily/MonsterFamily_1115645.jpg) 50% 0px no-repeat;">
											<p tabindex="0"
												style="width: 135px; height: 135px; cursor: pointer; position: absolute; left: 255px; top: 255px;"
												onkeyup="javascript:adi_lottecinema_20171201_27_fn_MoviePlay(1)"
												onclick="javascript:adi_lottecinema_20171201_27_fn_MoviePlay(2)"
												title="온 가족이 몬스터로 변해 버렸다?! 슈퍼배드 제작진 몬스터 패밀리 12월 21일 대개봉 몬스터 패밀리 애니메이션/영국/93분/전체관람가 상세보기"
												재생”=""></p>
											<p tabindex="0"
												style="width: 150px; height: 50px; cursor: pointer; position: absolute; left: 455px; top: 555px;"
												onkeyup="javascript:adi_lottecinema_20171201_27_bannerlink_top(1)"
												onclick="javascript:adi_lottecinema_20171201_27_bannerlink_top(2)"
												title="온 가족이 몬스터로 변해 버렸다?! 슈퍼배드 제작진 몬스터 패밀리 12월 21일 대개봉 몬스터 패밀리 애니메이션/영국/93분/전체관람가"
												재생”=""></p>
										</div>
									</div>
									<div class="swiper-slide" data-swiper-slide-index="3"
										style="width: 1115px; margin-right: 30px;">
										<div
											style="width: 1115px; height: 645px; background: url(http://caching2.lottecinema.co.kr/lotte_image/2017/Pororo/Pororo_1115645.jpg) 50% 0px no-repeat;">
											<p tabindex="0"
												style="width: 135px; height: 135px; cursor: pointer; position: absolute; left: 255px; top: 255px;"
												onkeyup="javascript:adi_lottecinema_20171117_24_fn_MoviePlay(1)"
												onclick="javascript:adi_lottecinema_20171117_24_fn_MoviePlay(2)"
												title="위기에 처한 공룡섬을 구하라! 뽀로로 극장판 공룡섬 대모험 12월 7일 대개봉 뽀로로 극장판 공룡섬 대모험 애니메이션 한국 79분 전체관람가 상세보기"
												재생”=""></p>
											<p tabindex="0"
												style="width: 150px; height: 50px; cursor: pointer; position: absolute; left: 455px; top: 555px;"
												onkeyup="javascript:adi_lottecinema_20171117_24_bannerlink_top(1)"
												onclick="javascript:adi_lottecinema_20171117_24_bannerlink_top(2)"
												title="위기에 처한 공룡섬을 구하라! 뽀로로 극장판 공룡섬 대모험 12월 7일 대개봉 뽀로로 극장판 공룡섬 대모험 애니메이션 한국 79분 전체관람가 상세보기"
												재생”=""></p>
										</div>
									</div>
									<div class="swiper-slide" data-swiper-slide-index="4"
										style="width: 1115px; margin-right: 30px;">
										<div
											style="width: 1115px; height: 645px; background: url(http://caching2.lottecinema.co.kr/lotte_image/2017/SteelRain/SteelRain_1115645.jpg) 50% 0px no-repeat;">
											<p tabindex="0"
												style="width: 135px; height: 135px; cursor: pointer; position: absolute; left: 255px; top: 255px;"
												onkeyup="javascript:adi_lottecinema_20171204_1_fn_MoviePlay(1)"
												onclick="javascript:adi_lottecinema_20171204_1_fn_MoviePlay(2)"
												title="12월 14일 핵전쟁 카운트다운! 첩보 액션 블록버스터 강철비 첩보액션/한국/139분/15세이상관람가 상세보기"
												재생”=""></p>
											<p tabindex="0"
												style="width: 150px; height: 50px; cursor: pointer; position: absolute; left: 455px; top: 555px;"
												onkeyup="javascript:adi_lottecinema_20171204_1_bannerlink_top(1)"
												onclick="javascript:adi_lottecinema_20171204_1_bannerlink_top(2)"
												title="12월 14일 핵전쟁 카운트다운! 첩보 액션 블록버스터 강철비 첩보액션/한국/139분/15세이상관람가 상세보기"
												재생”=""></p>
										</div>
									</div>
									<div class="swiper-slide swiper-slide-duplicate-prev"
										data-swiper-slide-index="5"
										style="width: 1115px; margin-right: 30px;">
										<div
											style="width: 1115px; height: 645px; background: url(http://caching2.lottecinema.co.kr/lotte_image/2017/Gintama/Gintama_1115645.jpg) 50% 0px no-repeat;">
											<p tabindex="0"
												style="width: 135px; height: 135px; cursor: pointer; position: absolute; left: 255px; top: 255px;"
												onkeyup="javascript:adi_lottecinema_20171123_23_fn_MoviePlay(1)"
												onclick="javascript:adi_lottecinema_20171123_23_fn_MoviePlay(2)"
												title="은혼 12월 7일 대개봉! 은혼 액션, 모험, 코미디 일본 131분 12세 이상 관람가 상세보기"
												재생”=""></p>
											<p tabindex="0"
												style="width: 150px; height: 50px; cursor: pointer; position: absolute; left: 455px; top: 555px;"
												onkeyup="javascript:adi_lottecinema_20171123_23_bannerlink_top(1)"
												onclick="javascript:adi_lottecinema_20171123_23_bannerlink_top(2)"
												title="은혼 12월 7일 대개봉! 은혼 액션, 모험, 코미디 일본 131분 12세 이상 관람가 상세보기"
												재생”=""></p>
										</div>
									</div>
									<div
										class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-active"
										data-swiper-slide-index="0"
										style="width: 1115px; margin-right: 30px;">
										<div
											style="width: 1115px; height: 645px; background: url(http://caching2.lottecinema.co.kr/lotte_image/2017/Showman/Showman_1115645.jpg) 50% 0px no-repeat;">
											<p tabindex="0"
												style="width: 135px; height: 135px; cursor: pointer; position: absolute; left: 255px; top: 255px;"
												onkeyup="javascript:adi_lottecinema_20171201_66_fn_MoviePlay(1)"
												onclick="javascript:adi_lottecinema_20171201_66_fn_MoviePlay(2)"
												title="아카데미 음악상 수상 라라랜드 작사팀 OST 불가능한 꿈, 그 이상의 쇼! 위대한 쇼맨 위대한 쇼맨 드라마, 뮤지컬 미국 104분 관람등급 미정 12월 대개봉 상세보기"
												재생”=""></p>
											<p tabindex="0"
												style="width: 150px; height: 50px; cursor: pointer; position: absolute; left: 455px; top: 555px;"
												onkeyup="javascript:adi_lottecinema_20171201_66_bannerlink_top(1)"
												onclick="javascript:adi_lottecinema_20171201_66_bannerlink_top(2)"
												title="아카데미 음악상 수상 라라랜드 작사팀 OST 불가능한 꿈, 그 이상의 쇼! 위대한 쇼맨 위대한 쇼맨 드라마, 뮤지컬 미국 104분 관람등급 미정 12월 대개봉 상세보기"
												재생”=""></p>
										</div>
									</div>
								</div>
								<div
									class="swiper-pagination swiper-pagination-white swiper-pagination-clickable swiper-pagination-bullets">
									<span
										class="swiper-pagination-bullet swiper-pagination-bullet-active">
									</span> <span class="swiper-pagination-bullet"> </span> <span
										class="swiper-pagination-bullet"> </span> <span
										class="swiper-pagination-bullet"> </span> <span
										class="swiper-pagination-bullet"> </span> <span
										class="swiper-pagination-bullet"> </span>
								</div>
								<!--<div class="swiper-button-next swiper-button-white"></div>-->
								<!--<div class="swiper-button-prev swiper-button-white"></div>-->
							</div>
						</li>
					</ul>
				</div>
				<a href="javascript:void(0);" class="prev">prev</a> <a
					href="javascript:void(0);" class="next">next</a>
			</div>
		</div>

		<!-- 영화리스트 -->
		<div class="slidePoster">
			<div class="slide">
				<ul style="left: 0px;">
					<c:forEach var="list" items="${list}" varStatus="stat" begin="1"
						end="5">
						<c:url var="viewURL" value="/movieView.see">
							<c:param name="movie_no" value="${list.movie_no }" />
						</c:url>
						<c:url var="reserveURL" value="/movieTicketing.see">
							<c:param name="movie_no" value="${list.movie_no}" />
						</c:url>
						<li class=""><a href="javascript:void(0)";> <img
								src="<%= cp %>/resources/upload/movie/main_movie/${list.movie_poster}">
						</a>
							<div class="layer_hover">
								<a href="<%=cp%>/reserve/movieTicketing.see"
									onclick="goToTiketing()" class="btn_reserve">예매하기</a> <a
									href="${viewURL}" class="btn_View">상세보기</a>

							</div></li>
					</c:forEach>
				</ul>

				<ul style="left: 980px;">
					<c:forEach var="list" items="${list}" varStatus="stat" begin="6"
						end="10">
						<c:url var="viewURL" value="/movieView.see">
							<c:param name="movie_no" value="${list.movie_no }" />
						</c:url>
						<c:url var="reserveURL" value="/movieTicketing.see">
							<c:param name="movie_no" value="${list.movie_no}" />
						</c:url>
						<li class=""><a href="javascript:void(0)";> <img
								src="<%= cp %>/resources/upload/movie/main_movie/${list.movie_poster}">
						</a>
							<div class="layer_hover">
								<a href="${reserveURL}" onclick="goToTiketing()"
									class="btn_reserve">예매하기</a> <a href="${viewURL}"
									class="btn_View">상세보기</a>

							</div></li>
					</c:forEach>
				</ul>

				<ul style="left: 1960px;">
					<c:forEach var="list" items="${list}" varStatus="stat" begin="11"
						end="15">
						<c:url var="viewURL" value="/movieView.see">
							<c:param name="movie_no" value="${list.movie_no }" />
						</c:url>
						<c:url var="reserveURL" value="/movieTicketing.see">
							<c:param name="movie_no" value="${list.movie_no}" />
						</c:url>
						<li class=""><a href="javascript:void(0)";> <img
								src="<%= cp %>/resources/upload/movie/main_movie/${list.movie_poster}">
						</a>
							<div class="layer_hover">
								<a href="<%=cp%>/reserve/movieTicketing.see"
									onclick="goToTiketing()" class="btn_reserve">예매하기</a> <a
									href="${viewURL}" class="btn_View">상세보기</a>

							</div></li>
					</c:forEach>
				</ul>
			</div>
			<%-- <ul style="left:1080px;">
<c:forEach var="list" items="${list}" varStatus="stat" >
<c:url var="viewURL" value="/movieView.see">
   <c:param name="movie_no" value="${list.movie_no }"/>
   <c:param name="currentPage" value="${currentPage }" />
</c:url>
<li class="">
<a href="javascript:void(0)";>
<img src="<%= cp %>/resources/upload/movie/main_movie/${list.movie_poster}">
</a>
<div class="layer_hover">
<a href="javascript:void(0);" onclick="goToTiketing()" class="btn_reserve">예매하기</a>
<a href="${viewURL}" class="btn_View">상세보기</a>

</div>
</li>
</c:forEach>
</ul> --%>
			<div class="btnSt">
				<a href="#n" class="prev" style="">이전</a> <a href="#n"
					class="next on">다음</a>
			</div>
		</div>

		<!-- 고정배너 CHARLOTTE -->
		<div class="banner_box">
			<div class="banner_thum">
				<ul style="left: 0px;">
					<li><a href="#" onclick=""> <img
							src="<%=cp%>/resources/upload/movie/banner/charlotte.jpg"
							alt="샤무비씨바로가기"></a></li>
					<li><a href="#" onclick=""> <img
							src="<%=cp%>/resources/upload/movie/banner/cineBiz.jpg"
							alt="수퍼플렉스 G 바로가기"></a></li>
					<li><a href="#" onclick=""><img
							src="<%=cp%>/resources/upload/movie/banner/cinecouple.jpg"
							alt="-"></a></li>
					<li><a href="#" onclick=""><img
							src="<%=cp%>/resources/upload/movie/banner/cineFamily.jpg"
							alt="수퍼플렉스 바로가기"></a></li>
					<li><a href="#" onclick=""><img
							src="<%=cp%>/resources/upload/movie/banner/super4d.jpg"
							alt="수퍼4D 바로가기"></a></li>
					<li><a href="#" onclick=""><img
							src="<%=cp%>/resources/upload/movie/banner/superflex.jpg"
							alt="씨네패밀리 바로가기"></a></li>
					<li><a href="#" onclick=""><img
							src="<%=cp%>/resources/upload/movie/banner/superg.jpg"
							alt="씨네커플 바로가기"></a></li>
					<li><a href="#" onclick=""><img
							src="<%=cp%>/resources/upload/movie/banner/supers.jpg"
							alt="씨네비즈 바로가기"></a></li>
				</ul>

				<%-- <c:forEach var="banner" items="${banner}" varStatus="stat">
<li>
<img src="<%= cp %>/resources/upload/movie/banner/${banner.movie_banner}">

</li>
</ul>
</c:forEach> --%>
			</div>
		</div>

		<!-- Event배너 -->
		<div class="eventBxMain">
			<h2>
				<strong>Event</strong>
			</h2>
			<div class="eventBxMain_in">

				<div class="flbx">

					<ul class="fl">
						<li class="pbBn"><a href="javascript:void(0)"> <img
								src="<%= cp %>/resources/upload/movie/main_movie/${bannerselect.banner_left}">
						</a></li>

						<li><a href="javascript:void(0)"> <img
								src="<%= cp %>/resources/upload/movie/main_movie/${bannerselect.banner_left1}">
						</a></li>
					</ul>
					<!-- flbx까지 -->

					<ul class="fr">
						<li class="pbBn"><a href="javascript:void(0)"> <img
								src="<%= cp %>/resources/upload/movie/main_movie/${bannerselect.banner_center}">
						</a></li>

						<li><a href="javascript:void(0)"> <img
								src="<%= cp %>/resources/upload/movie/main_movie/${bannerselect.banner_center1}">
						</a></li>
					</ul>

					<a href="javascript:void(0);" class="pbBnT"> <img
						src="<%= cp %>/resources/upload/movie/main_movie/${bannerselect.banner_bottom}">
					</a>
				</div>

				<ul class="fr">

					<li class="pbBn"><a href="javascript:void(0)"> <img
							src="<%= cp %>/resources/upload/movie/main_movie/${bannerselect.banner_right}">
					</a></li>

					<li><img
						src="<%= cp %>/resources/upload/movie/main_movie/${bannerselect.banner_right1}">
					</li>

				</ul>
			</div>
		</div>

		<!-- 할인안내/포인트/VIP/틴틴클럽/브라보클럽 -->
		<div class="bnShortcuts">
			<ul class="shortList">
				<!-- 반복문  -->
				<li><a href="www.naver.com"> <img
						src="<%=cp%>/resources/upload/movie/banner/sale.gif">
				</a></li>

				<li><a href=""> <img
						src="<%=cp%>/resources/upload/movie/banner/point.gif">
				</a></li>


				<li><a href=""> <img
						src="<%=cp%>/resources/upload/movie/banner/vip.gif">
				</a></li>

				<li><a href=""><img
						src="<%=cp%>/resources/upload/movie/banner/tintin.gif"> </a></li>

				<li><a href=""> <img
						src="<%=cp%>/resources/upload/movie/banner/bravo.gif">
				</a></li>
			</ul>
		</div>

		<div style="display: none;" id="AD_PC_02"></div>
	</div>
	<script>
		var swiper = new Swiper('.swiper-container', {
			spaceBetween : 30,
			centeredSlides : true,
			autoplay : {
				delay : 2500,
				disableOnInteraction : false,
			},
			pagination : {
				el : '.swiper-pagination',
				clickable : true,
			},
			navigation : {
				nextEl : '.swiper-button-next',
				prevEl : '.swiper-button-prev',
			},
		});

		$(function() {
			var idx = idx2 = 0;
			var slide_width = $(".slide").width();
			var slide_count = $(".slide li").size();
			$("#slider li:first").css("display", "block");
			if (slide_count > 1)
				$(".btn").css("display", "inline");

			$(".prev").click(
					function() {
						if (slide_count > 1) {
							idx2 = (idx - 1) % slide_count;
							if (idx2 < 0)
								idx2 = slide_count - 1;
							$(".slide ul").css("left", "+=" + 980 + "px");
							$("#slider li:eq(" + idx + ")").animate(
									{
										left : "+=" + slide_width + "px"
									},
									time,
									function() {
										$(this).css("display", "none").css(
												"left",
												"-" + slide_width + "px");
									});
							$("#slider li:eq(" + idx2 + ")").css("display",
									"block").animate({
								left : "+=" + slide_width + "px"
							}, time);
							idx = idx2;
						}
					});

			$(".next.on").click(
					function() {
						if (slide_count > 1) {
							idx2 = (idx + 1) % slide_count;
							$(".slide ul").css("left", "-=" + 980 + "px");
							$("#slider li:eq(" + idx + ")").animate(
									{
										left : "-=" + 980 + "px"
									},
									time,
									function() {
										$(this).css("display", "none").css(
												"left", slide_width + "px");
									});
							$("#slider li:eq(" + idx2 + ")").css("display",
									"block").animate({
								left : "-=" + slide_width + "px"
							}, time);
							idx = idx2;
						}
					});
		});

		$(function() {
			$("#tabs").tabs();
		});
	</script>
</body>
</html>