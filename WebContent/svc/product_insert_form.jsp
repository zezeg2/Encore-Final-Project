<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="setting.jsp" %>
<%@ include file="header.jsp" %>



	<h3 class="fs-4 my-4 text-center text-white">상품에 대한 정보를 입력하세요</h3>
	<form class="form form--login my-2" name="productform" action="product_insert_pro.go" method="post" role="form" style="width: 700px; margin:0 auto;" enctype="multipart/form-data" onsubmit="return product_insert_check();">
		<div class="form__field">
			<label for="product_title" class="col-sm-3 col-form-label text-center" style="color:white;background-color: #7f5cad;">방송 제목</label>
			<input class="form__input" type="text" name="product_title" id="product_title" maxlength="50" value="${product_dt.trailer_title}" style="color:white;background-color: #cfc4d661;">
		</div>
		<div class="form__field">
			<label for="product_name" class="col-sm-3 col-form-label text-center" style="color:white;background-color: #7f5cad;">상품 이름</label>
			<input class="form__input" type="text" name="product_name" id="product_name" maxlength="50" value="${product_dt.trailer_name}" style="color:white;background-color: #cfc4d661;">
		</div>
		<div class="form__field">
			<label for="product_price" class="col-sm-3 col-form-label text-center" style="color:white;background-color: #7f5cad;">상품 가격</label>
			<input class="form__input" type="number" name="product_price" id="product_price" maxlength="20" value="${product_dt.trailer_price}" style="color:white;background-color: #cfc4d661;">
		</div>
		
		<div class="form_field">
			<label for="product_detail" class="col-sm-3 col-form-label text-center fs-5 p-2 mb-1" style="color:white; background-color: #7f5cad; width:140px; border-radius:2rem;">상품 설명</label>
			<textarea class="form-control my-2" name="product_detail" id="product_detail" rows="10" cols="30" style="background-color: #cfc4d6;"></textarea>
		</div>
		<div class="form__field">
			<p class="fs-6 m-2 text-center text-white p-1" style="width:120px;background-color: #7f5cad;border-radius: 1rem;">카테고리</p>
			<select class="form-select" name="product_category" id="product_category" style="background-color: #cfc4d6; margin:auto; border-radius:2rem;">
			<option selected>상품의 카테고리를 선택하세요</option>
				<option value="1">가전디지털</option>
				<option value="2">식품</option>
				<option value="3">주방용품</option>
				<option value="4">생활용품</option>
				<option value="5">의류</option>
				<option value="6">취미</option>
				<option value="7">스포츠/레저</option>
			</select>
		</div>
		<div class="input-group mb-3">
			<p class="fs-6 m-2 text-center text-white p-1" style="width:120px;background-color: #7f5cad;border-radius: 1rem;">상품 이미지</p>
			<input type="file"  class="form__input" name="product_image" id="product_image" accept=".gif, .jpg, .png, .jpeg" style="background-color: #cfc4d6;height:27px;border-radius: 1rem;margin: auto;">
		</div>
		
		<input type="hidden" name="session" id="session" value="${user_id}" />
		<input type="hidden" name="product_id" value="${product_id}" />
		<input type="hidden" name="aws_url" id="aws_url" value="${userDto.a}">
		<input type="hidden" name="user_charn" id="user_charn" value="${userDto.user_charn}">
		<div class="form__field">
			<button class="round-button" style="width: 250px;margin-left: 32%;height: 50px;border-radius: 3rem;" type="submit" >상품 등록</button>
		</div>
	</form>
	


<%@include file="tail.jsp"%>
