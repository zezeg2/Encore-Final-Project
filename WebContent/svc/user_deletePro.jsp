<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>
<script src="${project}script.js"></script>

<c:if test="${result eq 0}">
	<script type="text/javascript">
		alert( "비밀번호가 틀렸습니다" );
	</script>
	<meta http-equiv="refresh" content="0; url=login.go">	
</c:if>

<c:if test="${result eq 1}">
	<script type="text/javascript">
		alert( "탈퇴되셨습니다." );
		sessionStorage.removeItem('user_id');
	</script>
	<meta http-equiv="refresh" content="0; url=login.go">
</c:if>



