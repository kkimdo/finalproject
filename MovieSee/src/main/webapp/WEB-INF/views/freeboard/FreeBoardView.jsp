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

<title>자유게시판</title>

<script type="text/javascript">

	function btnList(){
    	location.href="<%= cp %>/free/freeBoardList.see?curPage=${curPage}&searchOption=${searchOption}&keyword=${keyword}";
    	}
    	
	<%-- function btnUpdate(){
		location.href="<%= cp%>/free/freeBoardUpdate.see?freeboard_no=${freeBoardModel.freeboard_np}";
		} --%>
	  
	<%-- function btnDelete() {
		if (confirm("정말 삭제하시겠습니까?") == true) { //확인
			location.href ="<%= cp%>/free/freeBoardDelete.see?freeboard_no=${freeBoardModel.freeboard_np}";
		} else { //취소
			return;
		}
	} --%>
	  
</script>
</head>

<body>
	
	<div class="cs_center">
				<h2 class="csTit">고객센터</h2>
				<ul class="tab_st03">
					<li>
						<a href="<%=cp%>/faq/faqList.see">FAQ</a>
					</li>
					<li><a href="<%=cp%>/admin/noticeList.see">공지사항</a></li> <!-- goCustomerCenterMenu-->
					<li><a href="javascript:customerCenterMenu(2);">1:1문의</a></li>
					<li class="active"><a href="<%=cp%>/free/freeBoardList.see">자유게시판</a></li>
					<li><a href="javascript:customerCenterMenu(4);">분실물안내</a></li>
                </ul>
				<form name="form1" method="post">
                    <div class="tabCont">
						<div class="detail_header">
							<h3 class="cinema_stit" id="hTitle">${freeBoardModel.freeboard_subject}</h3>
							<ul class="view_info">
								<li><strong>번호  : </strong><span id="spanCinema">${freeBoardModel.freeboard_no}</span></li>
								<li><strong>작성자  : </strong><span id="spanCinema">${freeBoardModel.freeboard_name}</span></li>
								<li><strong>등록일 : </strong><span id="spanCreateDate"><fmt:formatDate value="${freeBoardModel.freeboard_date}" pattern="yyyy-MM-dd" /></span></li>
								<li><strong>조회수 : </strong><span id="spanSearchCount">${freeBoardModel.freeboard_hit}</span></li>
							</ul>
						</div>
                        <div class="board_cont" id="divContents">${freeBoardModel.freeboard_content}<br/>
                        </div>
						<ul class="view_list">
							
						</ul>
						<div class="btn_box btn_cbox">
							<a href="javascript:void(0);" class="btnc_check" onclick="btnList();">목록</a>
							<a href="javascript:void(0);" class="btnc_check" onclick="btnUpdate();">수정</a>
							<a href="javascript:void(0);" class="btnc_check" onclick="btnDelete();">삭제</a>
						</div>
                    </div>
                   	</form>
                </div>
              
	
</body>
</html>