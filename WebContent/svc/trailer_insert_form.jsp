<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="setting.jsp" %>
<%@ include file="header.jsp" %>


<h3 class="fs-4 my-4 text-center text-white">라이브로 판매예정인 상품정보를 입력해주세요</h3>
<form class="form form--login my-2" name="inputform" id="inputform" action="trailer_insert_pro.go" method="post" enctype="multipart/form-data" style="width: 700px; margin:0 auto;">
	<div class="form__field">
		<label for="trailer_name" class="col-sm-3 col-form-label text-center" style="color:white;background-color: #7f5cad;">상품 명</label>
		<input class="form__input" type="text" name="trailer_name" id="trailer_name" maxlength="50" style="color:white;background-color: #cfc4d661;">
	</div>
	<div class="form__field">
		<label for="trailer_name" class="col-sm-3 col-form-label text-center" style="color:white;background-color: #7f5cad;">방제목</label>
		<input class="form__input" type="text" name="trailer_title" id="trailer_title" maxlength="50" style="color:white;background-color: #cfc4d661;">
	</div>
	<div class="form__field">
		<label for="trailer_price" class="col-sm-3 col-form-label text-center" style="color:white;background-color: #7f5cad;">상품 가격</label>
		<input class="form__input" type="number" name="trailer_price" id="trailer_price" maxlength="20" style="color:white;background-color: #cfc4d661;">
	</div>
	<div class="form__field">
		<label for="trailer_price" class="col-sm-3 col-form-label text-center" style="color:white;background-color: #7f5cad;">라이브 예정 일정</label>
		<input class="form__input text-center" type="datetime-local" name="trailer_launchdate" id="trailer_launchdate" maxlength="20" style="color:white;background-color: #cfc4d661;">
	</div>
	<div class="form_field">
		<label for="trailer_detail" class="col-sm-3 col-form-label text-center fs-5 p-2 mb-1" style="color:white; background-color: #7f5cad; width:140px; border-radius:2rem;">라이브 소개</label>
		<textarea class="form-control mb-3" name="trailer_detail" id="trailer_detail" rows="10" cols="30" style="background-color: #cfc4d6;"></textarea>
	</div>
	<div class="input-group mb-3">
		<p class="fs-6 m-1 text-center text-white p-1" style="width:120px;background-color: #7f5cad;border-radius: 1rem;">상품 이미지</p>
		<input class="form__input" type="file" name="trailer_image" id="trailer_image" accept=".gif, .jpg, .png, .jpeg" style="background-color: #cfc4d6;height:27px;border-radius: 1rem;margin: auto;">
	</div>
	<div class="form__field">
		<p class="fs-6 m-1 text-center text-white p-1" style="width:120px;background-color: #7f5cad;border-radius: 1rem;">광고 영상</p>
		<input class="form__input" type="file" id="file-chooser" style="background-color: #cfc4d6;height:27px;border-radius: 1rem;margin: auto;" />
	</div>
	<input type="hidden" name="session" id="session" value="${user_id}" />
	<input type="hidden" name="trailer_id" value="${trailer_id}" />
	<div id="results" style="text-align:center;">
	</div>
	<div class="form__field">
		<button class="round-button" type="button" id="upload-button" style="margin-left: 32%;width: 250px;height: 50px;background-color: #7550e6;border-radius: 2rem;">라이브 예고 등록</button>
	</div>
</form>


 <script type="text/javascript">

 
	 AWS.config.region = 'us-east-1'; // 1. Enter your region
	 AWS.config.update({
	 	"accessKeyId": "",
	 	"secretAccessKey": "",
	 	"region": "us-east-1"
	 });
	 var bucketName = 'cdn-video-source71e471f1-1w5ehaaqw3boh'; // Enter your bucket name
	 var bucket = new AWS.S3({
	 	params: {
	 		Bucket: bucketName
	 	}
	 });
	 var fileChooser = document.getElementById('file-chooser');
	 var button = document.getElementById('upload-button');
	 var results = document.getElementById('results');
	 var session = $('#session').val();
	 button.addEventListener("click", function() {
	 	var file = fileChooser.files[0];
	 	if(file) {
	 		button.style.display='none';
	 		results.innerHTML = '<img src="${project}img/ezgif.com-gif-maker.gif" style="width:200px;" ><br><h4 class="text-white fs-5">Uploading(약 30초 소요)</h4>';
	 		var objKey = 'assets01/' + session + file.name;
	 		var params = {
	 			Key: objKey,
	 			ContentType: file.type,
	 			Body: file,
	 			ACL: 'public-read'
	 		};
	 		bucket.putObject(params, function(err, data) {
	 			if(err) {
	 				results.innerHTML = 'ERROR: ' + err;
	 				document.getElementById('inputform').submit();
	 			} else {
	 				console.log(data);
	 				var s3 = new AWS.S3();
	 				var timer = setInterval(function() {
	 					console.log("hello");
	 					s3.getObject({
	 						Bucket: "cdn-video-source71e471f1-1w5ehaaqw3boh",
	 						Key: "jobs-manifest.json"
	 					}, function(err, data) {
	 						if(err) console.log(err, err.stack);
	 						else data = data.Body.toString();
	 						data = JSON.parse(data);
	 						data = data.Jobs.filter(function(element) {
	 							if(element.Job != undefined) {
	 								return element.Job.Settings.Inputs[0].FileInput == 's3://cdn-video-source71e471f1-1w5ehaaqw3boh/assets01/' + session + file.name;
	 								//return element.Job.Settings.Inputs[0].FileInput == 's3://cdn-video-source71e471f1-1w5ehaaqw3boh/assets01/adminpexels-c-technical-6121389.mp4';
	 							} else {
	 								return element.InputFile == 's3://cdn-video-source71e471f1-1w5ehaaqw3boh/assets01/' + session + file.name;
	 							}
	 						});
	 						console.log(data.length);
	 						if(data.length != 0) {
	 							if(data[0].Outputs != undefined) {
	 								trailer_aws_url = data[0].Outputs.HLS_GROUP[0];
	 								console.log(trailer_aws_url);
	 								//console.log(typeof(trailer_aws_url));
	 								//console.log(typeof(trailer_aws_url.value));
	 								results.innerHTML = '<input type="hidden" name="trailer_aws_url" id="trailer_aws_url" value="' + trailer_aws_url + '">'
	 								document.getElementById('inputform').submit();
	 								clearInterval(timer);
	 							} else {
	 								alert("파일 업로드 중 문제가 발생했습니다. 다시 시도해 주세요.");
	 								clearInterval(timer);
	 								location.reload();
	 							}
	 						} else {
	 							console.log("data is not detected")
	 						}
	 					})
	 				}, 30000);
	 				timer;
	 			}
	 		});
	 	} else {
	 	 	var trailer_name= inputform.trailer_name.value;
	 	 	var trailer_title= inputform.trailer_title.value;
	 	 	var trailer_price= inputform.trailer_price.value;
	 	 	var trailer_launchdate= inputform.trailer_launchdate.value;
	 	 	var trailer_detail= inputform.trailer_detail.value;
	 	 	if (trailer_name == "" || trailer_name == null) {
	 	         alert("상품 명 을 입력하지 않았습니다.");
	 	         productform.product_title.focus();
	 	         return false;
	 	     }
	 	 	if (trailer_title == "" || trailer_title == null) {
	 	 		alert("제목 을 입력하지 않았습니다.");
	 	 		productform.product_name.focus();
	 	 		return false;
	 	 	}
	 	 	
	 	 	if (trailer_price == "" || trailer_price == null) {
	 	 		alert("가격 을 입력하지 않았습니다.");
	 	 		productform.product_price.focus();
	 	 		return false;
	 	 	}
	 	 	if (trailer_launchdate == "" || trailer_launchdate == null) {
	 	 		alert("라이브 날짜 을 입력하지 않았습니다.");
	 	 		productform.product_detail.focus();
	 	 		return false;
	 	 	}
	 	 	if (trailer_detail == "" || trailer_detail == null) {
	 	 		alert("상품 설명 을 정하지 않았습니다.");
	 	 		productform.product_category.focus();
	 	 		return false;
	 	 	}
	 		results.innerHTML = 'Nothing to upload.';
	 		document.getElementById('inputform').submit();
	 	}
	 }, false);
 </script>
<%@include file="tail.jsp"%>