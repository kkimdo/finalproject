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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>QNA</title>
<script type="text/javascript">
	//** 목록 버튼 클릭 이벤트 : 버튼 클릭시 상세보기화면에 있던 페이지, 검색옵션, 키워드 값을 가지로 목록으로 이동
	function btnList(){
    	location.href="<%=cp%>/admin/qnaList.see";
    	}  
  <%--   
	// 삭제 버튼 클릭 
	function btnDelete() {
		// 댓글이 존재하는 게시물의 삭제처리 방지
		var countReply = "${countReply}";
		// 댓글의 수가 0보다 크면 팝업, 함수 종료
		if(countReply > 0) {
		alert("댓글이 있는 게시물은 삭제할 수 없습니다.")
		return;
			    }
			
	    // 댓글의 수가 0이면 삭제처리
		if (confirm("정말 삭제하시겠습니까?") == true) { //확인
			location.href ="<%=cp%>/admin/qnaDelete.see?qna_no=${qnaModel.qna_no}";
		} else { 
			return;
		}
	} --%>

	
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
	<div class="admin_grp">
		<div class="admin_list">
			<ul>
				<li><a href="<%=cp%>/admin/movieList.see">상영작</a></li>
				<li><a href="<%=cp%>/admin/timeTableList.see">시간표관리</a></li>
				<li><a href="<%=cp%>/admin/bannerList.see">배너관리</a></li>
				<li><a href="<%=cp%>/admin/giftShopList.see">기프트샵</a></li>
				<li><a href="<%=cp%>/admin/eventListMain.see">이벤트</a></li>
				<li><a href="<%=cp%>/admin/noticeList.see">공지사항</a></li>
				<li><a href="<%=cp%>/admin/faqList.see">FAQ</a></li>
				<li class="on"><a href="<%=cp%>/admin/qnaList.see">Q&amp;A</a></li>
				<li><a href="<%=cp%>/admin/memberList.see">회원정보</a></li>
			</ul>
		</div>
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
							<th scope="row"><label for="name"> 작성자 </label></th>
							<td id="name">${qnaModel.qna_name}</td>
						</tr>
						<tr>
							<th scope="row"><label for="id"> 아이디 </label></th>
							<td id="id">${qnaModel.qna_id}</td>
						</tr>
						<tr>
							<th scope="row"><label for="phone"> 연락처 </label></th>
							<td id="phone">${qnaModel.qna_phone}</td>
						</tr>
						<tr>
							<th scope="row"><label for="email"> 이메일 </label></th>
							<td id="email">${qnaModel.qna_email}</td>
						</tr>
						<tr>
							<th scope="row"><label for="date"> 등록일 </label></th>
							<td id="date"><fmt:formatDate value="${qnaModel.qna_date}"
									pattern="yyyy.MM.dd" /></td>
						</tr>
						<tr>
							<th scope="row"><label for="area"> 지역 </label></th>
							<td id="area">${qnaModel.qna_area}</td>
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
							<th class="do" scope="row"><label for="uploadfile"> 파일이름</label></th>
							<td class="do" id="uploadfile">
								<a href="<%=cp%>/admin/fileDownload.see?qna_orgfile=${qnaModel.qna_orgfile}">${qnaModel.qna_orgfile}
								</a>
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
		<form action="qnaCommentWrite.see" method="post" name="cfrms" onsubmit="return validation();">
			<div class="reply_form">
				<input type="hidden" name="qna_no" value="${qnaModel.qna_no}" /> <input
					type="hidden" name="qna_comment_no" value="${qna_comment_no}" />

				<table class="tbl_style01">
					<colgroup>
						<col style="width: 13%">
						<col style="width: *">
					</colgroup>
					<tbody>
						<tr>
							<th class="co3">답변작성</th>
							<td class="co2" id="qna_comment_content"><textarea name="qna_comment_content"></textarea></td>
							<td class="co4"> 
								<input class="dodos" type="submit" value="답변입력" />
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</form>
		<c:forEach var="qna_comment" items="${QnaCommentList}">
			<table class="tbl_style01">
					<colgroup>
						<col style="width: 13%">
						<col style="width: *">
					</colgroup>
					<tbody>
						<tr>
							<th class="coco">답변내용</th>
							<td class="co5" id="qna_comment_content">${qna_comment.qna_comment_content}</td>
							<td class="co6">
							<input class="dodo" type="button" onclick="qnaCommentDelete('<%=cp%>/admin/qnaCommentDelete.see?qna_comment_no=${qna_comment.qna_comment_no}&qna_no=${qnaModel.qna_no}')" value="댓글삭제" />
							</td>
						</tr>
					</tbody>
			</table>
		</c:forEach>
		
		<div class="btn_type_035">
					<span class="momo"> 
						<input class="mo" type="button" onclick="btnList();" value="목록" />
					</span>
				
		</div>
	</div>
</body>
</html>
