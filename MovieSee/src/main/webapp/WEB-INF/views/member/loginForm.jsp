<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

    
	
    <title>로그인 | 회원 | 무비씨</title>

<link rel="stylesheet" type="text/css" href="./lott Login_files/reset.css"><link rel="stylesheet" type="text/css" href="./lott Login_files/common.css">

    <link rel="stylesheet" type="text/css" href="./lott Login_files/banner.css"><link rel="stylesheet" type="text/css" href="./lott Login_files/swiper.min.css">

   
<body>
<form action="<%=cp %>/member/login.see" method="post" name="loginform">


    <div id="container">
        <!-- content -->
        <div id="content">
            <!-- login_wrap -->
            <div class="login_wrap">
                <div class="login_inner">
                    <h2 class="login_tit">로그인</h2>
                    <div class="login_top">
                        <!--section 내용 새로 추가 -->
                        
                         <!-- 웹접근성 테스트 20170420 sunho 추가 로그인 방법 변경-->
                        <section>
                            <dl class="tabdl_login" id="jq-tabdl_login">
                                <!-- 회원 -->
                                <dt class="tab_login active">
                                    <a href="/movie/member/login.see" title="회원">회원</a>
                                </dt>
                                <dd class="tab_login_con active">
                                    <div class="clear_fix">
                                        <div class="login_left">
                                            <!-- 0304 문구수정 -->
                                            <ul class="etc_list">
                                                <li>회원을 위한 다양한 맞춤 서비스를 이용해보세요.</li>
                                            </ul>
                                            <!-- //0304 문구수정 -->
                                            <div class="login_box">
                                                <span>
                                                    <label for="userId">아이디</label><input type="text" class="txt" id="member_id" name="member_id" placeholder="아이디를 입력해주세요." /></span>
                                                <span>  
                                                    <label for="userPassword">비밀번호</label><input type="password" class="txt" id="member_password1" name="member_password1" placeholder="비밀번호를 입력해주세요.";/></span>
                                             <input type="submit"  class="btn_login" value="로그인" id="btnMember" style="cursor: pointer; vertical-align: middle !important; padding-top: 15px; height:60px;" title="로그인" >
                                            </div>
                                            <!-- <div class="login_find">
                                                <span>
                                                    <input type="checkbox" id="saveId" name="saveId" value="Y" onkeydown="keyDownEnterEventNo(event);"><label for="saveId">아이디저장</label></span>
                                                <span class="no_bg"><a href="javascript:void(0);" target="_blank" title="아이디 찾기 새창 열림" id="aFindId">아이디 찾기</a></span>
                                                <span><a href="javascript:void(0);" target="_blank" title="비밀번호 찾기 새창 열림" id="aFindPassword">비밀번호 찾기</a></span>
                                            </div> -->
                                        </div>
                                        <div class="login_right">
                                            <!-- 20170112 - 신규 광고 스크립트 -->
                                            <!-- 20170726 - 광고 복원 -->
                                            <!-- 20170904 - 스테이징,운영테스트 동기화 -->
                                            <script type="text/javascript" src="https://nvapi.feeldmc.com/ad/p/in/v1_0/imp?slotid=stw_lottelotte_9"></script>
                                            <!--<script language="javascript" src="https://nvapi.feeldmc.com/ad/p/in/v1_0/imp?slotid=stw_lottelotte_9"></script>-->
                                            <!--<img src="http://www.lottecinema.co.kr/LCHS/Image/Thum/img_thum_ad.png" alt="L.POINT 외식, 문화, 쇼핑, 엔터테인먼트 등 롯데의 다양한 라이프스타일 브랜드를 L.POINT로 즐기세요." />-->
                                        </div>
                                    </div>
                                </dd>
                                <!-- //회원 -->


                                <dt class="tab_login com">
                                    <a href="/movie/member/memberFindId.see" title="아이디찾기">아이디찾기</a>
                                </dt>
                             
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
	

</form>
</body></html>