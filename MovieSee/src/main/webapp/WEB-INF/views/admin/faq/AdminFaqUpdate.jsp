<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

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
	<form:form commandName="faqModel" name="formWrite" action="faqUpdate.see" method="post">
		<input type="hidden" name="faq_no" value="${faqModel.faq_no}" />
			<div class="tabCont">
					<div>
						<fieldset>
							<legend>FAQ내용입력</legend>
							<div class="titYtxt mt50">
								<h3 class="mem_tit">FAQ</h3>
							
							</div>

							<table class="tbl_style01">

								<caption>FAQ 작성란</caption>
								<colgroup>
									<col style="width: 13%">
									<col style="width: *">
								</colgroup>

								<tbody>
									<tr>
							<th scope="row">카테고리</th>
							<td><span class="ipt_radio mr40"> <input type="radio"
									id="faq_category1" name="faq_category" value="영화관 이용"
									checked="checked"> <label for="faq_category1">영화관
										이용</label>
							</span> <span class="ipt_radio mr40"> <input type="radio"
									id="faq_category2" name="faq_category" value="할인혜택"> <label
									for="faq_category2">할인혜택</label>
							</span> <span class="ipt_radio mr40"> <input type="radio"
									id="faq_category3" name="faq_category" value="회원"> <label
									for="faq_category3">회원</label>
							</span> <span class="ipt_radio mr40"> <input type="radio"
									id="faq_category4" name="faq_category" value="관람권"> <label
									for="faq_category4">관람권</label>
							</span></td>
						</tr>
									<tr>
										<th scope="row"><label for="subject"> 제목 </label></th>
										<td><form:input name="faq_subject" type="text"
												value="${faqModel.faq_subject}" maxlength="40"
												id="subject" class="ipt_txt03" path="faq_subject" /> <font
											color="red"><form:errors path="faq_subject" /></font></td>
									</tr>
								
						<tr>
							<th scope="row">글내용</th>
							<td>
								<div class="textarea_grp">
									<textarea name="faq_content">${faqModel.faq_content}</textarea>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</fieldset>
			</div>
			<div class="btn_type_03">
				<span class="btn btnC_03 btnP_04 mr10" onclick="history.go(-1);">
					<input type="button" value="취소" />
				</span> <span class="btn btnC_04 btnP_04"> <input type="submit"
					value="수정완료" />
				</span>
			</div>
			</div>
			</form:form>
		</div>
</div>