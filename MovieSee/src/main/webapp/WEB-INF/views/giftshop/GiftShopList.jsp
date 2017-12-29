<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	String cp = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>기프트샵</title>

<script type="text/javascript">
	//**원하는 페이지로 이동시 검색조건, 키워드 값을 유지하기 위해 
	function list(page){
   	location.href="<%=cp%>/gift/giftShopList.see?curPage=" + page
				+ "&searchOption=${map.searchOption}"
				+ "&keyword=${map.keyword}";
	}
</script>

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

			<li><a href="<%=cp%>/aMovieList.see" title="영화">영화</a>
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
			</li>

			<li><a href="<%=cp%>/event/eventListMain.see"
				title="이벤트">이벤트</a>
			</li>
			<li class="active"><a href="<%=cp%>/gift/giftShopList.see" title="기프트샵">기프트샵</a>
			</li>

		</ul>
	</div>
	<div id="container" class="subGnbNo">
		<!-- content -->
		<div id="content">
			<div class="movie_trailer">
				<div class="movile_box">
					<div class="prevNext">
						<a href="javascript:void(0)" class="btnc_prev"
							style="display: none;"> <img
							src="/movie/images/Btn/btnc_prev.png" alt="이전"></a> <a
							href="javascript:void(0)" class="btnc_next"
							style="display: none;"> <img
							src="/movie/images/Btn/btnc_next.png" alt="다음"></a>
					</div>
					<div class="control_navi">
						<ul class="indicator"></ul>
						<div class="ctr_btn">
							<a href="javascript:void(0)" class="rolling_play"
								style="display: none;"> <img
								src="/movie/images/Btn/btn_m_play.png" alt="자동롤링 재생"></a> <a
								href="javascript:void(0)" class="rolling_stop"
								style="display: none;"> <img
								src="/movie/images/Btn/btn_m_stop.png" alt="자동롤링 멈춤"></a>
						</div>
					</div>
					<ul class="bannerImg" id="ulMovieKeyValue">
						<li class="active"
							style="background: url(&quot;http://caching.lottecinema.co.kr//Media/WebAdmin/a98ebf0b93c74b5b8a221db1d7002d9d.jpg&quot;) 50% 0px no-repeat; left: 0px;"><span
							class="blind">무비씨 관람권과 스위트샵 교환권으로 소중한 분께 사랑을 전하세요.</span></li>
					</ul>
				</div>
			</div>

			<!-- product_wrap -->
			<div class="product_wrap">
				<div class="product_inner">
					<h3 class="cinema_stit pt30" id="m20">영화 관람권</h3>
					<ul class="product_slist p20">
					<c:forEach var="giftShopList_1" items="${map.giftShopList_1}">
							<c:url var="productViewURL" value="giftShopView.see">
								<c:param name="giftshop_product_no" value="${giftShopList_1.giftshop_product_no }" />
							</c:url>
						
						<li id="ic130104001">
							<span class="product_thum">
							<a href="${productViewURL}"> 
							<img src="/movie/resources/uploads/giftshop/${giftShopList_1.giftshop_product_file}"
									alt="${giftShopList_1.giftshop_product_name}"
									onerror="this.src=&quot;/movie/images/Thum/movie_no_image03.gif&quot;"></a></span>
							<dl class="product_txt">
								<dt class="product_tit">
									<a href="${productViewURL}">${giftShopList_1.giftshop_product_name}</a>
								</dt>
								<dd class="date">
									<span>사용기간 </span>${giftShopList_1.giftshop_product_periodofuse}
								</dd>
							</dl>
							<p class="product_price">
								<span class="dash_price">판매가</span> 
								<span class="price"><em>${giftShopList_1.giftshop_product_price}</em><span>원</span></span>
							</p>
						</li>
			
					</c:forEach>
					</ul>
					<h3 class="cinema_stit pt30" id="m20">매점 상품권</h3>
					<ul class="product_slist p20">
					<c:forEach var="giftShopList_2" items="${map.giftShopList_2}">
							<c:url var="productViewURL2" value="giftShopView.see">
								<c:param name="giftshop_product_no" value="${giftShopList_2.giftshop_product_no }" />
							</c:url>
						
						<li id="ic130104001">
							<span class="product_thum">
							<a href="${productViewURL2}"> 
							<img src="/movie/resources/uploads/giftshop/${giftShopList_2.giftshop_product_file}"
									alt="${giftShopList_2.giftshop_product_name}"
									onerror="this.src=&quot;/movie/images/Thum/movie_no_image03.gif&quot;"></a></span>
							<dl class="product_txt">
								<dt class="product_tit">
									<a href="javascript:void(0)">${giftShopList_2.giftshop_product_name}</a>
								</dt>
								<dd class="date">
									<span>사용기간 </span>${giftShopList_2.giftshop_product_periodofuse}
								</dd>
							</dl>
							<p class="product_price">
								<span class="dash_price">판매가</span> 
								<span class="price"><em>${giftShopList_2.giftshop_product_price}</em><span>원</span></span>
							</p>
						</li>
					
					</c:forEach>
						</ul>
				</div>
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
	</div>

</body>
</html>