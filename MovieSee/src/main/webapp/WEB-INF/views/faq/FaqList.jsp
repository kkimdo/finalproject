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
   	location.href="<%=cp%>/faq/faqList.see?curPage=" + page + "&searchOption=${map.searchOption}" + "&keyword=${map.keyword}";
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
	<div id="wrap">
		<div id="container" class="subGnbNo">
			<!-- content -->
			<div id="content">
				<div class="cs_center">
					<h2 class="csTit">고객센터</h2>
					<ul class="tab_st03">
						<li class="active"><a href="<%=cp%>/faq/faqList.see">FAQ</a></li>
						<li><a href="<%=cp%>/notice/noticeList.see">공지사항</a></li>
						<li><a href="javascript:customerCenterMenu(2);">1:1문의</a></li>
						<li><a href="<%=cp%>/free/freeBoardList.see">자유게시판</a></li>
						<li><a href="<%=cp%>/common/privacy.see">개인정보처리방침</a></li>
					</ul>
					<div class="cs_center">
						<!-- 검색 -->
						<form name="form1" method="post" action="<%=cp%>/faq/faqList.see">

							<div class="tabCont faqTabCont">
								<div class="shPeriod" id="searchArea">
									<span class="tit">검색</span>
									<div class="goods">
										<input type="text" placeholder="검색어를 입력하세요" title="검색어 입력"
											id="searchKeyword" onkeydown="keyDownSearchForm(event);">
										<input type="button" value="검색" class="btn_goodsSrch"
											id="btnSearch">
									</div>
									<div class="sh_view">
										<p class="txt">더 궁금한 점이 있거나, 이미 문의한 내용과 답변을 확인하려면?</p>
										<!-- 0223 텍스트 수정 -->
										<a href="<%=cp%>/qna/qnaWrite.see" class="btnv_inquery"
											onclick="javascript:customerCenterMenu(2);">1:1문의 바로가기</a> <a
											href="javascript:void(0);" class="btnv_use"
											onclick="javascript:goLotteMyCinema(5, 0);">나의 문의 내역 바로가기</a>
									</div>
									<div class="srchResult_none" id="divSearchNone"
										style="display: none;">
										<span class="txt">검색 결과가 없습니다. 다른 조건으로 검색해 주세요.</span>
									</div>
								</div>
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


							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>