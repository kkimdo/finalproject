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
				<li><a href="<%=cp%>/admin/eventListMain.see">이벤트</a></li>
				<li class="on"><a href="<%=cp%>/admin/noticeList.see">공지사항</a></li>
				<li><a href="<%=cp%>/admin/faqList.see">FAQ</a></li>
				<li><a href="<%=cp%>/admin/qnaList.see">Q&amp;A</a></li>
				<li><a href="<%=cp%>/admin/memberList.see">회원정보</a></li>
			</ul>
		</div>
		<div class="admin_ct">
			<form:form commandName="noticeModel" name="formWrite"
				action="noticeWrite.see" method="post" enctype="multipart/form-data">
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
										<td><form:input name="notice_subject" type="text"
												maxlength="40" id="subject" class="ipt_txt03"
												path="notice_subject" /> <font color="red"><form:errors
													path="notice_subject" /></font></td>
									</tr>
									<tr>
										<th scope="row"><label for="content">내용 <span
												class="point_red" title="필수 입력">*</span>
										</label></th>
										<td><form:textarea name="notice_content" rows="10"
												cols="30" id="content" class="textarea01"
												path="notice_content"></form:textarea> <font color="red">
												<form:errors path="notice_content" />
										</font>
											<div class="txt_wrap">
												<strong><span class="byte_txt" id="counter"></span></strong>
											</div></td>
									</tr>

									<tr>
										<!-- 1023 영화관 선택 구조 변경 -->
										<th scope="row">영화관 <span class="point_red" title="필수 입력">*</span></th>
										<!-- 1026 label 삭제 -->
										<td><form:input name="notice_area" type="text"
												maxlength="40" id="notice_area" class="ipt_txt"
												path="notice_area" /> <span class="area"
											id="spanCinemaName"> </span> <a href="javascript:selected();"
											title="레이어 열림" class="btnv_pick">영화관선택</a> <font color="red"><form:errors
													path="notice_area" /></font></td>
									</tr>

									<tr>
										<th scope="row"><label for="fileUpload1">내용 이미지</label></th>
										<td>
											<div>
												<input type="file" name="content_file" id="fileUpload1" />
											</div> <span class="txt_left"> </span>
										</td>
									</tr>
								</tbody>
							</table>
						</fieldset>
						<div class="btn_type_03">
							<a href="javascript:history.back()"
								class="btn btnC_03 btnP_04 mr10"> <span>취소</span>
							</a> <span class="btn btnC_04 btnP_04"> <input type="submit"
								value="등록" />
							</span>
						</div>
					</div>
				</div>
			</form:form>
		</div>
	</div>
</body>
</html>