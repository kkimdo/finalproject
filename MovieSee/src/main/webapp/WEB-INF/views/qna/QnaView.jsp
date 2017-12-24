<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	String cp = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="<%=cp%>/resources/mscs/qna.css?ver=201712060002" />
<link rel="stylesheet" type="text/css"
	href="<%=cp%>/resources/mscs/theme.css?ver=201712060002" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>QNA</title>
<script type="text/javascript">
	function btnList(){
    	location.href="<%=cp%>/qna/qnaMemberList.see?curPage=${curPage}";
	}
</script>

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

			<li><a href="<%=cp%>/giftshop/giftShopList.see" title="기프트샵">기프트샵</a>
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
					<dt>회원 등급</dt>
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
				<li class=""><a href="<%=cp%>/mypage/reserveList.see"
					class="Lang-LBL3001">예매/구매내역</a> <!-- 
                        <ul class="tabDep2">
                            <li class="on"><a href="javascript:void(0)" class="Lang-LBL3016">예매/구매내역</a></li>
                            <li><a href="javascript:void(0)" class="Lang-LBL3000">선물내역</a></li>
                            <li><a href="javascript:void(0)" class="Lang-LBL3002" id="aCancle">취소내역</a></li>
                        </ul> 
                   --></li>

				<li class=""><a href="<%=cp%>/mypage/reserveCancel.see">나의
						취소내역</a></li>

				<li class="pointRat" style=""><a href="<%=cp%>/mypage/vip.see">VIP</a>
					<!--170915 cok 문구 교체 멤버십 ->VIP 기준 -->
					<ul class="tabDep2">
						<li class="on"><a href="javascript:void(0)">VIP 승급 금액 안내</a></li>
						<!--20170111 sunho 문구 교체 VIP승급포인트 안내 -> VIP승급 금액 안내 -->
					</ul></li>

				<li class="mvHistory" style=""><a
					href="<%=cp%>/mypage/movieHistory.see">무비 히스토리</a></li>

				<li class="active" style=""><a
					href="<%=cp%>/qna/qnaMemberList.see">나의 문의 내역</a></li>
				<li style=""><a href="<%=cp%>/mypage/mypage.see">나의 정보관리</a></li>

			</ul>
			<div class="tabCont">
			<fieldset>
				<legend>문의내역</legend>
				<div class="titYtxt">
					<h3 class="mem_tit">문의내역</h3>
				</div>
				<table class="tbl_style01">
					<colgroup>
						<col style="width: 13%">
						<col style="width: *">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" id="th_questionDetail_title">번호</th>
							<td headers="th_questionDetail_title" colspan="3"><strong
								class="c_purple">${qnaModel.qna_no}</strong></td>
						</tr>
						<tr>
							<th scope="row"><label for="kinds"> 문의 종류 </label></th>
							<td id="kinds">${qnaModel.qna_question_kinds}</td>
						</tr>
						<tr>
							<th scope="row"><label for="category"> 문의 분류 </label></th>
							<td id="category">${qnaModel.qna_category}</td>
						</tr>
						<tr>
							<th scope="row"><label for="area"> 지역 </label></th>
							<td id="area">${qnaModel.qna_area}</td>
						</tr>
						<tr>
							<th scope="row"><label for="subject"> 제목 </label></th>
							<td id="subject">${qnaModel.qna_subject}</td>
						</tr>
						<tr>
							<th scope="row"><label for="content"> 내용 </label></th>
							<td id="content">${qnaModel.qna_content}</td>
						</tr>
						<tr>
							<th scope="row"><label for="uploadfile"> 첨부파일 </label></th>
							<td id="uploadfile">
								<c:if test="${qnaModel.qna_orgfile ne null }">
									<img border="0" hspace="0" alt="${qnaModel.qna_content}" src="<%= cp %>/resources/uploads/qna/${qnaModel.qna_savfile}">
								</c:if>
								<c:if test="${qnaModel.qna_orgfile eq null }">
								첨부 파일이 없습니다.
								</c:if>
							</td>
						</tr>
						<tr>
							<th scope="row">등록일</th>
							<td><fmt:formatDate value="${qnaModel.qna_date}"
									pattern="yyyy.MM.dd" />
							</td>
						</tr>
					</tbody>
				</table>
			</fieldset>
		</div>
		
		<c:if test="${QnaCommentList.size() eq 0}">
			<table class="tbl_style01">
					<colgroup>
						<col style="width: 13%">
						<col style="width: *">
					</colgroup>
					<tbody>
						<tr>
							<th class="co">답변</th>
							<td class="co">답변 내용이 없습니다.</td>
						</tr>
					</tbody>
				</table>
		</c:if>

			<c:forEach var="qna_comment" items="${QnaCommentList}">

				<table class="tbl_style01">
					<colgroup>
						<col style="width: 13%">
						<col style="width: *">
					</colgroup>
					<tbody>
						<tr>
							<th class="coco">답변내용</th>
							<td class="co" id="qna_comment_content">${qna_comment.qna_comment_content}</td>
						</tr>
					</tbody>
			</table>

			</c:forEach>

			<div class="btn_type_033">
					<span class="btn btnC_03 btnP_04 mr10"> 
						<input type="button" onclick="btnList();" value="목록" />
					</span>
			</div>
	</div>
</body>
</html>
