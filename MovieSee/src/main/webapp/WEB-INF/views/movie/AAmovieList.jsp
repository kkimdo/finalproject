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
<title>박스오피스(상영예정작)</title>
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

			<li class="active"><a href="<%=cp%>/aMovieList.see" title="영화">영화</a>
				<div class="depth">

					<ul>
						<li class="active"><a href="<%=cp%>/aMovieList.see"
							title="박스오피스">박스오피스</a></li>
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

			<li><a href="<%=cp%>/event/eventListMain.see" title="이벤트">이벤트</a>
					</li>

			<li><a href="<%=cp%>/gift/giftShopList.see" title="기프트샵">기프트샵</a>
			</li>

		</ul>
	</div>

	<div class="content">

		<div class="movie_trailer">
			<div class="movile_box">
				<!-- 150821 재생버튼위치변경-->
				<ul class="bannerImg">
					<li class="active">

						<div id="AD_PC_03_01">
							<!-- 20170112 - 신규 광고 스크립트 -->
							<!-- 20170726 - 광고 복원 -->
							<!-- 20170904 - 스테이징,운영테스트 동기화 -->
							<div class="swiper-container_main swiper-container-horizontal">
								<div class="swiper-wrapper"
									style="transform: translate3d(-5564px, 0px, 0px); transition-duration: 300ms;">
									<div class="swiper-slide swiper-slide-duplicate"
										data-swiper-slide-index="8"
										style="width: 1361px; margin-right: 30px;">
										<div
											style="width: 10000px; height: 420px; background: url(http://caching2.lottecinema.co.kr/lotte_image/2017/Gintama/Gintama_1920420.jpg) 50% 0px no-repeat; display: table-cell; vertical-align: middle"
											id="mainvisual">
											<a href="javascript:void(0)"
												onclick="adi_lottecinema_20171123_18_fn_MoviePlay()"
												style="width: 132px; height: 132px; margin: 0 auto; cursor: pointer"
												title="”동영상" 재생”=""></a> <span class="blind">백퍼센트 레알
												팩트 빼박캔트 역대급 실사각, 올겨울 흥행각! 은혼 12월 7일 대개봉! 12세이상관람가</span>
										</div>
									</div>
									<div class="swiper-slide" data-swiper-slide-index="0"
										style="width: 1361px; margin-right: 30px;">
										<div
											style="width: 10000px; height: 420px; background: url(http://caching2.lottecinema.co.kr/lotte_image/2017/Assassin/1204/Assassin_1920420.jpg) 50% 0px no-repeat; display: table-cell; vertical-align: middle"
											id="mainvisual">
											<a href="javascript:void(0)"
												onclick="adi_lottecinema_20171124_12_fn_MoviePlay()"
												style="width: 132px; height: 132px; margin: 0 auto; cursor: pointer"
												title="”동영상" 재생”=""></a> <span class="blind">액션 블록버스터
												시리즈의 시작! 어쌔신 더 비기닝 2017.12.07 15세 이상 관람가</span>
										</div>
									</div>
									<div class="swiper-slide" data-swiper-slide-index="1"
										style="width: 1361px; margin-right: 30px;">
										<div
											style="width: 10000px; height: 420px; background: url(http://caching2.lottecinema.co.kr/lotte_image/2017/SteelRain/SteelRain_1920420.jpg) 50% 0px no-repeat; display: table-cell; vertical-align: middle"
											id="mainvisual">
											<a href="javascript:void(0)"
												onclick="adi_lottecinema_20171204_6_fn_MoviePlay()"
												style="width: 132px; height: 132px; margin: 0 auto; cursor: pointer"
												title="”동영상" 재생”=""></a> <span class="blind">12월 14일
												핵전쟁 카운트다운! 첩보 액션 블록버스터 강철비</span>
										</div>
									</div>
									<div class="swiper-slide swiper-slide-prev"
										data-swiper-slide-index="2"
										style="width: 1361px; margin-right: 30px;">
										<div
											style="width: 10000px; height: 420px; background: url(http://caching2.lottecinema.co.kr/lotte_image/2017/StarWars/StarWars_1920420.jpg) 50% 0px no-repeat; display: table-cell; vertical-align: middle"
											id="mainvisual">
											<a href="javascript:void(0)"
												onclick="adi_lottecinema_20171201_8_fn_MoviePlay()"
												style="width: 132px; height: 132px; margin: 0 auto; cursor: pointer"
												title="”동영상" 재생”=""></a> <span class="blind">전격 예매오픈!
												스타워즈 라스트 제다이 12월 14일 대개봉</span>
										</div>
									</div>
									<div class="swiper-slide swiper-slide-active"
										data-swiper-slide-index="3"
										style="width: 1361px; margin-right: 30px;">
										<div
											style="width: 10000px; height: 420px; background: url(http://caching2.lottecinema.co.kr/lotte_image/2017/Pororo/Pororo_1920420.jpg) 50% 0px no-repeat; display: table-cell; vertical-align: middle"
											id="mainvisual">
											<a href="javascript:void(0)"
												onclick="adi_lottecinema_20171117_29_fn_MoviePlay()"
												style="width: 132px; height: 132px; margin: 0 auto; cursor: pointer"
												title="”동영상" 재생”=""></a> <span class="blind">위기에 처한
												공룡섬을 구하라! 뽀로로 극장판 공룡섬 대모험 12월 7일 대개봉 전체관람가</span>
										</div>
									</div>
									<div class="swiper-slide swiper-slide-next"
										data-swiper-slide-index="4"
										style="width: 1361px; margin-right: 30px;">
										<div
											style="width: 10000px; height: 420px; background: url(http://caching2.lottecinema.co.kr/lotte_image/2017/Showman/Showman_1920420.jpg) 50% 0px no-repeat; display: table-cell; vertical-align: middle"
											id="mainvisual">
											<a href="javascript:void(0)"
												onclick="adi_lottecinema_20171201_71_fn_MoviePlay()"
												style="width: 132px; height: 132px; margin: 0 auto; cursor: pointer"
												title="”동영상" 재생”=""></a> <span class="blind">아카데미 음악상
												수상 라라랜드 작사팀 OST 불가능한 꿈, 그 이상의 쇼! 위대한 쇼맨 12월 대개봉 관람등급미정</span>
										</div>
									</div>
									<div class="swiper-slide" data-swiper-slide-index="5"
										style="width: 1361px; margin-right: 30px;">
										<div
											style="width: 10000px; height: 420px; background: url(http://caching2.lottecinema.co.kr/lotte_image/2017/WithGod/WithGod_1920420.jpg) 50% 0px no-repeat; display: table-cell; vertical-align: middle"
											id="mainvisual">
											<a href="javascript:void(0)"
												onclick="adi_lottecinema_20171201_25_fn_MoviePlay()"
												style="width: 132px; height: 132px; margin: 0 auto; cursor: pointer"
												title="”동영상" 재생”=""></a> <span class="blind">아무도 본 적
												없는 세계가 열린다 신과 함께 죄와 벌 12월 20일 대개봉 12세이상관람가</span>
										</div>
									</div>
									<div class="swiper-slide" data-swiper-slide-index="6"
										style="width: 1361px; margin-right: 30px;">
										<div
											style="width: 10000px; height: 420px; background: url(http://caching2.lottecinema.co.kr/lotte_image/2017/TheChase/1130/TheChase_1920420.jpg) 50% 0px no-repeat; display: table-cell; vertical-align: middle"
											id="mainvisual">
											<a href="javascript:void(0)"
												onclick="adi_lottecinema_20171114_6_fn_MoviePlay()"
												style="width: 132px; height: 132px; margin: 0 auto; cursor: pointer"
												title="”동영상" 재생”=""></a> <span class="blind">미제사건 추적
												스릴러 반드시 잡는다 절찬상영중 백윤식 성동일 15세이상관람가</span>
										</div>
									</div>
									<div class="swiper-slide" data-swiper-slide-index="7"
										style="width: 1361px; margin-right: 30px;">
										<div
											style="width: 10000px; height: 420px; background: url(http://caching2.lottecinema.co.kr/lotte_image/2017/MonsterFamily/MonsterFamily_1920420.jpg) 50% 0px no-repeat; display: table-cell; vertical-align: middle"
											id="mainvisual">
											<a href="javascript:void(0)"
												onclick="adi_lottecinema_20171201_35_fn_MoviePlay()"
												style="width: 132px; height: 132px; margin: 0 auto; cursor: pointer"
												title="”동영상" 재생”=""></a> <span class="blind">온 가족이
												몬스터로 변해 버렸다?! 슈퍼배드 제작진 몬스터패밀리 12월 21일 대개봉 컬투와 함께 극장 고고!
												전체관람가</span>
										</div>
									</div>
									<div class="swiper-slide" data-swiper-slide-index="8"
										style="width: 1361px; margin-right: 30px;">
										<div
											style="width: 10000px; height: 420px; background: url(http://caching2.lottecinema.co.kr/lotte_image/2017/Gintama/Gintama_1920420.jpg) 50% 0px no-repeat; display: table-cell; vertical-align: middle"
											id="mainvisual">
											<a href="javascript:void(0)"
												onclick="adi_lottecinema_20171123_18_fn_MoviePlay()"
												style="width: 132px; height: 132px; margin: 0 auto; cursor: pointer"
												title="”동영상" 재생”=""></a> <span class="blind">백퍼센트 레알
												팩트 빼박캔트 역대급 실사각, 올겨울 흥행각! 은혼 12월 7일 대개봉! 12세이상관람가</span>
										</div>
									</div>
									<div class="swiper-slide swiper-slide-duplicate"
										data-swiper-slide-index="0"
										style="width: 1361px; margin-right: 30px;">
										<div
											style="width: 10000px; height: 420px; background: url(http://caching2.lottecinema.co.kr/lotte_image/2017/Assassin/1204/Assassin_1920420.jpg) 50% 0px no-repeat; display: table-cell; vertical-align: middle"
											id="mainvisual">
											<a href="javascript:void(0)"
												onclick="adi_lottecinema_20171124_12_fn_MoviePlay()"
												style="width: 132px; height: 132px; margin: 0 auto; cursor: pointer"
												title="”동영상" 재생”=""></a> <span class="blind">액션 블록버스터
												시리즈의 시작! 어쌔신 더 비기닝 2017.12.07 15세 이상 관람가</span>
										</div>
									</div>
								</div>
								<div
									class="swiper-pagination swiper-pagination-white swiper-pagination-clickable swiper-pagination-bullets">
									<span class="swiper-pagination-bullet"></span><span
										class="swiper-pagination-bullet"></span><span
										class="swiper-pagination-bullet"></span><span
										class="swiper-pagination-bullet swiper-pagination-bullet-active"></span><span
										class="swiper-pagination-bullet"></span><span
										class="swiper-pagination-bullet"></span><span
										class="swiper-pagination-bullet"></span><span
										class="swiper-pagination-bullet"></span><span
										class="swiper-pagination-bullet"></span>
								</div>
								<!--<div class="swiper-button-next swiper-button-white"></div>-->
								<!--<div class="swiper-button-prev swiper-button-white"></div>-->
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>


		<div class="screen_cwrap">
			<ul class="tab_st02">
				<li><a href="<%=cp%>/aMovieList.see" id="aNow">현재상영작</a></li>
				<!--20170404 sunho javascript:void(0); 삭제 웹 접근성 # -->
				<li><a href="<%=cp%>/aaMovieList.see" id="aSoon" class="on">상영예정작</a></li>
				<!--20170404 sunho javascript:void(0); 삭제 웹 접근성 # -->
			</ul>
			<div class="tab_content on">
				<!-- 영화 LIST 출력 -->
				<ul class="curr_list movie_clist" id="arteMovieList">

					<c:forEach var="movieboxofficeList2" items="${movieboxofficeList2}"
						varStatus="stat">

						<jsp:useBean id="now" class="java.util.Date" />

						<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />

						<fmt:formatDate value="${movieboxofficeList2.movie_date}"
							pattern="yyyy-MM-dd" var="movie_date" />

						<c:if test="${today <= movie_date }">

							<c:url var="viewURL" value="/movieView.see">
								<c:param name="movie_no"
									value="${movieboxofficeList2.movie_no }" />
							</c:url>
							<c:url var="reserveURL" value="/movieTicketing.see">
								<c:param name="movie_no" value="${movieboxofficeList2.movie_no}" />
							</c:url>
							<li>
								<div class="curr_box">
									<span class="img"> <a href=''> <img
											src="<%= cp %>/resources/upload/movie/main_movie/${movieboxofficeList2.movie_poster}"></a>
									</span>
								</div> <!-- hover시 이미지 -->
								<div class="layer_hover">
									<a href="<%=cp%>/reserve/movieTicketing.see" onclick="goToTiketing()"
										class="btn_reserve">예매하기</a> <a href="${viewURL}"
										class="btn_View">상세보기</a>
								</div>
								<dl class="list_text">
									<dt>
										<a href='javascript:GoToMovie("12154");'><span
											class="grade_all">전체</span>${movieboxofficeList2.movie_name}</a>
									</dt>
									<dd>
										<span class="rate">관람 평점 0.0%</span> <span class="list_score">관람평점
											0.0</span>
									</dd>
								</dl>
							</li>

						</c:if>

					</c:forEach>
				</ul>

				<div class="srchResult_none" style="display: none;"
					id="searchResultNone">
					<span class="txt">상영 중인 영화가 없습니다.</span>
				</div>
			</div>
			<div class="tab_content"></div>
		</div>
		<div class="quick_ver2" id="quick" style="top: 186.25px;">
			<!-- [D] 접근성 관련 : 스크립트로 탭키이동시 foucs in, focus out  제어 필요 -->
			<ul>
				<li><a
					href="<%=cp%>/reserve/movieTicketing.see"
					title="빠른예매"><span><img
							src="http://caching.lottecinema.co.kr//Media/WebAdmin/a021109040b34b989bf01bacf6263973.jpg"
							alt="빠른예매"></span></a></li>
				<li><a
					href="<%=cp%>/mypage/reserveList.see"
					title="예매내역"><span><img
							src="http://caching.lottecinema.co.kr//Media/WebAdmin/1ec48d357ba44dbeaa0ef261d93e4003.jpg"
							alt="예매내역"></span></a></li>
				<li><a
					href="<%=cp%>/faq/faqList.see"
					title="고객센터"><span><img
							src="http://caching.lottecinema.co.kr//Media/WebAdmin/47141787f65643938247e12b5f5c9d75.jpg"
							alt="고객센터"></span></a></li>
				<li><a
					href="<%=cp%>/movie/aMovieTheater.see"
					title="스페셜관"><span><img
							src="http://caching.lottecinema.co.kr//Media/WebAdmin/1066bda3e3c1448f81cdbb07aeea257b.jpg"
							alt="스페셜관"></span></a></li>
			</ul>
		</div>
	</div>
</body>
</html>