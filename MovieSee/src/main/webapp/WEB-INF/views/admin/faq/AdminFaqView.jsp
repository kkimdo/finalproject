<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<%-- 
<script type="text/javascript">
	function faqDelete() {
		if (confirm("정말 삭제하시겠습니까??") == true) { //확인
			location.href ="<%=cp%>/admin/faqDelete.see?faq_no=${fqa_no}";
		} else { //취소
			return;
		}
	}
</script> --%>


<div class="admin_grp">
	<div class="admin_list">
		<ul>
			<li><a href="<%=cp%>/admin/movieList.see">상영작</a></li>
			<li><a href="<%=cp%>/admin/timeTableList.see">시간표관리</a></li>
			<li><a href="<%=cp%>/admin/bannerList.see">배너관리</a></li>
			<li><a href="<%=cp%>/admin/giftShopList.see">기프트샵</a></li>
			<li><a href="<%=cp%>/admin/eventListMain.see">이벤트</a></li>
			<li><a href="<%=cp%>/admin/noticeList.see">공지사항</a></li>
			<li class="on"><a href="<%=cp%>/admin/faqList.see">FAQ</a></li>
			<li><a href="<%=cp%>/admin/qnaList.see">Q&amp;A</a></li>
			<li><a href="<%=cp%>/admin/memberList.see">회원정보</a></li>
		</ul>
	</div>
	<div class="admin_ct">
		<div class="movie_list">
			<h3 class="sub_tit">FAQ 상세보기</h3>
			<div class="tbl_type_01">
				<table>
					<caption>번호,제목,날짜,조회를 나타내는 FAQ 표</caption>
					<colgroup>
						<col style="width: 120px;" />
						<col />
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">글제목</th>
							<td>${faqModel.faq_subject}</td>
						</tr>
						<tr>
							<th scope="row">작성일</th>
							<td><fmt:formatDate value="${faqModel.faq_date}"
									pattern="yyyy.MM.dd" /></td>

						</tr>
						<tr>
							<th scope="row">글내용</th>
							<td><pre>${faqModel.faq_content}</pre></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="btn_type_03">
			<a href="#none" class="btn btnC_03 btnP_04 mr10"
				onclick="location.href='faqList.see'">
				<span>목록</span>
			</a> <span class="btn btnC_04 btnP_04"> <input type="button"
				onclick="location.href='faqUpdate.see?faq_no=${faqModel.faq_no}'"
				value="수정" />
			</span> <span class="btn btnC_04 btnP_04" style="padding-left: 10px;">
				<input type="button" onclick="location.href='faqDelete.see?faq_no=${faqModel.faq_no}'" value="삭제" />
			</span>
		</div>
	</div>
</div>