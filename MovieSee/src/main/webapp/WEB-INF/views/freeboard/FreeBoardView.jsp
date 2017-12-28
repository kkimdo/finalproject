<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	String cp = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>자유게시판</title>

<script type="text/javascript">
	
	function openFreeBoard(url){
	      cw=screen.availWidth;    
	      ch=screen.availHeight;  
	      sw=500;    
	      sh=400;    
	      
	      ml=(cw-sw)/2;       
	      mt=(ch-sh)/2;     
	      window.open(url, "confirm","width="+sw+", height="+sh+",top="+mt+", left="+ml+", toolbar=no, location=no, status=no, menubar=no, scrollbars=yes, resizable=no");
	   }
	  
	// admin은 바로 지울 수 있게
	function freeBoardAdminDelete() {
		if (confirm("정말 삭제하시겠습니까?") == true) { //확인
			location.href ="<%=cp%>/free/freeBoardAdminDelete.see?freeboard_no=${freeBoardModel.freeboard_no}";
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
			<li><a href="<%=cp%>/faq/faqList.see">FAQ</a></li>
			<li><a href="<%=cp%>/notice/noticeList.see">공지사항</a></li>
			<li><a href="javascript:customerCenterMenu(2);">1:1문의</a></li>
			<li class="active"><a href="<%=cp%>/free/freeBoardList.see">자유게시판</a></li>
			<li><a href="<%=cp%>/common/privacy.see">개인정보처리방침</a></li>
		</ul>
			<div class="tabCont">
				<div class="detail_header">
					<h3 class="cinema_stit" id="hTitle">${freeBoardModel.freeboard_subject}</h3>
					<ul class="view_info">
						<li><strong>번호 : </strong><span id="spanCinema">${freeBoardModel.freeboard_no}</span></li>
						<li><strong>작성자 : </strong><span id="spanCinema">${freeBoardModel.freeboard_name}</span></li>
						<li><strong>등록일 : </strong><span id="spanCreateDate"><fmt:formatDate
									value="${freeBoardModel.freeboard_date}" pattern="yyyy-MM-dd" /></span></li>
						<li><strong>조회수 : </strong><span id="spanSearchCount">${freeBoardModel.freeboard_hit}</span></li>
					</ul>
				</div>
				<div class="board_cont" id="divContents">${freeBoardModel.freeboard_content}<br />
				</div>
			</div>
				<div class="btn_box btn_cbox">
						<a href="<%=cp%>/free/freeBoardList.see?curPage=${curPage}&searchOption=${searchOption}&keyword=${keyword}" class="btnc_check">목록</a>
						
						<c:if test="${freeBoardModel.freeboard_name == session_member_name}">
							<a href="<%=cp%>/free/freeBoardUpdate.see?freeboard_no=${freeBoardModel.freeboard_no}" class="btnc_check" >수정</a> 
						</c:if>
						<c:choose>
							<c:when test="${session_member_grade eq 1 }">
								<a href="javascript:void(0);" class="btnc_check" onclick="freeBoardAdminDelete();">
								삭제
								</a>
                        	</c:when>
							<c:otherwise>
								<c:if test="${freeBoardModel.freeboard_name == session_member_name}">
								<a href="javascript:void(0);" class="btnc_check" onclick="openFreeBoard('<%=cp%>/free/freeBoardCheckForm.see?freeboard_no=${freeBoardModel.freeboard_no}')">
								삭제
								</a>
								</c:if>
                        	</c:otherwise>
						</c:choose>	
							
						<c:if test = "${ref ne 1 }">
						<a href="<%=cp%>/free/freeBoardWriteReply.see?freeboard_no=${freeBoardModel.freeboard_no}" class="btnc_check">
						<span>답변쓰기</span>
						</a>
						</c:if>
					</div>
					<div class="quick_ver2" id="quick" style="top: 186.25px;">
			<!-- [D] 접근성 관련 : 스크립트로 탭키이동시 foucs in, focus out  제어 필요 -->
			<ul>
				<li><a
					href="<%=cp%>/reserve/movieTicketing.see"
					title="빠른예매"><span><img
							src="http://caching.lottecinema.co.kr//Media/WebAdmin/a021109040b34b989bf01bacf6263973.jpg"
							alt="빠른예매"></span></a></li>
				<li><a
					href="<%=cp%>/mypage/reserveList.see"
					title="예매내역"><span><img
							src="http://caching.lottecinema.co.kr//Media/WebAdmin/1ec48d357ba44dbeaa0ef261d93e4003.jpg"
							alt="예매내역"></span></a></li>
				<li><a
					href="<%=cp%>/faq/faqList.see"
					title="고객센터"><span><img
							src="http://caching.lottecinema.co.kr//Media/WebAdmin/47141787f65643938247e12b5f5c9d75.jpg"
							alt="고객센터"></span></a></li>
				<li><a
					href="<%=cp%>/movie/aMovieTheater.see"
					title="스페셜관"><span><img
							src="http://caching.lottecinema.co.kr//Media/WebAdmin/1066bda3e3c1448f81cdbb07aeea257b.jpg"
							alt="스페셜관"></span></a></li>
			</ul>
		</div>
	</div>

</body>
</html>