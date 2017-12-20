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
<div class="header">
		<div class="gnb">
			<ul>
				<li class="active"><a href="<%=cp%>/event/eventListMain.see"
					title="이벤트">이벤트</a>
					<div class="depth">
						<ul>
							<li><a href="<%=cp%>/event/eventList_1.see" title="영화">영화</a></li>
							<li><a href="<%=cp%>/event/eventList_2.see" title="시사회/무대인사">시사회/무대인사</a></li>
							<li><a href="<%=cp%>/event/eventList_3.see" title="롯시NOW">롯시NOW</a></li>
							<li><a href="<%=cp%>/event/eventList_4.see" title="제휴할인">제휴할인</a></li>
						</ul>
					</div></li>

			</ul>
		</div>
		<!-- //GNB area -->
	</div>
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
	</div>

</body>
</html>