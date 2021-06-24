<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@include file="setting.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@include file="header.jsp" %>

	<div class="container-fluid">
		<c:choose>
			<c:when test="${count*trailerCount eq 0}">
				<h3 class="fs-4 my-4 text-center text-white">"${keyword}"로 검색된 결과가 없습니다.</h3>
			</c:when>
			<c:when test="${count*trailerCount ne 0}">
				<div class="row">
					<c:if test="${count eq 0}">
						<h3 class="fs-4 m-4  text-white">"${keyword}" 로 검색된 라이브 방송이 없습니다.</h3>
					</c:if>
					<c:if test="${count ne 0}">
						<h3 class="fs-4 m-4  text-white">"${keyword}" 로 검색된 라이브 방송입니다.</h3>
						<hr>
						<c:forEach var="menu" items="${foundList}">
							<input type="hidden" id="user_charn${menu.product_id}" name="user_charn${menu.product_id}" value="${menu.user_charn}">
							<div class="col-sm-3 d-flex justify-content-center">
								<div class="card bg-black my-4" style="background-color: #151515; width: 362px;">
									<input type="hidden" name="aws_url" id="aws_url" value="${menu.aws_url}" />
									<video autoplay id="video-player${menu.product_id}" style="width: 100%; height:200px;" muted="muted"></video>
									<img id="ready-image${menu.product_id}" src="${project}img/19-1.jpg" width="100%" height="auto">
									<div class="card-body text-center font-weight-bold flex-fill p-1" style="background-color:#151515;">	<a href="product_detail.go?product_id=${menu.product_id}" class="btn btn-danger stretched-link p-0"> ON AIR </a>
										<input class="text-center m-1" type="text" id="aa${menu.product_id}" name="aa${menu.product_id}" readonly style="color:white;background-color: #ffffff00; width:80px">
										<hr class="m-1">
										<div class="m-1">
											<div class="row m-0">
												<p class="card-text my-1 fs-6" style="color:#D8D8D8; text-align: initial;">${menu.product_title}</p>
											</div>
											<hr class="m-1">
											<div class="row m-0">
												<div class="col-4 px-0">
													<img src="menu_images/${menu.product_image}" alt="Menu Img" style="width:100%; height:100px; margin:0 auto;">
												</div>
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
					</c:if>
				</div>
				<hr class="m-0">
				<div class="row">
					<c:if test="${trailerCount eq 0}">
						<h3 class="fs-4 m-4  text-white">"${keyword}" 로 검색된 라이브예고가 없습니다.</h3>
					</c:if>
					<c:if test="${trailerCount ne 0}">
						<h3 class="fs-4 m-4  text-white">"${keyword}" 로 검색된 라이브예고 입니다.</h3>
						<hr>
						<c:forEach var="menu" items="${foundTrailerList}">
							<div class="col-sm-3 d-flex justify-content-center">
								<div class="card bg-black mt-5" style="background-color: #151515; width: 362px;">
									<c:if test="${menu.trailer_aws_url eq null}">
										<img class="card-img-top img-fluid" src="menu_images/${menu.trailer_image}" alt="Menu Img" style="width: 360px; height: 270px;">
									</c:if>
									<!--  -->
									<c:if test="${menu.trailer_aws_url ne null}">
										<video id=video${menu.trailer_id} class="video-js vjs-big-play-centered" style="width: 100%;" autoplay muted="muted">
											<source src="${menu.trailer_aws_url}" type="application/x-mpegURL">
										</video>
									</c:if>
									<input type=hidden name="showdate" value="${menu.trailer_launchdate}">
									<div class="card-body text-center font-weight-bold flex-fill" style="background-color:#151515;"> <b class="card-title" style="color:#D8D8D8;">${menu.trailer_name}</b>
										<p class="card-text" style="color:#D8D8D8;">${menu.trailer_price}원</p> <a href="trailer_detail.go?trailer_id=${menu.trailer_id}" class="btn btn-primary stretched-link">라이브 예정일시 : 
							  <script>
							 	var showdate = $("input[name=showdate]").val();
							 	showdate = showdate.slice(0,16);
							 	document.write(showdate);
							  </script>
							  </a>
									</div>
								</div>
							</div>
							<script type="text/javascript">
								var player = videojs('video${menu.trailer_id}');
								player.play();
							</script>
						</c:forEach>
					</c:if>
				</div>
			</c:when>
		</c:choose>
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
