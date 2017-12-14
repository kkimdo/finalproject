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

<script type="text/javascript">

	

</script>
</head>
<body>
	<div id="container" class="sub" style="">
		<!-- content -->
		<div id="content">
			<!-- eventWrap -->
			<div class="eventWrap">

				<!-- event_sinner -->
				<div class="event_sinner">
					<h2 class="sub_tit02">${eventModel.event_subject}</h2>
					<div id="img">
						<p class="img">
							<img
								src="<%= cp %>/resources/uploads/event/${eventModel.event_stored_file_name1}"
								alt="롯데시네마와 함께하는" />
						</p>
					</div>

					<div id="event_movie"></div>
					<div id="event_img"></div>
				</div>
				<!--//  event_sinner -->

				<!-- view_add -->
				<div class="view_add">
					<strong>유의사항</strong>
					<p>
						<strong> 내용
						</strong>
					</p>
				</div>
				<!--// view_add -->

				<ul class="view_list">
				</ul>
				
				<div id="btn_list" class="btn_box btn_cbox">
					<a href="/admin/eventListMain.see" class="btnc_list">목록</a>
				</div>

			</div>
			<!--// eventWrap -->
		</div>
		<!-- //content -->
	</div>

</body>
</html>