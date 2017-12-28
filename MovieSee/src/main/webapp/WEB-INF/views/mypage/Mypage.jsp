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
				<div class="depth"></div>
				<ul>
					<li></li>
					<li></li>
					<li></li>
				</ul></li>

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
				<li style="" class="active"><a href="<%=cp%>/mypage/mypage.see">나의 정보관리</a></li>
				
				<li style=""><a href="<%=cp%>/qna/qnaMemberList.see">나의 문의
						내역</a></li>

				<li class=""><a href="<%=cp%>/mypage/reserveList.see"
					class="Lang-LBL3001">예매/구매내역</a></li>

				<li><a
					href="<%=cp%>/gift/purchaseMemberList.see">기프트샵 구매 내역</a></li>

				<li class="pointRat" style=""><a
					href="<%=cp%>/gift/purchaseMemberCancleList.see">기프트샵 취소 내역</a>
				</li>

			</ul>
			<!-- //마이시네마 탭 메뉴 -->
			<!-- 탭 내용 -->
			<div class="tabCont my_manage" id="divTabContent">
				<!-- 탭 내용 -->
				<!--
				<div class="tabCont my_manage">
-				->
				<!-- my_manage 클래스 추가 -->
				<ol class="manage_step">
						<li class="on first"><a href="/movie/member/memberView.see?member_no=${session_member_no}" id="aInformationChange">회원정보변경</a></li>
						<li class="second"><a href="/movie/member/memberPWView.see?member_no=${session_member_no}" id="aPasswordChange">비밀번호변경</a></li>
						<li class="third"><a href="<%=cp%>/faq/faqList.see" id="aAuthChange">고객센터</a></li>
						<li class="last"><a href="/movie/member/memberDelete.see" id="aMemberDelete">회원탈퇴</a></li>
				</ol>
				<ul class="manege_list">
					<li>무비씨는 L.POINT 제휴 사이트입니다. 비밀번호/회원정보는 롯데멤버스㈜에서 관리되고 있으며,
						회원가입 시 등록하신 개인정보는 롯데멤버스㈜에서 변경하실 수 있습니다.</li>
					<li>무비씨 회원탈퇴를 원하시면 회원탈퇴 버튼을 클릭해주세요. 회원을 탈퇴하시면 등록되어 있던
						쿠폰/할인권/관람권/L.POINT카드 등 개인정보가 삭제되어 재가입 시 다시 입력하셔야 합니다.</li>
					<li>회원님의 광고 수신동의 일자를 확인하실 수 있습니다.</li>
					<!--<li>무비씨의 이메일 주소 변경, 수신관리 설정을 원하시면 이메일설정 버튼을 클릭하세요. <a href="https://member.lpoint.com/door/user/editUser.jsp?sid=CINEMA&amp;opentyp=p&amp;returnurl=http://www.lottecinema.co.kr/LHS/AT/Auth/Logout.aspx" target="_balnk" title="새창" class="btnEmail">이메일설정</a></li>-->
					<li class="gap">L.POINT 적립 및 사용 현황을 확인하세요.</li>
					<!-- 추가 20171025 -->
				</ul>
				<!--
				</div>
					-->
				<!-- //탭 내용 -->
				<!--
				<script src="/LCHS/Script/My-Cinema/infomation-management.js"></script>
				-->
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