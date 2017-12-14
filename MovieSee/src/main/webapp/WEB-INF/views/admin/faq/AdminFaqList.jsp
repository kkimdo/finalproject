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
<title>FAQ</title>

<script type="text/javascript">

	//**원하는 페이지로 이동시 검색조건, 키워드 값을 유지하기 위해 
	function list(page){
   	location.href="<%=cp%>/faq/faqList.see?curPage="+page+"&searchOption=${map.searchOption}"+"&keyword=${map.keyword}";
	}

	function btnWrite(){
	 // 페이지 주소 변경(이동)
	location.href="<%=cp%>
	/faq/faqWrite.see";
	}
</script>

<script type="text/javascript">
	$(function() {
		$(".faq > .faqBody > .article > .a").hide(); //적용시 바로 안보이게

		$(".faq > .faqBody > .article > .q").click(function(event) {

			$(event.currentTarget).next().slideToggle(200, function() {
				var $a = $(this);
				var $faq = $a.prev();
				console.log($a.css("display"));

				if ($a.css("display") == "none") {
					$faq.find("span").html("▼");
				} else {
					$faq.find("span").html("▲");
				}
			});
		});
	});
</script>

</head>
<body>
	<div class="cs_center">
		<h2 class="csTit">FAQ</h2>
		<!-- 검색 -->
	
	<div class="tabCont faqTabCont">
	
		<form name="form1" method="post" action="<%=cp%>/faq/faqList.see">
			<div class="shPeriod">
				<div class="goods">
					<input type="text" placeholder="검색어를 입력하세요" name="keyword" value="${map.keyword}" title="검색어 입력" class="ipt_txt mt0"> 
					<input type="submit" value="검색" class="boardBt">
				</div>
			</div>
		</form>
	
		<h3 class="mem_tit" id="faqTop5Title" style="">FAQ TOP5</h3>
		<c:forEach var="faqTop5List" items="${map.faqTop5List}">
			<div class="faqTop" id="a11">
				<a href="#a11"><span>▲</span>${faqTop5List.faq_subject}</a>
				<span class="qnTit"><em class="num">1</em>&nbsp;&nbsp;${faqTop5List.faq_content}</span>
			</div>
		</c:forEach>
	
	<table class="tbl_faq" style="table-layout: fixed">
		<caption>faq 목록</caption>
		<colgroup>
			<col style="width: 190px">
			<col style="width: 790px">
		</colgroup>

		<thead>
			<tr>
				<th scope="col">분류</th>
				<th scope="col">질문</th>
			</tr>
		</thead>
	</table>

	<c:forEach var="faqList" items="${map.faqList}">
		<div class="faq">
			<ul class="faqBody">
				<li class="article" id="a1">
					<p class="q">
						<a href="#a1"><span>▲</span>${faqList.faq_subject}</a>
					</p>
					<p class="a">
						<span title="답변" class="A">A</span>&nbsp;&nbsp;${faqList.faq_content}
					</p>
				</li>
			</ul>
		</div>
		<!-- **상세보기 페이지로 이동시 게시글 목록페이지에 있는 검색조건, 키워드, 현재페이지 값을 유지하기 위해 -->
		<td class="txtl"><a
			href="<%=cp%>/faq/faqView.see?faq_no=${faqList.faq_no}&curPage=${map.c_Paging.curPage}&searchOption=${map.searchOption}&keyword=${map.keyword}">${noticeList.faq_subject}</a></td>
	</c:forEach>

	<%-- <c:forEach var="faqList" items="${faqList}" varStatus="stat">

		<dl class="faq">
			<dt>
				<h5>
					<span>▲</span> ${faqList.faq_subject}
				</h5>
			</dt>
			<dd>${faqList.faq_content}</dd>
		</dl>

	</c:forEach> --%>

	<%-- <table>
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>등록일</td>
			<td>조회수</td>
		</tr>

		<c:forEach var="faqList" items="${faqList}" varStatus="stat">

			<c:url var="faqViewURL" value="faqView.see">
				<c:param name="faq_no" value="${faqList.faq_no}" />
				<c:param name="currentPage" value="${currentPage}" />
			</c:url>

			<tr>
				<td>${faqList.faq_no}</td>
				<td><a href="${faqViewURL}">${faqList.faq_subject}</a></td>
				<td><fmt:formatDate value="${faqList.faq_date}"
						pattern="yyyy-MM-dd" /></td>
				<td>${faqList.faq_hit}</td>
			</tr>
		</c:forEach>
		
	</table> --%>


	<%-- <c:if test="${fn:length(faqList) le 0}">
		<center>등록된 게시물이 없습니다.</center>
	</c:if> --%>

	<!-- <div>
		<form method="post">
			<div>
					<input type="text" name="isSearch" /> 
					<input type="submit" value="검색">
					
					<input type="button" value="글쓰기"
									onclick="btnWrite();" class="boardBt" />
					
			</div>
		</form>
	</div>-->
	</div>
	</div>
	${pagingHtml}
	<!-- <input type="button" onclick="location.href='faqWrite.see'" value="글쓰기" />%> -->
	<input type="button" value="글쓰기" onclick="btnWrite();" class="boardBt" />

</body>
</html>