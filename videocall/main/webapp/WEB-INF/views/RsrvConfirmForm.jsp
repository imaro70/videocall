<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/roboquest.css">
<	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>영상통화예약 등록</title>
</head>
<body>
	<form action="logout" method="post">
		<button id="btn_logout" type="submit">로그아웃</button>
	</form>
	<h2>
		<p>${clntinfo.name}고객님! ${firminfo.firmnm} 의 선택한 상품의 계약을 위한</p>
		<p>영상통화 예약 ${sResult} 되었습니다.</p>
	</h2>
		
<table class="table table-striped table-condensed table-hover">
	<tr>
		<th>자문회사코드</th>
		<th>자문회사명</th>
		<th>상품코드</th>
		<th>예약일</th>
		<th>예약시작시간</th>
		<th>예약종료시간</th>
		<th>고객CI</th>
		<th>핸드폰번호</th>
		<th>통화여부</th>
		
	</tr>
	<tr>	
		
		<td>${firminfo.firmno}</td>
		<td>${firminfo.firmnm}</td>		
		<td>${resvcall.prdtCode}</td>
		<td>${resvcall.rsvDt}</td>
		<td>${resvcall.rsvSrtTime}</td>
		<td>${resvcall.rsvEndTime}</td>
		<td>${resvcall.clntCi}</td>
		<td>${resvcall.hpNo}</td>
		<td>${resvcall.callCmpltYn}</td>
	</tr>
</table>		
		
<%-- 		<form action="resvcall" methode="POST"> --%>
<!-- 			<input type="submit" id="resvcall" value="영상통화 예약 확인"/> -->
<%-- 			</form> --%>
			<form action = "resvcalllist" methode="POST">
			<input type="submit" id="resvcalllist" value="영상통화 예약 전체조회"/>
			</form>

</body>
</html>