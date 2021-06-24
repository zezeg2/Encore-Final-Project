<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="setting.jsp"%>
<%@include file="header.jsp" %>
		

		<!-- Container -->
		<div class="container">
			<div class="grid_container" style="margin:0 auto; width:60%;">
				<c:if test="${result eq 0}">
					<h3 class="fs-4 my-4 text-center text-white">등록하신 라이브 예고가 없습니다.</h3>
				</c:if>
				
				
				<c:if test="${result ne 0}">
				
				<h3 class="fs-4 my-4 text-center text-white">${sessionScope.user_id}님의 라이브 예고 현황</h3>
					<table class="table table-sm table-responsive-lg table-striped table-hover text-center mt-3 mb-5 text-white">
						<thead>
							<tr>
								<th scope="col" class="order_no" style="background-color: #7550e6;">방 번호</th>
								<th scope="col" class="order_date" style="background-color: #7550e6;">방 제목</th>
								<th scope="col" class="menu_name" style="background-color: #7550e6;">상품명</th>
								<th scope="col" class="menu_name" style="background-color: #7550e6;">가격</th>
								<th scope="col" class="menu_name" style="background-color: #7550e6;">방송 예정일</th>
								<th scope="col" class="menu_name" style="background-color: #7550e6;">방송 시작하기</th>
							</tr>
						</thead>
						<c:forEach var="i" begin="0" end="${fn:length(Trailer_dto)-1}" step="1">
							<c:set var="count" value="${counts[i]}" />
							<c:set var="cusorder" value="${Trailer_dto[i]}" />
							<tr class="text-white" style="height: 40px; vertical-align: middle;">
								<td scope="row">${cusorder.trailer_id}</td>
								<td scope="row">${cusorder.trailer_title}</td>
								<td scope="row">${cusorder.trailer_name}</td>
								<td scope="row">${cusorder.trailer_price}원</td>
								<td scope="row">${cusorder.trailer_launchdate}</td>
								<td scope="row">
									<button type="button" class="btn p-0 text-white" style="background-color:#ef3d55; width: 120px" onclick="location.href='trailer_product_insert_form.go?trailer_id=${cusorder.trailer_id}'">방송하기</button>
								</td>
							</tr>
						</c:forEach>
					</table>
				</c:if>
			</div>
			
		</div>

		
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