<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FAQ</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
	$(function() {
	$(".faq > dd").hide();
  
  	$(".faq > dt").click(function(event) {
  	//var $dd = $(event.currentTarget).next();
  	//console.log($dd.css("display"));
    //$(".faq > dd").hide();
    
  	$(event.currentTarget).next().slideToggle(200, function() {
  		var $dd = $(this);
      	var $dl = $dd.prev();
      	console.log($dd.css("display"));
    	
    	/* if ($dd.css("display") == "none") {
      		$dl.find("span").html("▼");
      	} else {
      		$dl.find("span").html("▲");
      	} */
    });
  });
});
</script>

</head>

<body>
	<h1>FQA</h1>
		<c:forEach var="faqList" items="${faqList}" varStatus="stat">
			<dl class="faq">
  			<dt><h3><span>${faqList.faq_no}</span> ${faqList.faq_subject}</h3></dt>
  				<dd>
   					${faqList.faq_content}
  				</dd>
			</dl>
		</c:forEach>
	<table>	
		<!-- <c:forEach var="faqList" items="${faqList}" varStatus="stat">
			
			<c:url var="faqViewURL" value="faqView.see">
				<c:param name="faq_no" value="${faqList.faq_no}" />
				<c:param name="currentPage" value="${currentPage}" />
			</c:url>
			
			<tr>
				<td>번호</td>
				<td>제목</td>
				<td>등록일</td>
				<td>조회수</td>
			</tr>
		
			<tr>
				<td>${faqList.faq_no}</td>
				<td><a href="${faqViewURL}">${faqList.faq_subject}</a></td>
				<td><fmt:formatDate value="${faqList.faq_date}" pattern="yyyy-MM-dd" /></td>
				<td>${faqList.faq_hit}</td>
			</tr>
		</c:forEach> -->
	</table> 
	
	<c:if test="${fn:length(faqList) le 0}" >
		<center>등록된 게시물이 없습니다.</center>
	</c:if>
	
	${pagingHtml}

</body>
</html>