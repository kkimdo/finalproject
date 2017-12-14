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
							<li class="active"><a href="<%=cp%>/admin/eventList_2.see"
								title="시사회/무대인사">시사회/무대인사</a></li>
							<li><a href="<%=cp%>/admin/eventList_3.see" title="롯시NOW">롯시NOW</a></li>
							<li><a href="<%=cp%>/admin/eventList_4.see" title="제휴할인">제휴할인</a></li>
						</ul>
					</div></li>

			</ul>
		</div>
	</div>
	<div id="container" class="sub">
		<!-- content -->
		<div id="content">
			<!-- event_cwrap -->
			<div class="event_cwrap">
				<div class="clear_fix">
					<h2 class="sub_stit">
						시사회/무대인사<span class="event_etc">직접 만나는 설렘, 먼저 만나는 재미! 지금
							참여하세요.</span>
					</h2>

					<div class="category">
						<fieldset>
							<legend>분야별 선택 검색</legend>
							<input type="text" class="ipt_txt" title="검색어 입력"
								onkeydown="keyDownEventLists(event);"> <a
								href="javascript:void(0);" class="btn_search">검색</a>
						</fieldset>
					</div>
				</div>

				<!-- emovie_list -->
				<ul class="emovie_list">
					<c:forEach var="eventList_2" items="${map.eventList_2}">
						<li><a href="#none" onclick=""> <img
								src="/movie/resources/uploads/event/${eventList_2.event_stored_file_name}"
								alt="${eventList_2.event_subject}" />
						</a>
							<dl class="imgsub">
								<dt class="event">
									<a href="#none" onclick=""> ${eventList_2.event_subject} </a>
								</dt>
								<dd class="eventdate">
									기간 <span>${eventList_2.event_start_date} ~
										${eventList_2.event_end_date}</span>
								</dd>
							</dl></li>
					</c:forEach>
				</ul>

			</div>
		</div>
	</div>

</body>
</html>