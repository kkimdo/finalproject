<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지 사항</title>
</head>
<body>

	<table>
		<tr>
			<td>
				${noticeModel.notice_subject}
			</td>
		</tr>
		<tr>
			<td>
				영화관 : ${noticeModel.notice_area}
			</td>
			<td>
				등록일 : <fmt:formatDate value="${noticeModel.notice_date}" pattern="yyyy-MM-dd" />
			</td>
			<td>
				조회수 : ${noticeModel.notice_hit}
			</td>
		</tr>
		<tr>
			<td>
				${noticeModel.notice_content}
			</td>
		</tr>
			
	
	</table>


</body>
</html>