<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String cp = request.getContextPath(); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="logo">
	<h1><a href="<%=cp %>/admin/movieList.see">MovieSee</a></h1>
</div>
<div class="util_menu">
	<div class="inner">
		<ul>	
				<c:if test="${session_member_grade eq 1 }">
					<li><strong>${session_member_name}&nbsp;님 환영합니다.</strong></li>
				</c:if>
				<li><a href="<%= cp %>/main.see">메인 페이지</a></li>
				<li><a href="<%=cp%>/member/logout.see" title="로그아웃">로그아웃</a></li>
		</ul>
	</div>
</div>
