<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% String cp = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div class="admin_grp">

<div class="admin_list">
		<ul>
			<li><a href="<%=cp%>/admin/movieList.see">상영작</a></li>
			<li><a href="<%=cp%>/admin/timeTableList.see">시간표관리</a></li>
			<li class="on"><a href="<%=cp%>/admin/bannerList.see">배너관리</a></li>
			<li><a href="<%=cp%>/admin/giftShopList.see">기프트샵</a></li>
			<li><a href="<%=cp%>/admin/eventListMain.see">이벤트</a></li>
			<li><a href="<%=cp%>/admin/noticeList.see">공지사항</a></li>
			<li><a href="<%=cp%>/admin/faqList.see">FAQ</a></li>
			<li><a href="<%=cp%>/admin/qnaList.see">Q&amp;A</a></li>
			<li><a href="<%=cp%>/admin/memberList.see">회원정보</a></li>
		</ul>
	</div>
	
	<div class="admin_ct">
      <h3 class="sub_tit">배너 등록</h3>
      <form action="" method="post" enctype="multipart/form-data">	
         <div class="tbl_type_01">
               <table>
                  <caption>번호,제목,글쓴이,날짜,조회를 나타내는 공지사항 표</caption>
                  <colgroup>
                     <col style="width: 120px;" />
                     <col />
                  </colgroup>
                  <tbody>
                     <tr>
                        <th scope="row">banner_left</th>
                        <td>
                         	  <c:if test="${!empty bannerselect.banner_left}">
                                  <p style="border-bottom: 1px dotted #999;width:203px;">현재 등록된 이미지 : <img src="<%= cp %>/resources/upload/movie/main_movie/${bannerselect.banner_left}" width="60" height="60" alt="" />
                                     <input type="hidden"  name="banner_left" value="${bannerselect.banner_left}"></p>
                                  </c:if>
                                  
                                  <input type="file" class="txt" name="file[0]" value="${bannerselect.banner_left}" />
                                  
                      
                        </td>
                        <tr>
                        
                        <th scope="row">banner_left1</th>
                        <td>
                         	  <c:if test="${!empty bannerselect.banner_left1}">
                                  <p style="border-bottom: 1px dotted #999;width:203px;">현재 등록된 이미지 : <img src="<%= cp %>/resources/upload/movie/main_movie/${bannerselect.banner_left1}" width="60" height="60" alt="" />
                                     <input type="hidden"  name="banner_left1" value="${bannerselect.banner_left1}"></p>
                                  </c:if>
                                  
                                  <input type="file" class="txt" name="file[1]" value="${bannerselect.banner_left1}" />
                                  
                      
                        </td>
                        </tr>
                        
                        <tr>
                        <th scope="row">banner_center</th>
                        <td>
                         	  <c:if test="${!empty bannerselect.banner_center}">
                                  <p style="border-bottom: 1px dotted #999;width:203px;">현재 등록된 이미지 : <img src="<%= cp %>/resources/upload/movie/main_movie/${bannerselect.banner_center}" width="60" height="60" alt="" />
                                     <input type="hidden"  name="banner_center" value="${bannerselect.banner_center}"></p>
                                  </c:if>
                                  
                                  <input type="file" class="txt" name="file[2]" value="${bannerselect.banner_center}" />
                                  
                      
                        </td>
                        </tr>
                        
                        <tr>
                        <th scope="row">banner_center1</th>
                        <td>
                         	  <c:if test="${!empty bannerselect.banner_center1}">
                                  <p style="border-bottom: 1px dotted #999;width:203px;">현재 등록된 이미지 : <img src="<%= cp %>/resources/upload/movie/main_movie/${bannerselect.banner_center1}" width="60" height="60" alt="" />
                                     <input type="hidden"  name="banner_center1" value="${bannerselect.banner_center1}"></p>
                                  </c:if>
                                  
                                  <input type="file" class="txt" name="file[3]" value="${bannerselect.banner_center1}" />
                                  
                      
                        </td>
                        </tr>
                        
                        <tr>
                        <th scope="row">banner_right</th>
                        <td>
                         	  <c:if test="${!empty bannerselect.banner_right}">
                                  <p style="border-bottom: 1px dotted #999;width:203px;">현재 등록된 이미지 : <img src="<%= cp %>/resources/upload/movie/main_movie/${bannerselect.banner_right}" width="60" height="60" alt="" />
                                     <input type="hidden"  name="banner_right" value="${bannerselect.banner_right}"></p>
                                  </c:if>
                                  
                                  <input type="file" class="txt" name="file[4]" value="${bannerselect.banner_right}" />
                                  
                      
                        </td>
                     </tr>
                     
                     <tr>
                        <th scope="row">banner_right1</th>
                        <td>
                         	  <c:if test="${!empty bannerselect.banner_right1}">
                                  <p style="border-bottom: 1px dotted #999;width:203px;">현재 등록된 이미지 : <img src="<%= cp %>/resources/upload/movie/main_movie/${bannerselect.banner_right1}" width="60" height="60" alt="" />
                                     <input type="hidden"  name="banner_right1" value="${bannerselect.banner_right1}"></p>
                                  </c:if>
                                  
                                  <input type="file" class="txt" name="file[5]" value="${bannerselect.banner_right1}" />
                                  
                      
                        </td>
                        </tr>
                        
                        <tr>
                        <th scope="row">banner_bottom</th>
                        <td>
                         	  <c:if test="${!empty bannerselect.banner_bottom}">
                                  <p style="border-bottom: 1px dotted #999;width:203px;">현재 등록된 이미지 : <img src="<%= cp %>/resources/upload/movie/main_movie/${bannerselect.banner_bottom}" width="60" height="60" alt="" />
                                     <input type="hidden"  name="banner_bottom" value="${bannerselect.banner_bottom}"></p>
                                  </c:if>
                                  
                                  <input type="file" class="txt" name="file[6]" value="${bannerselect.banner_bottom}" />
                                  
                      
                        </td>
                        </tr>

                        <tr>
                        <th scope="row">banner_footer</th>
                        <td>
                         	  <c:if test="${!empty bannerselect.banner_footer}">
                                  <p style="border-bottom: 1px dotted #999;width:203px;">현재 등록된 이미지 : <img src="<%= cp %>/resources/upload/movie/main_movie/${bannerselect.banner_footer}" width="60" height="60" alt="" />
                                     <input type="hidden"  name="banner_footer" value="${bannerselect.banner_footer}"></p>
                                  </c:if>
                                  
                                  <input type="file" class="txt" name="file[7]" value="${bannerselect.banner_footer}" />
                                  
                      
                        </td>
                        </tr>
                        
                        <tr>
                        <th scope="row">banner_footer1</th>
                        <td>
                         	  <c:if test="${!empty bannerselect.banner_footer1}">
                                  <p style="border-bottom: 1px dotted #999;width:203px;">현재 등록된 이미지 : <img src="<%= cp %>/resources/upload/movie/main_movie/${bannerselect.banner_footer1}" width="60" height="60" alt="" />
                                     <input type="hidden"  name="banner_footer1" value="${bannerselect.banner_footer1}"></p>
                                  </c:if>
                                  
                                  <input type="file" class="txt" name="file[8]" value="${bannerselect.banner_footer1}" />
                                  
                      
                        </td>
                     	</tr>
                     	
                     	
                     
                  </tbody>
               </table>
         </div>
         <div class="btn_type_03">
            <span class="btn btnC_04 btnP_04"> <input type="submit" value="작성완료" />
            </span>

         </div>
     </form>
   </div>
</div>