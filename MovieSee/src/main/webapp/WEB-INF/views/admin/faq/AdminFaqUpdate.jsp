<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<div class="admin_grp">
	<div class="admin_list">
		<ul>
			<li><a href="<%=cp%>/admin/movieList.see">상영작</a></li>
			<li><a href="<%=cp%>/admin/timeTableList.see">시간표관리</a></li>
			<li><a href="<%=cp%>/admin/bannerList.see">베너관리</a></li>
			<li><a href="<%=cp%>/admin/giftShopList.see">기프트샵</a></li>
			<li><a href="<%=cp%>/admin/eventListMain.see">이벤트</a></li>
			<li><a href="<%=cp%>/admin/noticeList.see">공지사항</a></li>
			<li class="on"><a href="<%=cp%>/admin/faqList.see">FAQ</a></li>
			<li><a href="<%=cp%>/admin/qnaList.see">Q&amp;A</a></li>
			<li><a href="<%=cp%>/admin/memberList.see">회원정보</a></li>
		</ul>
	</div>
	<div class="admin_ct">
		<h3 class="sub_tit">FAQ 수정</h3>
		<form action="faqUpdate.see" method="post">
			<input type="hidden" name="faq_no" value="${faqModel.faq_no}" /> <input
				type="hidden" name="currentPage" value="${currentPage}" />
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
							<td><input class="txt w200" name="faq_subject"
								value="${faqModel.faq_subject}" /> <font color="red"><form:errors
										path="faq_subject" /></font></td>
						</tr>
						<tr>
							<th scope="row">글내용</th>
							<td>
								<div class="textarea_grp">
									<textarea name="faq_content">${faqModel.faq_content}</textarea>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="btn_type_03">
				<span class="btn btnC_03 btnP_04 mr10" onclick="history.go(-1);">
					<input type="button" value="취소" />
				</span> <span class="btn btnC_04 btnP_04"> <input type="submit"
					value="수정완료" />
				</span>
			</div>
		</form>
	</div>
</div>