<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%
	String cp = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>1:1 문의내역</title>

<script type="text/javascript">

	//**원하는 페이지로 이동시 검색조건, 키워드 값을 유지하기 위해 
	function list(page){
   	location.href="<%=cp%>/gift/purchaseMemberCancleList.see?curPage=" + page
				+ "&searchOption=${map.searchOption}"
				+ "&keyword=${map.keyword}";
		}

</script>

</head>
<body>
	<div class="gnb">
		<ul>
			<li><a href="<%=cp%>/reserve/movieTicketing.see" title="예매">예매</a>
				<div class="depth"></div>
			</li>

			<li class=""><a href="<%=cp%>/aMovieList.see" title="영화">영화</a>
				<div class="depth"></div></li>

			<li><a href="<%=cp%>/aMovieTheater.see" title="영화관">영화관</a>
				<div class="depth"></div></li>

			<li><a href="<%=cp%>/event/eventListMain.see" title="이벤트">이벤트</a>
				<div class="depth"></div></li>

			<li><a href="<%=cp%>/gift/giftShopList.see" title="기프트샵">기프트샵</a>
				<div class="depth"></div></li>
		</ul>
	</div>
	<div class="myCinema">
		<!-- 내 정보 -->
		<div class="myInfo">
			<h2 class="order_tit02 Lang-LBL0000">마이시네마</h2>
			<div class="myInfoTit">
				<em><span class="userName" id="spnUserName">${session_member_name}</span>님
					환영합니다!</em>
				<dl>
					<dd class="rating Lang-LBL0000">
						<span id="spnMemberGrade"></span>
					</dd>
					<!-- <dd><a href="javascript:void(0)" class="bnfView Lang-LBL0000" id="aViewBenefit">혜택보기</a></dd> -->
				</dl>
			</div>
		</div>
		<!-- //내 정보 -->
	</div>

	<div class="content">


		<div class="myCinemaCont">
			<!-- 마이시네마 탭 메뉴 -->
			<ul class="tab_st03" id="ulTab">
				<li style=""><a href="<%=cp%>/mypage/mypage.see">나의 정보관리</a></li>
				
				<li style=""><a href="<%=cp%>/qna/qnaMemberList.see">나의 문의
						내역</a></li>

				<li class=""><a href="<%=cp%>/mypage/reserveList.see"
					class="Lang-LBL3001">예매/구매내역</a></li>

				<li class=""><a
					href="<%=cp%>/gift/purchaseMemberList.see">기프트샵 구매 내역</a></li>

				<li class="active" style=""><a
					href="<%=cp%>/gift/purchaseMemberCancleList.see">기프트샵 취소 내역</a>
				</li>

			</ul>
			<!-- //마이시네마 탭 메뉴 -->
			<!-- 탭 내용 -->
			<div class="tabCont my_manage" id="divTabContent">
				<div class="tabCont">
					<form name="form1" method="post"
						action="<%=cp%>/gift/purchaseMemberCancleList.see">
						<div class="custCategory">
							<select class="select_box" name="searchOption">
								<!-- 검색조건을 검색처리 후 결과 화면에 보여주기 위해  c:out 출력태그 사용, 삼항연산자 -->
								<option value="all"
									<c:out value="${map.searchOption == 'all'?'ed':''}"/>>모두</option>
								<option value="giftpurchase_product_name"
									<c:out value="${map.searchOption == 'giftpurchase_product_name'?'ed':''}"/>>상품
									이름</option>
								<option value="giftpurchase_price"
									<c:out value="${map.searchOption == 'giftpurchase_price'?'ed':''}"/>>상품
									가격</option>

							</select> <input name="keyword" value="${map.keyword}" title="검색어 입력"
								class="ipt_txt mt0"> <input type="submit" value="검색"
								class="boardBt1"> <span> <!-- 레코드의 갯수를 출력 --> <strong>${map.mgsMemberCancleCount}</strong>개를 취소하였습니다.
							</span>
						</div>
					</form>
					<fieldset>

						<table class="tbl_st03">
							<colgroup>
								<col style="width: 8%">
								<col style="width: 10%">
								<col style="width: 20%">
								<col style="width: 14%">
								<col style="width: 11%">
								<col style="width: 11%">
							</colgroup>

							<thead>
								<tr>
									<th scope="col">번호</th>
									<th scope="col">상품 번호</th>
									<th scope="col">상품 이름</th>
									<th scope="col">구매 수량</th>
									<th scope="col">구매 가격</th>
									<th scope="col">구매 일</th>
								</tr>
							</thead>

							<tbody>
								<c:forEach var="purchaseCancleList" items="${map.purchaseCancleList}">
									<c:if test="${purchaseCancleList.giftpurchase_delshow == 'n'}">
										<tr class="notice">
											<td>${purchaseCancleList.giftpurchase_no}</td>
											<td>${purchaseCancleList.giftshop_product_no }</td>
											<td>${purchaseCancleList.giftpurchase_product_name }</td>
											<td>${purchaseCancleList.giftpurchase_count }</td>
											<td>${purchaseCancleList.giftpurchase_price }</td>
											<td><fmt:formatDate value="${purchaseCancleList.giftpurchase_date}" pattern="yyyy.MM.dd" /></td>
										</tr>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
					</fieldset>
					<div class="paging">
						<c:if test="${map.c_Paging.curBlock > 1}">
							<a href="javascript:list('1')" class="first"><img
								src="<%=cp%>/images/btn/btn_first_02.gif" alt="처음으로 이동"></a>
						</c:if>
						<c:if test="${map.c_Paging.curBlock > 1}">
							<a href="javascript:list('${map.c_Paging.prevPage}')"><img
								src="<%=cp%>/images/btn/btn_prev_02.gif" alt="10페이지 이전으로 이동"></a>
						</c:if>

						<span class="pagingNum"> <c:forEach var="num"
								begin="${map.c_Paging.blockBegin}"
								end="${map.c_Paging.blockEnd}">
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
						<c:if test="${map.c_Paging.curBlock <= map.c_Paging.totBlock}">
							<a href="javascript:list('${map.c_Paging.nextPage}')"
								class="next"><img src="<%=cp%>/images/btn/btn_next_02.gif"
								alt="10페이지 다음으로 이동"></a>
						</c:if>
						<c:if test="${map.c_Paging.curPage <= map.c_Paging.totPage}">
							<a href="javascript:list('${map.c_Paging.totPage}')" class="last"><img
								src="<%=cp%>/images/btn/btn_last_02.gif" /></a>
						</c:if>

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