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
	location.href="<%=cp%>/admin/eventListMain.see?curPage=${curPage}&searchOption=${searchOption}&keyword=${keyword}";
	}
	
function btnUpdate(){
	location.href="<%=cp%>/admin/eventUpdate.see?event_no=${eventModel.event_no}";
	}
  
function btnDelete() {
	if (confirm("정말 삭제하시겠습니까?") == true) { //확인
		location.href ="<%=cp%>/admin/eventDelete.see?event_no=${eventModel.event_no}";
		} else { //취소
			return;
		}
	}
	function aFacebook() {
		location.href = "https://www.facebook.com/login.php";
	}

	function aTwitter() {
		location.href = "https://twitter.com/intent/tweet";
	}

	function aKakaoStory() {
		location.href = "https://accounts.kakao.com/login/kakaostory";
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
		<div id="container" class="sub" style="">
			<!-- content -->
			<div id="content">
				<!-- eventWrap -->
				<div class="eventWrap">
					<ul class="social_list">
						<!-- 어드민 영역이 아니므로 마크업 위치 제외 -->
						<li><a href="javascript:void(0);" onclick="aFacebook();"
							title="새창 열림"><img
								src="/movie/images/icon/icon_facebook02.gif" alt="페이스북에 공유하기"></a></li>
						<li><a href="javascript:void(0);" onclick="aTwitter();"
							title="새창 열림"><img
								src="/movie/images/icon/icon_twitter02.gif" alt="트위터에 공유하기"></a></li>
						<li><a href="javascript:void(0);" onclick="aKakaoStory();"
							title="새창 열림"><img
								src="/movie/images/icon/icon_kakaostory02.gif"
								alt="카카오스토리에 공유하기"></a></li>
					</ul>
					<!-- event_sinner -->
					<div class="event_sinner">
						<h2 class="sub_tit02">${eventModel.event_subject}</h2>
						<c:if test="${eventModel.event_content_file ne null }">
							<div id="img">
								<p class="img">
									<img
										src="<%= cp %>/resources/uploads/event/${eventModel.event_content_file}"
										alt="${eventModel.event_subject}" />
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
						<a href="javascript:void(0);" class="btnc_check"
							onclick="btnList();">목록</a> <a href="javascript:void(0);"
							class="btnc_check" onclick="btnUpdate();">수정</a> <a
							href="javascript:void(0);" class="btnc_check"
							onclick="btnDelete();">삭제</a>
					</div>

				</div>
				<!--// eventWrap -->
			</div>
			<!-- //content -->
		</div>
	</div>
</body>
</html>