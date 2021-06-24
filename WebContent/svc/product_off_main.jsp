<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
		
	
		<div class="container-fluid">
			<div class="row">
				<c:forEach var="menu" items="${Produt_dto}">
					<div class="col-sm-3 d-flex justify-content-center">
						<div class="card bg-black mt-4 mb-4" style="background-color: #151515; width: 362px;">
					<img class="card-img-top img-fluid" src="menu_images/${menu.product_image}" alt="Menu Img" style="width: 360px; height: 270px;">
							<div class="card-body text-center font-weight-bold flex-fill" style="background-color:#151515;"> <b class="card-title" style="color:#D8D8D8;">${menu.product_name}</b>
								<p class="card-text" style="color:#D8D8D8;">${menu.product_price}원</p> <a href="product_off_detail.go?product_id=${menu.product_id}" class="stretched-link"> </a>
								<p class="card-text mt-4" style="color:#D8D8D8;">${menu.product_title}</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		
		
<%@include file="tail.jsp" %>
