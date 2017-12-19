<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	window.onload = function(){
		var chk = ${deleteCheck}
		
		if(chk == 1){
			alert('글이 삭제 되었습니다.');
			opener.location.href = '/movie/free/freeBoardList.see';
			self.close();
		}
		
		if(chk == -1){
			alert('비밀번호가 틀렸습니다.');
			history.back();
		}
	}
</script>