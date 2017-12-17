<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>QNA</title>
<script type="text/javascript">
	//** 목록 버튼 클릭 이벤트 : 버튼 클릭시 상세보기화면에 있던 페이지, 검색옵션, 키워드 값을 가지로 목록으로 이동
	function btnList(){
    	location.href="<%=cp%>/qna/qnaList.see?curPage=${curPage}";
    	}  
	function btnDelete() {
		if (confirm("정말 삭제하시겠습니까?") == true) { //확인
			location.href ="<%=cp%>/qna/qnaDelete.see?qna_no=${qnaModel.qna_no}";
		} else { //취소
			return;
		}
	
	}
</script>

<script type="text/javascript">

	function qnaCommentDelete(url) {
		if (confirm("정말 삭제하시겠습니까?") == true) { //확인
			location.href = url;
		} else { //취소
			return;
		}
		}  
</script>

</head>

<body>

	<table>
		<h3>Q&amp;A 상세보기</h3>
		<tbody>
			<tr>
				<th scope="row">번호</th>
				<td>${qnaModel.qna_no }</td>
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
				<th scope="row">등록일</th>
				<td><fmt:formatDate value="${qnaModel.qna_date}"
						pattern="yyyy.MM.dd" /></td>
			</tr>

		</tbody>

	</table>
	
		<form:form action="qnaCommentWrite.see" method="post" name="cfrms"
			onsubmit="return validation();">
			<div class="reply_form">
				<div class="reply_inp">
					<input type="hidden" name="qna_no" value="${qnaModel.qna_no}" />
					<input type="hidden" name="qna_comment_no" value="${qna_comment_no}" />
				</div>

				<div class="reply_write">
					<div class="textarea_grp">
						<pre>
							<textarea name="qna_comment_content"></textarea>
						<form:errors path="qna_comment_content" />
						</pre>
					</div>
				
					 <input type="submit" value="입력" />
				</div>
			</div>
		</form:form>

		<%-- <c:if test="commentlist.size() > 0"> --%>
		<%-- </c:if> --%>

		<c:forEach var="qna_comment" items="${QnaCommentList}">
		
				<div class="reply_cts">
					<p>${qna_comment.qna_comment_content}</p>
					<input type="button" onclick="qnaCommentDelete('<%=cp%>/qna/qnaCommentDelete.see?qna_comment_no=${qna_comment.qna_comment_no}&qna_no=${qnaModel.qna_no}')" value="댓글삭제" />
					<input type="button" onclick="location.href='qnaCommentUpdate.see?qna_comment_no=${qna_comment.qna_comment_no}'"value="수정" />
				</div>
			
		</c:forEach>

	<div>
		<a href="<%= cp %>/qna/qnaList.see?curPage=${curPage}" class="btnc_check">목록</a> 
		<a href="#none" class="btnc_check" onclick="btnDelete();">삭제</a>

	</div>

</body>
</html>
