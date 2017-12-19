<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<% String cp = request.getContextPath(); %>

<div class="sign_grp">
	<div class="step">
		<ul>
			<li>1. 약관동의</li>
			<li class="on">2. 회원정보입력</li>
			<li>3. 가입완료</li>
		</ul>
	</div>
	<form:form commandName="member" action="memberEnd.see" method="post" name="joinform">
		<div class="sign_box">
			<p class="tit"><span><img src="<%=cp %>/images/icon/sign_02.png" alt="회원정보입력" /></span>회원정보입력</p>
			<div class="step_02">
				<div class="tbl_type_01">
					<table>
						<caption>아이디,비밀번호,비밀번호확인,이름,주민등록번호,주소,전화번호,이메일,수신확인 작성하는 표</caption>
						<colgroup>
							<col style="width:120px" />
							<col />
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">아이디</th>
								<td>
									<form:input type="text" class="txt w200" path="member_id" required="true" />
									<strong class="pt_red ibk"><form:errors path="member_id" /></strong>
									<strong class="pt_red ibk"><form:errors element="member_id" /></strong>
								</td>
							</tr>
							<tr>
								<th scope="row">비밀번호</th>
								<td>
									<form:input type="password" class="txt w200" path="member_password1" />
									<strong class="pt_red ibk"><form:errors path="member_password1" /></strong>
								</td>
							</tr>
							<tr>
								<th scope="row">비밀번호 확인</th>
								<td>
									<form:input type="password" class="txt w200" path="member_password2"  />
									<strong class="pt_red ibk"><form:errors path="member_password2" /></strong>
								</td>
							</tr>
							<tr>
								<th scope="row">이름</th>
								<td>
									<form:input type="text" class="txt w200" path="member_name" />
									<strong class="pt_red ibk"><form:errors path="member_name" /></strong>
								</td>
							</tr>
						
							<tr>
								<th scope="row">주소</th>
								<td>
									<%-- <form:input type="text" class="txt w80" path="zipcode" value="${resultMap.zipcode}" readonly="readonly" />
									<span class="ibk btn btnC_03 btnP_03">
										<input type="button" value="우편번호 검색" onclick="openZipcode(this.form)" />
									</span> --%>
									<span class="bk">상세 주소를 추가 기입해 주세요.</span>
									<span class="bk"><form:input type="text" class="txt" path="member_addr" value="${resultMap.member_addr}" /></span>
								</td>
							</tr>
							<tr>
								<th scope="row">휴대폰</th>
								<td>
									<form:input type="text" class="txt w200" path="member_phone" maxlength="11"  />
									<span class="ibk">" - " 없이 입력하세요.</span>
								</td>
							</tr>
							<tr>
								<th scope="row">이메일</th>
								<td>
									<form:input type="text" class="txt w200" path="member_email" />
									<strong class="pt_red ibk"><form:errors path="member_email" /></strong>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>

		<div class="btn_type_04">
			<a href="member.see" class="btn btnC_03 btnF_02 mr10">
				<span>취소</span>
			</a>
			<span class="btn btnC_04 btnF_02">
				<input type="submit" value="가입" />
			</span>
		</div>
	</form:form>
</div>