<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String cp = request.getContextPath(); %>
<div class="logo">
	<h1><a href="<%=cp %>/admin/movieList.see">MovieSee</a></h1>
</div>
<div class="util_menu">
	<div class="inner">
		<ul>
			<li><a href="<%= cp %>/admin/movieList.see">Home</a></li>
			<li><a href="<%= cp %>/admin/movieList.see">상영작</a></li>
			<li><a href="<%= cp %>/reserve/reserveMain.mt">예매</a></li>
			<li><a href="<%= cp %>/magazine/magazineList.mt">매거진</a></li>
			<li><a href="<%= cp %>/admin/eventListMain.see">이벤트</a></li>
			<li><a href="<%= cp %>/qna/qnaList.see">고객센터</a></li>
		</ul>
	</div>
</div>
