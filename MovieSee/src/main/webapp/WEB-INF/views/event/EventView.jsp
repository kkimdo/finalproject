<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String cp = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>

<script type="text/javascript">

function btnList(){
	location.href="<%=cp%>/event/eventListMain.see?curPage=${curPage}&searchOption=${searchOption}&keyword=${keyword}";
	}
	
function aFacebook(){
	location.href="https://www.facebook.com/login.php";
}

function aTwitter(){
	location.href="https://twitter.com/intent/tweet";
}

function aKakaoStory(){
	location.href="https://accounts.kakao.com/login/kakaostory";
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
							<li><a href="<%=cp%>/event/eventList_2.see" title="시사회/무대인사">시사회/무대인사</a></li>
							<li><a href="<%=cp%>/event/eventList_3.see" title="롯시NOW">롯시NOW</a></li>
							<li><a href="<%=cp%>/event/eventList_4.see" title="제휴할인">제휴할인</a></li>
						</ul>
					</div>
				</li>
				<li><a href="<%=cp%>/gift/giftShopList.see" title="기프트샵">기프트샵</a>
				</li>

			</ul>
		</div>
		<!-- //GNB area -->
	<div id="container" class="sub" style="">
		<div id="content">
			<div class="eventWrap">
				<!-- event_sinner -->
				<div class="event_sinner">
					<h2 class="sub_tit02">${eventModel.event_subject}</h2>
					<c:if test="${eventModel.event_content_file ne null }">
						<div id="img">
							<p class="img">
								<img src="<%= cp %>/resources/uploads/event/${eventModel.event_content_file}" alt="${eventModel.event_subject}" />
							</p>
						</div>
					</c:if>
					<div id="event_movie"></div>
					<div id="event_img"></div>
				</div>
				<!--//  event_sinner -->

				<!-- view_add -->
				<div class="view_add">
					<strong>유의사항</strong>
					<p>
						<strong> ${eventModel.event_content} </strong>
					</p>
				</div>
				<!--// view_add -->

				<ul class="view_list">
				</ul>

				<div id="btn_list" class="btn_box btn_cbox">
					<a href="javascript:void(0);" class="btnc_check" onclick="btnList();">목록</a> 
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