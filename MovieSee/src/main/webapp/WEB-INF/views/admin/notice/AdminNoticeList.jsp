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

	//**원하는 페이지로 이동시 검색조건, 키워드 값을 유지하기 위해 
	function list(page){
   	location.href="<%=cp%>/admin/noticeList.see?curPage="+page+"&searchOption=${map.searchOption}"+"&keyword=${map.keyword}";
	}

	function btnWrite(){
	 // 페이지 주소 변경(이동)
	location.href="<%=cp%>/admin/noticeWrite.see";
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
						<li><a href="<%=cp%>/faq/faqList.see">FAQ</a></li>
						<li class="active"><a
							href="<%=cp%>/admin/noticeList.see">공지사항</a></li>
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
									class="boardBt"><!--  <input type="button" value="글쓰기"
									onclick="btnWrite();" class="boardBt" /> --> <span> <!-- 레코드의 갯수를 출력 -->
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