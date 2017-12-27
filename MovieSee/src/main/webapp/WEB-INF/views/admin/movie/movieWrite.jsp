<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% String cp = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<title></title>
<head>
<script type="text/javascript">
function validateForm() {
    var x = document.forms["writeForm"]["movie_name"].value;
    var x1 = document.forms["writeForm"]["movie_company"].value;
    var x2 = document.forms["writeForm"]["movie_poster"].value;
    var x3 = document.forms["writeForm"]["movie_date"].value;
    
    if (x == null || x == "") {
        alert("영화이름을 입력해주세요");
        return false;
    }
    else if (x1 == null || x1 == ""){
       alert("제작사을 입력해주세요");
       return false;
    }
    else if (x2 == null || x2 == ""){
       alert("포스터를 선택해주세요");
       return false;
    }
    else if (x3 == null || x3 == ""){
       alert("개봉일을 입력해주세요");
       return false;
    }
}
</script>
</head>
<body>
<div class="admin_grp">
    <div class="admin_list">
			<ul>
				<li class="on"><a href="<%=cp%>/admin/movieList.see">상영작</a></li>
				<li><a href="<%=cp%>/admin/timeTableList.see">시간표관리</a></li>
				<li><a href="<%=cp%>/admin/bannerList.see">배너관리</a></li>
				<li><a href="<%=cp%>/admin/giftShopList.see">기프트샵</a></li>
				<li><a href="<%=cp%>/admin/eventListMain.see">이벤트</a></li>
				<li><a href="<%=cp%>/admin/noticeList.see">공지사항</a></li>
				<li><a href="<%=cp%>/admin/faqList.see">FAQ</a></li>
				<li><a href="<%=cp%>/admin/qnaList.see">Q&amp;A</a></li>
				<li><a href="<%=cp%>/admin/memberList.see">회원정보</a></li>
			</ul>
		</div>
   <div class="admin_ct">
      <h3 class="sub_tit">상영작 등록</h3>
      <form:form commandName="movieModel" action="movieWrite.see" method="post" enctype="multipart/form-data" name="writeForm" onsubmit="return validateForm()">
         <div class="tbl_type_01">
            <table>
               <caption>번호,제목,글쓴이,날짜,조회를 나타내는 공지사항 표</caption>
               <colgroup>
                  <col style="width: 120px;" />
                  <col />
               </colgroup>
               <tbody>
                  <tr>
                     <th scope="row">영화제목</th>
                     <td>
                        <form:input type="text" class="txt w200" path="movie_name" />
                        <font color="red"><form:errors path="movie_name"/></font>
                     </td>
                  </tr>
                  <tr>
                     <th scope="row">감독</th>
                     <td>
                        <form:input type="text" class="txt w200" path="movie_director" />
                        <font color="red"><form:errors path="movie_director"/></font>
                     </td>
                  </tr>
                  <tr>
                     <th scope="row">감독 이미지</th>
                     <td><input type="file" class="txt" name="movie_director_picture" /></td>
                  </tr>
                  <tr>
                     <th scope="row">배우</th>
                     <td>
                        <form:input type="text" class="txt w200" path="movie_actor" />
                        <font color="red"><form:errors path="movie_actor"/></font>
                     </td>
                  </tr>
                  <tr>
                     <th scope="row">배우1</th>
                     <td>
                        <form:input type="text" class="txt w200" path="movie_actor1" />
                        <font color="red"><form:errors path="movie_actor1"/></font>
                     </td>
                  </tr>
                  <tr>
                     <th scope="row">배우2</th>
                     <td>
                        <form:input type="text" class="txt w200" path="movie_actor2" />
                        <font color="red"><form:errors path="movie_actor2"/></font>
                     </td>
                  </tr>
                  <tr>
                     <th scope="row">배우 이미지</th>
                     <td><input type="file" class="txt" name="movie_actor_picture" /></td>
                  </tr>
                  <tr>
                     <th scope="row">배우 이미지1</th>
                     <td><input type="file" class="txt" name="movie_actor_picture1" /></td>
                  </tr>
                  <tr>
                     <th scope="row">배우 이미지2</th>
                     <td><input type="file" class="txt" name="movie_actor_picture2" /></td>
                  </tr>
                  <tr>
                     <th scope="row">제작사</th>
                     <td>
                        <form:input type="text" class="txt w200" path="movie_company" />
                        <font color="red"><form:errors path="movie_company"/></font>
                     </td>
                  </tr>
                  <tr>
                     <th scope="row">줄거리</th>
                     <td>
                        <div class="textarea_grp">
                           <textarea name="movie_story"></textarea>
                        </div>
                     </td>
                  </tr>
                  <tr>
                     <th scope="row">포스터</th>
                     <td>
                        <input type="file" class="txt" name="movie_poster" />
                     </td>
                  </tr>
                  <tr>
                     <th scope="row">스틸컷</th>
                     <td><input type="file" class="txt" name="movie_stillcut" /></td>
                  </tr>
                  <tr>
                     <th scope="row">스틸컷 1</th>
                     <td><input type="file" class="txt" name="movie_stillcut1" /></td>
                  </tr>
                  <tr>
                     <th scope="row">스틸컷 2</th>
                     <td><input type="file" class="txt" name="movie_stillcut2" /></td>
                  </tr>
                  <tr>
                     <th scope="row">스틸컷 3</th>
                     <td><input type="file" class="txt" name="movie_stillcut3" /></td>
                  </tr>
                  <tr>
                     <th scope="row">스틸컷 4</th>
                     <td><input type="file" class="txt" name="movie_stillcut4" /></td>
                  </tr>
                  <tr>
                     <th scope="row">개요</th>
                     <td>
                        <form:input type="text" class="txt w200" path="movie_genre" />
                        <font color="red"><form:errors path="movie_genre"/></font>
                        <span class="ibk">예)모험, 드라마 [미국] 106분</span>
                     </td>
                  </tr>
                  <tr>
                     <th scope="row">연령제한</th>
                     <td>
                       <%--  <form:input type="text" class="txt w200" path="movie_age" />
                        <font color="red"><form:errors path="movie_age"/></font> --%>
                         <select id="age_type" class="txt w200" name="movie_age">
                              <option value="12">12세</option>
                              <option value="15">15세</option>
                              <!-- <option value="19">19세</option> -->
                              <option value="0">전체</option>
                        </select> 
                     </td>
                  </tr>
                  <tr>
                     <th scope="row">개봉일</th>
                     <td>
                        <form:input type="text" class="txt w200" path="movie_date" />
                        <span class="ibk">예)20160606</span>
                        <font color="red"><form:errors path="movie_date"/></font>
                     </td>
                  </tr>
                  <tr>
                     <th scope="row">타입</th>
                     <td>
                        <form:input type="text" class="txt w200" path="movie_type" />
                        <span class="ibk">예)2D/3D</span>
                        <font color="red"><form:errors path="movie_type"/></font>
                     </td>
                  </tr>
                     <tr>
                     <th scope="row">카테고리</th>
                     <td>
                        <%-- <form:input type="text" class="txt w200" path="movie_intro"/>
                        <font color="red"><form:errors path="movie_intro"/></font> --%>
                       <select id="intro_type" class="txt w200" name="movie_intro">
                              <option value="boxoffice">Boxoffice</option>
                              <option value="arte">ARTE</option>
                              <option value="gcinema">Gcinema</option>
                              <option value="chinamovie">Chinamovie</option>
                              <option value="opera">Opera</option>
                        </select> 
                     </td>
                  </tr>
                  <tr>
                     <th scope="row">스페셜 상영관</th>
                     <td>
                     <p style=color:red> &nbsp;&nbsp; on / off 를 설정해주세요.</p>
                     <br/>
                       <select id="type" class="txt w200" name="movie_superG">
                       		  <option value="null">SUPER_G</option>	
                              <option value="off">off</option>
                              <option value="on">on</option>
                        </select>
                         <select id="type" class="txt w200" name="movie_super">
                              <option value="null">SUPER</option>
                              <option value="off">off</option>
                              <option value="on">on</option>
                        </select>
                        <select id="type" class="txt w200" name="movie_4D">
                              <option value="null">4D</option>
                              <option value="off">off</option>
                              <option value="on">on</option>
                        </select> 
                        <select id="type" class="txt w200" name="movie_superS">
                              <option value="null">SUPER_S</option>
                              <option value="off">off</option>
                              <option value="on">on</option>
                        </select> 
                        <br/>
                        <br/>
                        <select id="type" class="txt w200" name="movie_private">
                              <option value="null">PRIVATE</option>
                              <option value="off">off</option>
                              <option value="on">on</option>
                        </select> 
                        <select id="type" class="txt w200" name="movie_family">
                              <option value="null">FAMILY</option>
                              <option value="off">off</option>
                              <option value="on">on</option>
                        </select> 
                        <select id="type" class="txt w200" name="movie_couple">
                              <option value="null">COUPLE</option>
                              <option value="off">off</option>
                              <option value="on">on</option>
                        </select> 
                        <select id="type" class="txt w200" name="movie_biz">
                              <option value="null">BIZ</option>
                              <option value="off">off</option>
                              <option value="on">on</option>
                        </select>  
                     </td>
                  </tr>
               </tbody>
            </table>
         </div>
         <div class="btn_type_03">
            <span class="btn btnC_04 btnP_04"> <input type="submit"
               value="작성완료" />
            </span>
         </div>
      </form:form>
   </div>
</div>
</body>
</html>