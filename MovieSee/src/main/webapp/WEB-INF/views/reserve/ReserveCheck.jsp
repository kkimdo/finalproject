<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp = request.getContextPath();
%>
<script type="text/javascript">
   alert("표가 없습니다. 남은 좌석을 확인 후 예매해주세요.");
   location.href = "<%=cp%>/reserve/movieTicketing1.see?timetable_no=${reserveTimeTableModel.timetable_no}&timetable_movie_no=${reserveTimeTableModel.timetable_movie_no}";
</script>