<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QNA</title>

<script type="text/javascript">
	function btnWrite() {
		var frm = document.formWrite;

		if (frm.qna_name.value == "") {
			alert("성명을 입력해주세요.");
			frm.qna_name.focus();
			return false;
		} else if (frm.qna_phone.value == "") {
			alert("연락처를 입력해주세요.");
			frm.qna_phone.focus();
			return false;
		} else {
			alert("작성완료 되었습니다.");
			f.submit();
		}
		return true;
	}
</script>
</head>
<body>

	<form name="formWrite" action="qnaWrite.see" method="post" enctype="multipart/form-data" onsubmit="return btnWrite();">
		<div class="titYtxt">
			<h3 class="mem_tit">회원정보</h3>
			<span><strong title="필수항목">*</strong> 표시 항목은 필수 입력 항목입니다.</span>
		</div>
		<table>
			<tbody>
				<tr>
					<td>성명</td>
					<td><input type="text" class="btnWrite" name="qna_name" />
				</tr>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="qna_id" />
				</tr>
				<tr>
					<td>연락처</td>
					<td><input type="text" name="qna_phone" maxlength="11" /> <span>
							"-" 없이 입력하세요.</span>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" name="qna_email" />
				</tr>
	
				<h3>문의내용</h3>
				<tr>
					<td>문의 종류</td>
					<td><input type="radio" name="qna_question_kinds" value="문의"
						checked="checked"><label>문의</label> <input type="radio"
						name="qna_question_kinds" value="칭찬" checked="checked"><label>칭찬</label>
						<input type="radio" name="qna_question_kinds" value="불만"
						checked="checked"><label>불만</label> <input type="radio"
						name="qna_question_kinds" value="건의" checked="checked"><label>건의</label>
					</td>
				</tr>
				<tr>
					<td>문의분류</td>
					<td><select name="qna_category" size="1">
							<option value="영화관 문의" selected>영화관 문의</option>
							<option value="영화 문의">영화 문의</option>
							<option value="회원 및 포인트 문의">회원 및 포인트 문의</option>
							<option value="결제 및 관람권 문의">결제 및 관람권 문의</option>
							<option value="이벤트/시사회/무대인사 문의">이벤트/시사회/무대인사 문의</option>
							<option value="홈페이지/모바일 이용관련 문의">홈페이지/모바일 이용관련 문의</option>
					</select></td>
				</tr>
				<tr>
					<td>지역선택</td>
					<td><select name="qna_area" size="1">
							<option value="서울" selected>서울</option>
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
					<td>제목</td>
					<td><input type="text" name="qna_subject" />
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea name="qna_content"></textarea></td>
				</tr>
	
				<tr>
					<th scope="row"><label for="fileUpload1">첨부파일</label></th>
					<td>
						<div>
							<input type="file" name="qna_orgfile" id="fileUpload1" />
						</div> <span class="txt_left"> </span>
					</td>
				</tr>
			</tbody>
		   </table>
		       <input name="submit" type="submit" value="확인" />
	</form>
</body>
</html>