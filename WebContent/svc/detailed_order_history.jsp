<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="setting.jsp"%>
<%@include file="header.jsp" %>
<script src="${project}script.js"></script>
	
	
	<div class="container">
		<div class="grid_container" style="margin:0 auto; width:60%;">
		<h3 class="fs-4 my-4 text-center text-white">주문 상세보기</h3>
		<h3 class="fs-6 mb-5 text-center text-white">주문 일시 : ${order_date}</h3>

		<table class="table table-sm table-responsive-lg table-striped table-hover text-center mt-2 mb-5">
				<thead class="text-white">

					<tr class="text-white">
						<th scope="col" style="background-color: #7550e6;">아이템</th>
						<th scope="col" style="background-color: #7550e6;">수량</th>
						<th scope="col" style="background-color: #7550e6;">주소</th>

						<th scope="col" style="background-color: #7550e6;">금액</th>
						
					</tr>
				</thead>
				
				<c:forEach var="order_historyDto" items="${order_historyDto}">
				<c:set var="total" value="${order_historyDto.order_qnt * order_historyDto.product_price }"/>
				
					<tr class="text-white">
						<td class="py-3" scope="row">
							${order_historyDto.product_name}
						</td>
						<td class="py-3" scope="row">
							${order_historyDto.order_qnt}
						</td>
						<td class="py-3" scope="row">
							${order_historyDto.user_addr} ${order_historyDto.user_addr2}
						</td>
						
						

						
						<td class="py-3" scope="row">
							
							${order_historyDto.product_price }
							
						</td>
						
					</tr>
				
				<tr class="text-white">
					<td class="py-3" scope="row" colspan="2">
						<b class="fs-5">Total</b>
					</td>
					<td class="py-3 fs-5" scope="row">
						<c:out value="${total}"/>
					</td>
					<td class="py-3" scope="row">
							<button class="round-button" type="button" onclick="location.href='product_detail.go?product_id=${order_historyDto.product_id}'">상품페이지</button>

						</td>
					
				</tr>
				
				</c:forEach>
			</table>
		</div>
	</div>
		
		<%@include file="tail.jsp"%>