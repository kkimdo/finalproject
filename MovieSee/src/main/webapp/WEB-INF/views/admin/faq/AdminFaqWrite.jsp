<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String cp = request.getContextPath();
%>
<script type="text/javascript">
	function validation1() {
		var frm = document.forms1;

		if (frm.faq_subject.value == "") {
			alert("제목을 입력해주세요.");
			frm.faq_subject.focus();
			return false;
		} else if (frm.faq_contents.value == "") {
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
			<li><a href="<%=cp%>/admin/movieList.see">상영작</a></li>
			<li><a href="<%=cp%>/admin/timeTableList.see">시간표관리</a></li>
			<li><a href="<%=cp%>/admin/bannerList.see">배너관리</a></li>
			<li><a href="<%=cp%>/admin/giftShopList.see">기프트샵</a></li>
			<li><a href="<%=cp%>/admin/eventListMain.see">이벤트</a></li>
			<li><a href="<%=cp%>/admin/noticeList.see">공지사항</a></li>
			<li class="on"><a href="<%=cp%>/admin/faqList.see">FAQ</a></li>
			<li><a href="<%=cp%>/admin/qnaList.see">Q&amp;A</a></li>
			<li><a href="<%=cp%>/admin/memberList.see">회원정보</a></li>
		</ul>
	</div>
	<div class="admin_ct">
		<form action="faqWrite.see" method="post" name="forms1"
			onsubmit="return validation1();">
			<div class="tbl_type_01">
				<table>
					<caption>번호,제목,날짜,조회를 나타내는 FAQ 표</caption>
					<colgroup>
						<col style="width: 120px;" />
						<col />
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">카테고리</th>
							<td><span class="ipt_radio mr40"> <input type="radio"
									id="faq_category1" name="faq_category" value="영화관 이용"
									checked="checked"> <label for="faq_category1">영화관 이용</label>
							</span> <span class="ipt_radio mr40"> <input type="radio"
									id="faq_category2" name="faq_category" value="할인 혜택　"> <label
									for="faq_category2">할인 혜택　</label>
							</span> <span class="ipt_radio mr40"> <input type="radio"
									id="faq_category3" name="faq_category" value="회원 정보　"> <label
									for="faq_category3">회원 정보　</label>
							</span> <span class="ipt_radio mr40"> <input type="radio"
									id="faq_category4" name="faq_category" value="관람권 이용"> <label
									for="faq_category4">관람권 이용</label>
							</span></td>
						</tr>
						<tr>
							<th scope="row">제목</th>
							<td><input type="text" name="faq_subject"  class="txt w200" /></td>
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
				</a> <span class="btn btnC_04 btnP_04"> <input type="submit"
					value="등록완료" />
				</span>
			</div>
		</form>
	</div>
</div>