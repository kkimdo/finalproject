<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String cp = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>

제목 : ${eventModel.event_subject} <br/>
내용 : ${eventModel.event_content} <br/>
이벤트 카테고리 : ${eventModel.event_category} <br/>
이벤트 시작 일 : ${eventModel.event_start_date} <br/>
이벤트 종료 일 : ${eventModel.event_end_date} <br/>
파일 이름 : ${eventModel.event_original_file_name} <br/>
파일 저장 이름 : ${eventModel.event_stored_file_name} <br/>
이미지 : <img src ="/movie/resources/uploads/event/test.jpg" /> <br/>
<img src ="<%= cp %>/resources/uploads/event/${eventModel.event_stored_file_name}" alt="${eventModel.event_subject}">
</body>
</html>