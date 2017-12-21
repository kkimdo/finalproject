<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<% String cp = request.getContextPath(); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%= cp%>/resources/mscs/qna.css?ver=201712060002"/>
<link rel="stylesheet" type="text/css" href="<%= cp%>/resources/mscs/theme.css?ver=201712060002"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>QNA</title>
<script type="text/javascript">
	//** 목록 버튼 클릭 이벤트 : 버튼 클릭시 상세보기화면에 있던 페이지, 검색옵션, 키워드 값을 가지로 목록으로 이동
	function btnList(){
    	location.href="<%=cp%>/qna/qnaMyList.see?curPage=${curPage}";
    	}  
</script>

</head>

<body>
	<div class="board_view mt40">
		<table summary="나의 문의내역">
			<caption class="blind"></caption>
			<colgroup>
				<col width="200px">
				<col width="285px">
				<col width="200px">
				<col>
			</colgroup>
			<h3>Q&amp;A 상세보기</h3>
			<tbody>
				<tr>
					<th scope="row" id="th_questionDetail_title">번호</th>
					<td headers="th_questionDetail_title" colspan="3"><strong
						class="c_purple">${qnaModel.qna_no}</strong></td>
				</tr>
				<tr>
					<th scope="row">성명</th>
					<td>${qnaModel.qna_name }</td>
				</tr>
				<tr>
					<th scope="row">아이디</th>
					<td>${qnaModel.qna_id }</td>
				</tr>
				<tr>
					<th scope="row">연락처</th>
					<td>${qnaModel.qna_phone }</td>
				</tr>
				<tr>
					<th scope="row">이메일</th>
					<td>${qnaModel.qna_email }</td>
				</tr>
				<tr>
					<th scope="row">문의 종류</th>
					<td>${qnaModel.qna_question_kinds }</td>
				</tr>
				<tr>
					<th scope="row">문의 분류</th>
					<td>${qnaModel.qna_category }</td>
				</tr>
				<tr>
					<th scope="row">해당 지역</th>
					<td>${qnaModel.qna_area }</td>
				</tr>
				<tr>
					<th scope="row">제목</th>
					<td>${qnaModel.qna_subject }</td>
				</tr>
				<tr>
					<th scope="row">내용</th>
					<td>
						<p>${qnaModel.qna_content}</p>
					</td>
			
				</tr>
				<tr>
					<th scope="row">첨부파일</th>
					<td>
					<c:if test="${qnaModel.qna_orgfile ne null }">
						<img border="0" hspace="0" alt="${qnaModel.qna_content}" src="<%= cp %>/resources/uploads/qna/${qnaModel.qna_orgfile}">
					</c:if>
					</td>
			
				</tr>
				
				<tr>
					<th scope="row">등록일</th>
					<td><fmt:formatDate value="${qnaModel.qna_date}"
							pattern="yyyy.MM.dd" /></td>
				</tr>

			</tbody>

		</table>
	</div>


	<c:forEach var="qna_comment" items="${QnaCommentList}">

		<div class="reply_cts">
			<p>${qna_comment.qna_comment_content}</p>
		</div>

	</c:forEach>

	<div>
		<a href="<%= cp %>/qna/qnaList.see?curPage=${curPage}" class="img_btn mypage board_list pull-left" onclick="btnList();">목록</a>
	</div>

</body>
</html>
