<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%
	String cp = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자유게시판</title>

<script type="text/javascript">
	$(function() {
		$('#content').keyup(function(e) {
			var content = $(this).val();
			$(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
			$('#counter').html(content.length + '/ 한글 2,000자');
		});
		$('#content').keyup();
	});
</script>

<script type="text/javascript">

	function btnUpdate() {
		var frm = document.freeBoardUpdate;

		if (frm.freeboard_name.value == "") {
			alert("작성자를 입력해 주세요.");
			frm.freeboard_name.focus();
			return false;
		} else if (frm.freeboard_passwd.value == "") {
			alert("비밀번호를 입력해 주세요.");
			frm.freeboard_passwd.focus();
			return false;
		} else if (frm.freeboard_subject.value == "") {
			alert("제목을 입력해 주세요.");
			frm.freeboard_subject.focus();
			return false;
		} else if (frm.freeboard_content.value == "") {
			alert("내용을 입력해 주세요.");
			frm.freeboard_content.focus();
			return false;
		}
		return true;
	}
</script>

</head>
<body>
	<div class="cs_center">
		<h2 class="csTit">고객센터</h2>
		<ul class="tab_st03">
			<li><a href="<%=cp%>/faq/faqList.see">FAQ</a></li>
			<li><a href="<%=cp%>/notice/noticeList.see">공지사항</a></li>
			<li><a href="javascript:customerCenterMenu(2);">1:1문의</a></li>
			<li class="active"><a href="<%=cp%>/free/freeBoardList.see">자유게시판</a></li>
			<li><a href="<%=cp%>/common/privacy.see">개인정보처리방침</a></li>
		</ul>
		<form name="freeBoardUpdate" action="freeBoardUpdateCheck.see" method="post" onsubmit="return btnUpdate();">
			<input type="hidden" name="freeboard_no"
				value="${freeBoardModel.freeboard_no}" />
			<div class="tabCont">
				<div>
					<fieldset>
						<legend>자유게시판내용입력</legend>
						<div class="titYtxt mt50">
							<h3 class="mem_tit">자유게시판</h3>
							<span><strong title="필수항목">*</strong> 표시 항목은 필수 입력 항목입니다.</span>
						</div>

						<table class="tbl_style01">

							<caption>자유게시판 작성란</caption>
							<colgroup>
								<col style="width: 13%">
								<col style="width: *">
							</colgroup>

							<tbody>
								<tr>
									<th scope="row"><label for="name"> 작성자 <span
											class="point_red" title="필수 입력">*</span>
									</label></th>
									<td>
										${freeBoardModel.freeboard_name}
										<input name="freeboard_name" type="hidden" value="${freeBoardModel.freeboard_name}" id="name" class="input_txt" />
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="passwd"> 비밀 번호 <span
											class="point_red" title="필수 입력">*</span>
									</label></th>
									<td><input name="freeboard_passwd" type="password"
										maxlength="20" id="passwd" class="input_txt" /></td>
								</tr>
								<tr>
									<th scope="row"><label for="subject"> 제목 <span
											class="point_red" title="필수 입력">*</span>
									</label></th>
									<td><input name="freeboard_subject" type="text"
										value="${freeBoardModel.freeboard_subject}" maxlength="40"
										id="subject" class="ipt_txt03" /></td>
								</tr>
								<tr>
									<th scope="row"><label for="content"> 내용 <span
											class="point_red" title="필수 입력">*</span>
									</label></th>
									<td><textarea name="freeboard_content" rows="10" cols="30"
											id="content" class="textarea01">${freeBoardModel.freeboard_content}</textarea>
										<div class="txt_wrap">
											<strong><span class="byte_txt" id="counter"></span></strong>
										</div></td>
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