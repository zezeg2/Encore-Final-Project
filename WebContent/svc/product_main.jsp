<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@include file="setting.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@include file="header.jsp" %>
		
		<div class="container-fluid" style="padding: 0;">
			<!-- Carousel (Ads) -->
			<div id="ads" class="carousel slide" data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#ads" data-slide-to="0" class="active"></li>
					<li data-target="#ads" data-slide-to="1" class="active"></li>
					<li data-target="#ads" data-slide-to="2"></li>
					<li data-target="#ads" data-slide-to="3"></li>
					<li data-target="#ads" data-slide-to="4"></li>
					<li data-target="#ads" data-slide-to="5"></li>
					
				</ol>
				<div class="carousel-inner" style="height: 400px; width: 100%;">
					<div class="carousel-item active">
						<img class="d-block h-75 newTrex" src="${project}img/banner.png" alt="First Slide">
					</div>
					<div class="carousel-item">
						<img class="d-block h-75" src="${project}img/2.jpg" alt="Second Slide">
					</div>
					<div class="carousel-item">
						<img class="d-block h-75" src="${project}img/3.jpg" alt="Third Slide">
					</div>
					<div class="carousel-item">
						<img class="d-block h-75" src="${project}img/4.jpg" alt="Third Slide">
					</div>
					<div class="carousel-item">
						<img class="d-block h-75" src="${project}img/5.jpg" alt="Third Slide">
					</div>
					<div class="carousel-item">
						<img class="d-block h-75" src="${project}img/6.jpg" alt="Third Slide">
					</div>
				</div>
				<a class="carousel-control-prev" href="#ads" role="button" data-slide="prev">	<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a>
				<a class="carousel-control-next" href="#ads" role="button" data-slide="next">	<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="sr-only">Next</span>	
				</a>
			</div>
		</div>
		

		<div class="container-fluid">
			<div class="row">
				<c:forEach var="menu" items="${menus}">
				<input type="hidden" id="user_charn${menu.product_id}" name="user_charn${menu.product_id}" value="${menu.user_charn}">
					<div class="col-sm-3 d-flex justify-content-center">
						<div class="card bg-black my-4" style="background-color: #151515; width: 362px;">
							<input type="hidden" name="aws_url" id="aws_url" value="${menu.aws_url}" />
							<video autoplay id="video-player${menu.product_id}" style="width: 100%; height:200px;" muted="muted"></video>
							<img id="ready-image${menu.product_id}" src="${project}img/19-1.jpg" width="100%" height="auto">
							<div class="card-body text-center font-weight-bold flex-fill p-1" style="background-color:#151515;">
								<a href="product_detail.go?product_id=${menu.product_id}" class="btn btn-danger stretched-link p-0"> ON AIR </a>
								<input class="text-center m-1" type="text" id="aa${menu.product_id}" name="aa${menu.product_id}" readonly style="color:white;background-color: #ffffff00; width:80px"><hr class="m-1">
								<div class="m-1">
								<div class="row m-0"><p class="card-text my-1 fs-6" style="color:#D8D8D8; text-align: initial;">${menu.product_title}</p></div><hr class="m-1">
								<div class="row m-0">
								<div class="col-4 px-0"><img src="menu_images/${menu.product_image}" alt="Menu Img" style="width:100%; height:100px; margin:0 auto;"></div>
								<div class="col-8 px-4">
								<p class="card-title fs-6" style="color:#D8D8D8; text-align:initial; margin-top:20px">${menu.product_name}</p>
								<p class="card-text fs-6" style="color:#D8D8D8; text-align:initial; margin-top:15px">${menu.product_price}원</p>
								</div>
								</div>
								
								</div>
								
							</div>
						</div>
					</div>
					<script type="text/javascript">
						var aws_url = $('#aws_url').val();
						if (IVSPlayer.isPlayerSupported) {
						  const player = IVSPlayer.create();
						  player.attachHTMLVideoElement(document.getElementById('video-player${menu.product_id}'));
						  player.load(aws_url);
						  player.play();
						}
						
						function ChennelViewCount() {
							
							var ivs = new AWS.IVS();
							var user_charn = $('#user_charn${menu.product_id}').val();
							var params = {
								'channelArn': user_charn
							};
							ivs.getStream(params, function(err, data) {
								if(err) document.getElementById("aa${menu.product_id}").value = "방송 준비중" // an error occurred
								
								else 
								var view_count = data.stream.viewerCount
									if(view_count === undefined){
										document.getElementById("aa${menu.product_id}").value = "방송 준비중"
										$("#video-player${menu.product_id}").hide();
										$("#ready-image${menu.product_id}").show();
									}
									else{
										document.getElementById("aa${menu.product_id}").value = view_count + "명";
										$("#video-player${menu.product_id}").show();
										$("#ready-image${menu.product_id}").hide();
									}
									
							});
						}
						ChennelViewCount();
						setInterval(ChennelViewCount, 10000);
						//ajax
						function commentInsert() { //댓글 등록 버튼 클릭시 
							var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
							CmtInsert(insertData); //Insert 함수호출(아래)
						}
					</script>
				</c:forEach>
			</div>
		</div>
		
		<script>
			AWS.config.update({
				"accessKeyId": "AKIAUUHFXRLVBFMMWAY3",
				"secretAccessKey": "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",
				"region": "us-east-1"
			});
			// AWS.config.loadFromPath('./config.json');
			AWS.config.region = 'us-east-1'; // 리전
		</script>
		
		<%@include file="tail.jsp" %>
