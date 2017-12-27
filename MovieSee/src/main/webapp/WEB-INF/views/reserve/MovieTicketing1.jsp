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
<a href="<%=cp %>/event/eventListMain.see" title="이벤트">이벤트</a>
</li>

<li>
<a href="<%=cp %>/gift/giftShopList.see" title="기프트샵">기프트샵</a>
</li>
</ul>
</div>

<div id="content">

			<!-- seatwrap -->
			<div class="seatwrap">
			  <div class="seatArea">
                  <!-- 온라인광고 신규 2017-06 -->
                
                    
                    <div class="ad-banner wing_banner left_banner">
						<div class="wrap_banner">
							<a href="https://nvapi.feeldmc.com:443/ad/p/in/v1_0/clk?slotid=stw_lottelotte_22&amp;adgroupid=adg_lottecinema_20171130_13&amp;adid=adi_lottecinema_20171130_13" target="_blank">
							<img src="https://caching2.lottecinema.co.kr/lotte_image/2017/hyundaicardM2/0816/hyundaicardM2_160300.jpg" style="width:160;height:300;border:0px" alt="현대카드 신규 발급 시 영화관람권 1~4장 제공"></a>
						</div>
					</div>
					<div class="ad-banner wing_banner right_banner">
						<div class="wrap_banner">
							<a href="https://nvapi.feeldmc.com:443/ad/p/in/v1_0/clk?slotid=stw_lottelotte_22&amp;adgroupid=adg_lottecinema_20171130_13&amp;adid=adi_lottecinema_20171130_13" target="_blank">
							<img src="https://caching2.lottecinema.co.kr/lotte_image/2017/hyundaicardM2/0816/hyundaicardM2_160300.jpg" style="width:160;height:300;border:0px" alt="현대카드 신규 발급 시 영화관람권 1~4장 제공"></a>
						</div>
					</div>
                    

                <!--// 온라인광고 신규 2017-06 -->
                  <div class="seatheader">
					<h2 class="seatTit Lang-LBL1001">인원/좌석선택</h2>
				</div>
				<div class="selectbox">
				<form name="reserveform" action="#" method="post">
					<ul class="personSelect">
					<label for="person0">성인</label>
					<ul>
					<li>	
						<select name="adult_cnt" class="slct">
						<option value="0">0명</option>
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
						<option value="0">0명</option>
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
                    </form>
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
						<span class="floor_tit" style="display: none;"></span>
						<div class="seat_Barea">
						<c:choose>
						<c:when test = "${reserve_seat.timetable_total_seat == 10}">
						<div class="seat_area" style="height: 150px; margin-left: 330px;">
						<a href="javascript:void(0);" class="p0 grNum7" data-seat="B1" seat-statuscode="0" block-code="p0" seat-group="grNum7" style="left: 22px; top: 27px;" title="좌석 번호:B1 - 일반석" seat-code="1B01">1</a>
						<a class="p0 grNum7" data-seat="B2" seat-statuscode="0" block-code="p0" seat-group="grNum7" style="left: 48px; top: 27px;" title="좌석 번호:B2 - 일반석" seat-code="1B02">2</a>
						<a class="p0 grNum7" data-seat="B3" seat-statuscode="0" block-code="p0" seat-group="grNum7" style="left: 75px; top: 27px;" title="좌석 번호:B3 - 일반석" seat-code="1B03">3</a>
						<a href="javascript:void(0);" class="p0 grNum7" data-seat="B4" seat-statuscode="0" block-code="p0" seat-group="grNum7" style="left: 102px; top: 27px;" title="좌석 번호:B4 - 일반석" seat-code="1B04">4</a>
						<a href="javascript:void(0);" class="p0 grNum8" data-seat="B5" seat-statuscode="0" block-code="p0" seat-group="grNum8" style="left: 129px; top: 27px;" title="좌석 번호:B5 - 일반석" seat-code="1B05">5</a>
						<a class="p0 grNum8" data-seat="B6" seat-statuscode="0" block-code="p0" seat-group="grNum8" style="left: 176px; top: 27px;" title="좌석 번호:B6 - 일반석" seat-code="1B06">6</a>
						<a href="javascript:void(0);" class="p0 grNum8" data-seat="B7" seat-statuscode="0" block-code="p0" seat-group="grNum8" style="left: 203px; top: 27px;" title="좌석 번호:B7 - 일반석" seat-code="1B07">7</a>
						<a href="javascript:void(0);" class="p0 grNum8" data-seat="B8" seat-statuscode="0" block-code="p0" seat-group="grNum8" style="left: 230px; top: 27px;" title="좌석 번호:B8 - 일반석" seat-code="1B08">8</a>
						<a class="p0 grNum8" data-seat="B9" seat-statuscode="0" block-code="p0" seat-group="grNum8" style="left: 256px; top: 27px;" title="좌석 번호:B9 - 일반석" seat-code="1B09">9</a>
						<a href="javascript:void(0);" class="p0 grNum8" data-seat="B10" seat-statuscode="0" block-code="p0" seat-group="grNum8" style="left: 283px; top: 27px;" title="좌석 번호:B10 - 일반석" seat-code="1B10">10</a>
						</c:when>
						
						<c:when test = "${reserve_seat.timetable_total_seat == 20}">
						<div class="seat_area" style="height: 236px; margin-left: 330px;">
						<a href="javascript:void(0);" class="p0 grNum7" data-seat="B1" seat-statuscode="0" block-code="p0" seat-group="grNum7" style="left: 22px; top: 27px;" title="좌석 번호:B1 - 일반석" seat-code="1B01">1</a>
						<a class="p0 grNum7" data-seat="B2" seat-statuscode="0" block-code="p0" seat-group="grNum7" style="left: 48px; top: 27px;" title="좌석 번호:B2 - 일반석" seat-code="1B02">2</a>
						<a class="p0 grNum7" data-seat="B3" seat-statuscode="0" block-code="p0" seat-group="grNum7" style="left: 75px; top: 27px;" title="좌석 번호:B3 - 일반석" seat-code="1B03">3</a>
						<a href="javascript:void(0);" class="p0 grNum7" data-seat="B4" seat-statuscode="0" block-code="p0" seat-group="grNum7" style="left: 102px; top: 27px;" title="좌석 번호:B4 - 일반석" seat-code="1B04">4</a>
						<a href="javascript:void(0);" class="p0 grNum8" data-seat="B5" seat-statuscode="0" block-code="p0" seat-group="grNum8" style="left: 128px; top: 27px;" title="좌석 번호:B5 - 일반석" seat-code="1B05">5</a>
						<a class="p0 grNum8" data-seat="B6" seat-statuscode="0" block-code="p0" seat-group="grNum8" style="left: 176px; top: 27px;" title="좌석 번호:B6 - 일반석" seat-code="1B06">6</a>
						<a href="javascript:void(0);" class="p0 grNum8" data-seat="B7" seat-statuscode="0" block-code="p0" seat-group="grNum8" style="left: 203px; top: 27px;" title="좌석 번호:B7 - 일반석" seat-code="1B07">7</a>
						<a href="javascript:void(0);" class="p0 grNum8" data-seat="B8" seat-statuscode="0" block-code="p0" seat-group="grNum8" style="left: 230px; top: 27px;" title="좌석 번호:B8 - 일반석" seat-code="1B08">8</a>
						<a class="p0 grNum8" data-seat="B9" seat-statuscode="0" block-code="p0" seat-group="grNum8" style="left: 256px; top: 27px;" title="좌석 번호:B9 - 일반석" seat-code="1B09">9</a>
						<a href="javascript:void(0);" class="p0 grNum8" data-seat="B10" seat-statuscode="0" block-code="p0" seat-group="grNum8" style="left: 283px; top: 27px;" title="좌석 번호:B10 - 일반석" seat-code="1B10">10</a>
						<a href="javascript:void(0);" class="p0 grNum11" data-seat="C1" seat-statuscode="0" block-code="p0" seat-group="grNum11" style="left: 22px; top: 54px;" title="좌석 번호:C1 - 일반석" seat-code="1C01">1</a>
						<a class="p0 grNum11" data-seat="C2" seat-statuscode="0" block-code="p0" seat-group="grNum11" style="left: 48px; top: 54px;" title="좌석 번호:C2 - 일반석" seat-code="1C02">2</a><a class="p0 grNum11" data-seat="C3" seat-statuscode="0" block-code="p0" seat-group="grNum11" style="left: 75px; top: 54px;" title="좌석 번호:C3 - 일반석" seat-code="1C03">3</a>
						<a href="javascript:void(0);" class="p0 grNum11" data-seat="C4" seat-statuscode="0" block-code="p0" seat-group="grNum11" style="left: 102px; top: 54px;" title="좌석 번호:C4 - 일반석" seat-code="1C04">4</a>
						<a href="javascript:void(0);" class="p0 grNum12" data-seat="C5" seat-statuscode="0" block-code="p0" seat-group="grNum12" style="left: 128px; top: 54px;" title="좌석 번호:C5 - 일반석" seat-code="1C05">5</a>
						<a class="p0 grNum12" data-seat="C6" seat-statuscode="0" block-code="p0" seat-group="grNum12" style="left: 176px; top: 54px;" title="좌석 번호:C6 - 일반석" seat-code="1C06">6</a><a href="javascript:void(0);" class="p0 grNum12" data-seat="C7" seat-statuscode="0" block-code="p0" seat-group="grNum12" style="left: 203px; top: 54px;" title="좌석 번호:C7 - 일반석" seat-code="1C07">7</a><a href="javascript:void(0);" class="p0 grNum12" data-seat="C8" seat-statuscode="0" block-code="p0" seat-group="grNum12" style="left: 230px; top: 54px;" title="좌석 번호:C8 - 일반석" seat-code="1C08">8</a><a class="p0 grNum12" data-seat="C9" seat-statuscode="0" block-code="p0" seat-group="grNum12" style="left: 256px; top: 54px;" title="좌석 번호:C9 - 일반석" seat-code="1C09">9</a><a href="javascript:void(0);" class="p0 grNum12" data-seat="C10" seat-statuscode="0" block-code="p0" seat-group="grNum12" style="left: 283px; top: 54px;" title="좌석 번호:C10 - 일반석" seat-code="1C10">10</a>
						</c:when>
						
						<c:otherwise>
						<div class="seat_area" style="height: 236px; margin-left: 330px;">
						<a href="javascript:void(0);" class="p0 grNum7" data-seat="B1" seat-statuscode="0" block-code="p0" seat-group="grNum7" style="left: 22px; top: 27px;" title="좌석 번호:B1 - 일반석" seat-code="1B01">1</a><a class="p0 grNum7" data-seat="B2" seat-statuscode="0" block-code="p0" seat-group="grNum7" style="left: 48px; top: 27px;" title="좌석 번호:B2 - 일반석" seat-code="1B02">2</a><a class="p0 grNum7" data-seat="B3" seat-statuscode="0" block-code="p0" seat-group="grNum7" style="left: 75px; top: 27px;" title="좌석 번호:B3 - 일반석" seat-code="1B03">3</a><a href="javascript:void(0);" class="p0 grNum7" data-seat="B4" seat-statuscode="0" block-code="p0" seat-group="grNum7" style="left: 102px; top: 27px;" title="좌석 번호:B4 - 일반석" seat-code="1B04">4</a><a href="javascript:void(0);" class="p0 grNum8" data-seat="B5" seat-statuscode="0" block-code="p0" seat-group="grNum8" style="left: 128px; top: 27px;" title="좌석 번호:B5 - 일반석" seat-code="1B05">5</a><a class="p0 grNum8" data-seat="B6" seat-statuscode="0" block-code="p0" seat-group="grNum8" style="left: 176px; top: 27px;" title="좌석 번호:B6 - 일반석" seat-code="1B06">6</a><a href="javascript:void(0);" class="p0 grNum8" data-seat="B7" seat-statuscode="0" block-code="p0" seat-group="grNum8" style="left: 203px; top: 27px;" title="좌석 번호:B7 - 일반석" seat-code="1B07">7</a><a href="javascript:void(0);" class="p0 grNum8" data-seat="B8" seat-statuscode="0" block-code="p0" seat-group="grNum8" style="left: 230px; top: 27px;" title="좌석 번호:B8 - 일반석" seat-code="1B08">8</a><a class="p0 grNum8" data-seat="B9" seat-statuscode="0" block-code="p0" seat-group="grNum8" style="left: 256px; top: 27px;" title="좌석 번호:B9 - 일반석" seat-code="1B09">9</a><a href="javascript:void(0);" class="p0 grNum8" data-seat="B10" seat-statuscode="0" block-code="p0" seat-group="grNum8" style="left: 283px; top: 27px;" title="좌석 번호:B10 - 일반석" seat-code="1B10">10</a>
						<a href="javascript:void(0);" class="p0 grNum11" data-seat="C1" seat-statuscode="0" block-code="p0" seat-group="grNum11" style="left: 22px; top: 54px;" title="좌석 번호:C1 - 일반석" seat-code="1C01">1</a><a class="p0 grNum11" data-seat="C2" seat-statuscode="0" block-code="p0" seat-group="grNum11" style="left: 48px; top: 54px;" title="좌석 번호:C2 - 일반석" seat-code="1C02">2</a><a class="p0 grNum11" data-seat="C3" seat-statuscode="0" block-code="p0" seat-group="grNum11" style="left: 75px; top: 54px;" title="좌석 번호:C3 - 일반석" seat-code="1C03">3</a><a href="javascript:void(0);" class="p0 grNum11" data-seat="C4" seat-statuscode="0" block-code="p0" seat-group="grNum11" style="left: 102px; top: 54px;" title="좌석 번호:C4 - 일반석" seat-code="1C04">4</a><a href="javascript:void(0);" class="p0 grNum12" data-seat="C5" seat-statuscode="0" block-code="p0" seat-group="grNum12" style="left: 128px; top: 54px;" title="좌석 번호:C5 - 일반석" seat-code="1C05">5</a><a class="p0 grNum12" data-seat="C6" seat-statuscode="0" block-code="p0" seat-group="grNum12" style="left: 176px; top: 54px;" title="좌석 번호:C6 - 일반석" seat-code="1C06">6</a><a href="javascript:void(0);" class="p0 grNum12" data-seat="C7" seat-statuscode="0" block-code="p0" seat-group="grNum12" style="left: 203px; top: 54px;" title="좌석 번호:C7 - 일반석" seat-code="1C07">7</a><a href="javascript:void(0);" class="p0 grNum12" data-seat="C8" seat-statuscode="0" block-code="p0" seat-group="grNum12" style="left: 230px; top: 54px;" title="좌석 번호:C8 - 일반석" seat-code="1C08">8</a><a class="p0 grNum12" data-seat="C9" seat-statuscode="0" block-code="p0" seat-group="grNum12" style="left: 256px; top: 54px;" title="좌석 번호:C9 - 일반석" seat-code="1C09">9</a><a href="javascript:void(0);" class="p0 grNum12" data-seat="C10" seat-statuscode="0" block-code="p0" seat-group="grNum12" style="left: 283px; top: 54px;" title="좌석 번호:C10 - 일반석" seat-code="1C10">10</a>
						<a href="javascript:void(0);" class="p0 grNum15" data-seat="D1" seat-statuscode="0" block-code="p0" seat-group="grNum15" style="left: 22px; top: 81px;" title="좌석 번호:D1 - 일반석" seat-code="1D01">1</a><a class="p0 grNum15" data-seat="D2" seat-statuscode="0" block-code="p0" seat-group="grNum15" style="left: 48px; top: 81px;" title="좌석 번호:D2 - 일반석" seat-code="1D02">2</a><a class="p0 grNum15" data-seat="D3" seat-statuscode="0" block-code="p0" seat-group="grNum15" style="left: 75px; top: 81px;" title="좌석 번호:D3 - 일반석" seat-code="1D03">3</a><a href="javascript:void(0);" class="p0 grNum15" data-seat="D4" seat-statuscode="0" block-code="p0" seat-group="grNum15" style="left: 102px; top: 81px;" title="좌석 번호:D4 - 일반석" seat-code="1D04">4</a><a href="javascript:void(0);" class= p0 grNum16" data-seat="D5" seat-statuscode="0" block-code="p0" seat-group="grNum16" style="left: 128px; top: 81px;" title="좌석 번호:D5 - 일반석 SWEET SPOT" seat-code="1D05">5</a><a class= p0 grNum16" data-seat="D6" seat-statuscode="0" block-code="p0" seat-group="grNum16" style="left: 176px; top: 81px;" title="좌석 번호:D6 - 일반석 SWEET SPOT" seat-code="1D06">6</a><a href="javascript:void(0);" class= p0 grNum16" data-seat="D7" seat-statuscode="0" block-code="p0" seat-group="grNum16" style="left: 203px; top: 81px;" title="좌석 번호:D7 - 일반석 SWEET SPOT" seat-code="1D07">7</a><a href="javascript:void(0);" class= p0 grNum16" data-seat="D8" seat-statuscode="0" block-code="p0" seat-group="grNum16" style="left: 230px; top: 81px;" title="좌석 번호:D8 - 일반석 SWEET SPOT" seat-code="1D08">8</a><a class= p0 grNum16" data-seat="D9" seat-statuscode="0" block-code="p0" seat-group="grNum16" style="left: 256px; top: 81px;" title="좌석 번호:D9 - 일반석 SWEET SPOT" seat-code="1D09">9</a><a href="javascript:void(0);" class= p0 grNum16" data-seat="D10" seat-statuscode="0" block-code="p0" seat-group="grNum16" style="left: 283px; top: 81px;" title="좌석 번호:D10 - 일반석 SWEET SPOT" seat-code="1D10">10</a>
						</c:otherwise>
						</c:choose>
						<div class="seat_eBox">
						</div>
					</div>
				</div>
			</div>
			<!--// mseat_wrap -->

			<!-- info_wrap -->
			<div class="info_wrap">
			</div>
			<!--// info_wrap -->

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
											    <em class="movie_sort">${movieModel.movie_type}</em>
											    <em class="movie_sort">${movieModel.movie_genre}</em>
											    <p class="movie_grade">${movieModel.movie_age}세 이상 이용가</p>
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
										    <dd class="day_data"><fmt:formatDate value="${reserve_seat.timetable_show_date}" pattern="yyyy년 MM월 dd일"></fmt:formatDate></dd>
										    <dt class="Lang-LBL1029">상영시간</dt>
										    <dd class="time_data">${reserve_seat.timetable_start_time} ~ ${reserve_seat.timetable_end_time}</dd>
										    <dt class="Lang-LBL1029">좌석 수</dt>
										    <dd class="time_data">${reserve_seat.timetable_total_seat}석 영화관</dd>
									    </dl>
								    </dd>
							    </dl>
						    </li>
<%--  						    <li>
							    <dl>
								    <dt class="total_tit Lang-LBL1034">총 결제 금액</dt>
								    <dd>
									    <dl class="total_data sum">
										    <dt class="Lang-LBL1035">영화예매</dt>
										    <dd class="seatSum"> <span>${reserve_seat.timetable_adult_cnt + reserve_seat.timetable_child_cnt} 장 </span></dd> 
										    <dt class="Lang-LBL1035">성인</dt>
										    <dd class="seatSum"> <span>${reserve_seat.timetable_adult_cnt} 장</span></dd>
										    <dt class="Lang-LBL1035">학생</dt>
										    <dd class="seatSum"> <span>${reserve_seat.timetable_child_cnt} 장</span></dd>
									    </dl>								
								    </dd>
							    </dl>
							    <strong class="total_sum fixSum">
							    <span>${reserve_seat.timetable_adult_amt * reserve_seat.timetable_adult_cnt} + ${reserve_seat.timetable_child_amt * reserve_seat.timetable_child_cnt}</span> 
							    <em class="Lang-LBL1037">원</em>
							    </strong>
						    </li>  --%>
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