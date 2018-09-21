<%@page import="sample.dto.ContractDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.io.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>계약 등록</title>
</head>

<body>
<h1>계약 등록</h1>

<form action="contractInput" method="get">
	<%if(request.getAttribute("firmNo") == null) 
		request.setAttribute("firmNo", 101);	%>
	<%if(request.getAttribute("cvntNo") == null) 
		request.setAttribute("cvntNo", 0);	%>

	<%if(request.getAttribute("clntCi") == null) 
		request.setAttribute("clntCi", " ");	%>
	<%if(request.getAttribute("prdtCode") == null) 
		request.setAttribute("prdtCode", " ");	%>
	<%if(request.getAttribute("cvntDt") == null) 
		request.setAttribute("cvntDt", " ");	%>
	<%if(request.getAttribute("videoCallNo") == null) 
		request.setAttribute("videoCallNo", " ");	%>
	<%if(request.getAttribute("mgmtPsnNm") == null) 
		request.setAttribute("mgmtPsnNm", " ");	%>
	<%if(request.getAttribute("cvntFileNm") == null) 
		request.setAttribute("cvntFileNm", " ");	%>		
  
	<%if(request.getAttribute("sResult") == null) 
		request.setAttribute("sResult", " ");	%>
  
   자문회사           : 	<input type="text" name="firmNo"  value="<%=request.getAttribute("firmNo") %>" size=3 maxlength=3 ><br>   
   계약번호      : 	<input type="text" name="cvntNo"  value="<%=request.getAttribute("cvntNo") %>"><br>

    <input type="submit" value="계약등록"> 
    <input type="reset" value="취소"><br><br>

   고객CI       : <input type="text" name="clntCi"  value="<%=request.getAttribute("clntCi") %>" ><br>   
   상품코드           : 	<input type="text" name="prdtCode" value="<%=request.getAttribute("prdtCode") %>" ><br>
   계약일자           : 	<input type="text" name="cvntDt" value="<%=request.getAttribute("cvntDt") %>" ><br>
   영상통화번호      : 	<input type="text" name="videoCallNo" value="<%=request.getAttribute("videoCallNo") %>" ><br>   
   일임담당자        : 	<input type="text" name="mgmtPsnNm" value="<%=request.getAttribute("mgmtPsnNm") %>" ><br>
   계약서파일명      : 	<input type="text" name="cvntFileNm" value="<%=request.getAttribute("cvntFileNm") %>" ><br><br><br>
   
  처리결과           : <input type="text" name="sResult"  value="<%=request.getAttribute("sResult") %>"  size=40 disabled><br>
    
</form>

</body>
</html>



