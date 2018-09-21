<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<title>회원로그인</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/roboquest.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css"
		href="resources/css/videocall.css">

</head>
<body>

	<div class='header'>
		<div>코스콤 비대면 계약시스템</div>
	</div>

	<div class='row1'>
		<div class='col-sm-12'>
			<a href="loginform">로그인 </a> | <a href="registerform">회원가입</a> | <a
				href="customerservice">고객센터</a>
		</div>
	</div>

	<div class='main'>
		<div class='col-sm-2'>
			제휴자문사</br> 제휴자문사</br> 영상통화 예약</br> 영상통화 실행</br> 영상통화 등록</br> 제휴자문사</br>
		</div>
		<div class='col-sm-10'>
			<form:form modelAttribute="clntvo" action="login" method="POST">
				<div class="col-lg-4">
					<p>
					<div class="input-group">
						<span class="input-group-addon"> <i
							class="glyphicon glyphicon-user"></i>
						</span>
						<form:input id="email" type="email" class="form-control"
							path="clntemail" name="${clntvo.clntemail}" placeholder="Email"
							required="true" />
						</br>
					</div>
					</p>
					<div class="input-group">


						<span class="input-group-addon"> <i
							class="glyphicon glyphicon-lock"></i>
						</span>
						<form:input id="password" type="password" class="form-control"
							path="pwd" name="${clntvo.pwd}" placeholder="Password"
							required="true" />

					</div>
					</p>
					<p>
						<input type="submit" value="Sign-in"> <a
							href="registerform"> <input type="button" value="Sign-up" />
						</a>
					</p>
				</div>
			</form:form>
			</strong>
		</div>
	</div>
	<div class='footer'>
		<div>서울시 영등포구 여의나루로 76</div>
	</div>

</body>
</html>