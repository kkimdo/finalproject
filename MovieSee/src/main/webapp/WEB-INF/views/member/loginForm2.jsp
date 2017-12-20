<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String cp = request.getContextPath(); %>

<div style="width:400px;margin:auto;">
	<form action="<%=cp %>/member/login.see" method="post" name="loginform">
		<fieldset>
			<legend>로그인</legend>
			<div class="login_box">
				<div class="inner">
					<div class="input_box">
						<label for="id" class="lbl_txt">ID</label>
						<input type="text" class="txt" id="member_id" name="member_id" placeholder="ID" />
					</div>
					<div class="input_box">
						<label for="pw" class="lbl_txt">PW</label>
						<input type="password" class="txt" id="member_password1" name="member_password1" placeholder="PW" />
					</div>
					<input type="submit" value="로그인" class="btn_login" />
				</div>
			</div>
			<div class="login_btm">
				<ul>
					<li class="m1"><a href="<%=cp %>/member/member.see">회원가입</a></li>
					<li class="m2">
						<a href="<%=cp %>/member/memberIdFind.see">아이디 &#47; 비밀번호 찾기</a>
					</li>
				</ul>
			</div>
		</fieldset>
	</form>
</div>