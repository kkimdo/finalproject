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

<title>공 지 사 항</title>

<script type="text/javascript">
    
    // **원하는 페이지로 이동시 검색조건, 키워드 값을 유지하기 위해 
    function list(page){
        location.href="<%=cp%>/admin/noticeList.see?curPage="+page+"&searchOption=${map.searchOption}"+"&keyword=${map.keyword}";
    }
    
    function btnWrite(){
    	 // 페이지 주소 변경(이동)
    	location.href="<%=cp%>/admin/noticeWrite.see";
	}
</script>

<style>

html {overflow-y:scroll;}

html, body {height:100%;}

html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p,
	blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn,
	em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var,
	b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend,
	table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas,
	details, embed, figure, figcaption, footer, header, hgroup, menu, nav,
	output, ruby, section, summary, time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	vertical-align: baseline;
}

h2 {
	display: block;
	font-size: 1.5em;
	-webkit-margin-before: 0.83em;
	-webkit-margin-after: 0.83em;
	-webkit-margin-start: 0px;
	-webkit-margin-end: 0px;
	font-weight: bold;
}

ol, ul, li {
	list-style: none
}

fieldset {
	display: block;
	-webkit-margin-start: 2px;
	-webkit-margin-end: 2px;
	-webkit-padding-before: 0.35em;
	-webkit-padding-start: 0.75em;
	-webkit-padding-end: 0.75em;
	-webkit-padding-after: 0.625em;
	min-width: -webkit-min-content;
	border-width: 2px;
	border-style: groove;
	border-color: threedface;
	border-image: initial;
}

form, fieldset {
	border: 0;
}

body {
	font-family: "나눔 고딕", 'Nanum Gothic', 'ng';
	font-weight: 400;
	line-height: 1;
}

.tbl_st03 {
	width: 100%;
	border-top: 1px solid #c0c0c0;
	font-size: 13px;
	color: #231f20;
	text-align: center;
	line-height: 18px;
	table-layout: fixed;
}

.tbl_st03 th {
	padding: 14px 0 13px;
	border-bottom: 1px solid #c0c0c0;
	background: url('/movie/images/bg/bg_tab_line.gif') no-repeat left
		center;
	vertical-align: middle
}

.tbl_st03 th:first-child {
	background-image: none
}

.tbl_st03 td {
	padding: 15px 10px;
	border-bottom: 1px solid #dedede;
	color: #666;
	vertical-align: middle
}

.tbl_st03 td.btn_white {
	display: inline-block;
	width: 90px;
	height: 30px;
	line-height: 28px;
	border: 1px solid #999;
	color: #231f20;
	font-weight: bold;
	box-sizing: border-box;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
}

.tbl_st03 td.txtl {
	padding-left: 20px;
}

.tbl_st03 .ellipsis {
	display: block;
	width: 100%;
	padding-left: 15px;
	text-align: left;
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
}

.tbl_st03 .notice {
	font-weight: bold;
	color: #231f20;
}

.tab_st03 {
	position: relative;
	width: 100%;
	margin-bottom: 40px;
	border-bottom: 1px solid #231f20;
}

/* 카테고리 클릭하면 검정 배경 */
/* .tab_st03 .active > a {
    background: #231f20;
    color: #cdc197;
} */

.tab_st03:after {
	content: '';
	display: block;
	clear: both;
}

.tab_st03>li {
	float: left;
	margin-left: 1px;
}

.tab_st03>li:first-child {
	margin-left: 0;
}

.tab_st03>li>a {
	display: block;
	width: 195px;
	height: 49px;
	background: #efebdb;
	box-sizing: border-box;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	font-size: 14px;
	color: #231f20;
	text-align: center;
}

.tab_st03>li>a:before {
	content: '';
	display: inline-block;
	width: 0;
	height: 100%;
	vertical-align: middle
}

.tab_st03>li>a.on {
	background: #221e1d;
	color: #e5e1b0
}

.txtl {
	text-align: left;
}

table {
	border-collapse: collapse;
	border-spacing: 0;
	display: table;
}

element.style {
	width: 11%;
}

colgroup {
	display: table-column-group;
}

col {
	display: table-column;
}

thead {
	display: table-header-group;
}

tbody {
	display: table-row-group;
}

td, th {
	display: table-cell;
	vertical-align: inherit;
}

li {
	display: list-item;
	text-align: -webkit-match-parent;
}

a {
	text-decoration: none;
	color: #555;
}

a:hover {
	color: #555;
	text-decoration: none;
}

input, , textarea {
	font-size: 12px;
	font-family: 'NanumGothic';
	color: #555;
	vertical-align: middle;
}

input[type=submit] {
	border: 0
}

input[type=button] {
	border: 0
}

button, label, input[type=image], input[type="button"], input[type=submit]
	{
	cursor: pointer
}

button {
	vertical-align: top
}

select {
	border: 1px solid #e8e8e8
}

/* 숨김 영역 */
input[type=text], input[type=password] {
	height: 40px;
	padding: 10px;
	border: 1px solid #dedede;
	background: #f5f5f5;
	box-sizing: border-box;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
}

/*layout*/
#wrap {
	width: 100%;
	min-width: 980px
}

/* 셀렉트 박스 */
.select_wrap:after {
	content: '';
	display: block;
	clear: both
}

.select_box {
	position: relative
}

.select_box select {
	height: 41px;
	padding: 10px 0 10px 10px;
	color: #50504e
}

.select_box .ui_fold_btn {
	display: block;
	width: 90px;
	padding: 13px 26px 12px 10px;
	background: #fff url('/LCHS/Image/Bg/bg_select.gif') no-repeat 100% 50%;
	border: 1px solid #b9b9b9;
	color: #666;
	cursor: pointer;
	box-sizing: border-box;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	font-size: 13px
}

.select_box ul {
	position: absolute;
	top: 25px;
	left: 0;
	display: none;
	min-width: 97px;
	background: #fff;
	border: 1px solid #e0e0e0;
	z-index: 1;
	box-sizing: border-box;
}

.select_box ul.on {
	display: block
}

.select_box li {
	border-bottom: 1px solid #e0e0e0;
	font-size: 13px
}

.select_box li:last-child {
	border-bottom: 0
}

.select_box li a {
	display: block;
	width: auto;
	padding: 0 0 0 10px;
	line-height: 29px
}

.select_box li a.on, .select_box li a:hover, .select_box li a:focus,
	.select_box li a:active {
	background: #231f20;
	color: #fff;
}

/* margin / padding */
.mt0 {
	margin-top: 0 !important;
}

/* 공통 css */
option {
	font-weight: normal;
	display: block;
	white-space: pre;
	min-height: 1.2em;
	padding: 0px 2px 1px;
}

input, select, textarea {
	font-size: 12px;
	font-family: 'NanumGothic';
	color: #555;
	vertical-align: middle;
}

input, textarea, select, button {
	text-rendering: auto;
	color: initial;
	letter-spacing: normal;
	word-spacing: normal;
	text-transform: none;
	text-indent: 0px;
	text-shadow: none;
	display: inline-block;
	text-align: start;
	margin: 0em;
	font: 400 13.3333px Arial;
}

a:-webkit-any-link {
	/* color: -webkit-link; */
	cursor: auto;
	text-decoration: none;
} 

.cs_center {
	color: #231f20;
}

.cs_center .tabCont {
	padding-top: 30px;
	font-size: 14px;
}

ul, menu, dir {
	display: block;
	list-style-type: disc;
	-webkit-margin-before: 1em;
	-webkit-margin-after: 1em;
	-webkit-margin-start: 0px;
	-webkit-margin-end: 0px;
	/* -webkit-padding-start: 40px; */
}

/* Location */
#container {
	position: relative;
	min-width: 980px;
	border-top: 1px solid #e9e4d2;
	min-height: 669px
}

#container:after {
	content: '';
	display: block;
	clear: both
}

#container.sub {
	margin: 39px 0 0 0;
}

#container.subGnbNo {
	padding: 0;
	border-top: 1px solid #e9e4d2
}

#container.subGnbNo .quick_ver2 {
	top: 181px;
}

#content {
	position: relative;
	min-height: 400px
}

/* 공지사항검색 */
.custCategory {
	padding: 0 0 15px 0;
}

.custCategory:after {
	content: "";
	display: block;
	clear: both;
	visibility: hidden;
}

.custCategory select {
	float: left;
	width: 124px;
	height: 28px;
}

.custCategory .select_box {
	float: left;
	margin-right: 5px;
}

.custCategory .select_box .ui_fold_btn {
	width: 124px;
	padding: 6px 26px 6px 12px;
	box-sizing: border-box;
}

.custCategory .select_box .ui_fold_list {
	width: 122px;
}

.custCategory .ipt_txt {
	float: left;
	height: 23px;
	border-right: 0;
	margin-top: 0;
}

.custCategory .boardBt {
	float: left;
	min-width: 50px;
	text-align: center;
	height: 28px;
	border: 0;
	background: #231f20;
	color: #fff;
	font-size: 12px;
	font-weight: bold;
}

.custCategory>span {
	float: right;
	padding-top: 8px;
	color: #231f20;
}

.custCategory>span strong {
	font-size: 18px;
	font-family: 'linlivertine';
}

/* 고객 센터 */
.cs_center {
	width: 980px;
	margin: 0 auto;
	padding: 50px 0 50px;
	color: #231f20;
}

.csTit {
	/* padding-bottom: 20px; */
	font-size: 28px;
}

.cs_center .tab_st03 {
	margin-bottom: 0;
}

/* paging */
.paging {
	text-align: center
}

.paging * {
	display: inline-block;
	vertical-align: middle
}

.paging>.pagingNum {
	position: relative;
}

.paging>.pagingNum>a {
	width: 24px;
	height: 24px;
	line-height: 24px;
	margin: 0 1px;
	color: #666;
	text-align: center;
	box-sizing: border-box;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	font-size: 12px
}

.paging>.pagingNum>a:hover, .paging>.pagingNum>a:focus, .paging>.pagingNum>a.on
	{
	background: #231f20;
	color: #fff
}

.paging .prev {
	margin-right: 10px;
}

.paging .next {
	margin-left: 10px;
}
</style>

<!-- 12/5일날 다시 작업 -->

<script type="text/javascript">

	customerCenterMenu = function (menuID, type) {
    //var menuID;
    var url;
    
    switch (menuID) {
        case 0:// FAQ
            url = CinemaServerDomain + '/LCHS/Contents/Customer-Service-Center/FAQ/faq-list.aspx';
            break;
        case 1:// 공지사항
            url = <%= cp %> + '/admin/noticeList.see';
            break;
        case 2:// 1:1 문의
            url = CinemaServerDomain + '/LCHS/Contents/Customer-Service-Center/One-To-One-Inquriry/one-to-one-inquriry-registration.aspx';
            //if (!checkLogin()) {
            //    //	alert("로그인이 필요합니다.");
            //    goToLogin(url);
            //    return;
            //}
            break;
    }
    
    type = (type == undefined) ? '1' : type;
    goUrl(url, type);

}
	
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
						<li><a href="javascript:customerCenterMenu(0);">FAQ</a></li>
						<li class="active"><a
							href="javascript:customerCenterMenu(1);">공지사항</a></li>
						<li><a href="javascript:customerCenterMenu(2);">1:1문의</a></li>
						<li><a href="javascript:customerCenterMenu(3);">단체관람/대관문의</a></li>
						<li><a href="javascript:customerCenterMenu(4);">분실물안내</a></li>
					</ul>
					<div class="tabCont">
						<form name="form1" method="post"
							action="<%=cp%>/admin/noticeList.see">
							<div class="custCategory">
								<select class="select_box" name="searchOption">
									<!-- 검색조건을 검색처리 후 결과 화면에 보여주기 위해  c:out 출력태그 사용, 삼항연산자 -->
									<option value="all"
										<c:out value="${map.searchOption == 'all'?'ed':''}"/>>제목
										+ 내용</option>
									<option value="notice_subject"
										<c:out value="${map.searchOption == 'notice_subject'?'ed':''}"/>>제목</option>
									<option value="notice_content"
										<c:out value="${map.searchOption == 'notice_content'?'ed':''}"/>>내용</option>

								</select> <input name="keyword" value="${map.keyword}" title="검색어 입력"
									class="ipt_txt mt0"> <input type="submit" value="검색"
									class="boardBt"> <input type="button" value="글쓰기"
									onclick="btnWrite();" class="boardBt" /> <span> <!-- 레코드의 갯수를 출력 -->
									<strong>${map.count}</strong>개의 게시물이 있습니다.
								</span>
							</div>
						</form>
						<fieldset>
							<!-- 레코드의 갯수를 출력 -->
							<%-- ${map.count}개의 게시물이 있습니다. --%>
							<table class="tbl_st03">
								<colgroup>
									<col style="width: 11%">
									<col style="width: 15%">
									<col style="width: 49%">
									<col style="width: 14%">
									<col style="width: 11%">
								</colgroup>

								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">영화관</th>
										<th scope="col">제목</th>
										<th scope="col">등록일</th>
										<th scope="col">조회수</th>
									</tr>
								</thead>

								<tbody>
									<c:forEach var="noticeList" items="${map.noticeList}">
										<tr class="notice">
											<td>${noticeList.notice_no}</td>
											<td>${noticeList.notice_area}</td>
											<!-- **상세보기 페이지로 이동시 게시글 목록페이지에 있는 검색조건, 키워드, 현재페이지 값을 유지하기 위해 -->
											<td class="txtl"><a
												href="<%=cp %>/admin/noticeView.see?notice_no=${noticeList.notice_no}&curPage=${map.c_Paging.curPage}&searchOption=${map.searchOption}&keyword=${map.keyword}">${noticeList.notice_subject}</a></td>
											<td><fmt:formatDate value="${noticeList.notice_date}"
													pattern="yyyy-MM-dd" /></td>
											<td>${noticeList.notice_hit}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</fieldset>
						<div class="paging">
							<!-- **처음페이지로 이동 : 현재 페이지가 1보다 크면  [처음]하이퍼링크를 화면에 출력-->
							<c:if test="${map.c_Paging.curBlock > 1}">
								<a href="javascript:list('1')" class="first"><img
									src="<%= cp %>/images/btn/btn_first_02.gif" alt="처음으로 이동"></a>
							</c:if>
							<!-- **이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크를 화면에 출력 -->
							<c:if test="${map.c_Paging.curBlock > 1}">
								<a href="javascript:list('${map.c_Paging.prevPage}')"><img
									src="<%= cp %>/images/btn/btn_prev_02.gif" alt="10페이지 이전으로 이동"></a>
							</c:if>

							<span class="pagingNum"> <!-- **하나의 블럭에서 반복문 수행 시작페이지부터 끝페이지까지 -->
								<c:forEach var="num" begin="${map.c_Paging.blockBegin}"
									end="${map.c_Paging.blockEnd}">
									<!-- **현재페이지이면 하이퍼링크 제거 -->
									<c:choose>
										<c:when test="${num == map.c_Paging.curPage}">
											<span class="on">${num}</span>&nbsp;
                        </c:when>
										<c:otherwise>
											<a href="javascript:list('${num}')">${num}</a>&nbsp;
                        </c:otherwise>
									</c:choose>
								</c:forEach>
							</span>

							<!-- **다음페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [다음]하이퍼링크를 화면에 출력 -->
							<c:if test="${map.c_Paging.curBlock <= map.c_Paging.totBlock}">
								<a href="javascript:list('${map.c_Paging.nextPage}')"
									class="next"><img src="<%= cp %>/images/btn/btn_next_02.gif"
									alt="10페이지 다음으로 이동"></a>
							</c:if>
							<!-- **끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝]하이퍼링크를 화면에 출력 -->
							<c:if test="${map.c_Paging.curPage <= map.c_Paging.totPage}">
								<a href="javascript:list('${map.c_Paging.totPage}')"
									class="last"><img src="<%= cp %>/images/btn/btn_last_02.gif" /></a>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>