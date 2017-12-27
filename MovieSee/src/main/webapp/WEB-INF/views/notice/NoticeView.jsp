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
    	location.href="<%= cp %>/notice/noticeList.see?curPage=${curPage}&searchOption=${searchOption}&keyword=${keyword}";
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
					<li class="active"><a href="<%=cp%>/notice/noticeList.see">공지사항</a></li> <!-- goCustomerCenterMenu-->
					<li><a href="<%=cp%>/qna/qnaWrite.see">1:1문의</a></li>
					<li><a href="<%=cp%>/free/freeBoardList.see">자유게시판</a></li>
					<li><a href="<%=cp%>/common/privacy.see">개인정보처리방침</a></li>
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
                        <div class="board_cont" id="divContents">${noticeModel.notice_content}<br/>
                        <c:if test="${noticeModel.notice_content_file ne null }">
                        	<img border="0" hspace="0" alt="${noticeModel.notice_content}" src="<%= cp %>/resources/uploads/notice/${noticeModel.notice_content_file}">
                        </c:if>
                        </div>
						<ul class="view_list">
							<li>
								<strong class="prev">이전글</strong>
								<div>
									<c:choose>
										<c:when test="${preNum ne 0 }">
											<a href="<%=cp %>/notice/noticeView.see?notice_no=${noticePrev.notice_no}&curPage=${curPage}" id="aPrev">${noticePrev.notice_subject}</a>
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
											<a href="<%=cp %>/notice/noticeView.see?notice_no=${noticeNext.notice_no}&curPage=${curPage}" id="aNext">${noticeNext.notice_subject}</a>
										</c:when>
										<c:otherwise>
											다음글이 없습니다.
										</c:otherwise>
									</c:choose>
								</div>
							</li>
						</ul>
						<div class="btn_box btn_cbox">
							<%-- <a href="<%= cp %>/admin/noticeList.see?curPage=${curPage}&searchOption=${searchOption}&keyword=${keyword}" class="btnc_check" >목록</a>
							<a href="<%= cp %>/admin/noticeUpdate.see?notice_no=${noticeModel.notice_no}" class="btnc_check" >수정</a> --%>
							<a href="javascript:void(0);" class="btnc_check" onclick="btnList();">목록</a>
						</div>
                    </div>
                   	</form>
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