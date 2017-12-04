<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<% String cp = request.getContextPath(); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>공지 사항</title>
<script type="text/javascript">
	//** 목록 버튼 클릭 이벤트 : 버튼 클릭시 상세보기화면에 있던 페이지, 검색옵션, 키워드 값을 가지로 목록으로 이동
	function btnList(){
    	location.href="<%= cp %>/admin/noticeList.see?curPage=${curPage}&searchOption=${searchOption}&keyword=${keyword}";
    	}
    	
	function btnUpdate(){
		location.href="<%= cp%>/admin/noticeUpdate.see?notice_no=${noticeModel.notice_no}";
		}
	  
	function btnDelete(){
	   	location.href="<%= cp%>/admin/noticeDelete.see?notice_no=${noticeModel.notice_no}";
	    }
	  
</script>
</head>

<body>
	<h2>${noticeModel.notice_subject}</h2>
	<form name="form1" method="post">
		<div>
			작성일 :
			<fmt:formatDate value="${noticeModel.notice_date}" pattern="yyyy-MM-dd" />
		</div>
		<div>조회수 : ${noticeModel.notice_hit}</div>
		<div>
			제목  : ${noticeModel.notice_subject}
		</div>
		<div>
			내용 : ${noticeModel.notice_content}
		</div>
		<div style="width: 650px; text-align: center;">
			
			<!-- **관리자만 게시물 수정, 삭제가 가능하도록 처리 해야함 세션으로 -->
				<input type="button" value="수정" onclick="btnUpdate();" />
				<input type="button" value="삭제" onclick="btnDelete();" />
				
			<!-- **상세보기 화면에서 게시글 목록화면으로 이동 -->
				<input type="button"value="목록" onclick="btnList();"/>
		</div>
	</form>
</body>
</html>