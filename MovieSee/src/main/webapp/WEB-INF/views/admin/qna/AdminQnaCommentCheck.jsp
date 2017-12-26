<%@ page contentType="text/html;charset=UTF-8" %>
<% String cp = request.getContextPath(); %>
<html>
<body>
<script type="text/javascript">
alert("댓글이 있는 게시물은 삭제할 수 없습니다.");
location.href = "<%= cp %>/admin/qnaList.see"; 
</script>
</body>
</html>