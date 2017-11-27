<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FAQ</title>

</head>

<body>
	
	<table>
	
		<tr>
			<td>
				등록일 : <fmt:formatDate value="${faqModel.faq_date}" pattern="yyyy-MM-dd" />
			</td>
			<td>
				조회수 : ${faqModel.faq_hit}
			</td>
		</tr>
		<tr>
			<td>
				${faqModel.faq_subject}
			</td>
		</tr>
		<tr>
			<td>
				${faqModel.faq_content}
			</td>
		</tr>
	</table>




</body>
</html>