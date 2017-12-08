<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div id="container" class="sub">
        <!-- content -->
        <div id="content">
            <!-- event_cwrap -->
            <div class="event_cwrap">
                <div class="clear_fix">
                    <h2 class="sub_stit">영화<span class="event_etc">신작 영화 이벤트에 지금 참여하세요.</span></h2><!--20170308 sunho 예매 삭제 -->

                    <div class="category">
                        <fieldset>
                            <legend>분야별 선택 검색</legend>
                            <input type="text" class="ipt_txt" title="검색어 입력" onkeydown="keyDownEventLists(event);">
                            <a href="javascript:void(0);" class="btn_search">검색</a>
                        </fieldset>
                    </div>
                </div>
                
                	<!-- emovie_list -->
                	<ul class="emovie_list">
                		<li>
                			<a href="#none" onclick="">
                				<img src ="/movie/resources/uploads/event/eventImage_91.jpg" alt="메리와 마녀의 꽃 선착순 현장 이벤트" />
                			</a>
                			<dl class="imgsub">
                				<dt class="event">
                					<a href="#none" onclick="javascript:goEventDtailsMove(&quot;201010016917193&quot;, &quot;101&quot;, &quot;0&quot;, &quot;1&quot;); return false;">
                						&lt;메리와 마녀의 꽃&gt; 현장경품 이벤트
                					</a>
                				</dt>
                				<dd class="eventdate">
                					기간
                				 	<span>
                						${eventModel.event_start_date} ~ ${eventModel.event_end_date}
                					</span>
                				</dd>
                			</dl>
                		</li>
                	</ul>
                </div>
			</div>
		</div>


</body>
</html>