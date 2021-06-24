<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="setting.jsp"%>

    
<h2>cus_delete_info_pro.jsp</h2>
<c:if test="${result eq 0}">
	<script type="text/javascript">
		alert( "실패" );
	</script>
</c:if>

<c:if test="${result eq 1}">
	<script type="text/javascript">
		alert( "방송이 종료되었습니다" );
		
	</script>
	<c:redirect url="myPage.go"/>
</c:if>



