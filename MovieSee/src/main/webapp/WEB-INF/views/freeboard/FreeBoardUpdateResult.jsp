<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String cp = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript">

	window.onload = function(){
		var chk = ${updateCheck}
		
		if(chk == 1){
			alert('글이 수정되었습니다.');
			document.form1.submit();
		}
		if(chk == -1){
			alert('비밀번호가 틀렸습니다');
			history.back();
		}
	}
</script>

</head>
<body>
	<form action="<%=cp%>/free/freeBoardUpdate.see" method="post" name="form1">
		<input type="hidden" name="freeboard_no" value="${freeBoardModel.freeboard_no}">
		<input type="hidden" name="freeboard_name" value="${freeBoardModel.freeboard_name}" />
		<input type="hidden" name="freeboard_subject" value="${freeBoardModel.freeboard_subject}"/>
		<input type="hidden" name="freeboard_content" value="${freeBoardModel.freeboard_content}">
	</form>
</body>
</html>