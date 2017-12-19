<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String cp = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 확인</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/resources/mscs/freeboard.css" />

<script type="text/javascript">
	function updateCheck(){
		var check = document.getElementById("freeBoardUpdate");
		check.method = "post";
		check.action = "<%=cp %>/free/freeBoardUpdate.see";
		check.submit();
	}
</script>

</head>
<body id="KOR">
	<div id="mast-body">
		<form id="freeBoardUpdate">
			<input type="hidden" name="freeboard_no" value="${freeboard_no}"/>
			<div class="container">
				<div class="section __half">
					<h3 class="subject __underline">
						<em></em>
					</h3>
					<div class="row">
						<div class="col-md">
							<label for="freeboard-passwd"> 비밀번호 확인 </label>
						</div>
						<div class="col-md">
							<div class="form-wrap __normal __x1">
								<div class="ui-input">
									<input type="password" id="freeboard-passwd" name="freeboard_passwd" title="비밀번호를 입력해주세요.">
										<label for="freeboard-passwd">비밀번호를 입력해주세요.</label>
								</div>
								<input type="button" onclick="updateCheck()" class="ui-button __square-small __black" value="확인">
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>

	</div>







</body>
</html>