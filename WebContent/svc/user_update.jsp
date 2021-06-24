<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@include file="setting.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@include file="header.jsp" %>


 <h3 class="fs-4 my-4 text-white text-center">회원정보 수정</h3>
<br>
<br>
<form class="form form--login" name="joinform" method="post" action="updatePro.go" onsubmit="return modifyCheck()" style="
	    width: 490px; margin:0 auto;">
	<div class="form__field">
		<label class="col-sm-3 col-form-label text-white text-white text-white text-white text-white" style="color:white;">아이디</label>
		<input style="color:white;" class="form__input" type="text" value="${userDto.user_id}" readonly>
	</div>
	<div class="form__field">
		<label class="col-sm-3 col-form-label text-white text-white text-white text-white text-white" style="color:white;">이름</label>
		<input style="color:white;" class="form__input" type="text" value="${userDto.user_name}" readonly>
	</div>
	<div class="form__field">
		<label class="col-sm-3 col-form-label text-white text-white text-white text-white text-white" style="color:white;">비밀번호</label>
		<input style="color:white;" class="form__input" name="user_pw" id="password" type="password" value="${userDto.user_pw }">
	</div>
	<div class="form__field">
		<label class="col-sm-3 col-form-label text-white text-white text-white text-white text-white" style="color:white;">주소</label>
		<input style="color:white;" class="form__input" name="user_addr" id="cus_address" type="text" placeholder="주소" value="${userDto.user_addr}">
		<button class="form__input" type="button" onclick="sample4_execDaumPostcode()">주소찾기</button>
	</div>
	<div class="form__field">
		<label for="inputNickname" class="col-sm-3 col-form-label text-white text-white text-white text-white text-white" style="color:white;">상세주소</label>
		<input style="color:white;" class="form__input" name="user_addr2" id="cus_address2" type="text" value="${userDto.user_addr2 }">
	</div>
	<div class="form__field">
		<label class="col-sm-3 col-form-label text-white text-white text-white text-white text-white" style="color:white;">이메일</label>
		<input style="color:white;" class="form__input" name="email" type="text" value="${userDto.user_email}" readonly>
	</div>
	<div class="form__field">
		<c:if test="${userDto.user_phone == null eq null or userDto.user_phone eq ''}">
			<input style="color:white;" class="form__input" type="text" name="tel1" maxlength="3" style="width: 100px">-
			<input style="color:white;" class="form__input" type="text" name="tel2" maxlength="4" style="width: 100px">-
			<input style="color:white;" class="form__input" type="text" name="tel3" maxlength="4" style="width: 100px">
		</c:if>
		<c:if test="${userDto.user_phone ne null and userDto.user_phone ne ''}">
			<c:set var="t" value="${fn:split(userDto.user_phone, '-')}" />
			<input style="color:white;" class="form__input" type="text" name="tel1" maxlength="3" style="width: 100px" value="${t[0]}">-
			<input style="color:white;" class="form__input" type="text" name="tel2" maxlength="4" style="width: 100px" value="${t[1]}">-
			<input style="color:white;" class="form__input" type="text" name="tel3" maxlength="4" style="width: 100px" value="${t[2]}">
		</c:if>
	</div>
	<div class="form__field">
		<input type="submit" value="정보수정">&nbsp; &nbsp;
		<button type="button" class="btn btn-lg btn-secondary btn-block" onclick="location='myPage.go'">취소</button>
	</div>
</form>   


<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>


<script>
	function sample4_execDaumPostcode() {  //다음 주소 api
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
	            var extraRoadAddr = ''; // 도로명 조합형 주소 변수
	
	            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                extraRoadAddr += data.bname;
	            }
	            // 건물명이 있고, 공동주택일 경우 추가한다.
	            if(data.buildingName !== '' && data.apartment === 'Y'){
	               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	            }
	            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	            if(extraRoadAddr !== ''){
	                extraRoadAddr = ' (' + extraRoadAddr + ')';
	            }
	            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
	            if(fullRoadAddr !== ''){
	                fullRoadAddr += extraRoadAddr;
	            }
	
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            //document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
	            //document.getElementById('sample4_roadAddress').value = fullRoadAddr;
	            document.getElementById('cus_address').value = data.jibunAddress;
	            self.close();
	
	            
	        }
	    }).open();
	}

</script>
<script>
	//이메일 입력방식 선택
	$('#cus_email2').change(function(){
	   $("#cus_email2 option:selected").each(function () {
			
			if($(this).val()== '0'){ //직접입력일 경우
				 $("#cus_email3").val('');                        //값 초기화
				 $("#cus_email3").attr("disabled",false); //활성화
			}else{ //직접입력이 아닐경우
				 $("#cus_email3").val($(this).text());      //선택값 입력
				 $("#cus_email3").attr("disabled",true); //비활성화
			}
	   });
	});
	</script>
	<script>
	function modifyCheck(){
		if((!joinform.passwd.value)){
			alert("비밀번호를 입력하세요")
			return false;
		}
	
		if(! joinform.address2.value){
			alert("상세주소를 입력하세요")
			return false;
		}
		if( (!joinform.tel1.value)||(!joinform.tel1.value)||(!joinform.tel1.value)){
			alert("전화번호를 입력하세요")
			return false;
		}
		
	}
</script>





<%@include file="tail.jsp"%>

