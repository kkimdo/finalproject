<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="<%=cp%>/resources/mscs/common.css" />
<link rel="stylesheet" type="text/css"
	href="<%=cp%>/resources/mscs/reset.css" />
<link rel="stylesheet" type="text/css"
	href="<%=cp%>/resources/mscs/event.css" />
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
	<div class="pop_wrap" id="pop_wrap01" style="display: block">
		<div class="pop_wrap_inner pop_favor"
			style="visibility: visible; margin-left: -300px; margin-top: -294.5px;">
			<div class="pop_header">
				<strong class="pop_tit">영화관 선택</strong>
			</div>
			<div class="pop_body">
				<div class="pop_scroll">

					<div class="favor_box inner_scroll">
						<!-- 160107 inner_scroll 클래스 추가 -->
						<strong class="favor_tit2">전체영화관 <span>문의와 관련된
								영화관을 1곳 선택해 주세요.</span></strong>
						<ul class="theater_zone bg_bullet">
							<li><span class="area_zone zone_01 area0001 on"><a
									class="on" href="javascript:void(0)">서울</a></span>
								<div class="area_cont on">
									<ul class="area_list d0001">
										<li><a href="javascript:selected_input('강남')"
											class="cinema1013 100011013">강남</a></li>
									</ul>
								</div></li>
							<li><span class="area_zone zone_08  area0007 on"><a
									class="on" href="javascript:void(0)">제주</a></span>
								<div class="area_cont on">
									<ul class="area_list d0007">
										<li><a href="javascript:void(0)"
											class="cinema9013 100079013">서귀포</a></li>
									</ul>
								</div></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>