<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String cp = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>MovieSee</title>
<link rel="stylesheet" type="text/css" href="<%= cp%>/resources/mscs/common.css" />
<link rel="stylesheet" type="text/css" href="<%= cp%>/resources/mscs/reset.css" />
<link rel="stylesheet" type="text/css" href="<%= cp%>/resources/mscs/event.css" />
<link rel="stylesheet" type="text/css" href="<%= cp%>/resources/mscs/faq.css?v=201712050000" />
<link rel="stylesheet" type="text/css" href="<%= cp%>/resources/mscs/notice.css?v=201712050000" />

</head>
<body>

<div>

	<!-- header -->
	<div>
		<tiles:insertAttribute name="main_header" />
	</div>
	
	<!-- body -->
	<div>
		<tiles:insertAttribute name="main_body" />
	</div>

	<!-- footer -->
	<div>
		<tiles:insertAttribute name="main_footer" />
	</div>
	
	
</div>


</body>
</html>