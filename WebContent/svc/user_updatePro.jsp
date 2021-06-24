<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="setting.jsp"%>
<script src="${project}script.js"></script>
<h2>update</h2>

<c:if test="${result eq 0}">
	alert("수정 에러")
</c:if>
<c:if test="${result eq 1}">
	<c:redirect url="login.go"/> 
</c:if>
	
	
