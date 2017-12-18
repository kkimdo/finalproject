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

<title>자유게시판</title>

<script type="text/javascript">

	function list(page){
   	location.href="<%=cp%>/free/freeBoardList.see?curPage="+page+"&searchOption=${map.searchOption}"+"&keyword=${map.keyword}";
	}

	function btnWrite(){
	location.href="<%=cp%>/free/freeBoardWrite.see";
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
						<li><a href="<%=cp%>/admin/noticeList.see">공지사항</a></li>
						<li><a href="javascript:customerCenterMenu(2);">1:1문의</a></li>
						<li class="active"><a href="<%=cp%>/free/freeBoardList.see">자유게시판</a></li>
						<li><a href="javascript:customerCenterMenu(4);">분실물안내</a></li>
					</ul>
					<div class="tabCont">
						<form name="form1" method="post"
							action="<%=cp%>/free/freeBoardList.see">
							<div class="custCategory">
								<select class="select_box" name="searchOption">
									<option value="all"
										<c:out value="${map.searchOption == 'all'?'ed':''}"/>>모두</option>
									<option value="freeboard_subject"
										<c:out value="${map.searchOption == 'freeboard_subject'?'ed':''}"/>>제목</option>
									<option value="freeboard_content"
										<c:out value="${map.searchOption == 'freeboard_content'?'ed':''}"/>>내용</option>
									<option value="freeboard_name"
										<c:out value="${map.searchOption == 'freeboard_name'?'ed':''}"/>>작성자 이름</option>


								</select> <input name="keyword" value="${map.keyword}" title="검색어 입력"
									class="ipt_txt mt0"> <input type="submit" value="검색"
									class="boardBt"><input type="button" value="글쓰기"
									onclick="btnWrite();" class="boardBt" /> <span> <!-- 레코드의 갯수를 출력 -->
									<strong>${map.count}</strong>개의 게시물이 있습니다.
								</span>
							</div>
						</form>
						<fieldset>
							<table class="tbl_st03">
								<colgroup>
									<col style="width: 11%">
									<col style="width: 49%">
									<col style="width: 15%">
									<col style="width: 14%">
									<col style="width: 11%">
								</colgroup>

								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">제목</th>
										<th scope="col">작성자</th>
										<th scope="col">등록일</th>
										<th scope="col">조회수</th>
									</tr>
								</thead>

								<tbody>
									<c:forEach var="freeBoardList" items="${map.freeBoardList}">
										<tr class="notice">
											<td>${freeBoardList.freeboard_no}</td>
											<td>
												<a href="<%=cp %>/free/freeBoardView.see?freeboard_no=${freeBoardList.freeboard_no}&curPage=${map.c_Paging.curPage}&searchOption=${map.searchOption}&keyword=${map.keyword}">
													<c:if test="${freeBoardList.freeboard_re_step == 1}">&nbsp;
														<img src="/movie/images/icon/reply.gif">
													</c:if>
															${freeBoardList.freeboard_subject}
												</a>
											</td>
											<td  class="txtl">${freeBoardList.freeboard_name}</td>
											<td><fmt:formatDate value="${freeBoardList.freeboard_date}" pattern="yyyy-MM-dd" /></td>
											<td>${freeBoardList.freeboard_hit}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</fieldset>
						<div class="paging">
							<!-- **처음페이지로 이동 : 현재 페이지가 1보다 크면  [처음]하이퍼링크를 화면에 출력-->
							<c:if test="${map.c_Paging.curBlock > 1}">
								<a href="javascript:list('1')" class="first"><img
									src="<%=cp%>/images/btn/btn_first_02.gif" alt="처음으로 이동"></a>
							</c:if>
							<!-- **이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크를 화면에 출력 -->
							<c:if test="${map.c_Paging.curBlock > 1}">
								<a href="javascript:list('${map.c_Paging.prevPage}')"><img
									src="<%=cp%>/images/btn/btn_prev_02.gif" alt="10페이지 이전으로 이동"></a>
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
									class="next"><img
									src="<%=cp%>/images/btn/btn_next_02.gif" alt="10페이지 다음으로 이동"></a>
							</c:if>
							<!-- **끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝]하이퍼링크를 화면에 출력 -->
							<c:if test="${map.c_Paging.curPage <= map.c_Paging.totPage}">
								<a href="javascript:list('${map.c_Paging.totPage}')"
									class="last"><img
									src="<%=cp%>/images/btn/btn_last_02.gif" /></a>
							</c:if>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>