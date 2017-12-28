<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<% String cp = request.getContextPath(); %>
<!DOCTYPE html>
<!-- saved from url=(0061)https://www.lottecinema.co.kr/LCHS/Contents/Member/Login.aspx -->
<html lang="ko"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- 20170927추가 -->
<!-- Google Tag Manager -->
<script id="facebook-jssdk" src="./lott Login_files/sdk.js.다운로드"></script><script async="" src="https://connect.facebook.net/en_US/fbevents.js"></script><script async="" src="https://www.googletagmanager.com/gtm.js?id=GTM-M7STSDZ"></script><script>(function (w, d, s, l, i) {
    w[l] = w[l] || []; w[l].push({
        'gtm.start':
        new Date().getTime(), event: 'gtm.js'
    }); var f = d.getElementsByTagName(s)[0],
    j = d.createElement(s), dl = l != 'dataLayer' ? '&l=' + l : ''; j.async = true; j.src =
    'https://www.googletagmanager.com/gtm.js?id=' + i + dl; f.parentNode.insertBefore(j, f);
})(window, document, 'script', 'dataLayer', 'GTM-M7STSDZ');</script>
<!-- End Google Tag Manager -->
<script src="http://code.jquery.com/jquery-1.7.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

    
	
    <title>로그인 | 회원 | 롯데시네마</title>

<link rel="stylesheet" type="text/css" href="./lott Login_files/reset.css"><link rel="stylesheet" type="text/css" href="./lott Login_files/common.css">

    <link rel="stylesheet" type="text/css" href="./lott Login_files/banner.css"><link rel="stylesheet" type="text/css" href="./lott Login_files/swiper.min.css">

   
<body>
    <div id="container">
        <!-- content -->
        <div id="content">
            <!-- login_wrap -->
            <div class="login_wrap">
                <div class="login_inner">
                    <h2 class="login_tit">아이디찾기</h2>
                    <div class="login_top">
                        <!--section 내용 새로 추가 -->
                        
                         <!-- 웹접근성 테스트 20170420 sunho 추가 로그인 방법 변경-->
                        <section>
                            <dl class="tabdl_login" id="jq-tabdl_login">
                                <!-- 회원 -->
                                <dt class="tab_login">
                                     <a href="/movie/member/login.see" title="회원">회원</a>
                                </dt>
                              

                                <dt class="tab_login active">
                                    <a href="/movie/member/memberFindId.see" title="아이디찾기">아이디찾기</a>
                                </dt>  <dd class="tab_login_con active">
                                    <div class="clear_fix">
                                        <div class="login_left">
                                            <!-- 0304 문구수정 -->
                                            <ul class="etc_list">
                                                 <li></li>
                                            </ul>
                                            <!-- //0304 문구수정 -->
                                            <div class="login_box">
                                              <dd class="tab_login_con active">
                                    <div class="clear_fix">
                                        <div class="login_left">
                                            <!-- 0304 문구수정 -->
                                            <ul class="etc_list">
                                                <li></li>
                                            </ul>
                                            <!-- //0304 문구수정 -->
                                            <div class="login_box">
                                            <form:form commandName="member" action="/movie/member/memberFindId.see" method="POST" name="joinform">
                                                 <div style="margin-top: 10px">
                                                    <label>이름</label>
                                                    <form:input type="text" class="txt" path="member_name" placeholder="가입하신 이름을 입력하세요." />
                                                    <form:errors path="member_password1" />
                                                    </div>
                                                  <div style="margin-top: 10px">
                                                	<label>이메일</label>
                                                   <form:input type="text" class="text" path="member_email" placeholder="가입하신 이메일을 입력하세요." />
                                                       <form:errors path="member_password1" />
                                                    </div>
                                                    
                                                     <div style="margin-top: 20px">  
                                                 	<label>찾으신 ID</label>
                                                    <form:input type="text" class="txt" path="member_id" placeholder="찾으신 ID" readonly="readonly" value="${member.member_id }"/>
                                                      <form:errors path="member_password1" />
                                                   </div>
                                               
                                               
                                                 <input type="submit"  class="btn_login" value="확인" id="btnMember" style="cursor: pointer; vertical-align: middle !important; padding-top: 15px; height:60px;" title="확인" >
                                            
                                            </form:form>
                                            </div>
                                       
                                        </div>
                                        
                                    </div>
                                </dd>
                                                              <dt class="tab_login">
                                    <a href="/movie/member/memberFindPw.see" title="비밀번호찾기">비밀번호찾기</a>
                                </dt>

                            </dl> 
                        </section>


             

                    </div>

                    <div class="login_bottom">
                        <!-- 0304 문구수정 -->
                        <p class="login_etxt">L.POINT 아이디 하나면, 모든 L.POINT 제휴사의 온라인/모바일을 편리하게 이용할 수 있습니다.</p>
                        <!-- //0304 문구수정 -->
                        <a href="/movie/member/member.see" class="btn_join" title="회원가입 새창 열림" id="aMemberJoin">회원가입</a>
                        <!-- <a href="/movie/member/member.see" class="btn_join" target="_blank" title="회원가입 새창 열림" id="aMemberJoin">회원가입</a> -->
                    </div>
                </div>
            </div>
            <!--// login_wrap -->
        </div>
        <!-- //content -->
</div>

            <!-- Content -->
	
</body></html>