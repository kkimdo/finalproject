<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%
	String cp = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지 사항</title>

<!-- 
나중에 작업
<script type="text/javascript">
	
	function btnWrite() {
		var frm = document.formWrite;
		
		if(frm.notice_subject.value == "") {
			alert("제목을 입력해주세요.");
			frm.notice_subject.focus();
			return false;
		}
		else if(frm.notice_content.value == ""){
			alert("내용을 입력해주세요.");
			frm.notice_content.focus();
			return false;
		}
		else(frm.notice_area.value == ""){
			alert("영화관을 입력해주세요.");
			frm.notice_area.focus();
			return false;
		}
		return true;
	}
</script> -->

</head>
<body>
	<div class="cs_center">
		<h2 class="csTit">고객센터</h2>
		<ul class="tab_st03">
			<li><a href="<%=cp%>/faq/faqList.see">FAQ</a></li>
			<li class="active"><a href="<%=cp%>/admin/noticeList.see">공지사항</a></li>
			<!-- goCustomerCenterMenu-->
			<li><a href="javascript:customerCenterMenu(2);">1:1문의</a></li>
			<li><a href="javascript:customerCenterMenu(3);">단체관람/대관문의</a></li>
			<li><a href="javascript:customerCenterMenu(4);">분실물안내</a></li>
		</ul>
		<form name="formWrite" action="noticeWrite.see" method="post" onsubmit="return btnWrite();">
			<div>
				제목 <input name="notice_subject" id="notice_subject" size="80"
					placeholder="제목을 입력해주세요.">
			</div>
			<div>
				내용
				<textarea name="notice_content" id="notice_content" rows="4"
					cols="80" placeholder="내용을 입력해주세요."></textarea>
			</div>
			<div>
				영화관 <input name="notice_area" id="notice_area"
					placeholder="영화관을 입력해주세요.">
			</div>
			<div style="width: 650px; text-align: center;">
				<input type="submit" value="작성" />
			</div>
		</form>
	</div>
</body>
</html>