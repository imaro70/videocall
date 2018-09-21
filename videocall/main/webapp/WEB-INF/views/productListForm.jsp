<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/roboquest.css">
	<link rel="stylesheet" type="text/css"
		href="resources/css/videocall.css">
	
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${firminfo.firmnm}자문회사 상품 선택</title>
</head>

<body>
	<div class='header'>
		<div>코스콤 비대면 계약시스템</div>
	</div>

	<div class='row1'>
		<div class='col-sm-12'>
			<a href="loginform">로그인 </a> | <a href="registerform">회원가입</a> | <a href="logout">로그아웃</a> | <a
				href="customerservice">고객센터</a>
		</div>
	</div>

	<div class='main'>
		<div class='col-sm-2'>
			제휴자문사</br> 제휴자문사</br> 영상통화 예약</br> 영상통화 실행</br> 영상통화 등록</br> 제휴자문사</br>
		</div>
		<div class='col-sm-10'>
</form>
	<h1>${firminfo.firmnm}상품 목록!!</h1>
	<h2>${clntinfo.name} 고객님의 투자가능한 상품 목록입니다.</h2>
	<h2>투자하고자하는 상품을 선택해주세요.</h2>
	<form action="productlist" method="POST">
		<input type="hidden" name="invstinclngrd" value="${invstinclngrd}">
		<input type="submit" value="조회"> <br> <br>
	</form>

	<table class="table table-striped table-condensed table-hover">
		<tr>
			<th>상품코드</th>
			<th>상품명</th>
			<th>투자등급</th>
			<th>약정시작일</th>
			<th>약정종료일</th>
			<th>약정금액</th>
			<th>투자일임담당자</th>
			<th>상품선택</th>
		</tr>
		<c:forEach items="${productlist}" var="product" varStatus="st">
			<tr>
				<td>${product.prdtcode}</td>
				<td>${product.prdtnm}</td>
				<td>${product.invstinclngrd}</td>
				<td>${product.opsrtdt}</td>
				<td>${product.openddt}</td>
				<td>${product.opamt}</td>
				<td>${product.mgmtpsnnm}</td>
				<td>
				
					<form action="rsrvcallform" method="POST">
						<input type="hidden" name="prdtcode" value="${product.prdtcode}">
						<input type="submit" value="선택">
					</form> 
					
<%-- 					<input type="button" name=selectval value="${product.prdtcode}" --%>
<!-- 					onclick="rsrvcallform"> -->
				</td>
			</tr>
		</c:forEach>
	</table>
	<br>
	</div>
		<div class='footer'>
		<div>서울시 영등포구 여의나루로 76</div>
	</div>
</body>
</html>
