<%@ page language="java" contentType="text/html; charset=UTF-8" 
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% String cp = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="admin_grp">
   <div class="admin_list">
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
   </div>
   <div class="admin_ct">
      <h3 class="sub_tit">상영작 수정</h3>
      <form action="" method="post" enctype="multipart/form-data">
         <div class="tbl_type_01">
               <input type="hidden" name="movie_no" value="${movieModel.movie_no}">
               <table>
                  <caption>번호,제목,글쓴이,날짜,조회를 나타내는 공지사항 표</caption>
                  <colgroup>
                     <col style="width: 120px;" />
                     <col />
                  </colgroup>
                  <tbody>
                     <tr>
                        <th scope="row">영화제목</th>
                        <td><input type="text" class="txt w200" name="movie_name" value="${movieModel.movie_name}"/></td>
                     </tr>
                     <tr>
                        <th scope="row">감독</th>
                        <td><input type="text" class="txt w200" name="movie_director" value="${movieModel.movie_director}"/></td>
                     </tr>
                     <tr>
                        <th scope="row">감독 이미지</th>
                        <td>
                           <c:if test="${!empty movieModel.movie_director_picture}">
                                  <p style="border-bottom: 1px dotted #999;width:203px;">현재 등록된 이미지 : <img src="<%= cp %>/resources/upload/movie/main_movie/${movieModel.movie_director_picture}" width="60" height="60" alt="" />
                                     <input type="hidden"  name="movie_director_picture" value="${movieModel.movie_director_picture}"></p>
                                  </c:if>
                                  
                                  <input type="file" class="txt" name="file[6]" value="${movieModel.movie_director_picture}" />
                        </td>
                     </tr>
                     <tr>
                        <th scope="row">배우</th>
                        <td><input type="text" class="txt w200" name="movie_actor" value="${movieModel.movie_actor}"/></td>
                     </tr>
                     <tr>
                        <th scope="row">배우1</th>
                        <td><input type="text" class="txt w200" name="movie_actor1" value="${movieModel.movie_actor1}"/></td>
                     </tr>
                     <tr>
                        <th scope="row">배우2</th>
                        <td><input type="text" class="txt w200" name="movie_actor2" value="${movieModel.movie_actor2}"/></td>
                     </tr>
                     <tr>
                        <th scope="row">배우 이미지</th>
                        <td>
                           <c:if test="${!empty movieModel.movie_actor_picture}">
                                  <p style="border-bottom: 1px dotted #999;width:203px;">현재 등록된 이미지 : <img src="<%= cp %>/resources/upload/movie/main_movie/${movieModel.movie_actor_picture}" width="60" height="60" alt="" />
                                     <input type="hidden"  name="movie_actor_picture" value="${movieModel.movie_actor_picture}"></p>
                                  </c:if>
                                  
                                  <input type="file" class="txt" name="file[7]" value="${movieModel.movie_actor_picture}" />
                        </td>
                     </tr>
                     <tr>
                        <th scope="row">배우 이미지1</th>
                        <td>
                           <c:if test="${!empty movieModel.movie_actor_picture1}">
                                  <p style="border-bottom: 1px dotted #999;width:203px;">현재 등록된 이미지 : <img src="<%= cp %>/resources/upload/movie/main_movie/${movieModel.movie_actor_picture1}" width="60" height="60" alt="" />
                                     <input type="hidden"  name="movie_actor_picture1" value="${movieModel.movie_actor_picture1}"></p>
                                  </c:if>
                                  
                                  <input type="file" class="txt" name="file[8]" value="${movieModel.movie_actor_picture1}" />
                        </td>
                     </tr>
                     <tr>
                        <th scope="row">배우 이미지2</th>
                        <td>
                           <c:if test="${!empty movieModel.movie_actor_picture2}">
                                  <p style="border-bottom: 1px dotted #999;width:203px;">현재 등록된 이미지 : <img src="<%= cp %>/resources/upload/movie/main_movie/${movieModel.movie_actor_picture2}" width="60" height="60" alt="" />
                                     <input type="hidden"  name="movie_actor_picture2" value="${movieModel.movie_actor_picture2}"></p>
                                  </c:if>
                                  
                                  <input type="file" class="txt" name="file[9]" value="${movieModel.movie_actor_picture2}" />
                        </td>
                     </tr>
                     <tr>
                        <th scope="row">제작사</th>
                        <td><input type="text" class="txt w200" name="movie_company" value="${movieModel.movie_company}"/></td>
                     </tr>
                     <tr>
                        <th scope="row">줄거리</th>
                        <td>
                           <div class="textarea_grp">
                              <textarea name="movie_story">${movieModel.movie_story}</textarea>
                           </div>
                        </td>
                     </tr>
                     <tr>
                        <th scope="row">포스터</th>
                        <td>
                           <c:if test="${!empty movieModel.movie_poster}">
                                  <p style="border-bottom: 1px dotted #999;width:203px;">현재 등록된 이미지 : <img src="<%= cp %>/resources/upload/movie/main_movie/${movieModel.movie_poster}"  width="60" height="60" alt="" onerror="this.src='/pet/resources/images/noimg_130.gif'" />
                                     <input type="hidden"  name="movie_poster" value="${movieModel.movie_poster}"></p>
                                  </c:if>
                                  
                                  <input type="file" class="txt" name="file[0]" value="${movieModel.movie_poster}" />
                        </td>
                     </tr>
                     <tr>
                        <th scope="row">스틸컷</th>
                        <td>
                           <c:if test="${!empty movieModel.movie_stillcut}">
                                  <p style="border-bottom: 1px dotted #999;width:203px;">현재 등록된 이미지 : <img src="<%= cp %>/resources/upload/movie/main_movie/${movieModel.movie_stillcut}" width="60" height="60" alt="" />
                                     <input type="hidden"  name="movie_stillcut" value="${movieModel.movie_stillcut}"></p>
                                  </c:if>
                                  
                                  <input type="file" class="txt" name="file[1]" value="${movieModel.movie_stillcut}" />
                                  
                        </td>
                     </tr>
                     <tr>
                        <th scope="row">스틸컷1</th>
                        <td>
                           <c:if test="${!empty movieModel.movie_stillcut1}">
                                  <p style="border-bottom: 1px dotted #999;width:203px;">현재 등록된 이미지 : <img src="<%= cp %>/resources/upload/movie/main_movie/${movieModel.movie_stillcut1}" width="60" height="60" alt="" />
                                     <input type="hidden"  name="movie_stillcut1" value="${movieModel.movie_stillcut1}"></p>
                                  </c:if>
                                  
                                  <input type="file" class="txt" name="file[2]" value="${movieModel.movie_stillcut1}" />
                        </td>
                     </tr>
                     <tr>
                        <th scope="row">스틸컷2</th>
                        <td>
                           <c:if test="${!empty movieModel.movie_stillcut2}">
                                  <p style="border-bottom: 1px dotted #999;width:203px;">현재 등록된 이미지 : <img src="<%= cp %>/resources/upload/movie/main_movie/${movieModel.movie_stillcut2}" width="60" height="60" alt="" />
                                     <input type="hidden"  name="movie_stillcut2" value="${movieModel.movie_stillcut2}"></p>
                                  </c:if>
                                  
									<input type="file" class="txt" name="file[3]" value="${movieModel.movie_stillcut2}" />
                        </td>
                     </tr>
                     <tr>
                        <th scope="row">스틸컷3</th>
                        <td>
                           <c:if test="${!empty movieModel.movie_stillcut3}">
                                  <p style="border-bottom: 1px dotted #999;width:203px;">현재 등록된 이미지 : <img src="<%= cp %>/resources/upload/movie/main_movie/${movieModel.movie_stillcut3}" width="60" height="60" alt="" />
                                     <input type="hidden"  name="movie_stillcut3" value="${movieModel.movie_stillcut3}"></p>
                                  </c:if>
                                  
                                  <input type="file" class="txt" name="file[4]" value="${movieModel.movie_stillcut3}" />
                        </td>
                     </tr>
                     <tr>
                        <th scope="row">스틸컷4</th>
                        <td>
                           <c:if test="${!empty movieModel.movie_stillcut4}">
                                  <p style="border-bottom: 1px dotted #999;width:203px;">현재 등록된 이미지 : <img src="<%= cp %>/resources/upload/movie/main_movie/${movieModel.movie_stillcut4}" width="60" height="60" alt="" />
                                     <input type="hidden"  name="movie_stillcut4" value="${movieModel.movie_stillcut4}"></p>
                                  </c:if>
                                  
                                  <input type="file" class="txt" name="file[5]" value="${movieModel.movie_stillcut4}" />
                        </td>
                     </tr>
                     <tr>
                        <th scope="row">개요</th>
                        <td><input type="text" class="txt w200" name="movie_genre" value="${movieModel.movie_genre}"/></td>
                     </tr>
                     <tr>
                        <th scope="row">연령제한</th>
                        <td>
                        <%-- <p>현재 연령제한 : ${movieModel.movie_age}</p> --%>
                        <p style=color:red>변경할 연령을 선택해 주세요</p>
                        <br/>
                         <select id="age_type" class="txt w200" name="movie_age">
                         	  <option value="${movieModel.movie_age}">현재 ${movieModel.movie_age} 입니다.</option>	
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
                           <input type="text" class="txt w200" name="movie_date" value="<fmt:formatDate value="${movieModel.movie_date }" pattern="yyyyMMdd"></fmt:formatDate>"/>
                           <span class="ibk" style=color:red> 예) 20171229</span>
                        </td>
                     </tr>
                     <tr>
                        <th scope="row">타입</th>
                        <td><input type="text" class="txt w200" name="movie_type" value="${movieModel.movie_type}"/></td>
                     </tr>
                     <tr>
                        <th scope="row">카테고리</th>
                        <td>
                      <%--   <p>현재 카테고리 : ${movieModel.movie_intro}</p> --%><%-- <input class="txt w200" name="movie_intro" value="${movieModel.movie_intro}"/> --%>
                         <p style=color:red>&nbsp;변경할 카테고리를 선택해 주세요</p>
                         <br/>
                         <select id="intro_type" class="txt w200" name="movie_intro">
                         	  <option value="${movieModel.movie_intro}">현재 ${movieModel.movie_intro} 입니다.</option>	
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
                       <select id="type1" class="txt w200" name="movie_superG">
                       		  <option value="${movieModel.movie_superG}">현재 ${movieModel.movie_superG} 입니다.</option>	
                              <option value="on">on</option>
                              <option value="off">off</option>
                        </select>
                         <select id="type2" class="txt w200" name="movie_super">
                              <option value="${movieModel.movie_super}">현재 ${movieModel.movie_super} 입니다.</option>
							  <option value="on">on</option>
                              <option value="off">off</option>
                        </select>
                        <select id="type3" class="txt w200" name="movie_4D">
                              <option value="${movieModel.movie_4D}">현재 ${movieModel.movie_4D} 입니다.</option>
                              <option value="on">on</option>
                              <option value="off">off</option>
                        </select> 
                        <select id="type4" class="txt w200" name="movie_superS">
                              <option value="${movieModel.movie_superS}">현재 ${movieModel.movie_superS} 입니다.</option>
                              <option value="on">on</option>
                              <option value="off">off</option>
                        </select> 
                        <br/>
                        <br/>
                        <select id="type5" class="txt w200" name="movie_private">
                              <option value="${movieModel.movie_private}">현재 ${movieModel.movie_private} 입니다.</option>
							  <option value="on">on</option>
                              <option value="off">off</option>
                        </select> 
                        <select id="type6" class="txt w200" name="movie_family">
                             <option value="${movieModel.movie_family}">현재 ${movieModel.movie_family} 입니다.</option>
                              <option value="on">on</option>
                              <option value="off">off</option>
                        </select> 
                        <select id="type7" class="txt w200" name="movie_couple">
                              <option value="${movieModel.movie_couple}">현재 ${movieModel.movie_couple} 입니다.</option>
                              <option value="on">on</option>
                              <option value="off">off</option>
                        </select> 
                        <select id="type8" class="txt w200" name="movie_biz">
                              <option value="${movieModel.movie_biz}">현재 ${movieModel.movie_biz} 입니다.</option>
                              <option value="on">on</option>
                              <option value="off">off</option>
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
      </form>
   </div>
</div>