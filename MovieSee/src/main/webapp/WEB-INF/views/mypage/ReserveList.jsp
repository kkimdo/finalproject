<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>박스오피스</title>
</head>
<body>
	<div class="gnb">
		<ul>
			<li><a href="<%=cp%>/reserve/movieTicketing.see" title="예매">예매</a>
				<div class="depth"></div></li>

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
					<!-- 20150918 수정 -->
					<dd class="rating Lang-LBL0000">
						<span id="spnMemberGrade"></span>
					</dd>
					<!-- 20161101 삭제 -->
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

				<li class="active"><a href="<%=cp%>/mypage/reserveList.see"
					class="Lang-LBL3001">예매/구매내역</a></li>

				<li><a href="<%=cp%>/gift/purchaseMemberList.see">기프트샵 구매
						내역</a></li>

				<li class="pointRat" style=""><a
					href="<%=cp%>/gift/purchaseMemberCancleList.see">기프트샵 취소 내역</a></li>

			</ul>
			<!-- //마이시네마 탭 메뉴 -->
			<!-- 탭 내용 -->
			<c:choose>
				<c:when test="${reserveList != null }">
					<c:forEach var="reserveList" items="${reserveList}"
						varStatus="stat">
						<div class="tabCont" id="divTabContent">
							<div class="category">
								<fieldset>
									<legend class="Lang-LBL0000">연도별 선택 검색</legend>
									<select title="연도별 선택" class="select_box" id="sltMyMovieYear"><option
											value="2007">전체</option>
										<option value="2017">2017</option>
										<option value="2016">2016</option>
										<option value="2015">2015</option></select>
								</fieldset>
							</div>

							<!-- my_mView -->
							<div class="my_mView">
								<p class="mView_txt">
									<strong class="name Lang-LBL0000">${reserveList.reserve_member_id}</strong>
									회원님께서 관람하신 영화 리스트입니다.
								</p>
							</div>
							<!--// my_mView -->
							<ol class="mView_list" id="olMyMovieList">
								<li><div class="mView_tcont">
										<span class="img"><img
											src="<%= cp %>/resources/upload/movie/main_movie/${reserveList.reserve_movie_poster}" 
											alt="${reserveList.reserve_movie_poster}"></span>
										<dl class="mView_scont">
											<dt>
												<span class="grade_18">청소</span><span class="name"><c:choose>
														<c:when test="${reserveList.reserve_movie_age eq '12' }">
															<img src="<%=cp%>/resources/upload/movie/btn/12.png">
														</c:when>
														<c:when test="${reserveList.reserve_movie_age eq '15' }">
															<img src="<%=cp%>/resources/upload/movie/btn/15.png">
														</c:when>
														<c:otherwise>
															<img src="<%=cp%>/resources/upload/movie/btn/all.png">
														</c:otherwise>
													</c:choose>${reserveList.reserve_movie_name}</span>
											</dt> 
											<dd>
												<dl class="mView_in">
													<dt>관람일시</dt>
													<dd class="t_date">${reserveList.reserve_start_date}
													<dt>관람시간</dt>
													<dd class="t_date">${reserveList.reserve_start_time}
														~ ${reserveList.reserve_end_time}
														<%-- <fmt:formatDate value="${reserveList.reserve_start_date}" pattern="yyyy-MM-dd" /> --%>
													</dd>
													<dt>관람인원</dt>
													<dd class="t_person">성인 :
														${reserveList.reserve_adult_cnt}명, 학생 :
														${reserveList.reserve_child_cnt}명</dd>
													<dt>총 금액</dt>
													<dd class="t_person">
														<fmt:formatNumber
															value="${reserveList.reserve_adult_amt * reserveList.reserve_adult_cnt +reserveList.reserve_adult_cnt * reserveList.reserve_child_cnt}"
															pattern="\#,###.##" />
														원
													</dd>
												</dl>
											</dd>
										</dl>
									</div> <a
									href="<%= cp %>/reserve/reserveCancel.see?reserve_no=${reserveList.reserve_no}&reserve_timetable_no=${reserveList.reserve_timetable_no}"
									class="btn_mView_close" args="1L97"> <img
										src="<%=cp%>/images/exit.gif" alt="삭제"></a></li>
							</ol>
						</div>
					</c:forEach>
				</c:when>
				<c:when test="${reserveList == null}">
					<div class="srchResult_none" style="" id="searchResultNone">
						<span class="txt Lang-LBL3056">예매/구매한 내역이 없습니다.</span>
					</div>
				</c:when>
			</c:choose>

			<div class="info_box">
				<h4 class="infoB_tit Lang-LBL3004">유의사항</h4>
				<!-- 0309 수정 -->

				<dl>
					<dt class="Lang-LBL3005">[예매취소 안내]</dt>
					<dd>
						<ul>
							<li class="point_red">온라인 예매 취소는 상영 20분 전까지 가능하며, 20분 이전부터는
								현장 취소만 가능합니다. (단, 무대인사 취소는 영화 시작 24시간 전 까지만 가능합니다.)</li>
							<li>적립 예정 L.POINT는 영화 관람 다음 날 적립됩니다.</li>
							<li>예고편과 광고 상영으로 실제 영화 시작 시간이 10분 정도 차이 날 수 있습니다.</li>
							<li>SMS 수신을 이용하시면 예매내역을 휴대폰으로 받을 수 있습니다.</li>
						</ul>
					</dd>
					<dt class="Lang-LBL3009">[상품취소 안내]</dt>
					<dd>
						<ul>
							<li>스위트샵 상품의 취소기한은 구매일로부터 30일, 기프트샵 상품의 취소기한은 구매일로부터 93일
								입니다.</li>
							<li style="background: initial; background: inherit;">(구매일로부터
								75일 이상, 93일 이내인 상품 취소를 원하실 경우, 고객센터 1544-8855로 문의 바랍니다.)</li>
							<li>구매취소는 취소기한 내 마이시네마 &gt; 예매/구매내역에서만 가능합니다.(현장취소 불가)</li>
							<li>구매하신 상품은 부분환불 및 현금환불이 되지 않습니다.</li>
							<li>좌석 구매 시 함께 구매한 매점 상품은 영화 관람 완료 후에는 취소가 불가합니다.</li>
							<li>얼리버드 상품은 특별관람권이므로 구매 후 7일 이내 환불 가능합니다.</li>
						</ul>
					</dd>
				</dl>
			</div>

		</div>
	</div>
	</div>
</body>
</html>