<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="setting.jsp"%>
<%@include file="header.jsp"%>
<script src="${project}script.js"></script>
<script src="./jquery-3.3.1.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="cus/cus_cart/cus_cart_script.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3619266ca6391650a5506641423333bd&libraries=services,clusterer,drawing"></script>

<!-- Descriptor Jumbotron -->
		
			<h3 class="fs-4 my-4 text-center text-white">주문서 작성</h3>
		
		

<form class="form form--login my-2" name="cus_pay_form" method='post' action='order_insert_pro.go' onsubmit="return cus_pay_check();" style="width: 700px; margin:0 auto;">

		<input type="hidden" name="user_id" id="user_id" value="${userDto.user_id}">
		<div class="form__field">
			<label for="product_title" class="col-sm-3 col-form-label text-center" style="color:white;background-color: #7f5cad;">아이디</label>
			<input class="form-control border-0 p-2" type="text" value="${userDto.user_id}" readonly style="color:white;background-color: #cfc4d661;">
			
		</div>
		<div class="form__field">
			<label for="product_name" class="col-sm-3 col-form-label text-center" style="color:white;background-color: #7f5cad;">주문자 성명</label>
			<input class="form-control border-0 p-2" type="text" value="${userDto.user_name}" readonly style="color:white;background-color: #cfc4d661;">
		</div>
		<div class="form__field">
			<label for="product_price" class="col-sm-3 col-form-label text-center" style="color:white;background-color: #7f5cad;">이메일</label>
			<input class="form-control border-0 p-2" type="text" value="${userDto.user_email}" readonly style="color:white;background-color: #cfc4d661;">
		</div>
		<div class="form__field">
			<label for="product_price" class="col-sm-3 col-form-label text-center" style="color:white;background-color: #7f5cad;">전화번호</label>
			<input class="form-control border-0 p-2" type="text" value="${userDto.user_phone}" readonly style="color:white;background-color: #cfc4d661;">
		</div>
		<div class="form__field">
			<label for="product_price" class="col-sm-3 col-form-label text-center" style="color:white;background-color: #7f5cad;">배송받을 주소</label>
			<input class="form-control border-0 p-2" type="text" name="user_addr" id="user_addr"  value="${userDto.user_addr}" style="color:white;background-color: #cfc4d661;">
			<input class="btn btn-md btn-secondary  p-2 border-0 round-button" type="button" onclick="sample4_execDaumPostcode()" value="주소 찾기" style="margin: 4px; margin-right=0px; background-color: #4a7b7b; height:40px">
			<input class="btn btn-md btn-secondary  p-2 border-0 round-button" type="button" id="currentLocation" onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')" value="현재 주소" style="margin: 4px; background-color: #4a7b7b; height:40px;">
		</div>
		<div class="form__field">
			<label for="product_price" class="col-sm-3 col-form-label text-center" style="color:white;background-color: #7f5cad;">상세 주소</label>
			<input class="form-control border-0 p-2" type="text" name="user_addr2" id="user_addr2" value="${userDto.user_addr2}" style="color:white;background-color: #cfc4d661;">
		</div>
		<div class="form_field">
			<label for="product_detail" class="col-sm-3 col-form-label text-center fs-5 p-2" style="color:white; background-color: #7f5cad00; width:200px;">주문하실 상품 정보</label>
			<div class="row" id="ordered_menus"></div>
		</div>
		
		<div class="form__field">
			<input class="btn btn-primary border-0" type="submit" value="주문 등록" style="width:250px; margin-left: 32%; border-radius:2rem;">
		</div>
	</form>
	
 


<script>
setMenusForPay('sessionStorage');


$(document).ready(function(){
    $("#currentLocation").click(function(){
    });
});






function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 도로명 조합형 주소 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }

            document.getElementById('user_addr').value = data.jibunAddress;
            self.close();

        }
    }).open();
    
    
}

function setCurrentLocation() {
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 1 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
    infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
searchAddrFromCoords(map.getCenter(), displayCenterInfo);

// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
        if (status === kakao.maps.services.Status.OK) {
            var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
            detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
            
            var content = '<div class="bAddr">' +
                            '<span class="title">법정동 주소정보</span>' + 
                            detailAddr + 
                        '</div>';

            // 마커를 클릭한 위치에 표시합니다 
            marker.setPosition(mouseEvent.latLng);
            marker.setMap(map);

            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
            infowindow.setContent(content);
            infowindow.open(map, marker);
        }   
    });
});

// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'idle', function() {
    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
});

function searchAddrFromCoords(coords, callback) {
    // 좌표로 행정동 주소 정보를 요청합니다
    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
}

function searchDetailAddrFromCoords(coords, callback) {
    // 좌표로 법정동 상세 주소 정보를 요청합니다
    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
}

// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
function displayCenterInfo(result, status) {
    if (status === kakao.maps.services.Status.OK) {
        var infoDiv = document.getElementById('centerAddr');

        for(var i = 0; i < result.length; i++) {
            // 행정동의 region_type 값은 'H' 이므로
            if (result[i].region_type === 'H') {
                infoDiv.innerHTML = result[i].address_name;
                break;
            }
        }
    }    
}
		
	
}

//주문표 출력


function setMenusForPay(storageLocation){
	var storageLoc=eval('sessionStorage');
	var orderDetail = JSON.parse(storageLoc.getItem("order"));
	var total_pay = 0;
    var x = "";
    x+=	'<div class="container">';
    x+= 	'<table class="table table-sm table-hover text-center" style="background-color: #cabfea;">';
    x+=			'<thead>'
    x+= 			'<tr>';
    x+=					'<th scope="col">';
    x+=						'제품명';
    x+=					'</th>';
    x+=					'<th scope="col">';
    x+=						'가격';
    x+=					'</th>';
    x+=					'<th scope="col">';
    x+=						'수량';
    x+=					'</th>';
    x+=					'<th scope="col">';
    x+=						'전체 가격 ';
    x+=					'</th>';
    x+= 			'</tr>';
    x+= 		'</thead>';
    x+= 		'<tbody>';    

    for(i in orderDetail){
    	x+=			'<tr>';
    	x+=		 		'<td>';
    	x+=					orderDetail[i].product_name;
    	x+=		 		'</td>';
    	x+=		 		'<td>';
    	x+=					orderDetail[i].product_price;
    	x+=					'원';
    	x+=		 		'</td>';
    	x+=		 		'<td>';
    	x+=					orderDetail[i].product_qnt;
    	x+=					'개';
    	x+=		 		'</td>';
    	
		
    	x += '<input type="hidden" id="menu_id" name="product_id" value="'+orderDetail[i].product_id+'">';
    	x += '<input type="hidden" id="order_qnt" name="product_qnt" value="'+orderDetail[i].product_qnt+'">';
    	x += '<input type="hidden" id="ordered_menus" name="ordered_menus" value="'+orderDetail+'">';
    	
    	total_pay +=orderDetail[i].product_price*orderDetail[i].product_qnt;
    }
    x+=		 		'<td>';
	x+=					total_pay;
	x+=					'원';
	x+=		 		'</td>';
    x+=		 	'</tr>';
    x+= '</table>';
    document.getElementById("ordered_menus").innerHTML = x;
} 



//주문표 삭제
function deleteMenu(index){
	
	var order = JSON.parse(localStorage.getItem("order"));
	
	if(order.length==1){
		localStorage.removeItem("order")
	}else{
		delete order[index];
		//order = JSON.stringify(order);
		var neworder =[];
		for(var i=0; i<order.length;i++){
			if(i==index){
				
			}else{
				neworder.push(order[i]);
			}
		}
		
		neworder = JSON.stringify(neworder);
		
		localStorage.setItem("order",neworder);
	}
	
	setMenus('localStorage');
}



</script>

<%@include file="tail.jsp"%>