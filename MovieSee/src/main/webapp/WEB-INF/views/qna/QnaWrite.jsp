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
<link rel="stylesheet" type="text/css"
	href="<%=cp%>/resources/mscs/qna.css?ver=201712060002" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>1:1문의</title>

<script type="text/javascript">
	function btnWrite() {
		var frm = document.formWrite;
		var checked_radio = $('input:radio[name=U_checkAgreement1]:checked')
				.val();

		if (checked_radio == 'N') {
			alert("동의 해주세요.");
			return false;
		} else if (frm.qna_name.value == "") {
			alert("성명을 입력해주세요.");
			frm.qna_name.focus();
			return false;
		} else if (frm.qna_id.value == "") {
			alert("아이디를 입력해주세요.");
			frm.qna_id.focus();
			return false;
		} else if (frm.qna_phone.value == "") {
			alert("연락처를 입력해주세요.");
			frm.qna_phone.focus();
			return false;
		} else if (frm.qna_email.value == "") {
			alert("이메일을 입력해주세요.");
			frm.qna_name.focus();
			return false;
		} else if (frm.qna_subject.value == "") {
			alert("제목을 입력해주세요.");
			frm.qna_subject.focus();
			return false;
		} else if (frm.qna_content.value == "") {
			alert("내용을 입력해주세요.");
			frm.qna_content.focus();
			return false;
		} else if ($("#fileUpload1").val() != "") {

			var ext = $('#fileUpload1').val().split('.').pop().toLowerCase();

			if ($.inArray(ext, ['jpeg', 'gif', 'png', 'jpeg','bmp','pdf','jpg' ]) == -1) {
				alert("jpeg,gif,png,jpeg,bmp,pdf,jpg 파일만 업로드 할수 있습니다.");

				return false;

			}
		} else {
			alert("작성완료 되었습니다.");
			frm.submit();
		}
		return true;
	}
</script>

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

</head>
<body>
	<div id="wrap">
		<div id="container" class="subGnbNo">
			<div class="cs_center">
				<h2 class="csTit">고객센터</h2>
				<ul class="tab_st03">
					<li><a href="<%=cp%>/faq/faqList.see">FAQ</a></li>
					<li><a href="<%=cp%>/notice/noticeList.see">공지사항</a></li>
					<li class="active"><a href="<%=cp%>/qna/qnaWrite.see">1:1문의</a></li>
					<li><a href="<%=cp%>/free/freeBoardList.see">자유게시판</a></li>
					<li><a href="<%=cp%>/common/privacy.see">개인정보처리방침</a></li>
				</ul>

				<div class="tabCont">
					<p class="info_etxt">
						<strong>문의사항이나 불편사항은 이 곳에 남겨주세요. 최대한 빠른 시간 안에 답변 드리겠습니다.</strong>금요일
						오후 6시 이후 접수된 문의는 그 다음주에 처리될 수 있습니다. FAQ를 이용하시면 궁금증을 더 빠르게 해결하실 수
						있습니다.
					</p>
					<div
						id="MasterContentPlaceHolder_PageMasterContentPlaceHolder_pnlMain"
						onkeypress="javascript:return WebForm_FireDefaultButton(event, 'MasterContentPlaceHolder_PageMasterContentPlaceHolder_btnSubmit')">

						<fieldset>
							<legend>개인정보수집동의 선택</legend>
							<div class="titYtxt">
								<h3 class="mem_tit">개인정보수집동의</h3>
								<span>문의를 통해 아래의 개인정보를 수집합니다. 수집된 개인정보는 문의 처리 외 목적으로 사용하지
									않습니다.</span>
							</div>

							<div class="agree_box" tabindex="0">
								<strong>개인정보의 수집목적 및 항목</strong>
								<ul>
									<li>① 수집 목적 : 원활한 고객 상담, 불편사항 및 문의사항 관련 의사소통 경로 확보</li>
									<li>② 수집 항목 <strong>*필수입력사항</strong>
										<ul>
											<li>- 이용자 식별을 위한 항목 : 성명, 연락처, 이메일, 아이디(로그인 시 수집)</li>
										</ul>

									</li>
								</ul>

								<strong>개인정보의 보유 및 이용기간</strong>
								<p>

									입력하신 개인정보는 문의 접수 후 처리 완료 시점으로 부터 3개월 간 보유 합니다.<br> 다만,
									소비자보호에 관한 법률 등 관계 법률에 의해 보유할 필요가 있는 경우에는 다음과 같이 보유합니다.
								</p>
								<p>보유기간 : 소비자의 불만 또는 분쟁처리에 관한 기록 3년</p>

								<p class="pt20">※ 1:1문의 서비스 제공을 위한 최소한의 개인정보이며 거부할 수 있습니다.
									다만, 수집에 동의하지 않을 경우 서비스 이용이 제한됩니다.</p>
							</div>
						</fieldset>
					</div>
				</div>

				<form name="formWrite" action="qnaWrite.see" method="post"
					enctype="multipart/form-data" onsubmit="return btnWrite();">
					<fieldset>
						<ul class="radck">
							<li><input id="U_checkAgreement1" type="radio"
								name="U_checkAgreement1"> <label for="U_checkAgreement1">
									동의</label></li>

							<li><input id="U_checkAgreement2" type="radio"
								name="U_checkAgreement1" checked="checked" value="N"> <label
								for="U_checkAgreement2"> 동의하지 않음</label></li>
						</ul>

						<legend>회원정보입력</legend>
						<div class="titYtxt">
							<h3 class="mem_tit">회원정보</h3>
							<span><strong title="필수항목">*</strong> 표시 항목은 필수 입력 항목입니다.</span>
						</div>
						<table class="tbl_style01">
							<caption>회원정보 작성란</caption>
							<colgroup>
								<col style="width: 13%">
								<col style="width: *">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><label for="name"> 성명 </label></th>
									<td>${session_member_name}<input type="hidden"
										name="qna_name" value="${session_member_name}" />
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="id"> 아이디 </label></th>
									<td>${session_member_id}<input type="hidden" name="qna_id"
										value="${session_member_id}" />
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="phone"> 연락처 </label></th>
									<td>${session_member_phone}<input type="text"
										name="qna_phone" value="${session_member_phone}" />
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="email"> 이메일 </label></th>
									<td>
										<div class="ipt_left_txt">
											${session_member_email} <input type="text" name="qna_email"
												value="${session_member_email}" />
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</fieldset>
					<fieldset>
						<legend>문의내용입력</legend>
						<div class="titYtxt mt50">
							<h3 class="mem_tit">문의내용</h3>
							<span><strong title="필수항목">*</strong> 표시 항목은 필수 입력 항목입니다.</span>
						</div>
						<table class="tbl_style01">
							<caption>일대일 문의내용 작성란</caption>
							<colgroup>
								<col style="width: 13%">
								<col style="width: *">
							</colgroup>
							<tbody>
								<!-- 0118 추가 -->
								<tr>
									<th scope="row">문의종류 <span class="point_red" title="필수 입력">*</span></th>
									<td id="kindHtml"><span class="ipt_radio mr40"> <input
											type="radio" id="kind3" name="qna_question_kinds" value="문의"
											checked="checked"> <label for="kind3">문의</label></span><span
										class="ipt_radio mr40"> <input type="radio" id="kind1"
											name="qna_question_kinds" value="칭찬"> <label
											for="kind1">칭찬</label></span><span class="ipt_radio mr40"> <input
											type="radio" id="kind2" name="qna_question_kinds" value="불만">
											<label for="kind2">불만</label></span><span class="ipt_radio mr40">
											<input type="radio" id="kind4" name="qna_question_kinds"
											value="건의"> <label for="kind4">건의</label>
									</span></td>
								</tr>

								<tr>
									<th scope="row"><label for="category">분류 <span
											class="point_red" title="필수 입력">*</span>
									</label></th>
									<td><select name="qna_category" id="category"
										class="select_box select02" onchange="changDivisionCode();">

											<option selected="selected" value="영화관 문의">영화관 문의</option>
											<option value="영화문의">영화문의</option>
											<option value="회원 및 포인트 문의">회원 및 포인트 문의</option>
											<option value="결제 및 관람권 문의">결제 및 관람권 문의</option>
											<option value="이벤트/시사회/무대인사 문의">이벤트/시사회/무대인사 문의</option>
											<option value="홈페이지/모바일 이용관련 문의">홈페이지/모바일 이용관련 문의</option>
									</select> <select name="qna_category"
										id="MasterContentPlaceHolder_PageMasterContentPlaceHolder_selectCode"
										class="select_box select03" title="이벤트 선택"
										style="display: none">
									</select>
								</tr>


								<tr>
									<th scope="row"><label for="area">지역 선택 <span
											class="point_red" title="필수 입력">*</span>
									</label></th>
									<td><select name="qna_area" id="area"
										class="select_box select02" onchange="changDivisionCode();">

											<option selected="selected" value="서울">서울</option>
											<option value="경기">경기</option>
											<option value="인천">인천</option>
											<option value="강원">강원</option>
											<option value="부산">부산</option>
											<option value="대구">대구</option>
											<option value="경북">경북</option>
											<option value="경남">경남</option>
											<option value="대전">대전</option>
											<option value="전북">전북</option>
											<option value="전남">전남</option>
											<option value="광주">광주</option>
											<option value="울산">울산</option>
											<option value="충북">충북</option>
											<option value="충남">충남</option>
											<option value="강원">강원</option>
											<option value="제주">제주</option>
									</select>
									<td>
								</tr>
								<tr>
									<th scope="row"><label for="subject">제목 <span
											class="point_red" title="필수 입력">*</span>
									</label></th>
									<td><input name="qna_subject" type="text" maxlength="40"
										id="subject" class="ipt_txt03"></td>
								</tr>
								<tr>
									<th scope="row"><label for="content">내용 <span
											class="point_red" title="필수 입력">*</span>
									</label></th>
									<td><textarea name="qna_content" rows="10" cols="30"
											id="content" class="textarea01"></textarea>
										<div class="txt_wrap">
											<span class="byte_txt"><strong id="counter"></strong></span>
										</div></td>

								</tr>

								<tr>
									<th scope="row" rowspan="2"><label for="fileUpload1">첨부파일</label></th>
									<td class="kj">
										<div>
											<input type="file" name="qna_orgfile" id="fileUpload1" />
											jpeg, gif, png, jpeg, bmp, pdf, jpg 이 파일만 가능합니다.

										</div>

									</td>
								</tr>
							</tbody>
						</table>
					</fieldset>
					<div class="btn_box btn_cbox">
						<input class="btnc_check" name="submit" type="submit" value="확인" />
					</div>
				</form>
			</div>
		</div>
		<div class="quick_ver2" id="quick" style="top: 186.25px;">
			<!-- [D] 접근성 관련 : 스크립트로 탭키이동시 foucs in, focus out  제어 필요 -->
			<ul>
				<li><a
					href="<%=cp%>/reserve/movieTicketing.see"
					title="빠른예매"><span><img
							src="http://caching.lottecinema.co.kr//Media/WebAdmin/a021109040b34b989bf01bacf6263973.jpg"
							alt="빠른예매"></span></a></li>
				<li><a
					href="<%=cp%>/mypage/reserveList.see"
					title="예매내역"><span><img
							src="http://caching.lottecinema.co.kr//Media/WebAdmin/1ec48d357ba44dbeaa0ef261d93e4003.jpg"
							alt="예매내역"></span></a></li>
				<li><a
					href="<%=cp%>/faq/faqList.see"
					title="고객센터"><span><img
							src="http://caching.lottecinema.co.kr//Media/WebAdmin/47141787f65643938247e12b5f5c9d75.jpg"
							alt="고객센터"></span></a></li>
				<li><a
					href="<%=cp%>/movie/aMovieTheater.see"
					title="스페셜관"><span><img
							src="http://caching.lottecinema.co.kr//Media/WebAdmin/1066bda3e3c1448f81cdbb07aeea257b.jpg"
							alt="스페셜관"></span></a></li>
			</ul>
		</div>
	</div>
</body>
</html>