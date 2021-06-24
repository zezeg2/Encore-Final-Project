<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<div style="width: auto; margin: 0 auto; margin-top: 30px;">

	<div class="row my-4" style="width:960px; margin:0 auto;">
				<label class="text-center p-1" for="content" style="width:80px; background-color: #8b7fac;font-size: 20;border-radius: 5px;padding: 5px;color: beige">Review</label>
				<h1 id="product_name"></h1>
				<form class="p-1" action="product_review_pro.go" name="commentInsertForm" id="form" method="POST" enctype="multipart/form-data" style="margin:0 auto">
						
						
						<div class="text-center d-flex flex-inline">
							<label class="reviewRatings">5점
								<input type="radio" name="review_score" value="5" checked>
								<span class="checkmark"></span>
							</label>
							
							<label class="reviewRatings">4점
								<input type="radio" name="review_score" value="4">
								<span class="checkmark"></span>
							</label>
							
							<label class="reviewRatings">3점
								<input type="radio" name="review_score" value="3">
								<span class="checkmark"></span>
							</label>
							
							<label class="reviewRatings">2점
								<input type="radio" name="review_score" value="2">
								<span class="checkmark"></span>
							</label>
							
							<label class="reviewRatings">1점
								<input type="radio" name="review_score" value="1">
								<span class="checkmark"></span>
							</label>
						</div>			
					<input type="file" class="form-control" name="review_image" id="review_image" accept=".gif, .jpg, .png, .jpeg" style="background-color: #cfc4d6;">
					<div class="input-group">
						<input type="hidden" name="session" value="${sessionScope.user_id}" />
						<input type="hidden" id="product_id" name="product_id" />
						<input type="text" class="form-control text-white" id="review_content" name="review_content" placeholder="리뷰"> <span class="input-group-btn">
								<button class="btn btn-default text-white p-0 m-2" type="submit">Enter</button>
							</span>
					</div>
				</form>
				<div class="commentList p-1" style="width: 960;margin: auto;margin-top: 50;"></div>
		</div>
		</div>
	<script type="text/javascript"> //ajax
	function getQuerystring(paramName){
	
		var _tempUrl = window.location.search.substring(1); //url에서 처음부터 '?'까지 삭제
		var _tempArray = _tempUrl.split('&'); // '&'을 기준으로 분리하기
		
		for(var i = 0; _tempArray.length; i++) {
			var _keyValuePair = _tempArray[i].split('='); // '=' 을 기준으로 분리하기
			
			if(_keyValuePair[0] == paramName){ // _keyValuePair[0] : 파라미터 명
				// _keyValuePair[1] : 파라미터 값
				return _keyValuePair[1];
			}
		}
	}
	document.getElementById("product_id").value = getQuerystring('product_id')
	document.getElementById("product_name").value = getQuerystring('product_name')
	$('#product_name').text(getQuerystring('product_name'));
		</script>
	
		  <%@include file="tail.jsp"%>
