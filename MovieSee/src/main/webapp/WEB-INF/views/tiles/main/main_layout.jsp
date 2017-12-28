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
<link rel="stylesheet" type="text/css" href="<%= cp%>/resources/mscs/common.css?ver=20171221" />
<link rel="stylesheet" type="text/css" href="<%= cp%>/resources/mscs/reset.css?ver=20171221" />
<link rel="stylesheet" type="text/css" href="<%= cp%>/resources/mscs/event.css?ver=20171227" />
<link rel="stylesheet" type="text/css" href="<%= cp%>/resources/mscs/event2.css?ver=20171225" />
<link rel="stylesheet" type="text/css" href="<%= cp%>/resources/mscs/faq.css?ver=20171221" />
<link rel="stylesheet" type="text/css" href="<%= cp%>/resources/mscs/notice.css?ver=20171221" />
<link rel="stylesheet" type="text/css" href="<%= cp %>/resources/css/movie.css?ver=20171221" />
<link rel="stylesheet" type="text/css" href="<%= cp %>/resources/css/movie2.css?ver=20171221" />
<link rel="stylesheet" type="text/css" href="<%= cp %>/resources/css/movie3.css?ver=20171221" />
<link rel="stylesheet" type="text/css" href="<%= cp %>/resources/css/swiper.min.css?ver=20171221" />
<link rel="stylesheet" type="text/css" href="<%= cp %>/resources/css/banner.css?ver=20171221" />

<!-- <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"> -->

<script src="<%= cp %>/resources/js/swiper.min.js?ver=20171221"></script>
<script src="http://code.jquery.com/jquery-1.7.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

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
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
	<script src="<%= cp %>/resources/js/jquery-ui.min.js"></script>
	<script src="<%= cp %>/resources/js/json2.js"></script>
	<script src="<%= cp %>/resources/js/Index.js?ver=20171221"></script>
	<script src="<%= cp %>/resources/js/Movie-Detail-View.js?ver=20171221"></script>
	<script src="<%= cp %>/resources/js/swiper1.js?ver=20171221"></script>
	<script src="<%= cp %>/resources/js/ticketReservationData.js?ver=20171221"></script>
	<script src="<%= cp %>/resources/js/design-1.0.min.js?ver=20171221"></script>
	<script src="<%= cp %>/resources/js/banner.js?ver=20171221"></script>
	<%-- <script src="<%= cp %>/resources/js/ticketReservationData.js?ver=20171221"></script> --%>
	<script src="<%= cp %>/resources/js/buy.js?ver=20171221"></script>


</body>
</html>