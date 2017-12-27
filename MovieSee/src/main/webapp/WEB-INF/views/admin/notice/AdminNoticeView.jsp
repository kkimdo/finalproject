<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String cp = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>공지 사항</title>

<script type="text/javascript">
	function btnList(){
    	location.href="<%=cp%>/admin/noticeList.see";
    	}
    	
	function btnUpdate(){
		location.href="<%=cp%>/admin/noticeUpdate.see?notice_no=${noticeModel.notice_no}";
		}
	  
	function btnDelete() {
		if (confirm("정말 삭제하시겠습니까?") == true) { //확인
			location.href ="<%=cp%>/admin/noticeDelete.see?notice_no=${noticeModel.notice_no}";
		} else { //취소
			return;
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
				<li><a href="<%=cp%>/admin/eventListMain.see">이벤트</a></li>
				<li class="on"><a href="<%=cp%>/admin/noticeList.see">공지사항</a></li>
				<li><a href="<%=cp%>/admin/faqList.see">FAQ</a></li>
				<li><a href="<%=cp%>/admin/qnaList.see">Q&amp;A</a></li>
				<li><a href="<%=cp%>/admin/memberList.see">회원정보</a></li>
			</ul>
		</div>
		<form name="form1" method="post">
			<div class="tabCont">
				<div class="detail_header">
					<h3 class="cinema_stit" id="hTitle">${noticeModel.notice_subject}</h3>
					<ul class="view_info">
						<li><strong>영화관 : </strong><span id="spanCinema">${noticeModel.notice_area}</span></li>
						<li><strong>등록일 : </strong><span id="spanCreateDate"><fmt:formatDate
									value="${noticeModel.notice_date}" pattern="yyyy-MM-dd" /></span></li>
						<li><strong>조회수 : </strong><span id="spanSearchCount">${noticeModel.notice_hit}</span></li>
					</ul>
				</div>
				<div class="board_cont" id="divContents">${noticeModel.notice_content}<br />
					<c:if test="${noticeModel.notice_content_file ne null }">
						<img border="0" hspace="0" alt="${noticeModel.notice_content}" src="<%= cp %>/resources/uploads/notice/${noticeModel.notice_content_file}">
					</c:if>
				</div>

				<div class="btn_type_03">
					<span class="btn btnC_03 btnP_04 mr10"> <input type="button"
						onclick="btnList();" value="목록" />
					</span> <span class="btn btnC_04 btnP_04"> <input type="button"
						onclick="btnUpdate();" value="수정" />
					</span> 
					<span class="btn btnC_04 btnP_04" style="padding-left: 10px;">
						<input type="button" onclick="btnDelete();" value="삭제" />
					</span>
				</div>
			</div>
		</form>
	</div>


</body>
</html>