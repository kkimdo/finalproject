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
<title>이벤트</title>

</head>
<body>
	<div class="header">
		<div class="gnb">
			<ul>
				<li class="active"><a href="<%=cp%>/admin/eventListMain.see"
					title="이벤트">이벤트</a>
					<div class="depth">
						<ul>
							<li><a href="<%=cp%>/admin/eventList_1.see" title="영화">영화</a></li>
							<li><a href="<%=cp%>/admin/eventList_2.see" title="시사회/무대인사">시사회/무대인사</a></li>
							<li><a href="<%=cp%>/admin/eventList_3.see" title="롯시NOW">롯시NOW</a></li>
							<li><a href="<%=cp%>/admin/eventList_4.see" title="제휴할인">제휴할인</a></li>
						</ul>
					</div></li>

			</ul>
		</div>
		<!-- //GNB area -->
	</div>

	<div id="container" class="sub">
		<!-- content -->
		<div id="divADLeftPlotting" class="ad_pic" style="top: 323px;">
		</div>
		<div id="content">
			<div class="event_Hwrap allevPg">
				<ul class="btnc_right">
					<li><a href="#none">지난 이벤트</a></li>
					<li></li>
				</ul>
				<!-- 영화 -->
				<div id="clear_fix_20" class="clear_fix" style="">
					<h2 class="sub_stit">
						영화<span class="event_etc">신작 영화 이벤트에 지금 참여하세요.</span>
					</h2>
					<a href="<%=cp%>/admin/eventList_1.see" class="btn_more"
						title="영화 더보기">MORE</a>
				</div>
				<!-- emovie_list_1 -->
				<ul class="emovie_list">
					<c:forEach var="eventList_1" items="${map.eventList_1}" end="3">
						<li><a href="<%=cp %>/admin/eventView.see?event_no=${eventList_1.event_no}&curPage=${map.c_Paging.curPage}"> <img
								src="/movie/resources/uploads/event/${eventList_1.event_poster_file}"
								alt="${eventList_1.event_subject}" />
						</a>
							<dl class="imgsub">
								<dt class="event">
									<a href="<%=cp %>/admin/eventView.see?event_no=${eventList_1.event_no}&curPage=${map.c_Paging.curPage}"> ${eventList_1.event_subject} </a>
								</dt>
								<dd class="eventdate">
									기간 <span> ${eventList_1.event_start_date} ~
										${eventList_1.event_end_date} </span>
								</dd>
							</dl></li>
					</c:forEach>
				</ul>

				<!-- 시사회/무대인사 -->
				<div class="clear_fix" style="">
					<h2 class="sub_stit">
						시사회/무대인사 <span class="event_etc">직접 만나는 설렘, 먼저 만나는 재미! 지금
							참여하세요.</span>
					</h2>
					<a href="<%=cp%>/admin/eventList_2.see" class="btn_more"
						title="시사회/무대인사 더보기">MORE</a>
				</div>
				<!-- emovie_list_2 -->
				<ul class="emovie_list">
					<c:forEach var="eventList_2" items="${map.eventList_2}" end="3">
						<li><a href="javascript:void(0);" onclick=""> <img
								src="/movie/resources/uploads/event/<%-- ${eventList_2.event_stored_file_name} --%>"
								alt="${eventList_2.event_subject}"></a>
							<dl class="imgsub">
								<dt class="event">
									<a href="<%=cp %>/admin/eventView.see?event_no=${eventList_2.event_no}&curPage=${map.c_Paging.curPage}"> ${eventList_2.event_subject} </a>
								</dt>
								<dd class="eventdate">
									기간 <span> ${eventList_2.event_start_date} ~
										${eventList_2.event_end_date} </span>
								</dd>
							</dl></li>
					</c:forEach>
				</ul>

				<!-- 롯시NOW -->
				<div class="clear_fix" style="">
					<h2 class="sub_stit">
						롯시&nbsp;NOW<span class="event_etc">롯데시네마에서 진행중인 이벤트를 만나보세요.</span>
					</h2>
					<a href="<%=cp%>/admin/eventList_3.see" class="btn_more"
						title="롯시 NOW 더보기">MORE</a>
				</div>
				<!-- emovie_list_3 -->
				<ul class="emovie_list">
					<c:forEach var="eventList_3" items="${map.eventList_3}" end="3">
						<li><a href="javascript:void(0);" onclick=""> <img
								src="/movie/resources/uploads/event/<%-- ${eventList_3.event_stored_file_name} --%>"
								alt="${eventList_3.event_subject}"></a>
							<dl class="imgsub">
								<dt class="event">
									<a href="<%=cp %>/admin/eventView.see?event_no=${eventList_3.event_no}&curPage=${map.c_Paging.curPage}">
										${eventList_3.event_subject} </a>
								</dt>
								<dd class="eventdate">
									기간 <span> ${eventList_3.event_start_date} ~
										${eventList_3.event_end_date} </span>
								</dd>
							</dl></li>
					</c:forEach>
				</ul>
				<!-- 제휴 할인 -->
				<div class="clear_fix" style="">
					<h2 class="sub_stit">
						제휴할인<span class="event_etc">롯데시네마가 드리는 특별한 헤택과 함께 영화를
							즐겨보세요.</span>
					</h2>
					<!-- 0330 문구수정 -->
					<a href="<%=cp%>/admin/eventList_4.see" class="btn_more"
						title="제휴&amp;할인 더보기">MORE</a>
				</div>
				<!-- emovie_list_4 -->
				<ul class="emovie_list">
					<c:forEach var="eventList_4" items="${map.eventList_4}" end="3">
						<li><a href="#none"> <img
								src="/movie/resources/uploads/event/<%-- ${eventList_4.event_stored_file_name} --%>"
								alt="${eventList_4.event_subject}"></a>
							<dl class="imgsub">
								<dt class="event">
									<a href="<%=cp %>/admin/eventView.see?event_no=${eventList_4.event_no}&curPage=${map.c_Paging.curPage}">
										${eventList_4.event_subject} </a>
								</dt>
								<dd class="eventdate">
									기간 <span> ${eventList_4.event_start_date} ~
										${eventList_4.event_end_date} </span>
								</dd>
							</dl></li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>


</body>
</html>