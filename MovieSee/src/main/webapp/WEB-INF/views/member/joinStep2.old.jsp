<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<% String cp = request.getContextPath(); %>

<!-- 다음주소API -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample4_roadAddress').value = fullRoadAddr;
                document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
</script>

<div>
	<form:form commandName="member" action="memberEnd.see" method="post" name="joinform">
		<div class="sign_box">
			<div class="step_02">
				<div class="tbl_type_01">
					<table>
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