<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="/Muhan/cus/cus_theme.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
    <!-- Bootstrap core CSS -->
	 <!-- Custom style for this template -->

<style>
@import url(http://weloveiconfonts.com/api/?family=fontawesome);
@import url(http://fonts.googleapis.com/css?family=Open+Sans:400,700);
[class*="fontawesome-"]:before {
  font-family: 'FontAwesome', sans-serif;
}

* {
  box-sizing: border-box;
}

html {
  height: 100%;
}

body {
  background-color: #151515;
  color: #606468;
  font: 400 0.875rem/1.5 "Open Sans", sans-serif;
  margin: 0;
  min-height: 100%;
}

a {
  color: #eee;
  outline: 0;
  text-decoration: none;
}
a:focus, a:hover {
  text-decoration: underline;
}

button {
  border: 0;
  color: inherit;
  font: inherit;
  margin: 0;
  outline: 0;
  padding: 0;
  -webkit-transition: background-color .3s;
          transition: background-color .3s;
}




input {
  border: 0;
  color: inherit;
  font: inherit;
  margin: 0;
  outline: 0;
  padding: 0;
  -webkit-transition: background-color .3s;
          transition: background-color .3s;
}


h3 {
  border: 0;
  color: inherit;
  font: inherit;
  margin: 0;
  outline: 0;
  padding: 0;
  -webkit-transition: background-color .3s;
          transition: background-color .3s;
}

.site__container {
  -webkit-box-flex: 1;
  -webkit-flex: 1;
      -ms-flex: 1;
          flex: 1;
  padding: 3rem 0;
}

.form input[type="password"], .form input[type="text"], .form input[type="submit"], .form button[type="button"],.form input[type="number"] {
  width: 100%;
}
.form--login {
  color: #606468;
}
.form--login label,
.form input[type="number"],
.form--login input[type="text"],
.form--login input[type="password"],
.form--login input[type="submit"],
.form--login button[type="button"] {
  border-radius: 0.25rem;
  padding: 1rem;
}
.form--login label {
  background-color: #1C1C1C;
  border-bottom-right-radius: 0;
  border-top-right-radius: 0;
  padding-left: 1.25rem;
  padding-right: 1.25rem;
}
.form--login input[type="text"],.form input[type="number"], .form--login input[type="password"] {
  background-color: #2E2E2E;
  border-bottom-left-radius: 0;
  border-top-left-radius: 0;
}
.form--login .form input[type="number"]:focus,input[type="text"]:focus, .form--login input[type="text"]:hover, .form--login input[type="password"]:focus, .form--login input[type="password"]:hover {
  background-color: #2E2E2E;
}

.form--login input[type="submit"] {
  background-color: #AC58FA;
  color: #eee;
  font-weight: bold;
  text-transform: uppercase;
}
.form--login input[type="submit"]:focus, .form--login input[type="submit"]:hover {
  background-color: #AC58FA;
}
.form__field {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  margin-bottom: 1rem;
}
.form__input {
  -webkit-box-flex: 1;
  -webkit-flex: 1;
      -ms-flex: 1;
          flex: 1;
}



.form--login button[type="button"] {
  border-radius: 0.15rem;
  padding: 1rem;
}

.form button[type="button"] {
  width: 100%;
}

.form--login button[type="button"] {
  background-color: #AC58FA;
  color: #eee;
  font-weight: bold;
  text-transform: uppercase;
}

.form--login button[type="button"]:focus, .form--login input[type="button"]:hover {
  background-color: #AC58FA;
}


.align {
  -webkit-box-align: center;
  -webkit-align-items: center;
      -ms-flex-align: center;
          align-items: center;
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: horizontal;
  -webkit-box-direction: normal;
  -webkit-flex-direction: row;
      -ms-flex-direction: row;
          flex-direction: row;
}

.hidden {
  border: 0;
  clip: rect(0 0 0 0);
  height: 1px;
  margin: -1px;
  overflow: hidden;
  padding: 0;
  position: absolute;
  width: 1px;
}

.text--center {
  text-align: center;
}

.grid__container {
  margin: 0 auto;
  max-width: 20rem;
  width: 90%;
}

 input[type='radio']:checked:before {
  	background:#606468;
  }
  
</style>		
	
		<!-- Container -->
		<div class="container max-auto" style="min-height: 100%;">
		  <div class="site__container">
			<div class="grid__container">
    		
			<form method="post" name="modify_info_form" action="deletePro.go" style="width: 350px;">
			 <div class="jb-large">
			 	<h2 style="color:white;">회원탈퇴</h2>
			 </div>
			 	<div class="form__field">
			 		<input  type="password" name="user_pw" class="form__input" placeholder="비밀번호를 입력하세요" maxlength="20"> &nbsp;	
				<div class="form--login">			 	
					<input type="submit" class="btn btn-md btn-secondary" value="삭제"></input>&nbsp;
					<button type="button" class="btn btn-md btn-secondary"
					onclick="location='myPage.go'">취소</button>	
				</div>
	
			</div>
		</form>
			
			</div>
		</div>
		</div>
	
			
		
			<!-- Footer - No Scroll -->
			