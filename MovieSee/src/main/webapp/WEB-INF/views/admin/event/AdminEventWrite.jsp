<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>

<script type="text/javascript">

	$(function() {
		$("#start_date").datepicker({
			dateFormat : "yy.mm.dd",
			showButtonPanel: true
		});
		
		$("#end_date").datepicker({
			dateFormat : "yy.mm.dd",
			showButtonPanel: true
		});
		
	});
	
</script>

</head>
<body>

	<form action="eventWrite.see" method="post" enctype="multipart/form-data">
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
                                	<td>
                                        <span class="ipt_radio mr40">
                                        	<input type="radio" id="event_category1" name="event_category" value="1" checked="checked">
                                        		<label for="event_category1">영화</label>
                                        </span>
                                        <span class="ipt_radio mr40">
                                        	<input type="radio" id="event_category2" name="event_category" value="2">
                                        		<label for="event_category2">시사회/무대인사</label>
                                        </span>
                                        <span class="ipt_radio mr40">
                                       		<input type="radio" id="event_category3" name="event_category" value="3">
                                       			<label for="event_category3">롯시NOW</label>
                                       	</span>
                                       	<span class="ipt_radio mr40">
                                       		<input type="radio" id="event_category4" name="event_category" value="4">
                                       			<label for="event_category4">제휴할인</label>
                                       	</span>
                                       	<span class="ipt_radio mr40">
                                       		<input type="radio" id="event_category5" name="event_category" value="5">
                                       			<label for="event_category5">우리동네영화관</label>
                                       	</span>
                                    </td>
                            </tr>
							<tr>
								<th scope="row">
									<label for="subject">
										제목
										<span class="point_red" title="필수 입력">*</span>
									</label>
								</th>
									<td>
										<input name="event_subject" type="text" maxlength="40" id="subject" class="ipt_txt03" >
									</td>
							</tr>
							<tr>
								<th scope="row">
									<label for="content">내용
										<span class="point_red" title="필수 입력">*</span>
									</label>
								</th>
								<td>
									<textarea name="event_content" rows="10" cols="30" id="content" class="textarea01"></textarea> 
									<div class="txt_wrap">
										<span class="byte_txt"><strong>0</strong>
											/ 한글 2,000자</span>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">
									<label for="fileUpload">첨부파일</label></th>
								<td>
									<div>
										<input type="file" name="imageFile" id="fileUpload" />
									</div> 
									<span class="txt_left">
									</span>
								</td>
							</tr>
							<tr>
								<th scope="row">
									<label for="start_date">
										이벤트 시작 일
										<span class="point_red" title="필수 입력">*</span>
									</label>
								</th>
									<td>
										<input name="event_start_date" type="text" maxlength="40" id="start_date" class="ipt_txt03">
									</td>
							</tr>
							<tr>
								<th scope="row">
									<label for="end_date">
										이벤트 종료 일
										<span class="point_red" title="필수 입력">*</span>
									</label>
								</th>
									<td>
										<input name="event_end_date" type="text" maxlength="40" id="end_date" class="ipt_txt03">
									</td>
							</tr>

						</tbody>
					</table>
				</fieldset>

				<div class="btn_box btn_cbox">
					<!-- <a href="javascript:void(0);" class="btnc_cancel" id="aCancel">취소</a>
					<a onclick="return checkRegistration();" id="MasterContentPlaceHolder_PageMasterContentPlaceHolder_btnSubmit"
						class="btnc_check"
						href="javascript:__doPostBack('ctl00$ctl00$MasterContentPlaceHolder$PageMasterContentPlaceHolder$btnSubmit','')">확인</a> -->
					<input type="submit" value="확인" />
				</div>
			</div>
		</div>
	</form>
</body>
</html>