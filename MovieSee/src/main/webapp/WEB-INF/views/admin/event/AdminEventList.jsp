<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이벤트</title>
</head>
<body>

	<div id="container" class="sub">
        <!-- content -->
        <div id="content">
        	<div class="event_Hwrap allevPg">
        		<ul class="btnc_right">
                    <li><a href="#none">지난 이벤트</a></li>
                    <li></li>
                </ul>
                <div id="clear_fix_20" class="clear_fix" style="">
                    <h2 class="sub_stit">영화<span class="event_etc">신작 영화 이벤트에 지금 참여하세요.</span></h2>
                    <!---20160307 sunho 영화&amp;예매 에서 영화-->
                    <a href="javascript:void(0);" onclick="javascript:goToEventList('20'); return false;" class="btn_more" title="영화 더보기">MORE</a>
                </div>
                	<!-- emovie_list -->
                <ul class="emovie_list">
                	<c:forEach var="eventList" items="${map.eventList}">
                		<li>
                			<a href="#none" onclick="">
                				<%-- <img src ="/movie/resources/uploads/event/#{eventList.event_stored_file_name}" alt="${eventList.event_subject}" /> --%>
                			</a>
                			<dl class="imgsub">
                				<dt class="event">
                					<a href="#none" onclick="javascript:goEventDtailsMove(&quot;201010016917193&quot;, &quot;101&quot;, &quot;0&quot;, &quot;1&quot;); return false;">
                						${eventList.event_subject}
                					</a>
                				</dt>
                				<dd class="eventdate">
                					기간
                				 	<span>
                						${eventList.event_start_date} ~ ${eventList.event_end_date}
                					</span>
                				</dd>
                			</dl>
                		</li>
                	 </c:forEach>
                </ul>
			</div>
		</div>	
	</div>


</body>
</html>