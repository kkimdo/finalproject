<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<% String cp = request.getContextPath(); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>공지 사항</title>
<script type="text/javascript">
	//** 목록 버튼 클릭 이벤트 : 버튼 클릭시 상세보기화면에 있던 페이지, 검색옵션, 키워드 값을 가지로 목록으로 이동
	function btnList(){
    	location.href="<%= cp %>/admin/noticeList.see?curPage=${curPage}&searchOption=${searchOption}&keyword=${keyword}";
    	}
    	
	function btnUpdate(){
		location.href="<%= cp%>/admin/noticeUpdate.see?notice_no=${noticeModel.notice_no}";
		}
	  
	function btnDelete() {
		if (confirm("정말 삭제하시겠습니까?") == true) { //확인
			location.href ="<%= cp%>/admin/noticeDelete.see?notice_no=${noticeModel.notice_no}";
		} else { //취소
			return;
		}
	}
	  
</script>
</head>

<body>
	
	<div class="cs_center">
				<h2 class="csTit">고객센터</h2>
				<ul class="tab_st03">
					<li>
						<a href="<%=cp%>/faq/faqList.see">FAQ</a>
					</li>
					<li class="active"><a href="<%=cp%>/admin/noticeList.see">공지사항</a></li> <!-- goCustomerCenterMenu-->
					<li><a href="javascript:customerCenterMenu(2);">1:1문의</a></li>
					<li><a href="javascript:customerCenterMenu(3);">단체관람/대관문의</a></li>
					<li><a href="javascript:customerCenterMenu(4);">분실물안내</a></li>
                </ul>
				<form name="form1" method="post">
                    <div class="tabCont">
						<div class="detail_header">
							<h3 class="cinema_stit" id="hTitle">${noticeModel.notice_subject}</h3>
							<ul class="view_info">
								<li><strong>영화관  : </strong><span id="spanCinema">${noticeModel.notice_area}</span></li>
								<li><strong>등록일 : </strong><span id="spanCreateDate"><fmt:formatDate value="${noticeModel.notice_date}" pattern="yyyy-MM-dd" /></span></li>
								<li><strong>조회수 : </strong><span id="spanSearchCount">${noticeModel.notice_hit}</span></li>
							</ul>
						</div>
                        <div class="board_cont" id="divContents">${noticeModel.notice_content}
                        </div>
						<ul class="view_list">
							<li>
								<strong class="prev">이전글</strong>
								<div>
									<c:choose>
										<c:when test="${preNum ne 0 }">
											<a href="<%=cp %>/admin/noticeView.see?notice_no=${noticePrev.notice_no}&curPage=${curPage}" id="aPrev">${noticePrev.notice_subject}</a>
										</c:when>
										<c:otherwise>
											이전글이 없습니다.
										</c:otherwise>
									</c:choose>
								</div>
							</li>
							<li>
								<strong class="next">다음글</strong>
								<div>
									<c:choose>
										<c:when test="${nextNum ne 0 }">
											<a href="<%=cp %>/admin/noticeView.see?notice_no=${noticeNext.notice_no}&curPage=${curPage}" id="aNext">${noticeNext.notice_subject}</a>
										</c:when>
										<c:otherwise>
											다음글이 없습니다.
										</c:otherwise>
									</c:choose>
								</div>
							</li>
						</ul>
						<div class="btn_box btn_cbox">
							<a href="<%= cp %>/admin/noticeList.see?curPage=${curPage}&searchOption=${searchOption}&keyword=${keyword}" class="btnc_check" >목록</a>
							<a href="<%= cp %>/admin/noticeUpdate.see?notice_no=${noticeModel.notice_no}" class="btnc_check" >수정</a>
							<a href="#none" class="btnc_check" onclick="btnDelete();">삭제</a>
						</div>
                    </div>
                   	</form>
                </div>
              
	
</body>
</html>