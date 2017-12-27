<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>

<script type="text/javascript">
	$(function() {
		$("#start_date").datepicker({
			dateFormat : "yy.mm.dd",
			showButtonPanel : true,
			onClose : function(selectedDate) {
				// 시작일(fromDate) datepicker가 닫힐때
				// 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
				$("#end_date").datepicker("option", "minDate", selectedDate);
			}
		});

		$("#end_date").datepicker({
			dateFormat : "yy.mm.dd",
			showButtonPanel : true,
			onClose : function(selectedDate) {
				// 종료일(end_date) datepicker가 닫힐때
				// 시작일(start_date)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
				$("#start_date").datepicker("option", "maxDate", selectedDate);
			}
		});

	});

	$(function() {
		$('#content').keyup(function(e) {
			var content = $(this).val();
			$(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
			$('#counter').html(content.length + '/ 한글 2,000자');
		});
		$('#content').keyup();
	});
</script>

</head>
<body>
	<div class="admin_grp">
		<div class="admin_list">
			<ul>
				<li><a href="<%=cp%>/admin/movieList.see">상영작</a></li>
				<li><a href="<%=cp%>/admin/timeTableList.see">시간표관리</a></li>
				<li><a href="<%=cp%>/admin/bannerList.see">배너관리</a></li>
				<li><a href="<%=cp%>/admin/giftShopList.see">기프트샵</a></li>
				<li class="on"><a href="<%=cp%>/admin/eventListMain.see">이벤트</a></li>
				<li><a href="<%=cp%>/admin/noticeList.see">공지사항</a></li>
				<li><a href="<%=cp%>/admin/faqList.see">FAQ</a></li>
				<li><a href="<%=cp%>/admin/qnaList.see">Q&amp;A</a></li>
				<li><a href="<%=cp%>/admin/memberList.see">회원정보</a></li>
			</ul>
		</div>
		<form:form commandName="eventModel" action="eventWrite.see"
			method="post" enctype="multipart/form-data">
			<div class="tabCont">
				<div>
					<fieldset>
						<legend>이벤트내용입력</legend>
						<div class="titYtxt mt50">
							<h3 class="mem_tit">이벤트</h3>
							<span><strong title="필수항목">*</strong> 표시 항목은 필수 입력 항목입니다.</span>
						</div>

						<table class="tbl_style01">

							<caption>이벤트 작성란</caption>
							<colgroup>
								<col style="width: 13%">
								<col style="width: *">
							</colgroup>

							<tbody>
								<tr>
									<th scope="row">카테고리 <span class="point_red" title="필수 입력">*</span>
									</th>
									<td><span class="ipt_radio mr40"> <input
											type="radio" id="event_category1" name="event_category"
											value="1" checked="checked"> <label
											for="event_category1">영화</label>
									</span> <span class="ipt_radio mr40"> <input type="radio"
											id="event_category2" name="event_category" value="2">
											<label for="event_category2">시사회/무대인사</label>
									</span> <span class="ipt_radio mr40"> <input type="radio"
											id="event_category3" name="event_category" value="3">
											<label for="event_category3">롯시NOW</label>
									</span> <span class="ipt_radio mr40"> <input type="radio"
											id="event_category4" name="event_category" value="4">
											<label for="event_category4">제휴할인</label>
									</span></td>
								</tr>
								<tr>
									<th scope="row"><label for="subject"> 제목 <span
											class="point_red" title="필수 입력">*</span>
									</label></th>
									<td><form:input name="event_subject" type="text"
											maxlength="40" id="subject" class="ipt_txt03"
											path="event_subject" /> <font color="red"> <form:errors
												path="event_subject" />
									</font></td>
								</tr>
								<tr>
									<th scope="row"><label for="content">내용 <span
											class="point_red" title="필수 입력">*</span>
									</label></th>
									<td><form:textarea name="event_content" rows="10"
											cols="30" id="content" class="textarea01"
											path="event_content"></form:textarea> <font color="red">
											<form:errors path="event_content" />
									</font>
										<div class="txt_wrap">
											<strong><span class="byte_txt" id="counter"></span></strong>
										</div></td>
								</tr>
								<tr>
									<th scope="row"><label for="fileUpload1">메인 이미지</label></th>
									<td>
										<div>
											<input type="file" name="poster_file" id="fileUpload1" />
										</div> <span class="txt_left"> </span>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="fileUpload2">내용 이미지</label></th>
									<td>
										<div>
											<input type="file" name="content_file" id="fileUpload2" />
										</div> <span class="txt_left"> </span>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="start_date"> 이벤트 시작 일
											<span class="point_red" title="필수 입력">*</span>
									</label></th>
									<td><form:input name="event_start_date" type="text"
											maxlength="40" id="start_date" class="ipt_txt03"
											path="event_start_date" /> <font color="red"> <form:errors
												path="event_start_date" />
									</font></td>
								</tr>
								<tr>
									<th scope="row"><label for="end_date"> 이벤트 종료 일 <span
											class="point_red" title="필수 입력">*</span>
									</label></th>
									<td><form:input name="event_end_date" type="text"
											maxlength="40" id="end_date" class="ipt_txt03"
											path="event_end_date" /> <font color="red"> <form:errors
												path="event_end_date" />
									</font></td>
								</tr>

							</tbody>
						</table>
					</fieldset>

					<div class="btn_type_03">
							<a href="javascript:history.back()"
								class="btn btnC_03 btnP_04 mr10">
								<span>취소</span>
							</a> 
							<span class="btn btnC_04 btnP_04">
							 <input type="submit" value="등록" />
							</span>
						</div>
				</div>
			</div>
		</form:form>
	</div>
</body>
</html>