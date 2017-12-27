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
	
	$(function(){
		var notice_btn = $(".notice_delete");
		
		notice_btn.each(function(){
			var btn = $(this).children('.btn');
			
			btn.on('click',function(){
				var check = confirm("삭제하시겠습니까?");	
				if(check){
					return true;
				}else{
					return false;
				}
			})
		})
	})
</script>

</head>
<body>
	<div class="admin_grp">
		<div class="admin_list">
			<ul>
				<li><a href="<%=cp%>/admin/movieList.see">상영작</a></li>
				<li><a href="<%=cp%>/admin/timeTableList.see">시간표관리</a></li>
				<li><a href="<%=cp%>/admin/bannerList.see">배너관리</a></li>
				<li><a href="<%=cp%>/admin/giftShopList.see">기프트샵</a></li>
				<li><a href="<%=cp%>/admin/eventListMain.see">이벤트</a></li>
				<li class="on"><a href="<%=cp%>/admin/noticeList.see">공지사항</a></li>
				<li><a href="<%=cp%>/admin/faqList.see">FAQ</a></li>
				<li><a href="<%=cp%>/admin/qnaList.see">Q&amp;A</a></li>
				<li><a href="<%=cp%>/admin/memberList.see">회원정보</a></li>
			</ul>
		</div>
		<div class="admin_ct">
			<h3 class="sub_tit">공지사항</h3>
			<div class="tbl_type_02">
				<table>
					<colgroup>
						<col style="width: 7%;" />
						<col style="width: 8%;" />
						<col style="width: 30%;" />
						<col style="width: 8%;" />
						<col style="width: 5%;" />
						<col style="width: 8%;" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">영화관</th>
							<th scope="col">제목</th>
							<th scope="col">등록일</th>
							<th scope="col">조회수</th>
							<th scope="col">삭제유무</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach var="noticeList" items="${map.noticeList}">
							<tr>
								<c:choose>
									<c:when test="${noticeList.notice_area eq '전체'}">
										<td><strong>-</strong></td>
                        				</c:when>
									<c:otherwise>
										<td>${noticeList.notice_no}</td>
                        			</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${noticeList.notice_area eq '전체'}">
										<td><strong>${noticeList.notice_area}</strong></td>
                        				</c:when>
									<c:otherwise>
										<td>${noticeList.notice_area}</td>
                        			</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${noticeList.notice_area eq '전체'}">
										<td><strong><a href="<%=cp %>/admin/noticeView.see?notice_no=${noticeList.notice_no}&curPage=${map.c_Paging.curPage}&searchOption=${map.searchOption}&keyword=${map.keyword}">${noticeList.notice_subject}</a></strong></td>
                        				</c:when>
									<c:otherwise>
										<td><a href="<%=cp %>/admin/noticeView.see?notice_no=${noticeList.notice_no}&curPage=${map.c_Paging.curPage}&searchOption=${map.searchOption}&keyword=${map.keyword}">${noticeList.notice_subject}</a></td>
                        			</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${noticeList.notice_area eq '전체'}">
										<td><strong><fmt:formatDate value="${noticeList.notice_date}" pattern="yyyy-MM-dd" /></strong></td>
                        				</c:when>
									<c:otherwise>
										<td><fmt:formatDate value="${noticeList.notice_date}"
										pattern="yyyy-MM-dd" /></td>
                        			</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${noticeList.notice_area eq '전체'}">
										<td><strong>${noticeList.notice_hit}</strong></td>
                        				</c:when>
									<c:otherwise>
										<td>${noticeList.notice_hit}</td>
                        			</c:otherwise>
								</c:choose>
								<td class="notice_delete">
									<a href="<%=cp%>/admin/noticeDelete.see?notice_no=${noticeList.notice_no}"class="btn btnC_04 btnP_03">
									<span>삭제</span>
								</a>
								</td>
							</tr>
						</c:forEach>
						<c:if test="${fn:length(map.noticeList) le 0}">
					<tr>
						<td colspan="13" class="tac">등록된 공지사항이 없습니다.</td>
					</tr>
					</c:if>
					</tbody>
				</table>
				<form name="form1" method="post"
					action="<%=cp%>/admin/noticeList.see">
					<div class="search_form">
						<select class="slct w100" name="searchOption">
							<!-- 검색조건을 검색처리 후 결과 화면에 보여주기 위해  c:out 출력태그 사용, 삼항연산자 -->
							<option value="all"
								<c:out value="${map.searchOption == 'all'?'ed':''}"/>>모두</option>
							<option value="notice_subject"
								<c:out value="${map.searchOption == 'notice_subject'?'ed':''}"/>>제목</option>
							<option value="notice_content"
								<c:out value="${map.searchOption == 'notice_content'?'ed':''}"/>>내용</option>
							<option value="notice_area"
								<c:out value="${map.searchOption == 'notice_area'?'ed':''}"/>>영화관</option>


						</select> <input name="keyword" value="${map.keyword}" title="검색어 입력"
							class="txt w100"> <span class="btn btnC_04 btnP_04">
							<input type="submit" value="검색" />
						</span> <span class="btn btnC_04 btnP_04"> <input type="button"
							value="글쓰기" onclick="btnWrite();" />
						</span> <span> <strong>${map.count}</strong>개의 게시물이 있습니다.
						</span>
					</div>
				</form>
				<c:if test="${fn:length(map.noticeList) le 0}">
					<br />
					<center>등록된 게시물이 없습니다</center>
					<br />
				</c:if>
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
						<a href="javascript:list('${map.c_Paging.nextPage}')" class="next"><img
							src="<%=cp%>/images/btn/btn_next_02.gif" alt="10페이지 다음으로 이동"></a>
					</c:if>
					<!-- **끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝]하이퍼링크를 화면에 출력 -->
					<c:if test="${map.c_Paging.curPage <= map.c_Paging.totPage}">
						<a href="javascript:list('${map.c_Paging.totPage}')" class="last"><img
							src="<%=cp%>/images/btn/btn_last_02.gif" /></a>
					</c:if>

				</div>
			</div>
		</div>
	</div>
</body>
</html>