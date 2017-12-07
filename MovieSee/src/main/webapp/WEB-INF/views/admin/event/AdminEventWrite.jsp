<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>

	<form action="eventWrite.see" method="post" enctype="multipart/form-data">
		<%-- <div class="tabCont">
			<div
				id="MasterContentPlaceHolder_PageMasterContentPlaceHolder_pnlMain">
				<fieldset>
					<legend>문의내용입력</legend>
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
								<th scope="row"><label
									for="MasterContentPlaceHolder_PageMasterContentPlaceHolder_title">제목
										<span class="point_red" title="필수 입력">*</span>
								</label></th>
								<td><input name="${eventModel.event_subject}" type="text"
									maxlength="40"
									id="MasterContentPlaceHolder_PageMasterContentPlaceHolder_title"
									class="ipt_txt03"></td>
							</tr>
							<tr>
								<th scope="row"><label
									for="MasterContentPlaceHolder_PageMasterContentPlaceHolder_contents">내용
										<span class="point_red" title="필수 입력">*</span>
								</label></th>
								<td><textarea name="${eventModel.event_content}" rows="10"
										cols="30"
										id="MasterContentPlaceHolder_PageMasterContentPlaceHolder_contents"
										class="textarea01"></textarea> <!--
										<textarea id="cont" cols="30" rows="10" class="textarea01">내용을 입력하세요</textarea>
										-->
									<div class="txt_wrap">
										<!--
												<span class="byte_txt"><strong id="strongContentsCount">0</strong> / 4,000 (한글 2,000자/영문 4,000자)</span>
												-->
										<span class="byte_txt"><strong id="strongContentsCount">0</strong>
											/ 한글 2,000자</span>
									</div></td>
							</tr>
							<tr>
								<th scope="row" rowspan="2"><label
									for="MasterContentPlaceHolder_PageMasterContentPlaceHolder_fileUpload1">첨부파일</label></th>
								<td>
									<div class="btn_fileBx">
										<input type="file" name="imageFile"
											id="MasterContentPlaceHolder_PageMasterContentPlaceHolder_fileUpload1">

									</div> <span class="txt_left"></span>
								</td>
							</tr>

						</tbody>
					</table>
				</fieldset>

				<div class="btn_box btn_cbox">
					<a href="javascript:void(0);" class="btnc_cancel" id="aCancel">취소</a>
					<a onclick="return checkRegistration();" id="MasterContentPlaceHolder_PageMasterContentPlaceHolder_btnSubmit"
						class="btnc_check"
						href="javascript:__doPostBack('ctl00$ctl00$MasterContentPlaceHolder$PageMasterContentPlaceHolder$btnSubmit','')">확인</a>
					<input type="submit" value="확인" />
				</div>
			</div>
		</div> --%>
		<input type="file" name="imageFile" />
		<input type="submit" value="확인" />
	</form>
</body>
</html>