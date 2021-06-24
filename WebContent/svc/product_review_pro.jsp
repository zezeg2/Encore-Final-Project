<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>
<script src="${project}script.js"></script>

<c:if test="${result eq 0}">
	<script type="text/javascript">
		
		erroralert( "추가 실패" );
		
	</script>
	<meta http-equiv="refresh" content="0; url=Order_history_select.go">
</c:if>
<c:if test="${result eq 1}">
	<script type="text/javascript">
	alert( "리뷰 작성 완료" );
	</script>
	<c:redirect url="Order_history_select.go.go"/>	
</c:if>