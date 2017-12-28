<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>


<html>


<head>
<style>
</style>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=pVfJ9WZ0kM63fRFn4etx&submodules=geocoder"></script>

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

			<li class="active"><a href="<%=cp%>/aMovieTheater.see"
				title="영화관">영화관</a>
				<div class="depth">

					<ul>
						<li><a href="<%=cp%>/aMovieTheater.see" title="스페셜관">스페셜관</a></li>
						<!-- 스페셜관 종류 -->
						<div class="depth_03" style="display: block;">
							<ul>
								<li class="active"><a href="aMovieList.see" title="샤무비씨">샤무비씨</a>
								</li>
							</ul>
						</div>

						<li class="active"><a href="/movie/bMovieTheater.see">서울</a></li>
					</ul>
				</div></li>

			<li><a href="<%=cp%>/event/eventListMain.see" title="이벤트">이벤트</a>
				</li>

			<li><a href="<%=cp%>/gift/giftShopList.see" title="기프트샵">기프트샵</a>
			</li>

		</ul>
	</div>
	<div id="content">


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
									style="transform: translate3d(-11564px, 0px, 0px); transition-duration: 0ms;">
									<div class="swiper-slide swiper-slide-duplicate"
										data-swiper-slide-index="8"
										style="width: 1622px; margin-right: 30px;">
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
									<div class="swiper-slide" data-swiper-slide-index="0"
										style="width: 1622px; margin-right: 30px;">
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
									<div class="swiper-slide" data-swiper-slide-index="1"
										style="width: 1622px; margin-right: 30px;">
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
									<div class="swiper-slide" data-swiper-slide-index="2"
										style="width: 1622px; margin-right: 30px;">
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
									<div class="swiper-slide" data-swiper-slide-index="3"
										style="width: 1622px; margin-right: 30px;">
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
									<div class="swiper-slide" data-swiper-slide-index="4"
										style="width: 1622px; margin-right: 30px;">
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
									<div class="swiper-slide swiper-slide-prev"
										data-swiper-slide-index="5"
										style="width: 1622px; margin-right: 30px;">
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
										data-swiper-slide-index="6"
										style="width: 1622px; margin-right: 30px;">
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
									<div class="swiper-slide swiper-slide-next"
										data-swiper-slide-index="7"
										style="width: 1622px; margin-right: 30px;">
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
									<div class="swiper-slide" data-swiper-slide-index="8"
										style="width: 1622px; margin-right: 30px;">
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
									<div class="swiper-slide swiper-slide-duplicate"
										data-swiper-slide-index="0"
										style="width: 1622px; margin-right: 30px;">
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
								</div>
								<div
									class="swiper-pagination swiper-pagination-white swiper-pagination-clickable swiper-pagination-bullets">
									<span class="swiper-pagination-bullet"></span><span
										class="swiper-pagination-bullet"></span><span
										class="swiper-pagination-bullet"></span><span
										class="swiper-pagination-bullet"></span><span
										class="swiper-pagination-bullet"></span><span
										class="swiper-pagination-bullet"></span><span
										class="swiper-pagination-bullet swiper-pagination-bullet-active"></span><span
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

		<br /> <br /> <br /> <br /> <br />



		<!-- 지도API -->

		<br />
		<div class="come_road">
			<h3 class="map_tit">
				<span id="cinemaName3">가산디지털 </span>위치정보<span class="map_txt">최고의
					감동을 무비씨시네마에서 만나보세요.</span>
			</h3>
			<div id="map"
				style="width: 100%; height: 400px; position: relative; overflow: hidden; box-sizing: border-box;"></div>
			<script>
				var map = new naver.maps.Map('map');
				var myaddress = '디지털로10길 9';// 도로명 주소나 지번 주소만 가능 (건물명 불가!!!!)
				naver.maps.Service
						.geocode(
								{
									address : myaddress
								},
								function(status, response) {
									if (status !== naver.maps.Service.Status.OK) {
										return alert(myaddress
												+ '의 검색 결과가 없거나 기타 네트워크 에러');
									}
									var map = new naver.maps.Map('map', {
										scaleControl : false,
										logoControl : false,
										mapDataControl : false,
										zoomControl : true,
										minZoom : 1
									});
									var result = response.result;
									// 검색 결과 갯수: result.total
									// 첫번째 결과 결과 주소: result.items[0].address
									// 첫번째 검색 결과 좌표: result.items[0].point.y, result.items[0].point.x
									var myaddr = new naver.maps.Point(
											result.items[0].point.x,
											result.items[0].point.y);
									map.setCenter(myaddr); // 검색된 좌표로 지도 이동
									// 마커 표시
									var marker = new naver.maps.Marker({
										position : myaddr,
										map : map
									});
									// 마커 클릭 이벤트 처리
									naver.maps.Event.addListener(marker,
											"click", function(e) {
												if (infowindow.getMap()) {
													infowindow.close();
												} else {
													infowindow
															.open(map, marker);
												}
											});
									// 마크 클릭시 인포윈도우 오픈
									var infowindow = new naver.maps.InfoWindow(
											{
												content : '<h4> [네이버 개발자센터]</h4><a href="https://developers.naver.com" target="_blank"><img src="https://developers.naver.com/inc/devcenter/images/nd_img.png"></a>'
											});
								});
			</script>

		</div>

		<div class="come_road" id="a_transport">
			<!-- 2016.05.03 웹접근성 -->
			<div class="blind">
				<h3>교통정보</h3>
			</div>
			<h4 class="trafficTit">대중교통 안내</h4>
			<!--20170420 sunho 영화관 관리 노출 정보 변경 이용시 ▶ 안내 -->
			<table border="1" class="trafficATb">
				<caption>대중교통 안내</caption>
				<!--20170420 sunho 영화관 관리 노출 정보 변경 이용시 ▶ 안내 -->
				<!-- 150820 추가 -->
				<colgroup>
					<col style="width: 130px">
					<col style="width: 850px">
				</colgroup>
				<tbody>
					<tr>
						<th scope="row"><span class="bus">버스</span></th>
						<td>
							<ul class="trafficMemo" id="cinemaBus">
								<li>· 지선버스 : 5536, 5616, 5712, 5714</li>
								<li>· 간선버스 : 503, 504, 571, 652</li>
								<li>· 구로방면 : 금천 패션아울렛 사거리 W몰 하차</li>
								<li>· 가산디지털 방면 : 금천 패션아울렛 사거리 마리오 아울렛 하차</li>
							</ul>
						</td>
					</tr>
					<tr>
						<th scope="row"><span class="subway">지하철</span></th>
						<td>
							<ul class="trafficMemo" id="cinemaSubway">
								<li>· 1호선 가산디지털단지역 : 1번 출구 앞 시내 버스 정류장에서 5616, 5712 이용
									'W몰'에서 하차</li>
								<li>· 1호선 가산디지털단지역 : 4번 출구 (도보 직진 400미터 &gt; 도보 좌측 300미터
									&gt; 전방 횡단보도 이용 &gt; 우측 횡단보도 이용 &gt; 건물 진입 후 엘리베이터 이용 6층</li>
							</ul>
						</td>
					</tr>
				</tbody>
			</table>
			<h4 class="trafficTit">주차정보 및 이용안내</h4>
			<!--20170420 sunho 영화관 관리 노출 정보 변경 주차정보 및 이용 안내 -->
			<table border="1" class="trafficATb">
				<caption>주차정보 및 이용안내</caption>
				<!--20170420 sunho 영화관 관리 노출 정보 변경 주차정보 및 이용 안내-->
				<!-- 150820 추가 -->
				<colgroup>
					<col style="width: 130px">
					<col style="width: 850px">
				</colgroup>
				<tbody>
					<tr>
						<th scope="row"><span class="car">자가용(주차정보)</span></th>
						<!--20170420 sunho 영화관 관리 노출 정보 변경 자가용 ▶ 자가용(주차정보) -->
						<td>
							<ul class="trafficMemo" id="cinemaCar">
								<li>· 네비게이션 이용 시 : 서울시 금천구 10길 9, 현대아울렛</li>
								<li>· 남부순환도로 공항 방면으로 시흥IC를 500M 지나, 디지털단지 오거리를 건넌 후, 고가
									아래에서 U턴 → 가산로를 따라 100M 이동 후, 지웰에스테이트 골목으로 우회전 → 현대아울렛 후문에서 좌회전</li>
								<li></li>
								<li>· 가산디지털 쇼핑몰 지하 2F~5F / 총 902대</li>
								<li>· 티켓 제시시 3시간 무료주차 / 추가 10분당 500원</li>
							</ul>
						</td>
					</tr>
					<tr>
						<th scope="row"><span class="parking">이용안내</span></th>
						<!--20170420 sunho 영화관 관리 노출 정보 변경 주차정보 및 이용 안내-->
						<td>
							<ul class="trafficMemo" id="cinemaParkingInfomation">
								<li>주말 및 공휴일의 경우 주차 지연으로 인해 주차 대기가 길어질 수 있으니 평일보다 여유롭게
									출발하시길 바랍니다. 주차 지연으로 인한 교환 및 환불은 어렵습니다.</li>
							</ul>
						</td>
					</tr>
				</tbody>
			</table>
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