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
	 			<h3 class="fs-4 my-4 text-center text-white">판매 이력이 없습니다 </h3>
			</c:if>
			
			<c:if test="${result ne 0}">
			
			<h3 class="fs-4 my-4 text-center text-white">${sessionScope.user_id}님의 판매 목록</h3>
				<table class="table table-sm table-responsive-lg table-striped table-hover text-center mt-3 mb-5 text-white">
					<thead>
						<tr>
							<th scope="col" class="order_no" style="background-color: #7550e6;">주문번호</th>
							<th scope="col" class="order_date" style="background-color: #7550e6;">날짜</th>
							<th scope="col" class="menu_name" style="background-color: #7550e6;">주문내역</th>
						</tr>
					</thead>
			
				
				
				<c:forEach var="i" begin="0" end="${fn:length(cusorderlist)-1}" step="1">
					<c:set var="count" value="${counts[i]}"/>
					<c:set var="cusorder" value="${cusorderlist[i]}"/>
							<tr class="clickableRow text-white" data-href="detailed_order_history.go?order_num=${cusorder.order_num}&order_date=${cusorder.order_date}">
								<td class="py-3" scope="row">
									${cusorder.order_num}
								</td>
								<td class="py-3" scope="row">
									<fmt:formatDate value="${cusorder.order_date}" pattern="yyyy-MM-dd HH:mm"/>
								</td>
								<td class="py-3" scope="row">
									${cusorder.product_name}
								</td>
							</tr>
						</c:forEach>
				</table>
	</c:if>
		</div>
		
		</div>
	</body>

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