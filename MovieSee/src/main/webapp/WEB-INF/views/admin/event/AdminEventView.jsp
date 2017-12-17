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

function btnList(){
	location.href="<%= cp %>/admin/eventListMain.see?curPage=${curPage}&searchOption=${searchOption}&keyword=${keyword}";
	}
	
function btnUpdate(){
	location.href="<%= cp%>/admin/eventUpdate.see?event_no=${eventModel.event_no}";
	}
  
function btnDelete() {
	if (confirm("정말 삭제하시겠습니까?") == true) { //확인
		location.href ="<%= cp%>/admin/eventDelete.see?event_no=${eventModel.event_no}";
		} else { //취소
			return;
		}
	}
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
					 <c:if test="${eventModel.event_content_file ne null }">
						<div id="img">
							<p class="img">
								<img src="<%= cp %>/resources/uploads/event/${eventModel.event_content_file}" alt="${eventModel.event_subject}" />
							</p>
						</div>
					</c:if>
					<div id="event_movie"></div>
					<div id="event_img"></div>
				</div>
				<!--//  event_sinner -->

				<!-- view_add -->
				<div class="view_add">
					<strong>유의사항</strong>
					<p>
						<strong> ${eventModel.event_content} </strong>
					</p>
				</div>
				<!--// view_add -->

				<ul class="view_list">
				</ul>

				<div id="btn_list" class="btn_box btn_cbox">
					<a href="javascript:void(0);" class="btnc_check" onclick="btnList();">목록</a>
					<a href="javascript:void(0);" class="btnc_check" onclick="btnUpdate();">수정</a>
					<a href="javascript:void(0);" class="btnc_check" onclick="btnDelete();">삭제</a>
				</div>

			</div>
			<!--// eventWrap -->
		</div>
		<!-- //content -->
	</div>

</body>
</html>