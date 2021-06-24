<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@include file="setting.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@include file="header.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<c:forEach var="menu" items="${Trailer_dto}">
				<div class="col-sm-3 d-flex justify-content-center">
					<div class="card bg-black mt-5" style="background-color: #151515; width: 362px;">
						<c:if test="${menu.trailer_aws_url eq null}">
							<img class="card-img-top img-fluid" src="menu_images/${menu.trailer_image}" alt="Menu Img" style="width: 360px; height: 270px;">
						</c:if>
						<!--  -->
						<c:if test="${menu.trailer_aws_url ne null}">
							<video id=video${menu.trailer_id} class="video-js vjs-big-play-centered" style="width: 100%; height:270px;" loop autoplay muted="muted">
								<source src="${menu.trailer_aws_url}" type="application/x-mpegURL">
							</video>
						</c:if>
						<input type=hidden name="showdate${menu.trailer_id}" value="${menu.trailer_launchdate}">
						<div class="card-body text-center font-weight-bold flex-fill p-1" style="background-color:#151515; ;">
						<a href="trailer_detail.go?trailer_id=${menu.trailer_id}" class="btn btn-primary stretched-link p-1 border-0" style="width:100%;background-color:#3946a7;">라이브 예정일시 : 
						  <script>
						 	var showdate = $("input[name=showdate${menu.trailer_id}]").val();
						 	showdate = showdate.slice(0,16);
						 	document.write(showdate);
						  </script>
						  </a>
							<div class="m-1">
								<div class="row m-0"><p class="card-text my-1 fs-6" style="color:#D8D8D8; text-align: initial;">${menu.trailer_title}</p></div><hr class="m-1">
								<div class="row m-0">
									<c:if test="${menu.trailer_aws_url ne null}"><div class="col-4 px-0"><img src="menu_images/${menu.trailer_image}" alt="Menu Img" style="width:100%; height:100px; margin:0 auto;"></div></c:if>
									<div class="col-8 px-4">
										<p class="card-title fs-6" style="color:#D8D8D8; text-align:initial; margin-top:20px">${menu.trailer_name}</p>
										<p class="card-text fs-6" style="color:#D8D8D8; text-align:initial; margin-top:15px">${menu.trailer_price}원</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<script type="text/javascript">
					var player = videojs('video${menu.trailer_id}');
					player.play();
				</script>
			</c:forEach>
		</div>
	</div>
<%@include file="tail.jsp" %>