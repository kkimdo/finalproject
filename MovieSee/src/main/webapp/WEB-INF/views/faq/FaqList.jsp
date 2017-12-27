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
<link rel="stylesheet" type="text/css" href="<%= cp%>/resources/mscs/faq.css?ver=20171222" />
<title>FAQ</title>

<script type="text/javascript">

	//**원하는 페이지로 이동시 검색조건, 키워드 값을 유지하기 위해 
	function list(page){
   	location.href="<%=cp%>/faq/faqList.see?curPage=" + page
				+ "&searchOption=${map.searchOption}"
				+ "&keyword=${map.keyword}";
	}
</script>

<script type="text/javascript">
	$(function() {
		$(".faq > .faqBody > .article > .a").hide(); //적용시 바로 안보이게

		$(".faq > .faqBody > .article >  .q").click(function(event) {

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
						<li><a href="<%=cp%>/qna/qnaWrite.see">1:1문의</a></li>
						<li><a href="<%=cp%>/free/freeBoardList.see">자유게시판</a></li>
						<li><a href="<%=cp%>/common/privacy.see">개인정보처리방침</a></li>
					</ul>
					<div class="cs_center">
						<!-- 검색 -->
						<form name="form1" method="post" action="<%=cp%>/faq/faqList.see">

							<div class="tabCont faqTabCont">
								<div class="shPeriod" id="searchArea">
									<span class="tit2">검색</span>
									<div class="goods">
										<input name="keyword" type="text" value="${map.keyword}" placeholder="검색어를 입력하세요" title="검색어 입력"
											id="searchKeyword" onkeydown="keyDownSearchForm(event);">
										<input type="submit" value="검색" class="btn_goodsSrch2"
											id="btnSearch">
									</div>
									<div class="sh_view">
										<p class="txt">더 궁금한 점이 있거나, 이미 문의한 내용과 답변을 확인하려면?</p>
										<!-- 0223 텍스트 수정 -->
										<a href="<%=cp%>/qna/qnaWrite.see" class="btnv1_inquery"
											onclick="javascript:customerCenterMenu(2);">1:1문의 바로가기</a> <a
											href="<%=cp%>/qna/qnaMemberList.see" class="btnv1_use"
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
								<c:if test="${fn:length(map.faqList) le 0}">
								<br />
								<center>검색 결과가 없습니다. 다른 조건으로 검색해 주세요.</center>
								<br />
								</c:if>

								<c:forEach var="faqList" items="${map.faqList}">
											<div class="faq">
												<div class="faqBody">
													<span class="article" id="a1">
														<span class="Q">
															<span>Q</span>${faqList.faq_category}</span>
														<span class="q">
															<span class="s">▲</span><a href="#a1" class=a1>${faqList.faq_subject}</a>
														</span>
														<span class="a">
															<span title="답변" class="A">A</span>${faqList.faq_content}
														</span>
													</span>
												</div>
											</div>
									<!-- **상세보기 페이지로 이동시 게시글 목록페이지에 있는 검색조건, 키워드, 현재페이지 값을 유지하기 위해 -->
								<%-- 	<td class="txtl"><a
										href="<%=cp%>/faq/faqView.see?faq_no=${faqList.faq_no}&curPage=${map.c_Paging.curPage}&searchOption=${map.searchOption}&keyword=${map.keyword}">${faqList.faq_subject}</a></td> --%>
								</c:forEach>


							</div>
						</form>
					</div>
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