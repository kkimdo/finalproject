<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% String cp = request.getContextPath(); %>

	<div class="terms_ct">
		<h3 class="sub_tit">faq</h3>
		<div class="tbl_type_02">
			<table>
				<caption>번호,제목,글쓴이,날짜,조회를 나타내는 공지사항 표</caption>
				<colgroup>
					<col style="width: 7%;" />
					<col style="width: 25%;" />
					<col style="width: 8%;" />
					<col style="width: 8%;" />
					<col style="width: 7%;" />
				</colgroup>
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">제목</th>
						<th scope="col">날짜</th>
						<th scope="col">조회</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="list" items="${faqList}" varStatus="stat">
						<c:url var="viewURL" value="noticeView.mt">
							<c:param name="no" value="${list.no}" />
							<c:param name="currentPage" value="${currentPage }" />
						</c:url>

						<tr>
							<td>${list.no}</td>
							<td class="subject"><a href="${viewURL}">${list.subject}</a></td>
							<td>${list.name}</td>
							<td><fmt:formatDate value="${list.regdate}" pattern="yyyy.MM.dd" /></td>
							<td>${list.readhit}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		
		
		
		<div class="paging">${pagingHtml}</div>
	</div>
</div>