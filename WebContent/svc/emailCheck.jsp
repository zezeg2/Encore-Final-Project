<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="${project}script.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap core CSS -->
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<!-- Custom style for this template -->
<link href="https://fonts.googleapis.com/css?family=Work+Sans" rel="stylesheet">
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요한) -->
<script src="//code.jquery.com/jquery.js"></script>

</head>
<input type="hidden" id="authNum" value="${authNum}">

<c:if test="${result eq 0}">
<center>
	<br><br>
	<h5>인증번호를 입력하세요</h5>
		<div class="container">
			<form method="post" name="authenform" onSubmit="return check()">
				<input type="text" name="authnum"><br><br>
				<input type="submit" class="btn btn=info" value="Submit">
			</form>
		</div>

</center>
</c:if>


<c:if test="${result eq 1}">
<center>
<br><br>
	<h5>${email}이미 존재합니다</h5>
	
		<div class="container">
					<input class="inputbutton" type="button" class="btn btn-md btn-secondary" value="확인"
						onclick="EmailClose()">
			</div>
	
</center>
</c:if>

<script>
	function check(){
		
		var form =document.authenform;
		var authNum=document.getElementById("authNum").value;
		//alert(authNum);
		//alert(form.authnum.value);
		
		if(!form.authnum.value){
			alert("인증번호를 입력하세요");
			return false;
		}
		if(form.authnum.value !=authNum){
			alert("틀린 인증번호 입니다. 인증번호를 다시 입력해주세여");
			return false;
		}
		if(form.authnum.value ==authNum){
			alert("인증완료");
			opener.document.joinform.confirm.value=1;
			self.close();
		}
	}
	
	
	function EmailClose(){
		self.close();
	}
</script>




