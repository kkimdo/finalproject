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
	<div class="admin_grp">
		<div class="admin_list">
			<ul>
				<li><a href="<%=cp%>/admin/movieList.see">상영작</a></li>
				<li><a href="<%=cp%>/admin/timeTableList.see">시간표관리</a></li>
				<li><a href="<%=cp%>/admin/bannerList.see">배너관리</a></li>
				<li><a href="<%=cp%>/admin/giftShopList.see">기프트샵</a></li>
				<li class="on"><a href="<%=cp%>/admin/eventListMain.see">이벤트</a></li>
				<li><a href="<%=cp%>/admin/noticeList.see">공지사항</a></li>
				<li><a href="<%=cp%>/admin/faqList.see">FAQ</a></li>
				<li><a href="<%=cp%>/admin/qnaList.see">Q&amp;A</a></li>
				<li><a href="<%=cp%>/admin/memberList.see">회원정보</a></li>
			</ul>
		</div>
		<div id="container" class="sub">
			<!-- content -->
			<div id="content">
				<!-- event_cwrap -->
				<div class="event_cwrap">
					<div class="clear_fix">
						<h2 class="sub_stit">
							롯시&nbsp;NOW<span class="event_etc">무비씨시네마에서 진행중인 이벤트를
								만나보세요.</span>
						</h2>
						<!--20170308 sunho 예매 삭제 -->

						<div class="category">
							<fieldset>
								<legend>분야별 선택 검색</legend>
								<form name="form1" method="post"
									action="<%=cp%>/admin/eventList_3.see">
									<select class="select_box" name="searchOption">
										<option value="all"
											<c:out value="${map.searchOption == 'all'?'ed':''}"/>>모두</option>
										<option value="event_subject"
											<c:out value="${map.searchOption == 'event_subject'?'ed':''}"/>>제목</option>
										<option value="event_content"
											<c:out value="${map.searchOption == 'event_content'?'ed':''}"/>>내용</option>
									</select> <input type="text" name="keyword" value="${map.keyword}"
										title="검색어 입력" class="ipt_txt"> <input type="submit"
										value="검색" class="boardBt">
								</form>
							</fieldset>
						</div>
					</div>

					<!-- emovie_list -->
					<ul class="emovie_list">
						<c:forEach var="eventList_3" items="${map.eventList_3}">
							<fmt:parseDate value="${eventList_3.event_end_date}"
								var="eventEndDate3" pattern="yyyy.MM.dd" />
							<li><a href="javascript:void(0);"
								onclick='eventDate(<fmt:formatDate value="${eventEndDate3}" pattern="yyyyMMdd"/>, ${eventList_3.event_no})'>
									<img
									src="/movie/resources/uploads/event/${eventList_3.event_poster_file}"
									alt="${eventList_3.event_subject}" />
							</a>
								<dl class="imgsub">
									<dt class="event">
										<a href="javascript:void(0);"
											onclick='eventDate(<fmt:formatDate value="${eventEndDate3}" pattern="yyyyMMdd"/>, ${eventList_3.event_no})'>
											${eventList_3.event_subject} </a>
									</dt>
									<dd class="eventdate">
										기간 <span> ${eventList_3.event_start_date} ~
											${eventList_3.event_end_date} </span>
									</dd>
								</dl></li>
						</c:forEach>
					</ul>

				</div>
			</div>
		</div>
	</div>
</body>
</html>