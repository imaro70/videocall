<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/questionForm.css">
<link rel="stylesheet" type="text/css" href="resources/css/videocall.css">
	

<!DOCTYPE html>
<html>
<head>
<title>${firminfo.firmnm} 투자성향분석</title>
	
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

	<h1>${firminfo.firmnm} 투자성향분석</h1>
	<h2>안녕하세요. ${clntinfo.name}님!</h2>
	<div id="questionArea" >
	<c:forEach items="${questlist}" var="quest" varStatus="st">
		<h3>
			<label>${quest.qstnrno}. ${quest.qstnrquest}</label>
		</h3>
		<c:forEach items="${choiclist}" var="choic" varStatus="st">
			<c:if test="${quest.qstnrno == choic.qstnrno}">
				<p>
					<input type="radio" id="qstnr" name="${quest.qstnrvar}"
						class="${quest.qstnrvar}" value="${choic.choicscore}" /><span>
						<label>${choic.choicitemcnts}
					</span></label>
				</p>
			</c:if>
		</c:forEach>
	</c:forEach>
	</div>
	<input type="button" id="resultBtn" onclick="fn_goSum();" value="결과확인" />
	<!-- 		<div class="ac" id="result" style="display: block"> -->
	<!-- 			<a onClick="fn_goSum();" class="css_btn_class"> 완료 및 결과 보기</a> -->
	<!-- 		</div> -->
	<div id="resutlArea" class="mt20" style="display: none;">
		<div id = "resultSum" style="text-align: center;">
			<div
				style="display: inline-block; width: 400px; padding: 20px 5px 10px; margin: 0; text-align: center; background-color: red;">
				<strong
					style="text-align: center; color: white; font-weight: bold; font-size: 18px; align: center;">
					${clntinfo.name} 고객님의 투자성향은 [ <span id="cust_degree" class="black"></span> ] 입니다.
				</strong>
			</div>
			</br>
			<div
				style="display: inline-block; width: 400px; padding: 20px 5px 10px; margin: 0; text-align: center;">
				<strong
					style="text-align: center; color: white; font-weight: bold; font-size: 18px; align: center;">
					<form action="productlist" method="POST">
					<input type="text" id="grade" name="invstinclngrd"/>
					<button type = "submit">투자성향 적합 상품 선택</button>
					</form>
				</strong>
			</div>
		</div>
		<div class="printBreak" style="margin-top: 90px">
			<p class="depth3Type1 mt10">금융투자상품별 투자위험도 분류기준</p>
			<table cellspacing="0" cellpadding="0" border="1" width="800"
				class="dataTable ml15" style="margin: 0 auto;">
				<tr>
					<th colspan="2">구분</th>
					<th>초고위험</th>
					<th>고위험</th>
					<th>중위험</th>
					<th>저위험</th>
					<th class="bdNo">초저위험</th>
				</tr>
				<tr>
					<td class="unit" rowspan="2" colspan="2">채권 등</td>
					<td class="bg-red" colspan="2">투기등급 포함<br>(BB 이하)
					</td>
					<td class="bg-orange">회사채<br>(BBB+ ~ BBB-)
					</td>
					<td class="bg-orange">금융채<br> 회사채(A- 이상)
					</td>
					<td class="bg-green bdNo">국고채 <br>통안채 <br>지방채 <br>보증채
						<br>특수채
					</td>
				</tr>
				<tr>
					<td class="bg-red" colspan="2">신종자본증권/<br>조건부자본증권(상각형)
					</td>
					<td class="unit bdNo" colspan="4">&nbsp;</td>
				</tr>
				<tr>
					<td class="unit" colspan="2">CP</td>
					<td class="bg-red" colspan="2">B+ 이하</td>
					<td class="bg-orange">A3- ~ A3+</td>
					<td class="bg-orange">A2- 이상</td>
					<td class="bg-green bdNo">&nbsp;</td>
				</tr>
				<tr>
					<td class="unit" colspan="2">RP</td>
					<td class="bg-red" colspan="2">&nbsp;</td>
					<td class="bg-orange">&nbsp;</td>
					<td class="bg-orange">&nbsp;</td>
					<td class="bg-green bdNo">RP형 CMA, RP</td>
				</tr>
				<tr>
					<td class="unit" rowspan="2">파생결합증권</td>
					<td class="unit">ELW</td>
					<td class="bg-red">ELW</td>
					<td class="unit bdNo" colspan="4">&nbsp;</td>
				</tr>
				<tr>
					<td class="unit">ETN</td>
					<td class="bg-red">ETN</td>
					<td class="unit bdNo" colspan="4">&nbsp;</td>
				</tr>
				<tr>
					<td class="unit" colspan="2">주식</td>
					<td class="bg-red">신용거래, 관리종목,<br>투자경고종목,<br>투자위험종목
					</td>
					<td class="bg-red">주식</td>
					<td class="unit bdNo" colspan="3">&nbsp;</td>
				</tr>
				<tr>
					<td class="unit" colspan="2">선물/옵션</td>
					<td class="bg-red">선물/옵션</td>
					<td class="bg-red">&nbsp;</td>
					<td class="unit bdNo" colspan="3">&nbsp;</td>
				</tr>
				<tr>
					<td class="unit" colspan="2">ETF</td>
					<td class="bg-red">파생형 ETF</td>
					<td class="bg-red">ETF<br>(파생형 제외)
					</td>
					<td class="unit bdNo" colspan="3">&nbsp;</td>
				</tr>
			</table>
			<span class="star_red ml10 mt5">공모 집합투자증권의 경우 해당 집합투자증권의
				투자설명서에 기재된 투자위험도에 따라, 사모 집합투자증권의 경우 금융투자회사의 영업 및 업무에 관한 규정 시행 세칙 별지
				제 15호 '집합투자기구 분류'에 따라 생성된 금융투자협회 상품코드의 투자위험 등급에 따라 분류한다.</span>
			<p class="depth3Type1 mt20">투자자의 투자성향별 투자권유 가능상품 분류기준</p>
			<table cellspacing="0" cellpadding="0" border="1" width="800"
				class="dataTable ml15" style="margin: 0 auto;">
				<tr>
					<th>구분</th>
					<th>초고위험<br>(Speculative Risk)
					</th>
					<th>고위험<br>(High risk)
					</th>
					<th>중위험<br>(Intermediate Risk)
					</th>
					<th>저위험<br>(Low Risk)
					</th>
					<th class="bdNo">초저위험<br>(Ultra Low Risk)
					</th>
				</tr>
				<tr>
					<td class="unit">안정형</td>
					<td class="bg-red">투자권유불가</td>
					<td class="bg-red">투자권유불가</td>
					<td class="bg-red">투자권유불가</td>
					<td class="bg-red">투자권유불가</td>
					<td class="unit bdNo">&nbsp;</td>
				</tr>
				<tr>
					<td class="unit">안정추구형</td>
					<td class="bg-red">투자권유불가</td>
					<td class="bg-red">투자권유불가</td>
					<td class="bg-red">투자권유불가</td>
					<td class="unit">&nbsp;</td>
					<td class="unit bdNo">&nbsp;</td>
				</tr>
				<tr>
					<td class="unit">위험중립형</td>
					<td class="bg-red">투자권유불가</td>
					<td class="bg-red">투자권유불가</td>
					<td class="unit">&nbsp;</td>
					<td class="unit">&nbsp;</td>
					<td class="unit bdNo">&nbsp;</td>
				</tr>
				<tr>
					<td class="unit">적극투자형</td>
					<td class="bg-red">투자권유불가</td>
					<td class="unit">&nbsp;</td>
					<td class="unit">&nbsp;</td>
					<td class="unit">&nbsp;</td>
					<td class="unit bdNo">&nbsp;</td>
				</tr>
				<tr>
					<td class="unit">공격투자형</td>
					<td class="unit">&nbsp;</td>
					<td class="unit">&nbsp;</td>
					<td class="unit">&nbsp;</td>
					<td class="unit">&nbsp;</td>
					<td class="unit bdNo">&nbsp;</td>
				</tr>
			</table>
			<p class="depth3Type1 mt20">집합투자증권 투자자 투자성향별 투자권유 가능상품 분류기준</p>
			<table cellspacing="0" cellpadding="0" border="1" width="800"
				class="dataTable ml15" style="margin: 0 auto;">
				<tr>
					<th>구분</th>
					<th>매우높은위험 <br> 높은위험
					</th>
					<th>다소높은위험</th>
					<th>보통위험</th>
					<th>낮은위험</th>
					<th class="bdNo">매우낮은위험</th>
				</tr>
				<tr>
					<td class="unit">안정형</td>
					<td class="bg-red">투자권유불가</td>
					<td class="bg-red">투자권유불가</td>
					<td class="bg-red">투자권유불가</td>
					<td class="bg-red">투자권유불가</td>
					<td class="unit bdNo">&nbsp;</td>
				</tr>
				<tr>
					<td class="unit">안정추구형</td>
					<td class="bg-red">투자권유불가</td>
					<td class="bg-red">투자권유불가</td>
					<td class="bg-red">투자권유불가</td>
					<td class="unit">&nbsp;</td>
					<td class="unit bdNo">&nbsp;</td>
				</tr>
				<tr>
					<td class="unit">위험중립형</td>
					<td class="bg-red">투자권유불가</td>
					<td class="bg-red">투자권유불가</td>
					<td class="unit">&nbsp;</td>
					<td class="unit">&nbsp;</td>
					<td class="unit bdNo">&nbsp;</td>
				</tr>
				<tr>
					<td class="unit">적극투자형</td>
					<td class="bg-red">투자권유불가</td>
					<td class="unit">&nbsp;</td>
					<td class="unit">&nbsp;</td>
					<td class="unit">&nbsp;</td>
					<td class="unit bdNo">&nbsp;</td>
				</tr>
				<tr>
					<td class="unit">공격투자형</td>
					<td class="unit">&nbsp;</td>
					<td class="unit">&nbsp;</td>
					<td class="unit">&nbsp;</td>
					<td class="unit">&nbsp;</td>
					<td class="unit bdNo">&nbsp;</td>
				</tr>
			</table>
		</div>
	</div>
	<input type="button" id="ClearBtn" onclick="fn_clear();" value="초기화" />

	<!-- 		<a  class="gr_btn_class mR10" onClick="fn_clear();"> 초기화</a> -->
	<!-- 	<div class="mt10"></div> -->
</div>
		<div class='footer'>
		<div>서울시 영등포구 여의나루로 76</div>
	</div>
</body>
<script>
	function fn_goSum() {
		if ($('input:radio[name="qstnrvar01"]:checked').length == 0) {
			$('input:radio[name="qstnrvar01"]').focus();
			alert("고객연령을 선택해 주세요.");
			return;
		}
		if ($('input:radio[name="qstnrvar02"]:checked').length == 0) {
			$('input:radio[name="qstnrvar02"]').focus();
			alert("연간 소득을 선택해 주세요.");
			return;
		}
		if ($('input:radio[name="qstnrvar03"]:checked').length == 0) {
			$('input:radio[name="qstnrvar03"]').focus();
			alert("투자를 결정할 때 가장 중요하게 생각하시는 사항을 선택해 주세요.");
			return;
		}
		if ($('input:radio[name="qstnrvar04"]:checked').length == 0) {
			$('input:radio[name="qstnrvar04"]').focus();
			alert("금융상품 투자목적 및 기대수익을 선택해 주세요.");
			return;
		}
		if ($('input:radio[name="qstnrvar05"]:checked').length == 0) {
			$('input:radio[name="qstnrvar05"]').focus();
			alert("금융상품 투자와 관련하여  투자경험을 선택해 주세요.");
			return;
		}
		if ($('input:radio[name="qstnrvar06"]:checked').length == 0) {
			$('input:radio[name="qstnrvar06"]').focus();
			alert("금융상품 투자에 대하여 본인의 지식 수준을 선택해 주세요.");
			return;
		}
		if ($('input:radio[name="qstnrvar07"]:checked').length == 0) {
			$('input:radio[name="qstnrvar07"]').focus();
			alert("투자를 할 경우 감내할 수 있는 손실 수준을 선택해 주세요.");
			return;
		}
		if ($('input:radio[name="qstnrvar08"]:checked').length == 0) {
			$('input:radio[name="qstnrvar08"]').focus();
			alert("금융상품 투자 자금의 투자 예정기간을 선택해 주세요.");
			return;
		}
		if ($('input:radio[name="qstnrvar09"]:checked').length == 0) {
			$('input:radio[name="qstnrvar09"]').focus();
			alert("손실감내도를 선택해 주세요.");
			return;
		}
		var resultval = 0;
		resultval = Number($('input[name="qstnrvar01"]:checked').val())
				+ Number($('input[name="qstnrvar02"]:checked').val())
				+ Number($('input[name="qstnrvar03"]:checked').val())
				+ Number($('input[name="qstnrvar04"]:checked').val())
				+ Number($('input[name="qstnrvar05"]:checked').val())
				+ Number($('input[name="qstnrvar06"]:checked').val())
				+ Number($('input[name="qstnrvar07"]:checked').val())
				+ Number($('input[name="qstnrvar08"]:checked').val())
				+ Number($('input[name="qstnrvar09"]:checked').val());
		var avg = (Math.round(Number(resultval / 9)*10))/10;
		var result;
		var grade;
		if (avg < 1.5) {
//			alert("고객 투자성향 점수 합계 : " + avg + ", 고객등급 : 안정형");
			result = "안정형 : " + (avg);
			grade = "01";
		} else if (avg >= 1.5 & avg < 2.5) {
//			alert("고객 투자성향 점수 합계 : " + avg + ", 고객등급 : 안정추구형");
			result = "안정추구형 : " + (avg);
			grade = "02";
		} else if (avg >= 2.5 & avg < 3.5) {
//			alert("고객 투자성향 점수 합계 : " + avg + ", 고객등급 : 위험중립형");
			result = "위험중립형 : "  + (avg);
			grade = "03";
		} else if (avg >= 3.5 & avg < 4.5) {
//			alert("고객 투자성향 점수 합계 : " + avg + ", 고객등급 : 적극투자형");
			result = "적극투자형 : " + (avg);
			grade = "04";
		} else {
//			alert("고객 투자성향 점수 합계 : " + avg + ", 고객등급 : 공격투자형");
			result = "공격투자형 : " + (avg);
			grade = "05";
		}
		$('#call_result').toggle();
		$('#questionArea').toggle();
		$('#resutlArea').toggle();
		$('#resultBtn').toggle();
		$('#clearBtn').toggle();
		$('input[type="radio"]').attr('disabled', true);
		$('#cust_degree').text(result);
		$('#grade').val(grade);
		$('#resutlArea').focus();
	}
	function fn_clear() {
		$('#call_result').toggle();
		$('#questionArea').toggle();
		$('#resutlArea').toggle();
		$('#resultBtn').toggle();
		$('#clearBtn').toggle();
		$('input[type="radio"]').removeAttr("checked");
		$('input[type="radio"]').attr('disabled', false);
	}
</script>
</html>