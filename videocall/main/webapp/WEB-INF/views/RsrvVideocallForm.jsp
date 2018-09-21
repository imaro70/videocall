<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/roboquest.css">

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>영상통화예약 등록</title>
</head>
<body>
	<div class="col-lg-8">
		<div class="input-group">
			<form action="logout" method="post">
				<button id="btn_logout" type="submit">로그아웃</button>
			</form>

			<h1># 영상통화예약 등록 #</h1>
			<form action="resvcallinput" method="POST">
				<p>
					자문회사 : <input type="text" name="firmNo" value="${firminfo.firmno}"
						size=3 maxlength=3><label>${firminfo.firmnm} </label><br>
				</p>
				<p>
					고객CI : <input type="text" name="clntCi" value="${clntinfo.clntci}"><label>${clntinfo.name}</label><br>
				</p>
				<p>
					상품코드 : <input type="text" name="prdtCode" value="${prdtcode}"><br>
				</p>
				<p>
					예약일자 : <input type="text" name="rsvDt"
						value="${rsvDt}" size=8 maxlength=8 placeholder = "20180921"
						required><br>
				</p>
				<p>
					핸드폰번호 : <input type="text" name="hpNo" value="${clntinfo.hpno}"
						required><br>
				</p>
				<p>
					예약시작시간(6): <input type="text" name="rsvSrtTime"
						value="${rsvSrtTime}" size=6 maxlength=6 placeholder = "120000"
						required><br>
				</p>
				<p>
					예약종료시간(6): <input type="text" name="rsvEndTime" 
						value="${rsvEndTime}" size=6 maxlength=6 placeholder = "120000"
						required><br> 
						<input type="submit" value="예약등록">
					<input type="reset" value="취소">
				</p>
				<p>
					처리결과 : <input type="text" name="sResult"
						value="${sResult}" size=40 disabled><br>
				</p>
			</form>
		</div>
	</div>
</body>
</html>

