<%@page import="org.springframework.context.annotation.Import"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" type="text/css"
		href="resources/css/videocall.css">


<html>
<head>
<meta charset="UTF-8">
<title>투자자문사선택</title>
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
<form action="logout" method="post">
    <button id="btn_logout" type="submit">로그아웃</button>
</form>
	<h1>투자자문사 선택</h1>
	<h4>환영합니다. ${clntinfo.name} 고객님! 계약하고자하는 투자자문사 선택을 해주세요.</h4>
	<form action="firm" method = "POST">
	<c:forEach items="${listfirm}" var="firm" varStatus = "st">
		<h4><label><input type="radio" name="firmno" value="${firm.firmno}"/><span>${firm.firmnm}</span></label></h4>
		</c:forEach>
	<input type="submit" value="선택완료">
	</form>
	</div>
		<div class='footer'>
		<div>서울시 영등포구 여의나루로 76</div>
	</div>
	</body>
</html>