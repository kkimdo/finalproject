<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp = request.getContextPath();
%>
<script type="text/javascript">
   alert("최소 1장 이상의 표를 선택해 주세요.");
   location.href = "<%=cp%>/reserve/movieTicketing1.see?timetable_no=${reserveTimeTableModel.timetable_no}&timetable_movie_no=${reserveTimeTableModel.timetable_movie_no}";
</script>