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

<title>MovieSee</title>

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
				<div class="depth"></div>
				<ul>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
				</ul></li>

			<li><a
				href="http://event.lottecinema.co.kr/LCHS/Contents/Event/event-summary-list.aspx"
				title="이벤트">이벤트</a>
				<div class="depth">
					<ul>
						<li></li>
						<li></li>
						<li></li>
						<li></li>
						<li></li>
					</ul>
				</div></li>

			<li><a
				href="http://www.lottecinema.co.kr/LCHS/Contents/Cinema-Mall/gift-shop.aspx"
				title="기프트샵">기프트샵</a></li>

		</ul>
	</div>
	<div id="container" class="main">

		<div class="mKeyVi">
			<div class="main_key_visual">
				<div class="event"></div>
				<div class="office">
					<div class="office">
						<div class="officeTop">
							<h2>
								<img src="/LCHS/Image/Main/h2_boxoffice.png" alt="BOX OFFICE">
							</h2>
							<ul class="officeTab">
								<li class="on"><a href="javascript:void(0);"
									onclick="setMainRankList(this,'1')">예매순</a></li>
								<li><a href="javascript:void(0);"
									onclick="setMainRankList(this,'3')">평점순</a></li>
							</ul>
						</div>
						<div class="officeCont">
							<ol class="officeRk">
								<div class="blind">
									<h3>예매순</h3>
								</div>
								<li class=""><a href="javascript:void(0)"
									onmouseover="currentMovie(this)"
									onclick="goToTiketing('11981')" class="tit"><em>1.</em> <span
										class="grade_15">15</span><span class="mvTit">꾼</span></a> <span
									class="memRk">예매율<em>15.4%</em></span></li>
								<li class="active"><a href="javascript:void(0)"
									onmouseover="currentMovie(this)"
									onclick="goToTiketing('12205')" class="tit"><em>2.</em> <span
										class="grade_12">12</span><span class="mvTit">은혼</span></a> <span
									class="memRk">예매율<em>13.6%</em></span></li>
								<li><a href="javascript:void(0)"
									onmouseover="currentMovie(this)"
									onclick="goToTiketing('12047')" class="tit"><em>3.</em> <span
										class="grade_all">전체</span><span class="mvTit">뽀로로 극장판
											공룡...</span></a> <span class="memRk">예매율<em>11.0%</em></span></li>
								<li><a href="javascript:void(0)"
									onmouseover="currentMovie(this)"
									onclick="goToTiketing('12129')" class="tit"><em>4.</em> <span
										class="grade_15">15</span><span class="mvTit">기억의 밤</span></a> <span
									class="memRk">예매율<em>8.4%</em></span></li>
								<li><a href="javascript:void(0)"
									onmouseover="currentMovie(this)"
									onclick="goToTiketing('12163')" class="tit"><em>5.</em> <span
										class="grade_12">12</span><span class="mvTit">오리엔트 특급
											살인</span></a> <span class="memRk">예매율<em>6.5%</em></span></li>
								<li class=""><a href="javascript:void(0)"
									onmouseover="currentMovie(this)" onclick="goToTiketing('1414')"
									class="tit"><em>6.</em> <span class="grade_15">15</span><span
										class="mvTit">이프 온리</span></a> <span class="memRk">예매율<em>6.4%</em></span></li>
								<li class=""><a href="javascript:void(0)"
									onmouseover="currentMovie(this)"
									onclick="goToTiketing('10893')" class="tit"><em>7.</em> <span
										class="grade_12">12</span><span class="mvTit">라라랜드</span></a> <span
									class="memRk">예매율<em>4.6%</em></span></li>
							</ol>
						</div>
						<a href="<%=cp%>/movieTicketing.see" class="btn_Ticketing">예매하기</a>
					</div>
				</div>
				<div class="trailer">
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
			</div>
		</div>

		<!-- 영화리스트 -->
		<div class="slidePoster">
			<div class="slide">
				<ul style="left: 0px;">
					<c:forEach var="list" items="${list}" varStatus="stat">
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
				<a href="#n" class="prev" style="display: none;">이전</a> <a href="#n"
					class="next on">다음</a>
			</div>
		</div>

		<!-- 고정배너 CHARLOTTE -->
		<div class="banner_box">
			<div class="banner_thum">
				<ul style="left: 0px;">
					<li><a href="#" onclick=""> <img
							src="<%=cp%>/resources/upload/movie/banner/charlotte.jpg"
							alt="샤롯데바로가기"></a></li>
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
	</script>
</body>
</html>