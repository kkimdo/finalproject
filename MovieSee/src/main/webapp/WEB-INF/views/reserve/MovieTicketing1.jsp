<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% String cp = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div class="gnb">
<ul>
<li class="active">
<a href="<%=cp %>/reserve/movieTicketing.see" title="예매">예매</a>
<div class="depth">
<ul>
<li class="active">
<a href="<%= cp %>/reserve/movieTicketing.see" title="예매하기">예매하기</a></li>
<li>
<a href="http://www.lottecinema.co.kr/LCHS/Contents/ticketing/movie-schedule.aspx" title="상영시간표">상영시간표</a></li>
<li>
<a href="javascript:ShowPopupDiscountView();" title="할인가이드">할인가이드</a></li>
</ul>
</div>
</li>
<li>
<a href="<%=cp %>/aMovieList.see" title="영화">영화</a>
</li>

<li>
<a href="<%=cp %>/aMovieTheater.see" title="영화관">영화관</a>
</li>

<li>
<a href="http://event.lottecinema.co.kr/LCHS/Contents/Event/event-summary-list.aspx" title="이벤트">이벤트</a>
</li>

<li>
<a href="http://www.lottecinema.co.kr/LCHS/Contents/Cinema-Mall/gift-shop.aspx" title="기프트샵">기프트샵</a></li>
</ul>
</div>

<div id="content">

			<!-- seatwrap -->
			<div class="seatwrap">
			  <div class="seatArea">
                  <!-- 온라인광고 신규 2017-06 -->
                
                    
                    <div class="ad-banner wing_banner left_banner">
						<div class="wrap_banner">
							<script type="text/javascript" src="https://nvapi.feeldmc.com/ad/p/in/v1_0/imp?slotid=stw_lottelotte_22"></script><a href="https://nvapi.feeldmc.com:443/ad/p/in/v1_0/clk?slotid=stw_lottelotte_22&amp;adgroupid=adg_lottecinema_20171130_13&amp;adid=adi_lottecinema_20171130_13" target="_blank"><img src="https://caching2.lottecinema.co.kr/lotte_image/2017/hyundaicardM2/0816/hyundaicardM2_160300.jpg" style="width:160;height:300;border:0px" alt="현대카드 신규 발급 시 영화관람권 1~4장 제공"></a>
						</div>
					</div>
					<div class="ad-banner wing_banner right_banner">
						<div class="wrap_banner">
							<script type="text/javascript" src="https://nvapi.feeldmc.com/ad/p/in/v1_0/imp?slotid=stw_lottelotte_22"></script><a href="https://nvapi.feeldmc.com:443/ad/p/in/v1_0/clk?slotid=stw_lottelotte_22&amp;adgroupid=adg_lottecinema_20171130_13&amp;adid=adi_lottecinema_20171130_13" target="_blank"><img src="https://caching2.lottecinema.co.kr/lotte_image/2017/hyundaicardM2/0816/hyundaicardM2_160300.jpg" style="width:160;height:300;border:0px" alt="현대카드 신규 발급 시 영화관람권 1~4장 제공"></a>
						</div>
					</div>
                    

                <!--// 온라인광고 신규 2017-06 -->
                  <div class="seatheader">
					<h2 class="seatTit Lang-LBL1001">인원/좌석선택</h2>
					<ul class="sear_right">
						<li class="s_price"><a href="javascript:void(0);" class="Lang-LBL1003" title="레이어 열림">영화관 요금표</a></li>
						<li class="reset"><a href="javascript:void(0);" class="Lang-LBL1004" title="전체초기화">전체 초기화</a></li>
					</ul>
				</div>
				<div class="selectbox">
				<form name="reserveform" action="#" method="post">
					<ul class="personSelect">
					<label for="person0">성인</label>
					<ul>
					<li>	
						<select name="adult_cnt" class="slct">
						<option value="1">1명</option>
						<option value="2">2명</option>
						<option value="3">3명</option>
						<option value="4">4명</option>
						<option value="5">5명</option>
						<option value="6">6명</option>
						<option value="7">7명</option>
						<option value="8">8명</option>
						</select>
					</li>
					</ul>
					<li>   <label for="person1">청소년</label>   
					<ul>
					<li>	
						<select name="child_cnt" class="slct">
						<option value="1">1명</option>
						<option value="2">2명</option>
						<option value="3">3명</option>
						<option value="4">4명</option>
						<option value="5">5명</option>
						<option value="6">6명</option>
						<option value="7">7명</option>
						<option value="8">8명</option>
						</select>
					</li>
					</ul>
					</li>
					
                    <p class="seat_txt2" style="">만 15세 미만의 고객님(영, 유아 포함)은 반드시 부모님 또는 성인 보호자의 동반하에 관람이 가능합니다.</p>
                    </ul>
				</div>
			  </div>
			</div>
			<!-- //seatwrap -->

			<!-- mseat_wrap -->
			<div class="mseat_wrap">
				<div class="mseat_inner"><div class="alarm_special" style="display: none;"><p class="alarm_txt"></p><a href="javascript:void(0);" class="btn_close"><img src="/LCHS/image/Btn/btn_close02.gif" alt="닫기"></a></div>
					<div class="screen_box">
						<strong class="screen_tit">Screen</strong>
						<div class="screen_scroll">
						<div class="screen_Fbox seatSet1">
						<span class="floor_tit" style="display: none;"><em>7F</em></span><div class="seat_Barea"><div class="seat_area" style="height: 236px; margin-left: 211px;">
						<a href="javascript:void(0);" class="foot_seat p0 grNum3" data-seat="A1" seat-statuscode="0" block-code="p0" seat-group="grNum3" style="left: 22px; top: 0px;" title="좌석 번호:A1 - 발받침석" seat-code="1A01">1</a><a class="foot_seat p0 grNum3" data-seat="A2" seat-statuscode="0" block-code="p0" seat-group="grNum3" style="left: 48px; top: 0px;" title="좌석 번호:A2 - 발받침석" seat-code="1A02">2</a><a class="foot_seat p0 grNum3" data-seat="A3" seat-statuscode="0" block-code="p0" seat-group="grNum3" style="left: 75px; top: 0px;" title="좌석 번호:A3 - 발받침석" seat-code="1A03">3</a><a href="javascript:void(0);" class="foot_seat p0 grNum3" data-seat="A4" seat-statuscode="0" block-code="p0" seat-group="grNum3" style="left: 102px; top: 0px;" title="좌석 번호:A4 - 발받침석" seat-code="1A04">4</a><a href="javascript:void(0);" class="foot_seat p0 grNum4" data-seat="A5" seat-statuscode="0" block-code="p0" seat-group="grNum4" style="left: 149px; top: 0px;" title="좌석 번호:A5 - 발받침석" seat-code="1A05">5</a><a class="foot_seat p0 grNum4" data-seat="A6" seat-statuscode="0" block-code="p0" seat-group="grNum4" style="left: 176px; top: 0px;" title="좌석 번호:A6 - 발받침석" seat-code="1A06">6</a><a href="javascript:void(0);" class="foot_seat p0 grNum4" data-seat="A7" seat-statuscode="0" block-code="p0" seat-group="grNum4" style="left: 203px; top: 0px;" title="좌석 번호:A7 - 발받침석" seat-code="1A07">7</a><a href="javascript:void(0);" class="foot_seat p0 grNum4" data-seat="A8" seat-statuscode="0" block-code="p0" seat-group="grNum4" style="left: 230px; top: 0px;" title="좌석 번호:A8 - 발받침석" seat-code="1A08">8</a><a class="foot_seat p0 grNum4" data-seat="A9" seat-statuscode="0" block-code="p0" seat-group="grNum4" style="left: 256px; top: 0px;" title="좌석 번호:A9 - 발받침석" seat-code="1A09">9</a><a href="javascript:void(0);" class="foot_seat p0 grNum4" data-seat="A10" seat-statuscode="0" block-code="p0" seat-group="grNum4" style="left: 283px; top: 0px;" title="좌석 번호:A10 - 발받침석" seat-code="1A10">10</a>
						<a href="javascript:void(0);" class="p0 grNum7" data-seat="B1" seat-statuscode="0" block-code="p0" seat-group="grNum7" style="left: 22px; top: 27px;" title="좌석 번호:B1 - 일반석" seat-code="1B01">1</a><a class="p0 grNum7" data-seat="B2" seat-statuscode="0" block-code="p0" seat-group="grNum7" style="left: 48px; top: 27px;" title="좌석 번호:B2 - 일반석" seat-code="1B02">2</a><a class="p0 grNum7" data-seat="B3" seat-statuscode="0" block-code="p0" seat-group="grNum7" style="left: 75px; top: 27px;" title="좌석 번호:B3 - 일반석" seat-code="1B03">3</a><a href="javascript:void(0);" class="p0 grNum7" data-seat="B4" seat-statuscode="0" block-code="p0" seat-group="grNum7" style="left: 102px; top: 27px;" title="좌석 번호:B4 - 일반석" seat-code="1B04">4</a><a href="javascript:void(0);" class="p0 grNum8" data-seat="B5" seat-statuscode="0" block-code="p0" seat-group="grNum8" style="left: 149px; top: 27px;" title="좌석 번호:B5 - 일반석" seat-code="1B05">5</a><a class="p0 grNum8" data-seat="B6" seat-statuscode="0" block-code="p0" seat-group="grNum8" style="left: 176px; top: 27px;" title="좌석 번호:B6 - 일반석" seat-code="1B06">6</a><a href="javascript:void(0);" class="p0 grNum8" data-seat="B7" seat-statuscode="0" block-code="p0" seat-group="grNum8" style="left: 203px; top: 27px;" title="좌석 번호:B7 - 일반석" seat-code="1B07">7</a><a href="javascript:void(0);" class="p0 grNum8" data-seat="B8" seat-statuscode="0" block-code="p0" seat-group="grNum8" style="left: 230px; top: 27px;" title="좌석 번호:B8 - 일반석" seat-code="1B08">8</a><a class="p0 grNum8" data-seat="B9" seat-statuscode="0" block-code="p0" seat-group="grNum8" style="left: 256px; top: 27px;" title="좌석 번호:B9 - 일반석" seat-code="1B09">9</a><a href="javascript:void(0);" class="p0 grNum8" data-seat="B10" seat-statuscode="0" block-code="p0" seat-group="grNum8" style="left: 283px; top: 27px;" title="좌석 번호:B10 - 일반석" seat-code="1B10">10</a>
						<a href="javascript:void(0);" class="p0 grNum11" data-seat="C1" seat-statuscode="0" block-code="p0" seat-group="grNum11" style="left: 22px; top: 54px;" title="좌석 번호:C1 - 일반석" seat-code="1C01">1</a><a class="p0 grNum11" data-seat="C2" seat-statuscode="0" block-code="p0" seat-group="grNum11" style="left: 48px; top: 54px;" title="좌석 번호:C2 - 일반석" seat-code="1C02">2</a><a class="p0 grNum11" data-seat="C3" seat-statuscode="0" block-code="p0" seat-group="grNum11" style="left: 75px; top: 54px;" title="좌석 번호:C3 - 일반석" seat-code="1C03">3</a><a href="javascript:void(0);" class="p0 grNum11" data-seat="C4" seat-statuscode="0" block-code="p0" seat-group="grNum11" style="left: 102px; top: 54px;" title="좌석 번호:C4 - 일반석" seat-code="1C04">4</a><a href="javascript:void(0);" class="p0 grNum12" data-seat="C5" seat-statuscode="0" block-code="p0" seat-group="grNum12" style="left: 149px; top: 54px;" title="좌석 번호:C5 - 일반석" seat-code="1C05">5</a><a class="p0 grNum12" data-seat="C6" seat-statuscode="0" block-code="p0" seat-group="grNum12" style="left: 176px; top: 54px;" title="좌석 번호:C6 - 일반석" seat-code="1C06">6</a><a href="javascript:void(0);" class="p0 grNum12" data-seat="C7" seat-statuscode="0" block-code="p0" seat-group="grNum12" style="left: 203px; top: 54px;" title="좌석 번호:C7 - 일반석" seat-code="1C07">7</a><a href="javascript:void(0);" class="p0 grNum12" data-seat="C8" seat-statuscode="0" block-code="p0" seat-group="grNum12" style="left: 230px; top: 54px;" title="좌석 번호:C8 - 일반석" seat-code="1C08">8</a><a class="p0 grNum12" data-seat="C9" seat-statuscode="0" block-code="p0" seat-group="grNum12" style="left: 256px; top: 54px;" title="좌석 번호:C9 - 일반석" seat-code="1C09">9</a><a href="javascript:void(0);" class="p0 grNum12" data-seat="C10" seat-statuscode="0" block-code="p0" seat-group="grNum12" style="left: 283px; top: 54px;" title="좌석 번호:C10 - 일반석" seat-code="1C10">10</a>
						<a href="javascript:void(0);" class="p0 grNum15" data-seat="D1" seat-statuscode="0" block-code="p0" seat-group="grNum15" style="left: 22px; top: 81px;" title="좌석 번호:D1 - 일반석" seat-code="1D01">1</a><a class="p0 grNum15" data-seat="D2" seat-statuscode="0" block-code="p0" seat-group="grNum15" style="left: 48px; top: 81px;" title="좌석 번호:D2 - 일반석" seat-code="1D02">2</a><a class="p0 grNum15" data-seat="D3" seat-statuscode="0" block-code="p0" seat-group="grNum15" style="left: 75px; top: 81px;" title="좌석 번호:D3 - 일반석" seat-code="1D03">3</a><a href="javascript:void(0);" class="p0 grNum15" data-seat="D4" seat-statuscode="0" block-code="p0" seat-group="grNum15" style="left: 102px; top: 81px;" title="좌석 번호:D4 - 일반석" seat-code="1D04">4</a><a href="javascript:void(0);" class= p0 grNum16" data-seat="D5" seat-statuscode="0" block-code="p0" seat-group="grNum16" style="left: 149px; top: 81px;" title="좌석 번호:D5 - 일반석 SWEET SPOT" seat-code="1D05">5</a><a class= p0 grNum16" data-seat="D6" seat-statuscode="0" block-code="p0" seat-group="grNum16" style="left: 176px; top: 81px;" title="좌석 번호:D6 - 일반석 SWEET SPOT" seat-code="1D06">6</a><a href="javascript:void(0);" class= p0 grNum16" data-seat="D7" seat-statuscode="0" block-code="p0" seat-group="grNum16" style="left: 203px; top: 81px;" title="좌석 번호:D7 - 일반석 SWEET SPOT" seat-code="1D07">7</a><a href="javascript:void(0);" class= p0 grNum16" data-seat="D8" seat-statuscode="0" block-code="p0" seat-group="grNum16" style="left: 230px; top: 81px;" title="좌석 번호:D8 - 일반석 SWEET SPOT" seat-code="1D08">8</a><a class= p0 grNum16" data-seat="D9" seat-statuscode="0" block-code="p0" seat-group="grNum16" style="left: 256px; top: 81px;" title="좌석 번호:D9 - 일반석 SWEET SPOT" seat-code="1D09">9</a><a href="javascript:void(0);" class= p0 grNum16" data-seat="D10" seat-statuscode="0" block-code="p0" seat-group="grNum16" style="left: 283px; top: 81px;" title="좌석 번호:D10 - 일반석 SWEET SPOT" seat-code="1D10">10</a>
						<a href="javascript:void(0);" class="p0 grNum19" data-seat="E1" seat-statuscode="0" block-code="p0" seat-group="grNum19" style="left: 22px; top: 108px;" title="좌석 번호:E1 - 일반석" seat-code="1E01">1</a><a class="p0 grNum19" data-seat="E2" seat-statuscode="0" block-code="p0" seat-group="grNum19" style="left: 48px; top: 108px;" title="좌석 번호:E2 - 일반석" seat-code="1E02">2</a><a class="p0 grNum19" data-seat="E3" seat-statuscode="0" block-code="p0" seat-group="grNum19" style="left: 75px; top: 108px;" title="좌석 번호:E3 - 일반석" seat-code="1E03">3</a><a href="javascript:void(0);" class="p0 grNum19" data-seat="E4" seat-statuscode="0" block-code="p0" seat-group="grNum19" style="left: 102px; top: 108px;" title="좌석 번호:E4 - 일반석" seat-code="1E04">4</a><a href="javascript:void(0);" class= p0 grNum20" data-seat="E5" seat-statuscode="0" block-code="p0" seat-group="grNum20" style="left: 149px; top: 108px;" title="좌석 번호:E5 - 일반석 SWEET SPOT" seat-code="1E05">5</a><a class= p0 grNum20" data-seat="E6" seat-statuscode="0" block-code="p0" seat-group="grNum20" style="left: 176px; top: 108px;" title="좌석 번호:E6 - 일반석 SWEET SPOT" seat-code="1E06">6</a><a href="javascript:void(0);" class= p0 grNum20" data-seat="E7" seat-statuscode="0" block-code="p0" seat-group="grNum20" style="left: 203px; top: 108px;" title="좌석 번호:E7 - 일반석 SWEET SPOT" seat-code="1E07">7</a><a href="javascript:void(0);" class= p0 grNum20" data-seat="E8" seat-statuscode="0" block-code="p0" seat-group="grNum20" style="left: 230px; top: 108px;" title="좌석 번호:E8 - 일반석 SWEET SPOT" seat-code="1E08">8</a><a class= p0 grNum20" data-seat="E9" seat-statuscode="0" block-code="p0" seat-group="grNum20" style="left: 256px; top: 108px;" title="좌석 번호:E9 - 일반석 SWEET SPOT" seat-code="1E09">9</a><a href="javascript:void(0);" class= p0 grNum20" data-seat="E10" seat-statuscode="0" block-code="p0" seat-group="grNum20" style="left: 283px; top: 108px;" title="좌석 번호:E10 - 일반석 SWEET SPOT" seat-code="1E10">10</a>
						<div class="seat_eBox">
						</div>
					</div>
				</div>
			</div>
			<!--// mseat_wrap -->

			<!-- info_wrap -->
			<div class="info_wrap">
				<div class="info_list">
                    <ul class="list_center">

                        <li class="m03">
							<a href="javascript:void(0);" title="CINE COUPLE">S석</a>
                            <div class="layer_seat" style="display:none;">
                                <div class="seat_in">
                                    <p class="Lang-LBL1017">오직 두 사람만을 위한 독립된 커플용 좌석입니다.</p>
                                </div>
                            </div>
						</li>
                        <li class="m04">
							<a href="javascript:void(0);" title="CINE FAMILY">A석</a>
                            <div class="layer_seat" style="display:none;">
                                <div class="seat_in">
                                    <p class="Lang-LBL1018">소파, 테이블, 별도 음향시스템을 갖춘 4•6인실의 독립된 관람 공간입니다.</p>
                                </div>
                            </div>
						</li>
                    </ul>
				</div>
			</div>
			<!--// info_wrap -->

			<!-- carouselwrap -->
			<div class="carouselwrap">
				<div class="carousel">
					<h3 class="sub_stit Lang-LBL3043">매점상품 주문하기</h3>
					<span id="spn_sub_stit" style="position: absolute; top:4px; left:180px; color: #cd190b;">* SALE 상품은 모바일앱 &lt;바로팝콘&gt; 전용 상품입니다. (홈페이지 주문 불가)</span><!-- 추가 20171012 -->
                    <p class="icn_smt2">스마트오더가 가능한 상품에만 스마트오더 아이콘이 표시됩니다. 스마트오더 제조주문은 모바일에서만 가능합니다.</p>
					<!-- carousel_box -->
					<div class="carousel_box">
						<a href="javascript:void(0);" class="btn_prev" style="display:none;">이전</a>
						<a href="javascript:void(0);" class="btn_next" style="display:none;">다음</a><!-- 마크업 순서 변경 -->
						<div class="control_navi" style="display:none;">							
							<ul class="indicator" style="display: none;"></ul>
						</div>
						<div class="hidden_box">
							<ul class="product_slist"><li class="prdList ticketType 10101001" style="display:none;" ticketset="0" ticketcount="1" ticketfixed="1">   <div class="product_order">		<span class="product_thum"><a href="javascript:void(0);" title="스위트콤보 "><img src="https://caching.lottecinema.co.kr//Media/WebAdmin/4352f6b4fe2c410b8c841d729d7c85a1.jpg" alt="스위트콤보 " data-pin-nopin="true"></a></span>		<div class="product_txt">			<a href="javascript:void(0);" title="스위트콤보 ">스위트콤보 </a>		</div>		<p class="product_price">			<span class="dash_price"><del>8,500</del></span>			<span class="price"><em>8,000</em><span> 원</span></span>		</p>	</div></li><li class="prdList ticketType 10101002" style="display:none;" ticketset="0" ticketcount="1" ticketfixed="1">   <div class="product_order">		<span class="product_thum"><a href="javascript:void(0);" title="더블콤보 "><img src="https://caching.lottecinema.co.kr//Media/WebAdmin/7cd93510a99446e2a79b7fb9f8808c7d.jpg" alt="더블콤보 " data-pin-nopin="true"></a></span>		<div class="product_txt">			<a href="javascript:void(0);" title="더블콤보 ">더블콤보 </a>		</div>		<p class="product_price">			<span class="dash_price"><del>11,000</del></span>			<span class="price"><em>10,500</em><span> 원</span></span>		</p>	</div></li><li class="prdList ticketType 20101002" style="display:none;" ticketset="0" ticketcount="1" ticketfixed="1">   <div class="product_order">		<span class="product_thum"><a href="javascript:void(0);" title="오리지널팝콘 중"><img src="https://caching.lottecinema.co.kr//Media/WebAdmin/7df16c18c0fb4659afc4bf7e6f286429.jpg" alt="오리지널팝콘 중" data-pin-nopin="true"></a></span>		<div class="product_txt">			<a href="javascript:void(0);" title="오리지널팝콘 중">오리지널팝콘 중</a>		</div>		<p class="product_price">			<span class="dash_price"><del>4,500</del></span>			<span class="price"><em>4,000</em><span> 원</span></span>		</p>	</div></li><li class="prdList ticketType 20201002" style="display:none;" ticketset="0" ticketcount="1" ticketfixed="1">   <div class="product_order">		<span class="product_thum"><a href="javascript:void(0);" title="콜라 중"><img src="https://caching.lottecinema.co.kr//Media/WebAdmin/26c439e2cdef48e9ae8566612634cbcb.jpg" alt="콜라 중" data-pin-nopin="true"></a></span>		<div class="product_txt">			<a href="javascript:void(0);" title="콜라 중">콜라 중</a>		</div>		<p class="product_price">			<span class="dash_price"><del>2,200</del></span>			<span class="price"><em>1,700</em><span> 원</span></span>		</p>	</div></li><li class="prdList 10101001" ticketset="" ticketcount="0" ticketfixed="1" style="left: 0px;">   <div class="product_order">		<span class="product_thum"><a href="javascript:void(0);" title="스위트콤보"><img src="https://caching.lottecinema.co.kr//Media/WebAdmin/04812523aeb54b31b4d0ef2036200791.jpg" alt="스위트콤보" data-pin-nopin="true"></a></span>		<div class="product_txt">			<a href="javascript:void(0);" title="스위트콤보">스위트콤보</a>		</div>		<p class="product_price">			<span class="dash_price">판매가</span>			<span class="price"><em>8,500</em><span> 원</span></span>		</p>	</div></li><li class="prdList 10101002" ticketset="" ticketcount="0" ticketfixed="1" style="left: 250px;">   <div class="product_order">		<span class="product_thum"><a href="javascript:void(0);" title="더블콤보"><img src="https://caching.lottecinema.co.kr//Media/WebAdmin/ac2d04bbf190493d902cf486e40f5d33.jpg" alt="더블콤보" data-pin-nopin="true"></a></span>		<div class="product_txt">			<a href="javascript:void(0);" title="더블콤보">더블콤보</a>		</div>		<p class="product_price">			<span class="dash_price">판매가</span>			<span class="price"><em>11,000</em><span> 원</span></span>		</p>	</div></li><li class="prdList 10102002" ticketset="" ticketcount="0" ticketfixed="1" style="left: 500px;">   <div class="product_order">		<span class="product_thum"><a href="javascript:void(0);" title="에이드콤보"><img src="https://caching.lottecinema.co.kr//Media/WebAdmin/97c78cc034764ea9be83cf259a6bf9da.jpg" alt="에이드콤보" data-pin-nopin="true"></a></span>		<div class="product_txt">			<a href="javascript:void(0);" title="에이드콤보">에이드콤보</a>		</div>		<p class="product_price">			<span class="dash_price">판매가</span>			<span class="price"><em>11,000</em><span> 원</span></span>		</p>	</div></li><li class="prdList 10103032" ticketset="" ticketcount="0" ticketfixed="1" style="left: 750px;">   <div class="product_order">		<span class="product_thum"><a href="javascript:void(0);" title="나쵸즉석구이콤보"><img src="https://caching.lottecinema.co.kr//Media/WebAdmin/b902fd3d49c84fc891d8d3407fa75df7.jpg" alt="나쵸즉석구이콤보" data-pin-nopin="true"></a></span>		<div class="product_txt">			<a href="javascript:void(0);" title="나쵸즉석구이콤보">나쵸즉석구이콤보</a>		</div>		<p class="product_price">			<span class="dash_price">판매가</span>			<span class="price"><em>11,000</em><span> 원</span></span>		</p>	</div></li></ul>
                            <div class="product_info" style="display:none;">
                                <strong class="p_inTit">&lt;극장판 도라에몽 : 진구의 우주영웅기~스페이스 히어로즈&gt; 전용 이벤트상품 </strong>
                                <div class="clear_fix">
                                    <div class="info_Pleft">
                                        <h4 class="P_tits Lang-LBL3044">상품정보 <span class="p_etc">더 자세한 정보는 스위트샵 또는 기프트샵에서 확인해 주세요.</span></h4>
                                        <dl class="info_scroll">
                                            <dt class="Lang-LBL3045">구성품</dt>
                                            <dd class="setInfo">팝콘1 / 탄산음료2 / 즉석구이오징어1 / 나초1</dd>
                                            <dt class="Lang-LBL3046" style="display:none;">구매가능기간</dt>
                                            <dd class="dateInfo" style="display:none;">2015.12.09 ~ 2016.02.06</dd>
											<dt class="Lang-LBL3047">구매 제한</dt>
											<dd class="perInfo">1인 1일 1회</dd>
											<dt class="Lang-LBL3048">사용기간</dt>
											<dd class="dayInfo">구매 후 30일</dd>
											<dt class="Lang-LBL3049">설명</dt>
											<dd class="txtInfo">롯데시네마 BEST 콤보세트, 홈페이지, 모바일에서 구매하면 500원 할인</dd>
                                        </dl>
                                    </div>
                                    <div class="product_right">
                                        <h4 class="P_tits Lang-LBL3054">옵션선택</h4>
                                        <div class="product_scroll">
                                            <div class="pro_case1 sweetOne" style="display:none;">
                                                <div class="pro_tit">
                                                    사이즈
                                                    <div class="select_box" style="width: 187px;"><a href="#옵션선택" class="ui_fold_btn">옵션선택</a><ul><li><a href="javascript:void(0)" class="on">옵션선택</a></li><li><a href="javascript:void(0)">L(+500)</a></li><li><a href="javascript:void(0)">L(+500)</a></li><li><a href="javascript:void(0)">L(+500)</a></li></ul><select title="사이즈 선택" style="display: none;">
                                                        <option value="">옵션선택</option>
                                                        <option value="">L(+500)</option>
                                                        <option value="">L(+500)</option>
                                                        <option value="">L(+500)</option>
                                                    </select></div>
                                                </div>
                                                <ul class="shop_list">
                                                    <li>
                                                        <strong class="goods_tit">카라멜팝콘 L</strong>
                                                        <div class="goods_box">
                                                            <div class="amount">
                                                                <input type="text" title="수량갯수 입력">
                                                                <a href="javascript:void(0);"><img src="/LCHS/Image/Btn/btn_s_minus02.gif" alt="수랑감소"></a>
                                                                <a href="javascript:void(0);"><img src="/LCHS/Image/Btn/btn_s_plus02.gif" alt="수량증가"></a>
                                                            </div>
                                                            <p class="price"><span>0</span>원</p>
                                                            <a href="javascript:void(0);" class="btn_s_close"><img src="/LCHS/Image/Btn/btn_d_close.png" alt="닫기"></a>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <strong class="goods_tit">카라멜팝콘 L</strong>
                                                        <div class="goods_box">
                                                            <div class="amount">
                                                                <input type="text" title="수량갯수 입력">
                                                                <a href="javascript:void(0);"><img src="/LCHS/Image/Btn/btn_s_minus02.gif" alt="수랑감소"></a>
                                                                <a href="javascript:void(0);"><img src="/LCHS/Image/Btn/btn_s_plus02.gif" alt="수량증가"></a>
                                                            </div>
                                                            <p class="price"><span>0</span>원</p>
                                                            <a href="javascript:void(0);" class="btn_s_close"><img src="/LCHS/Image/Btn/btn_d_close.png" alt="닫기"></a>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="pro_case1 sweetTwo" style="display:none;">
                                                <div class="pro_tit">팝콘</div>
                                                <ul class="shop_list02">
                                                    <li>
                                                        <strong class="pro_tit">맛</strong>
                                                        <div class="select_box" style="width: 187px;"><a href="#옵션선택" class="ui_fold_btn">옵션선택</a><ul><li><a href="javascript:void(0)" class="on">옵션선택</a></li><li><a href="javascript:void(0)">카라멜(+1500)</a></li><li><a href="javascript:void(0)">카라멜(+1500)</a></li><li><a href="javascript:void(0)">카라멜(+1500)</a></li></ul><select title="맛 선택" style="display: none;">
                                                            <option value="">옵션선택</option>
                                                            <option value="">카라멜(+1500)</option>
                                                            <option value="">카라멜(+1500)</option>
                                                            <option value="">카라멜(+1500)</option>
                                                        </select></div>
                                                    </li>
                                                    <li>
                                                        <strong class="pro_tit">사이즈</strong>
                                                        <div class="select_box" style="width: 187px;"><a href="#옵션선택" class="ui_fold_btn">옵션선택</a><ul><li><a href="javascript:void(0)" class="on">옵션선택</a></li><li><a href="javascript:void(0)">카라멜(+1500)</a></li><li><a href="javascript:void(0)">카라멜(+1500)</a></li><li><a href="javascript:void(0)">카라멜(+1500)</a></li></ul><select title="사이즈 선택" style="display: none;">
                                                            <option value="">옵션선택</option>
                                                            <option value="">카라멜(+1500)</option>
                                                            <option value="">카라멜(+1500)</option>
                                                            <option value="">카라멜(+1500)</option>
                                                        </select></div>
                                                    </li>
                                                </ul>
                                                <div class="pro_tit">탄산음료1</div>
                                                <ul class="shop_list02">
                                                    <li>
                                                        <strong class="pro_tit">맛</strong>
                                                        <div class="select_box" style="width: 187px;"><a href="#옵션선택" class="ui_fold_btn">옵션선택</a><ul><li><a href="javascript:void(0)" class="on">옵션선택</a></li><li><a href="javascript:void(0)">카라멜(+1500)</a></li><li><a href="javascript:void(0)">카라멜(+1500)</a></li><li><a href="javascript:void(0)">카라멜(+1500)</a></li></ul>
                                                            <div class="select_box" style="width: 187px;"><a href="#옵션선택" class="ui_fold_btn">옵션선택</a><ul><li><a href="javascript:void(0)">옵션선택</a></li><li><a href="javascript:void(0)">카라멜(+1500)</a></li><li><a href="javascript:void(0)">카라멜(+1500)</a></li><li><a href="javascript:void(0)">카라멜(+1500)</a></li></ul><select title="맛 선택" style="display: none;">
                                                                <option value="">옵션선택</option>
                                                                <option value="">카라멜(+1500)</option>
                                                                <option value="">카라멜(+1500)</option>
                                                                <option value="">카라멜(+1500)</option>
                                                            </select></div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <strong class="pro_tit">사이즈</strong>
                                                        <div class="select_box" style="width: 187px;"><a href="#옵션선택" class="ui_fold_btn">옵션선택</a><ul><li><a href="javascript:void(0)" class="on">옵션선택</a></li><li><a href="javascript:void(0)">카라멜(+1500)</a></li><li><a href="javascript:void(0)">카라멜(+1500)</a></li><li><a href="javascript:void(0)">카라멜(+1500)</a></li></ul>
                                                            <div class="select_box" style="width: 187px;"><a href="#옵션선택" class="ui_fold_btn">옵션선택</a><ul><li><a href="javascript:void(0)">옵션선택</a></li><li><a href="javascript:void(0)">카라멜(+1500)</a></li><li><a href="javascript:void(0)">카라멜(+1500)</a></li><li><a href="javascript:void(0)">카라멜(+1500)</a></li></ul><select title="사이즈 선택" style="display: none;">
                                                                <option value="">옵션선택</option>
                                                                <option value="">카라멜(+1500)</option>
                                                                <option value="">카라멜(+1500)</option>
                                                                <option value="">카라멜(+1500)</option>
                                                            </select></div>
                                                        </div>
                                                    </li>
                                                    <li class="last_combo">
                                                        <strong class="goods_tit">슈퍼콤보패밀리 PACK</strong>
                                                        <div class="goods_box">
                                                            <div class="amount">
                                                                <input type="text" title="수량갯수 입력">
                                                                <a href="javascript:void(0);"><img src="/LCHS/Image/Btn/btn_s_minus02.gif" alt="수랑감소"></a>
                                                                <a href="javascript:void(0);"><img src="/LCHS/Image/Btn/btn_s_plus02.gif" alt="수량증가"></a>
                                                            </div>
                                                            <p class="price"><span>0</span>원</p>
                                                            <a href="javascript:void(0);" class="btn_s_close"><img src="/LCHS/Image/Btn/btn_d_close.png" alt="닫기"></a>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                            <ul class="shop_list sweetTree" style="display:none;">
                                                <li>
                                                    <strong class="goods_tit">카라멜팝콘 L</strong>
                                                    <div class="goods_box">
                                                        <div class="amount">
                                                            <input type="text" title="수량갯수 입력" value="0">
                                                            <a href="javascript:void(0);" class="prod_down"><img src="/LCHS/Image/Btn/btn_s_minus02.gif" alt="수랑감소"></a>
                                                            <a href="javascript:void(0);" class="prod_up"><img src="/LCHS/Image/Btn/btn_s_plus02.gif" alt="수량증가"></a>
                                                        </div>
                                                        <p class="price"><span>0</span>원</p>
                                                    </div>
                                                </li>
                                            </ul>

                                        </div>
                                        <div class="total">
                                            <strong class="Lang-LBL3050">합계</strong>
                                            <em><span>0</span><em class="Lang-LBL3051">원</em></em>
                                        </div>
                                    </div>
                                </div>
                                <div class="p_bottom">
                       
                                       <!-- 수정 20170316-->
                                        <ul class="fl_left">
                                            <li class="P_etxt desc Lang-LBL3052">상품 담기 후, 다음단계로 가시면 티켓과 함께 결제할 수 있습니다.</li>
											<li class="P_etxt desc Lang-LBL3060">좌석 구매 시 함께 구매한 매점 상품은 영화 관람 완료 후에는 취소가 불가합니다.</li>
                                            <li class="P_etxt desc Lang-LBL3061">매점 상품은 할인 상품으로 L.POINT 적립이 불가합니다.</li>
                                        </ul>
                                        <!--// 수정 20170316-->
                                    <div class="btn_box">
                                        <!--<a href="javascript:void(0);" class="btnc_complete complete_re">상품 담기</a>-->
                                        <a href="javascript:void(0);" class="btnc_complete complete_end Lang-LBL3053">상품 담기</a>
                                    </div>
                                </div>
                                <a href="javascript:void(0);" class="btn_close"><img src="/LCHS/Image/Btn/btn_t_close.png" alt="닫기"></a>
                            </div>
						</div>							
					</div>
					<!--// carousel_box -->
				</div>
			</div>
			<!-- //carouselwrap -->

            <div class="btn_wrap">
				<div class="btn_inner">
					<a href="<%= cp %>/reserve/movieTicketing.see" class="btn_prev Lang-LBL1024" title="이전단계">이전단계</a>
					<a href="JavaScript:Reserve()" class="btn_next Lang-LBL1025" title="다음단계">다음단계</a>
				</div>
			</div>

	        <!-- total_wrap -->
	        <div class="total_wrap">
		        <div class="total_inner">
				    <div class="total_slide">
				    
					    <ul>
						    <li>
							    <dl>
							    
								    <dt class="total_tit Lang-LBL1026">영화</dt>
								    <dd>
									    <dl class="total_data">
										    <dt><img src="<%= cp %>/resources/upload/movie/main_movie/${movieModel.movie_poster}" alt="기억의 밤"></dt>
										    <dd>
											    <strong class="movie_name">${reserve_seat.timetable_movie_name}</strong>
											    <em class="movie_sort">2D</em>
											    <p class="movie_grade">15세이상관람가</p>
										    </dd>
									    </dl>
								    </dd>
							    </dl>
						    </li>
						    <li>
							    <dl>
							    
								    <dt class="total_tit Lang-LBL1027">예매정보</dt>
								    <dd>
									    <dl class="total_data">
										    <dt class="Lang-LBL1028">상영날짜
										    <dd class="day_data"><fmt:formatDate value="${reserve_seat.timetable_show_date}" pattern="yyyyMMdd"></fmt:formatDate></dd>
										    <dt class="Lang-LBL1029">상영시간</dt>
										    <dd class="time_data">${reserve_seat.timetable_start_time} ~ ${reserve_seat.timetable_end_time}</dd>
										    <!-- <dt class="Lang-LBL1030">상영관</dt>
										    <dd class="seat_data"></dd> -->
									    </dl>
								    </dd>
							    </dl>
						    </li>
						    <li class="carouselView">
							    <dl>
									<dt class="total_tit Lang-LBL1032">상품정보</dt>
									<dd class="total_sweet">
										<p class="Lang-LBL1033">상품을 선택해 주십시오.</p>
									</dd>
								</dl>
						    </li>
<!-- 						    <li>
							    <dl>
								    <dt class="total_tit Lang-LBL1034">총 결제 금액</dt>
								    <dd>
									    <dl class="total_data sum">
										    <dt class="Lang-LBL1035">영화예매</dt>
										    <dd class="seatSum">\ <span>0</span></dd>
										    <dt class="carouselView Lang-LBL1036 prodView" style="display:none;">상품구매</dt>
										    <dd class="prodSum carouselView prodView" style="display:none;">\ <span>0</span></dd>
									    </dl>								
								    </dd>
							    </dl>
							    <strong class="total_sum fixSum"><span>0</span> <em class="Lang-LBL1037">원</em></strong>
						    </li> -->
					    </ul>
				    </div>
		        </div>
	        </div>
	        <!--//  total_wrap -->

		</div>
</div>

</div>
</div>
</div>
<script type="text/javascript">
function Reserve()
    {
	var timetable_movie_no = "${reserve_seat.timetable_movie_no}";
    var timetable_no = "${reserve_seat.timetable_no}";
    var timetable_adult_cnt = document.reserveform.adult_cnt.value;
    var timetable_child_cnt = document.reserveform.child_cnt.value;
    /* var id = "${session_member_id}"; */
    location.href = '<%= cp%>/reserve/movieTicketing2.see?timetable_movie_no='+timetable_movie_no+'&timetable_no='+timetable_no+'&timetable_adult_cnt='+timetable_adult_cnt+'&timetable_child_cnt='+timetable_child_cnt;
};
</script>
</body>
</html>