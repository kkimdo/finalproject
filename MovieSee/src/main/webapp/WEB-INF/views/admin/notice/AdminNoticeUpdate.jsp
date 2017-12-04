<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지 사항</title>
<script src="http://code.jquery.com/jquery-1.7.min.js" ></script>
<script>
	$(document).ready(function() {
		$("#btnUpdate").click(function() {

			//var notice_subject = document.formView.notice_subject.value; ==> name속성으로 처리할 경우
			var notice_subject = $("#notice_subject").val();
            var notice_content = $("#notice_content").val();
            var notice_area = $("#notice_area").val();
          
            if(notice_subject == ""){
                alert("제목을 입력하세요");
                document.formUpdate.notice_subject.focus();
                return false;
            }
            if(notice_content == ""){
                alert("내용을 입력하세요");
                document.formUpdate.notice_content.focus();
                return false;
            }
            if(notice_area == ""){
                alert("영화관을 입력하세요");
                document.formUpdate.notice_area.focus();
                return false;
            }
            // 폼에 입력한 데이터를 서버로 전송
            document.formUpdate.submit();
            return true;
        });
    });
</script>
</head>
<body>

	<h3>공지 사항</h3>
		<form name="formUpdate" action="noticeUpdate.see" method="post">
			<input type="hidden" name="notice_no" value="${noticeModel.notice_no}" />
			<div>
			제목 <input name="notice_subject" id="notice_subject" value="${noticeModel.notice_subject}" size="80" placeholder="제목을 입력해주세요" />
			</div>
			<div>
			내용<textarea name="notice_content" id="notice_content" rows="4" cols="80" placeholder="내용을 입력해주세요">${noticeModel.notice_content}</textarea>
			</div>
			<div>
			영화관 <input name="notice_area" id="notice_area" value="${noticeModel.notice_area}" placeholder="영화관을 입력해주세요"/>
			</div>
			<div style="width: 650px; text-align: center;">
				<input type="submit" value="작성" id="btnUpdate"/>
			</div>  
		</form>
</body>
</html>