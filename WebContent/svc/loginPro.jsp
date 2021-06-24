<%@page import="db.UserDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="setting.jsp" %>
<script src="${project}script.js"></script>

<h2> ${page_login} </h2>

<c:if test="${result eq 0}">
<script type="text/javascript">
		alert("입력하신 아이디가 틀렸습니다. 아이디를 다시 확인해주세요");
		window.location.href='login.go';
	</script>
</c:if>
<c:if test="${result eq -1}">
	<script type="text/javascript">
		alert("입력하신 패스워드가 틀렸습니다. 패스워드를 다시 확인해주세요");
		window.location.href='login.go';
	</script>
</c:if>
<c:if test="${result eq 1}">	
		${sessionScope.user_id = user_id}
	<c:redirect url="myPage.go"/>
</c:if>