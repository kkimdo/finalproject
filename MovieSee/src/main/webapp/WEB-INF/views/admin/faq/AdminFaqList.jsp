<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FAQ</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
	$(function() {
		$(".faq > dd").hide();

		$(".faq > dt").click(function(event) {

			$(event.currentTarget).next().slideToggle(200, function() {
				var $dd = $(this);
				var $dl = $dd.prev();
				console.log($dd.css("display"));

				if ($dd.css("display") == "none") {
					$dl.find("span").html("▼");
				} else {
					$dl.find("span").html("▲");
				}
			});
		});
	});
</script>
<style>
dl.faq {
	border-collapse: separate;
	border-spacing: 1px;
	text-align: left;
	line-height: 1.5;
	border-top: 1px solid #ccc;
	/* border: 1px solid red; */
	margin: 20px 10px;
}

dl.faq dd {
	position: relative;
	width: 980px;
	padding: 30px 20px 30px 70px;
	background: #f5f5f5;
	font-size: 13px;
	line-height: 22px;
	color: #666;
}

.shPeriod {
	padding: 20px 30px;
	padding-top: 20px;
	padding-right: 30px;
	padding-bottom: 20px;
	padding-left: 30px;
	background: #f5f5f5;
}

.shPeriod .tit {
	float: left;
	font-size: 14px;
	line-height: 30px;
}

.shPeriod .tit {
	display: inline-block;
	width: 111px;
	font-weight: bold;
	color: #231f20;
}

.cs_center {
	width: 980px;
	margin: 0 auto;
	padding: 50px 0 50px;
	color: #231f20;
}

.shPeriod .goods input[type="text"] {
	width: 349px;
	height: 30px;
	padding: 0 10px;
	border: none;
	font-size: 14px;
	color: #666;
	line-height: 30px;
	background: #fff;
}

.btn_view {
	display: block;
	width: 100%;
	height: 40px;
	padding: 8px 0;
	background: #efefef;
	border: 1px solid #dedede;
	text-align: center;
	font-size: 14px;
	color: #231f20;
	font-weight: bold;
	box-sizing: border-box;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
}

a {
	text-decoration: none;
	color: #555;
}

.faqTop5 {
	width: 100%;
	margin-bottom: 50px;
	border-bottom: 1px solid #c0c0c0;
	border-top: 1px solid #c0c0c0;
}
ol, ul, li {
    list-style: none;
}
body {
    font-family: "나눔 고딕", 'Nanum Gothic', 'ng';
    font-weight: 400;
    color: #555;
    line-height: 1;
}
.faqTop5 li .qTit .num {
    display: inline-block;
    width: 20px;
    height: 20px;
    vertical-align: middle;
    margin-right: 10px;
    background: url(\Users\user\Desktop\bg_faq.png) no-repeat 0 0;
    background-image: url(\Users\user\Desktop\bg_faq.png);
    font-size: 15px;
    color: #d01616;
    font-family: 'linlivertine';
    text-align: center;
    line-height: 20px;
}
	
</style>

</head>


<body>
	<h1>FAQ</h1>

	<!-- 검색 -->
	<div class="shPeriod" id="searchArea">
		<form method="post">
			<span class="tit">검색</span>
			<div class="goods">
				<input type="text" placeholder="검색어를 입력하세요" title="검색어 입력"
					name="isSearch"> <input type="submit" value="검색"
					class="btn_goodsSrch" id="btnSearch">
			</div>
	</div>

	<h3 class="mem_tit" id="faqTop5Title" style="">FAQ TOP5</h3>
	<ol class="faqTop5" id="faqTop5List" style="">
		<li id="qaTop35" class="">
			<div class="qTit">
				<a href="javascript:void(0);"> <span class="qnTit"><em
						class="num">1</em> 영화관 이용</span> 관람등급 안내
				</a>
			</div>
			<div class="answer_box" id="qaTopContent35" style="display: none;">
				<span title="답변" class="a">A</span><font face="나눔고딕">롯데시네마는
					영화 및 비디오진흥에 관한 법률(이하 영비법)을 준수합니다.<br>영비법 29조에 따르면 [만 12세
					이상관람가/ 만 15세 이상관람가]의 등급이라도 <br>부모 등 보호자를 동반하는 경우 어린이(유아) 동반이
					가능합니다.<br>반드시 보호자의 동반이 필요함을 양지하여 주시기 바랍니다.<br>
				<font color="#ff0000">단, 청소년관람불가 영화는 보호자 동반과 관계없이 <br>만
						18세미만이거나 연령 조건을 만족하여도 초중고 재학중인 청소년 및 영유아 관람이 절대 불가합니다.
				</font>
				</font>
			</div>
		</li>
		<li id="qaTop47">
			<div class="qTit">
				<a href="javascript:void(0);"> <span class="qnTit"><em
						class="num">2</em> 온라인</span> 비회원 예매를 했어요. 영화관에서 티켓을 어떻게 받나요?
				</a>
			</div>
			<div class="answer_box" id="qaTopContent47" style="display: none;">
				<span title="답변" class="a">A</span>
				<p>
					<font face="나눔고딕">비회원으로 예매 하신 경우 예매 내용은 홈페이지 [예매] 메뉴의
						[예매확인/취소]에서<br>비회원 예매 시 입력하셨던 '이름/핸드폰번호/이메일주소'를 통해 확인 가능합니다.<br>현장에서
						티켓으로 교환할 경우, [예매확인/취소]에서 예매번호를 확인하신 후<br>매표소(인포메이션) 또는 무인발권기에
						발급받으신 예매번호를 입력하시면 교환 가능합니다.
					</font>
				</p>
			</div>
		</li>
		<li id="qaTop105">
			<div class="qTit">
				<a href="javascript:void(0);"> <span class="qnTit"><em
						class="num">3</em> 할인혜택</span> 통신사별 멤버십 혜택은 어떻게 되나요?
				</a>
			</div>
			<div class="answer_box" id="qaTopContent105" style="display: none;">
				<span title="답변" class="a">A</span>
				<p>통신사별 멤버십 혜택은 다음과 같습니다.</p>
				<br>
				<p>
					▣ SKT<br>&nbsp; - VIP 회원에 한하여 연 6회 일반 영화 무료/할인 (온라인예매)<br>&nbsp;
					- 일반 영화 무료 예매 한도 소진 후 1천원 할인<br>&nbsp; - 3D영화 5천원 관람 <br>&nbsp;
					- 3D 조조, 3D 청소년, 4D, 특수관 제외<br>&nbsp; - 할인금액 상당 멤버십 할인 한도
					차감(잔여 할인한도 부족시 사용 불가)<br>&nbsp; - 본인 월 1회, 1매 제한
				</p>
				<br>
				<p>
					▣ KT<br>&nbsp; - VIP 회원 VIP초이스 내 통합 월 1회, 연 12회 무료 관람 (온라인예매)<br>&nbsp;
					- 동반 1인 할인은 8,000원 초과 결제금액에 대해 최대 3,500원 할인<br>&nbsp; - 할인
					금액만큼 포인트 차감<br>&nbsp; - 2D 일반 영화에 한함 (3D, 4D, 특수관 제외)<br>&nbsp;
					- 매점 콤보 월 1회, 연 12회 1,500원 할인(현장)<br>&nbsp; - 매점 콤보 할인 시 이벤트,
					싱글콤보제외, 중복할인불가<br>&nbsp; - 무료관람 및 티켓할인 제외 영화관 : 강동, 프리미엄칠곡<br>&nbsp;
					- 매점 콤보 할인 제외 영화관 : 강동, 경주, 구미, 군산, 남원주, 마산터미널, 목포, 부천역, 브로드웨이,
					서귀포, <br>&nbsp;&nbsp;&nbsp;&nbsp; 서산, 성남, 성남신흥, 오산, 용인, 원주무실,
					청주충대, 충장로, 통영, 프리미엄칠곡, 해운대
				</p>
				<br>
				<p>
					▣ LG U+<br>&nbsp; - '나만의 콕 영화' 선택 회원에 한함<br>&nbsp; -
					VVIP/VIP 회원: 주1회 / 통합 월 2회 무료관람 (온라인예매)<br>&nbsp; - 다이아몬드 회원:
					격월 1회 / 통합 연 6회 무료관람 (온라인예매)<br>&nbsp;&nbsp;&nbsp; (격월 기준:
					1~2월/3~4월/5~6월/7~8월/9~10월/11~12월)<br>&nbsp; - 골드 회원: 본인 3천원 할인
					(현장예매)<br>&nbsp; - 2D 일반 영화에 한함<br>&nbsp; - 강동, 프리미엄칠곡 제외
				</p>
				<br>
				<p></p>
			</div>
		</li>
		<li id="qaTop55">
			<div class="qTit">
				<a href="javascript:void(0);"> <span class="qnTit"><em
						class="num">4</em> 온라인</span> 바로입장 티켓은 무엇인가요?
				</a>
			</div>
			<div class="answer_box" id="qaTopContent55" style="display: none;">
				<span title="답변" class="a">A</span><font face="나눔고딕">온라인 예매 후
					롯데시네마 모바일앱을 켜면 바로입장 티켓을 확인하실 수 있습니다. <br>인포메이션 데스크 또는 무인발권기에서
					지류 티켓을 발권을 하지 않고, 바로입장 티켓을 상영관 입장 시 제시해주시면 바로 입장하실 수 있습니다.
				</font>
			</div>
		</li>
		<li id="qaTop56">
			<div class="qTit">
				<a href="javascript:void(0);"> <span class="qnTit"><em
						class="num">5</em> 온라인</span> 온라인 예매 후 예매내역 확인하고 싶어요
				</a>
			</div>
			<div class="answer_box" id="qaTopContent56" style="display: none;">
				<span title="답변" class="a">A</span><font face="나눔고딕">인터넷 예매후
					예매내역을 다시 확인 하시려면<br>- 홈페이지 : [로그인] → [마이시네마] → [예매/취소 내역]에서 확인
					가능합니다.<br>- 모바일 : [로그인] → 우측 상단 [MY] 메뉴 → [마이시네마] → [예매/취소
					내역]에서 확인 가능합니다.
				</font>
			</div>
		</li>
	</ol>

	<c:forEach var="faqList" items="${faqList}" varStatus="stat">

		<dl class="faq">
			<dt>
				<h5>
					<span>▲</span> ${faqList.faq_subject}
				</h5>
			</dt>
			<dd>${faqList.faq_content}</dd>
		</dl>

	</c:forEach>


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
		
	</table>  --%>


	<c:if test="${fn:length(faqList) le 0}">
		<center>등록된 게시물이 없습니다.</center>
	</c:if>

	<!-- <div>
		<form method="post">
			<div>
					<input type="text" name="isSearch" /> 
					<input type="submit" value="검색">
					
			</div>
		</form>
	</div> -->

	${pagingHtml}
	<input type="button" onclick="location.href='faqWrite.see'" value="글쓰기" />
</body>
</html>