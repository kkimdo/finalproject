<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>영화관 선택</title>

<script type="text/javascript">
	function selected_input(theater) {
		window.opener.formWrite.notice_area.value = theater;
		self.close();
	}
</script>
</head>
<body>

	<a href="javascript:selected_input('서울/강남')">서울/강남</a>
	<br>

	<div class="pop_wrap_inner pop_favor"
		style="visibility: visible; margin-left: -300px; margin-top: -294.5px;">
		<div class="pop_header">
			<strong class="pop_tit">영화관 선택</strong>
		</div>
		<div class="pop_body">
			<div class="pop_scroll">

				<div class="favor_box inner_scroll">
					<!-- 160107 inner_scroll 클래스 추가 -->
					<strong class="favor_tit2">전체영화관 <span>문의와 관련된 영화관을
							1곳 선택해 주세요.</span></strong>
					<ul class="theater_zone bg_bullet">
						<li><span class="area_zone zone_01 area0001 on"><a
								class="on" href="javascript:selected_input('서울/강남')">서울/강남</a></span>
							<div class="area_cont on">
								<ul class="area_list d0001">
									<li><a href="javascript:void(0)"
										class="cinema1013 100011013">가산디지털</a></li>
									<li><a href="javascript:void(0)"
										class="cinema9010 100019010">강동</a></li>
									<li><a href="javascript:void(0)"
										class="cinema1004 100011004">건대입구</a></li>
									<li><a href="javascript:void(0)"
										class="cinema1009 100011009">김포공항</a></li>
									<li><a href="javascript:void(0)"
										class="cinema1003 100011003">노원</a></li>
									<li><a href="javascript:void(0)"
										class="cinema1017 100011017">독산</a></li>
									<li><a href="javascript:void(0)"
										class="cinema9056 100019056">브로드웨이(신사)</a></li>
									<li><a href="javascript:void(0)"
										class="cinema1012 100011012">서울대입구</a></li>
									<li><a href="javascript:void(0)"
										class="cinema1019 100011019">수락산</a></li>
									<li><a href="javascript:void(0)"
										class="cinema1022 100011022">수유</a></li>
									<li><a href="javascript:void(0)"
										class="cinema1015 100011015">신도림</a></li>
									<li><a href="javascript:void(0)"
										class="cinema1007 100011007">신림</a></li>
									<li><a href="javascript:void(0)"
										class="cinema1001 100011001">에비뉴엘(명동)</a></li>
									<li><a href="javascript:void(0)"
										class="cinema1002 100011002">영등포</a></li>
									<li><a href="javascript:void(0)"
										class="cinema1014 100011014">용산</a></li>
									<li><a href="javascript:void(0)"
										class="cinema1016 100011016">월드타워</a></li>
									<li><a href="javascript:void(0)"
										class="cinema1021 100011021">은평(롯데몰)</a></li>
									<li><a href="javascript:void(0)"
										class="cinema9053 100019053">장안</a></li>
									<li><a href="javascript:void(0)"
										class="cinema1008 100011008">청량리</a></li>
									<li><a href="javascript:void(0)"
										class="cinema1010 100011010">합정</a></li>
									<li><a href="javascript:void(0)"
										class="cinema1005 100011005">홍대입구</a></li>
									<li><a href="javascript:void(0)"
										class="cinema1011 100011011">황학</a></li>
									<li><a href="javascript:void(0)"
										class="cinema1018 100011018">가양</a></li>
								</ul>
							</div></li>
					</ul>
				</div>
			</div>
			<a href="#pop_wrap01" class="pop_btn_close pop_close"><img
				src="/LCHS/Image/Btn/btn_pop_close01.gif" alt="닫기"></a>
		</div>
	</div>
</body>
</html>