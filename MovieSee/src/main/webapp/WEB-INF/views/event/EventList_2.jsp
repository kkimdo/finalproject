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
		 location.href='<%=cp%>/event/eventView.see?event_no=' + number + '&curPage=${map.c_Paging.curPage}';
		}else{ 
		  alert('이벤트 기간이 아닙니다.');
		}
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
					<ul>
						<li></li>
						<li></li>
						<li></li>
						<li></li>
						<li></li>
						<li></li>
						<li></li>
						<li></li>
						<li></li>
					</ul></li>

				<li class="active"><a href="<%=cp%>/event/eventListMain.see"
					title="이벤트">이벤트</a>
					<div class="depth">
						<ul>
							<li><a href="<%=cp%>/event/eventList_1.see" title="영화">영화</a></li>
							<li class="active"><a href="<%=cp%>/event/eventList_2.see" title="시사회/무대인사">시사회/무대인사</a></li>
							<li><a href="<%=cp%>/event/eventList_3.see" title="롯시NOW">롯시NOW</a></li>
							<li><a href="<%=cp%>/event/eventList_4.see" title="제휴할인">제휴할인</a></li>
						</ul>
					</div>
				</li>
				<li><a href="<%=cp%>/gift/giftShopList.see" title="기프트샵">기프트샵</a>
				</li>

			</ul>
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
								<form name="form1" method="post" action="<%=cp%>/event/eventList_2.see">
									<select class="select_box" name="searchOption">
									<option value="all"
										<c:out value="${map.searchOption == 'all'?'ed':''}"/>>모두</option>
									<option value="event_subject"
										<c:out value="${map.searchOption == 'event_subject'?'ed':''}"/>>제목</option>
									<option value="event_content"
										<c:out value="${map.searchOption == 'event_content'?'ed':''}"/>>내용</option>
								</select> 
									<input type="text" name="keyword" value="${map.keyword}" title="검색어 입력" class="ipt_txt1"> 
									<input type="submit" value="검색" class="btn_search1">
								</form>
						</fieldset>
					</div>
				</div>

				<!-- emovie_list -->
				<ul class="emovie_list">
					<c:forEach var="eventList_2" items="${map.eventList_2}">
						<fmt:parseDate value="${eventList_2.event_end_date}" var="eventEndDate2" pattern="yyyy.MM.dd" />
						<li><a href="javascript:void(0);" onclick='eventDate(<fmt:formatDate value="${eventEndDate2}" pattern="yyyyMMdd"/>, ${eventList_2.event_no})'> <img
								src="/movie/resources/uploads/event/${eventList_2.event_poster_file}"
								alt="${eventList_2.event_subject}" />
						</a>
							<dl class="imgsub">
								<dt class="event">
									<a href="javascript:void(0);" onclick='eventDate(<fmt:formatDate value="${eventEndDate2}" pattern="yyyyMMdd"/>, ${eventList_2.event_no})'> ${eventList_2.event_subject} </a>
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