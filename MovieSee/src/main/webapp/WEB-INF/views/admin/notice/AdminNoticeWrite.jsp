<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%
	String cp = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지 사항</title>

<script type="text/javascript">
	function selected() {
		window.open("/movie/admin/noticeSelected.see", "selected",
				"width=500, height=500");
	}
</script>


</head>
<body>
	<div class="cs_center">
		<h2 class="csTit">고객센터</h2>
		<ul class="tab_st03">
			<li><a href="<%=cp%>/faq/faqList.see">FAQ</a></li>
			<li class="active"><a href="<%=cp%>/admin/noticeList.see">공지사항</a></li>
			<!-- goCustomerCenterMenu-->
			<li><a href="javascript:customerCenterMenu(2);">1:1문의</a></li>
			<li><a href="javascript:customerCenterMenu(3);">단체관람/대관문의</a></li>
			<li><a href="javascript:customerCenterMenu(4);">분실물안내</a></li>
		</ul>
		<form name="formWrite" action="noticeWrite.see" method="post">
			<div class="tabCont">
				<div>
					<fieldset>
						<legend>공지사항내용입력</legend>
						<div class="titYtxt mt50">
							<h3 class="mem_tit">공지사항</h3>
							<span><strong title="필수항목">*</strong> 표시 항목은 필수 입력 항목입니다.</span>
						</div>

						<table class="tbl_style01">

							<caption>공지사항 작성란</caption>
							<colgroup>
								<col style="width: 13%">
								<col style="width: *">
							</colgroup>

							<tbody>

								<tr>
									<th scope="row"><label for="subject"> 제목 <span
											class="point_red" title="필수 입력">*</span>
									</label></th>
									<td><input name="notice_subject" type="text"
										maxlength="40" id="subject" class="ipt_txt03" /> <font
										color="red"><form:errors path="notice_subject" /></font></td>
								</tr>
								<tr>
									<th scope="row"><label for="content">내용 <span
											class="point_red" title="필수 입력">*</span>
									</label></th>
									<td><textarea name="notice_content" rows="10" cols="30"
											id="content" class="textarea01"></textarea> <font color="red"><form:errors
												path="notice_content" /></font>
										<div class="txt_wrap">
											<span class="byte_txt"><strong>0</strong> / 한글 2,000자</span>
										</div></td>
								</tr>

								<tr>
									<!-- 1023 영화관 선택 구조 변경 -->
									<th scope="row">영화관 <span class="point_red" title="필수 입력">*</span></th>
									<!-- 1026 label 삭제 -->
									<td><input name="notice_area" type="text" maxlength="40"
										id="notice_area" class="ipt_txt"> <span class="area"
										id="spanCinemaName"> </span> <a href="javascript:selected();"
										title="레이어 열림" class="btnv_pick">영화관선택</a> <font color="red"><form:errors
												path="notice_area" /></font></td>
								</tr>
								
								<tr>
								<th scope="row">
									<label for="fileUpload1">내용 이미지</label></th>
								<td>
									<div>
										<input type="file" name="content_file" id="fileUpload1" />
									</div> 
									<span class="txt_left">
									</span>
								</td>
							</tr>
							</tbody>
						</table>
					</fieldset>
					<div class="btn_box btn_cbox">
						<span> <input type="submit" value="확인">
						</span> <span onclick="history.go(-1);"> <input type="button"
							value="취소" />
						</span>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>