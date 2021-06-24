<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="setting.jsp"%>
<%@include file="header.jsp" %>


		<div class="container">
		<div class="grid_container" style="margin:0 auto; width:60%;">
			<c:if test="${result eq 0}">
				<h3 class="fs-4 my-4 text-center text-white">주문이력이 없습니다</h3>
			</c:if>
			<c:if test="${result ne 0}">
				<h3 class="fs-4 my-4 text-center text-white">${sessionScope.user_id}님의 주문 목록</h3>
				<table class="table table-sm  table-striped text-center mt-3 mb-5 text-white" style="background-color: #212529;">
					<thead>
						<tr>
							<th scope="col" class="order_no" style="background-color: #7550e6;">주문번호</th>
							<th scope="col" class="order_date" style="background-color: #7550e6;">날짜</th>
							<th scope="col" class="menu_name" style="background-color: #7550e6;">주문 품목</th>
							<th scope="col" class="menu_name" style="background-color: #7550e6;">주문 상세 페이지</th>
							<th scope="col" class="menu_name" style="background-color: #7550e6;">리뷰 작성</th>
						</tr>
					</thead>
					<c:forEach var="i" begin="0" end="${fn:length(cusorderlist)-1}" step="1">
						<script>
							$(document).ready(function(){
							  $("#review_button${i}").click(function(){
							    $("#review_toggle${i}").toggle(300);
							  });
							});
						</script>
						<c:set var="count" value="${counts[i]}" />
						<c:set var="cusorder" value="${cusorderlist[i]}" />
						<tr class="text-white" style="height: 40px; vertical-align: middle;">
							<td scope="row">${cusorder.order_num}</td>
							<td class="py-3" scope="row">
								<fmt:formatDate value="${cusorder.order_date}" pattern="yyyy-MM-dd HH:mm" />
							</td>
							<td class="py-3" scope="row">${cusorder.product_name}</td>
							<td scope="row">
								<button type="button" class="btn p-1 text-white round-button" style="background-color:#a26de1; width: 120px" onclick="location.href='detailed_order_history.go?order_num=${cusorder.order_num}&order_date=${cusorder.order_date}'">주문 상세정보</button>
							</td>
							<td scope="row">
								<button id="review_button${i}" type="button" class="btn p-1 text-white round-button" style="background-color:#55765c; width: 120px">리뷰 작성</button>
							</td>
						</tr>
						<tr id="review_toggle${i}" style="display:none;">
							<td colspan=5>
								<div class="row my-4" style="width:500px; margin:0 auto;">
									<form class="p-1" action="product_review_pro.go" name="commentInsertForm" id="form" method="POST" enctype="multipart/form-data" style="margin:0 auto">
										<div class="text-center d-flex flex-inline">
											
											<p class="fs-6 m-2 text-center text-white p-1" style="width:120px;background-color: #7f5cad;border-radius: 1rem;">평점</p>
											
											<label class="reviewRatings mx-1" style="padding: 10px;">5점
												<input type="radio" name="review_score" value="5" checked>	<span class="checkmark"></span>
											</label>
											<label class="reviewRatings mx-1" style="padding: 10px;">4점
												<input type="radio" name="review_score" value="4">	<span class="checkmark"></span>
											</label>
											<label class="reviewRatings mx-1" style="padding: 10px;">3점
												<input type="radio" name="review_score" value="3">	<span class="checkmark"></span>
											</label>
											<label class="reviewRatings mx-1" style="padding: 10px;">2점
												<input type="radio" name="review_score" value="2">	<span class="checkmark"></span>
											</label>
											<label class="reviewRatings mx-1" style="padding: 10px;">1점
												<input type="radio" name="review_score" value="1">	<span class="checkmark"></span>
											</label>
										</div>
										
										<div class="input-group mb-3" style="width:450px">
											<p class="fs-6 m-2 text-center text-white p-1" style="width:120px;background-color: #7f5cad;border-radius: 1rem;">Photo</p>
											<input type="file"  class="form__input" name="review_image" id="review_image" accept=".gif, .jpg, .png, .jpeg" style="background-color: #cfc4d6;height:27px;border-radius: 1rem;margin: auto;">
										</div>
										<div class="input-group">
											<input type="hidden" name="session" value="${sessionScope.user_id}" />
											<input type="hidden" id="product_id" name="product_id" value="${cusorder.product_id}" />
											
											<textarea class="form-control my-2" id="review_content" name="review_content" rows="10" cols="30" style="background-color: #cfc4d6;"></textarea>
											
											
										</div>
										<div class="form__field">
												<button class="round-button" style="width: 250px;margin:0 auto;height: 50px;border-radius: 3rem;" type="submit" >리뷰 등록</button>
											</div>
									</form>
									<div class="commentList p-1 my-1" style="width: 960;margin: auto;margin-top: 50;"></div>
								</div>
							</td>
					</c:forEach>
				</table>
			</c:if>
		</div>
	</div>
	
			
	<script>
	$(document).ready(function(){
	  $("#review_button").click(function(){
	    $("#review_toggle").toggle(300);
	  });
	});
	</script>	
	<script>
	$(document).ready(
			function() {
	$('.clickableRow').on(
			'click',
			function(event) {
				window.location=$(this).data('href');
			}
		);
	}
			
	);
	</script>
	<%@include file="tail.jsp"%>
