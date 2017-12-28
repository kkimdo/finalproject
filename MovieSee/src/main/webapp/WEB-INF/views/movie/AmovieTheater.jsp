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
<title>Insert title here</title>
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
						<li class="active"><a href="<%=cp%>/aMovieTheater.see"
							title="스페셜관">스페셜관</a></li>
						<!-- 스페셜관 종류 -->
						<div class="depth_03" style="display: BLOCK;">
							<ul>
								<li class="active"><a href="aMovieTheater.see" title="샤무비씨">샤무비씨</a>
								</li>

							</ul>
						</div>


						<li><a href="<%=cp%>/bMovieTheater.see">서울</a></li>
					</ul>
				</div></li>

			<li><a href="<%=cp%>/event/eventListMain.see" title="이벤트">이벤트</a>
				<div class="depth">
					<ul>
						<li></li>
						<li></li>
						<li></li>
						<li></li>
						<li></li>
					</ul>
				</div></li>

			<li><a href="<%=cp%>/gift/giftShopList.see" title="기프트샵">기프트샵</a>
			</li>

		</ul>
	</div>
	<div id="content">
		<!-- top 사진 -->
		<div class="special_box" id="keyVisual">
			<img
				src="http://caching.lottecinema.co.kr//Media/WebAdmin/eacaf47c32e647eda0ca9d2ac8a7e9b4.jpg"
				alt="샤무비씨,당신을 위한 하나의 프리미엄 상영관">
		</div>
		<!--// special_box -->


		<div class="tab_stWrap" id="tabSuper4D" style="display: none;">
			<ul class="tab_st10">
				<li><a href="#wind"><img
						src="/LCHS/Image/Icon/img_4D_wind.png" alt="wind Effect"></a></li>
				<li><a href="#wind"><img
						src="/LCHS/Image/Icon/img_4D_strobe.png" alt="strobe Light Effect"></a></li>
				<li><a href="#bubble"><img
						src="/LCHS/Image/Icon/img_4D_bubble.png" alt="Bubble Effect"></a></li>
				<li><a href="#bubble"><img
						src="/LCHS/Image/Icon/img_4D_fog.png" alt="Fog Effect"></a></li>
				<li><a href="#aroma"><img
						src="/LCHS/Image/Icon/img_4D_aroma.png" alt="aroma Effect"></a></li>
				<li><a href="#aroma"><img
						src="/LCHS/Image/Icon/img_4D_water.png" alt="water Effect"></a></li>
				<li><a href="#motion"><img
						src="/LCHS/Image/Icon/img_4D_motion.png" alt="motion Effect"></a></li>
				<li><a href="#motion"><img
						src="/LCHS/Image/Icon/img_4D_vib.png" alt="vibration Effect"></a></li>
			</ul>
		</div>

		<!-- spec_shWrap -->
		<div id="divSpec">
			<div class="spec_shwrap">
				<img
					src="http://caching.lottecinema.co.kr//Media/WebAdmin/d0ba44a1fd1f4050a3654294b2452731.jpg"
					alt="최고급가죽시트와더욱편안한리클라이너체어.개인용호출벨로퍼스트클래스의안락함을느껴보세요">
			</div>

			<div class="spec_shwrap">
				<img
					src="http://caching.lottecinema.co.kr//Media/WebAdmin/470b3bbbedc9470cacde63b5d7864b09.jpg"
					alt="전용티켓창구,웰컴푸드&amp;음료서비스,개인담요제공과물품제공서비스까지샤무비씨고객만을위한프리미엄서비스">
			</div>

			<div class="spec_shwrap">
				<img
					src="http://caching.lottecinema.co.kr//Media/WebAdmin/712969cbceca4b6099da39179a296ac2.jpg"
					alt="샤무비씨전용라운지는영화의기다림부터마지막까지인상적인순간으로남겨드립니다.">
			</div>
		</div>

		<div class="spec_shalotte">
			<span id="spanRental"><img
				src="http://caching.lottecinema.co.kr//Media/WebAdmin/04466f7f805f40d8bc713d5bb0c9d12c.jpg"
				alt="샤무비씨및 프라이빗의 대관 문의가 가능합니다."></span>
			<div class="btn_box btn_cbox" id="divBtnBox_sfg"
				style="display: none;">
				<a href="javascript:goEventToTicketIng('','','0941','1016','2',1);"
					class="btnc_yellow"><span>예매바로가기</span></a>
			</div>
			<div class="btn_box btn_cbox" id="divBtnBox" style="">

				<a href="javascript:customerCenterMenu(3,1);" class="btnc_yellow"><span>대관
						문의</span></a>
				<!-- //0317 문구수정 -->
			</div>
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
		<!--// spec_shwrap04 -->
	</div>
</body>
</html>