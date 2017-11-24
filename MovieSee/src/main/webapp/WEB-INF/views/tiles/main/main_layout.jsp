<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
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