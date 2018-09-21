<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/roboquest.css">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>영상통화 예약조회 </title>
</head>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.0.min.js" ></script>

<script type="text/javascript">
$(function() {
	// 검색버튼 눌렸을 때 함수 실행
	$("#test").click(
			function () { 

				alert("blah");
			
				var str = ""
				var tdArr = new Array();	// 배열 선언
				var checkBtn = $(this);
				
				// checkBtn.parent() : checkBtn의 부모는 <td>이다.
				// checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
				var tr = checkBtn.parent().parent();
				var td = tr.children();
				alter(tr);
				alter(td);
				var firmNo = td.eq(0).text();
				var prdtCode = td.eq(1).text();		
				alter(firmNo);
				alter(prdtCode);
				
				// 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
				td.each(function(i){	
					tdArr.push(td.eq(i).text());
				});
				
				console.log("배열에 담긴 값 : "+tdArr);
				
				str +=	" * 클릭된 Row의 td값 = firmNo : <font color='red'>" + firmNo + "</font>" +
						", prdtCode : <font color='red'>" + prdtCode + "</font>";		
				
				$("#ex2_Result1").html(" * 클릭한 Row의 모든 데이터 = " + tr.text());		
				$("#ex2_Result2").html(str);

				// resvCallList.jsp 로 회사번호 전달
//		 		request.setAttribute("firmNo", sFirmNo);   
			
//		 		RequestDispatcher rd = request.getRequestDispatcher("videoCallInput.jsp");
//		 		rd.forward(request, response);	
	
	
			})
})
</script>

<body>
<h1># 영상통화 예약조회 #</h1>
<form:form modelAttribute="resvcall" action="resvcalllist" method="POST">
	자문회사  :	<input type="text" name="firmNo" value="${firminfo.firmno}" size=3 maxlength=3>${firminfo.firmnm} <br>
	예약일     :<input type="text" name="rsvDt" value="${resvcall.rsvDt}" size=8 maxlength=8 > <br>
			<input type="submit" value="조회">		 <br> <br>   
</form:form>

<form method="post">
<table class="table table-striped table-condensed table-hover">
	<tr>
		<th>자문회사코드</th>
		<th>상품코드</th>
		<th>예약일</th>
		<th>예약시작시간</th>
		<th>예약종료시간</th>
		<th>고객CI</th>
		<th>핸드폰번호</th>
		<th>통화여부</th>
		<th>선택</th>
	</tr>
	
		<c:forEach items="${resvcalllist}" var="resvcall" varStatus="st">

	<tr>	
		<td>${resvcall.firmNo}</td>
		<td>${resvcall.prdtCode}</td>
		<td>${resvcall.rsvDt}</td>
		<td>${resvcall.rsvSrtTime}</td>
		<td>${resvcall.rsvEndTime}</td>
		<td>${resvcall.clntCi}</td>
		<td>${resvcall.hpNo}</td>
		<td>${resvcall.callCmpltYn}</td>
		
<!-- 		<td><input id="test" type="button" value="선택"></td> -->
		
	<td><input type="submit" class="btn btn-warning" value="선택" id="test"
								onkeydown="javascript:if(event.keyCode==13)">
		</td>
	</tr>
	</c:forEach>
</table>
</form>

		<div class="col-lg-12" id="ex2_Result1" ></div> 
		<div class="col-lg-12" id="ex2_Result2" ></div> 

<form>
	<br><br><br>
	처리결과           : <input type="text" name="sResult"  value="${sResult}"  size=40 disabled><br>
</form>

</body>

</html>
