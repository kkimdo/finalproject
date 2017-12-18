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

<script type="text/javascript">

	 function eventDate(endDate, number){

		var today = new Date(); 
		var year = today.getFullYear();
		var month = today.getMonth() + 1; 
		var day = today.getDate();
		
		if (("" + month).length == 1) month = "0" + month;
		if (("" + day).length  == 1) day  = "0" + day;
		var toDate	= year+''+month+''+day;
		
		if(toDate <= endDate){ 
		 location.href='<%=cp%>/admin/eventView.see?event_no=' + number + '&curPage=${map.c_Paging.curPage}';
		}else{ 
		  alert('이벤트 기간이 아닙니다.');
		}
	}
	
</script>

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
							<li ><a href="<%=cp%>/admin/eventList_3.see"
								title="롯시NOW">롯시NOW</a></li>
							<li class="active"><a href="<%=cp%>/admin/eventList_4.see" title="제휴할인">제휴할인</a></li>
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
						제휴할인<span class="event_etc">롯데시네마가 드리는 특별한 헤택과 함께 영화를
							즐겨보세요.</span>
					</h2>
					<!--20170308 sunho 예매 삭제 -->

					<div class="category">
						<fieldset>
							<legend>분야별 선택 검색</legend>
								<form name="form1" method="post" action="<%=cp%>/admin/eventList_4.see">
									<select class="select_box" name="searchOption">
									<option value="all"
										<c:out value="${map.searchOption == 'all'?'ed':''}"/>>모두</option>
									<option value="event_subject"
										<c:out value="${map.searchOption == 'event_subject'?'ed':''}"/>>제목</option>
									<option value="event_content"
										<c:out value="${map.searchOption == 'event_content'?'ed':''}"/>>내용</option>
								</select> 
									<input type="text" name="keyword" value="${map.keyword}" title="검색어 입력" class="ipt_txt"> 
									<input type="submit" value="검색" class="boardBt">
								</form>
						</fieldset>
					</div>
				</div>

				<!-- emovie_list -->
				<ul class="emovie_list">
					<c:forEach var="eventList_4" items="${map.eventList_4}">
						<li><a href="javascript:void(0);" onclick='eventDate(<fmt:formatDate value="${eventEndDate4}" pattern="yyyyMMdd"/>, ${eventList_4.event_no})'> <img
								src="/movie/resources/uploads/event/${eventList_4.event_poster_file}"
								alt="${eventList_4.event_subject}" />
						</a>
							<dl class="imgsub">
								<dt class="event">
									<a href="javascript:void(0);" onclick='eventDate(<fmt:formatDate value="${eventEndDate4}" pattern="yyyyMMdd"/>, ${eventList_4.event_no})'> ${eventList_4.event_subject} </a>
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