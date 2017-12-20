<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String cp = request.getContextPath();
%>
<script type="text/javascript">
	function validation1(){
		var frm = document.forms1;
		
		if(frm.faq_subject.value == ""){
			alert("제목을 입력해주세요.");
			frm.faq_subject.focus();
			return false;
		}
		else if(frm.faq_contents.value == ""){
			alert("내용을 입력해주세요.");
			frm.faq_contents.focus();
			return false;
		}
		return true;
	}
</script>
<div class="admin_grp">
	<div class="admin_list">
		<ul>
			<li><a href="<%=cp%>/admin/movieList.mt">상영작</a></li>
			<li><a href="<%=cp%>/admin/timeTableList.mt">시간표관리</a></li>
			<li><a href="<%=cp%>/admin/adminMagazineList.mt">매거진</a></li>
			<li><a href="<%=cp%>/admin/adminEventList.mt">이벤트</a></li>
			<li class="on"><a href="<%=cp%>/admin/adminNoticeList.mt">공지사항</a></li>
			<li><a href="<%=cp %>/admin/adminQnaList.mt">Q&amp;A</a></li>
			<li><a href="<%=cp%>/admin/memberList.mt">회원정보</a></li>
		</ul>
	</div>
	<div class="admin_ct">
		<form action="faqWrite.see" method="post" name="forms1" onsubmit="return validation1();">
			<div class="tbl_type_01">
				<table>
					<caption>번호,제목,날짜,조회를 나타내는 FAQ 표</caption>
					<colgroup>
						<col style="width:120px;" />
						<col />
					</colgroup>
					<tbody>
						<tr>
								<th scope="row">카테고리</th>
									<td><span class="ipt_radio mr40"> <input
											type="radio" id="faq_category1" name="faq_category"
											value="영화관 이용" checked="checked"> <label
											for="faq_category1">영화관 이용</label>
									</span> <span class="ipt_radio mr40"> <input type="radio"
											id="faq_category2" name="faq_category" value="할인혜택">
											<label for="faq_category2">할인혜택</label>
									</span> <span class="ipt_radio mr40"> <input type="radio"
											id="faq_category3" name="faq_category" value="회원">
											<label for="faq_category3">회원</label>
									</span> <span class="ipt_radio mr40"> <input type="radio"
											id="faq_category4" name="faq_category" value="관람권">
											<label for="faq_category4">관람권</label>
									</span></td>
						</tr>
						<tr>
							<th scope="row">제목</th>
							<td><input type="text" name="faq_subject" class="txt w200" /></td>
						</tr>
						<tr>
							<th scope="row">내용</th>
							<td>
								<div class="textarea_grp">
									<textarea name="faq_content"></textarea>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="btn_type_03">
				<a href="javascript:history.back()" class="btn btnC_03 btnP_04 mr10">
					<span>목록</span>
				</a>
				<span class="btn btnC_04 btnP_04">
					<input type="submit" value="등록완료"/>
				</span>
			</div>
		</form>		
	</div>
</div>