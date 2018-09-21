<%@page import="sample.dto.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.io.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자문회사 상품 선택</title>
</head>

<body>
<h1>상품 목록!!</h1>
<%
	List<ProductDTO> list =(List<ProductDTO>)request.getAttribute("productList");

 	//String firmNo = (String) request.getAttribute("firmNo");
 	//request.setAttribute("firmNo", firmNo);
	
%> <br>
		
<form action="productList" method="get">
	<%if(request.getAttribute("firmNo") == null) 
		request.setAttribute("firmNo", 101);	%>	
	<%if(request.getAttribute("invstInclnGrd") == null) 
		request.setAttribute("invstInclnGrd", " ");	%>	
		
		자문회사           : 	<input type="text" name="firmNo" value="<%=request.getAttribute("firmNo") %>" size=3 maxlength=3 > <br>
		최종고객성향      : 	<input type="text" name="invstInclnGrd" value="<%=request.getAttribute("invstInclnGrd") %>" size=2 maxlength=2 > <br>
					    <input type="submit" value="조회">		 <br> <br>   
	    
</form>

<table>
	<tr>
		<th>자문회사코드</th>
		<th>자문회사명</th>
		<th>상품코드</th>
		<th>상품명</th>
		<th>투자등급</th>
		<th>약정시작일</th>
		<th>약정종료일</th>
		<th>투자일임담당자</th>
	</tr>
	<%if(list != null){
		for(ProductDTO product : list){
		%>

	<tr>	
		<td><%=product.getFirmNo() %></td>
		<td><%=product.getFirmNm() %></td>
		<td><%=product.getPrdtCode() %></td>
		<td><%=product.getPrdtNm()%></td>
		<td><%=product.getInvstInclnGrd()%></td>
		<td><%=product.getOpSrtDt()%></td>
		<td><%=product.getOpEndDt()%></td>
		<td><%=product.getOpAmt()%></td>
		<td><%=product.getMgmtPsnNm()%></td>

	</tr>
	<% 
		}//end for
	}//end if
	%>
</table>
<br>
</body>
</html>