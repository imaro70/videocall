<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</style>

<link rel="stylesheet" type="text/css" href="resources/css/videocall.css">

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
		<form:form modelAttribute="clntvo" action="register" method="POST">
			<div class="col-xs-4">
				<p>
					<!-- 이메일 -->
				<div class="input-group">
					<span class="input-group-addon"> <i
						class="glyphicon glyphicon-user"></i>
					</span>
					<form:input id="clntemail" type="email" class="form-control"
						path="clntemail" name="${clntvo.clntemail}" placeholder="Email"
						required="true" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" />
				</div>
				</p>
				<input type="button" value="중복이메일체크"
					onclick="javascript:chkDupEmail();" />
				<!-- 			<input type="submit" class="btn btn-warning" value="중복이메일체크" -->
				<!-- 				id="emailDupChkBtn" onkeydown="javascript:if(event.keyCode==13)"> -->
				<p>
					<!-- 비밀번호 -->
				<div class="input-group">
					<span class="input-group-addon"> <i
						class="glyphicon glyphicon-lock"></i>
					</span>
					<form:input id="pwd" type="password" class="form-control"
						path="pwd" name="${clntvo.pwd}" placeholder="비밀번호" required="true" />
					</p>
					<p>
						<!-- 비밀번호확인 -->
						<input id="pwd1" type="password" class="form-control" name="pwd1"
							placeholder="비밀번호확인" required="true" /><label id="pwdcheck1">2</label>
				</div>
				</p>
				<p>
					<!-- 이름 -->
				<div class="input-group">
					<span class="input-group-addon"> <i
						class="glyphicon glyphicon-user"></i>
					</span>
					<form:input id="name" type="text" class="form-control" path="name"
						name="${clntvo.name}" placeholder="이름" required="true" />
					</br>
				</div>
				</p>
				<p>
					<!-- 생년월일 -->
				<div class="input-group">
					<span class="input-group-addon"> <i
						class="glyphicon glyphicon-lock"></i>
					</span>
					<form:input id="dob" type="text" class="form-control" path="dob"
						name="${clntvo.dob}" placeholder="생년월일(20001001)" required="true"
						pattern="[0-9]{8}$" />

				</div>
				</p>
				<p>
					<!-- 성별 -->
				<div class="input-group">
					<span class="input-group-addon"> <i
						class="glyphicon glyphicon-user"></i>
					</span>
					<%-- 				<form:select name="${clntvo.gender}" id="gender" path="gender"> --%>
					<%-- 					<form:option value="" selected >성별</form:option> --%>
					<%-- 					<form:option value="1">남</form:option> --%>
					<%-- 					<form:option value="2">여</form:option> --%>
					<form:input id="gender" type="text" class="form-control"
						path="gender" name="${clntvo.gender}" placeholder="성별"
						required="true" />
					<%-- 				</form:select> --%>
					</br>
				</div>
				</p>
				<p>
					<!-- 휴대폰번호 -->
				<div class="input-group">
					<span class="input-group-addon"> <i
						class="glyphicon glyphicon-phone"></i>
					</span>
					<form:input id="hpno" type="text" class="form-control" path="hpno"
						pattern="[0-9]{11}$" name="${clntvo.hpno}"
						placeholder="휴대폰번호(01012345678)" required="true" />
				</div>
				</p>
				<p>
					<!-- SMS수신여부 -->
				<div class="input-group">
					<span class="input-group-addon"> <i
						class="glyphicon glyphicon-inbox"></i>
					</span>
					<form:input id="smsprslyn" type="text" class="form-control"
						path="smsprslyn" name="${clntvo.smsprslyn}" placeholder="SMS수신여부"
						required="true" />
					</br>
				</div>
				</p>
				<p>
					<!-- 우편번호 인증키 : c9165a2246a5c7fdd1536623879242 -->
				<div class="input-group">
					<span class="input-group-addon"> <i
						class="glyphicon glyphicon-home"></i>
					</span>
					<form:button>
						<a href="#" id="zip_codeBtn" data-toggle="modal"
							data-target="#zip_codeModal">우편번호검색하기</a>
					</form:button>
					<form:input id="postno" type="text" class="form-control"
						path="postno" name="${clntvo.postno}" placeholder="우편번호"
						required="true" readonly="true" />
					<input id="addr" type="text" class="form-control" path="postno1"
						name="addr" required="true" readonly="true" placeholder="주소" /> </span>
					<form:input id="dtladdr" type="text" class="form-control"
						path="dtladdr" name="${clntvo.dtladdr}" placeholder="상세주소"
						required="true" />
					</br>
				</div>
				</p>

				<p>
					<input type="submit" class="btn btn-warning" value="등록"
						id="registerBtn" onkeydown="javascript:if(event.keyCode==13)">
					<!-- 				<input type="submit" value="전송" /> -->
				</p>
		</form:form>
	</div>
</div>
<div class='footer'>
	<div>서울시 영등포구 여의나루로 76</div>
</div>
<body>
	<div class="modal fade" id="zip_codeModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header text-center">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h3 class="modal-title" id="myModalLabel">우편번호</h3>
				</div>
				<div class="modal-body text-center">
					<form id="zip_codeForm">
						<div class="input-group">
							<span class="input-group-addon">동 입력</span> <input type="text"
								class="form-control" name="query" id="query"> <span
								class="input-group-btn"> <input type="submit"
								class="btn btn-warning" value="검색" id="searchBtn"
								onkeydown="javascript:if(event.keyCode==13)">
							</span>
						</div>
					</form>
					<p></p>
					<div>
						<div style="width: 100%; height: 200px; overflow: auto">
							<table class="table text-center">
								<thead>
									<tr>
										<th style="width: 150px;">우편번호</th>
										<th style="width: 600px;">주소</th>
									</tr>
								</thead>
								<tbody id="zip_codeList"></tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

<script>
	$(function() {
		$("#pwd1").keyup(function() {
			if ($("#pwd").val() != $("#pwd1").val()) {
				$("#pwdcheck1").text("Mismatch");
			} else {
				$("#pwdcheck1").text("Match");
			}

		});
	});

	$(function() {
		// 검색버튼 눌렸을 때 함수 실행
		$("#searchBtn").click(
				function(e) {
					e.preventDefault();
					// ajax
					$.ajax({
						// zip_codeList controller 진입 url
						url : "zipcode/list",
						// zip_codeForm을 serialize 해줍니다.
						data : $("#zip_codeForm").serialize(),
						type : "POST",
						// dataType 은 json형태로 보냅니다.
						dataType : "json",
						success : function(result) {
							$("#zip_codeList").empty();
							var html = "";
							if (result.errorCode != null
									&& result.errorCode != "") {
								html += "<tr>";
								html += "    <td colspan='2'>";
								html += result.errorMessage;
								html += "    </td>";
								html += "</tr>";
							} else {
								// 검색결과를 list에 담는다.
								var list = result.list;

								for (var i = 0; i < list.length; i++) {
									html += "<tr>";
									html += "    <td>";
									// 우편번호
									var zipcode = list[i].zipcode;
									// 주소
									var address = list[i].address;

									html += list[i].zipcode;
									html += "    </td>";
									html += "    <td>";
									html += '<a href="#" onclick="put(\''
											+ list[i].address + '\',\''
											+ zipcode + '\')">' + address
											+ '</a>';
									html += "    </td>";
									html += "</tr>";
								}
							}
							// 완성된 html(우편번호 list)를 zip_codeList밑에 append
							$("#zip_codeList").append(html);
						}
					});
				});
	})

	function chkDupEmail() {
		var email = $('#clntemail').val();
		if (email == '') {
			alert('이메일을 입력해주세요.');
			return;
		}

		$.ajax({
			type : 'POST',
			data : "email=" + email,
			dataType : 'json',
			url : 'checkdupemail',
			success : function(result) {
				if (result.errorCode != null && result.errorCode != "") {
					alert(result.errorMessage)
				} else {
					// 검색결과를 list에 담는다.
					var cnt = result.cnt;
					if (cnt == 0) {
						alert("사용가능한 이메일입니다.");
						$("#emaildupcheck").val('Y');

					} else {
						$('#clntemail').focus();
						alert("다른 사용자가 사용하고 있는 이메일입니다.");
						$("#emaildupcheck").val('N');
					}
				}
			},
			error : function(xhr, status, e) {
				alert(e);
			}
		});
	}

	// 원하는 우편번호 선택시 함수 실행
	function put(address, zipcode) {
		var address = address;
		var zipcode = zipcode;
		// 모달창 닫기
		$("#zip_codeModal").modal("hide");
		$("#postno").val(zipcode);
		$("#addr").val(address);
	}

	// 등록....
	function emailChk() {

		var frm = document.companyForm;

		if (!chkVal('${clntvo.clntemail}', 'Email'))
			return false;
		if ($("#emaildupcheck").val() == 'N') {
			alert('이메일 중복 체크를 해주세요.');
			return;
		}
		return;
	}
</script>