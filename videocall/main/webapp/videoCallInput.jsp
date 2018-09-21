<%@page import="sample.dto.VideoCallDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.io.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>영상통화 등록</title>
</head>

<body>
<h1># 영상통화 등록 #</h1>

<form action="videoCallInput" method="get">
	<%if(request.getAttribute("firmNo") == null) 
		request.setAttribute("firmNo", 999);	%>

	<%if(request.getAttribute("videoCallNo") == null) 
		request.setAttribute("videoCallNo", 0);	%>  

	<%if(request.getAttribute("clntCi") == null) 
		request.setAttribute("clntCi", " ");	%>
	<%if(request.getAttribute("prdtCode") == null) 
		request.setAttribute("prdtCode", " ");	%>
	<%if(request.getAttribute("baseDt") == null) 
		request.setAttribute("baseDt", " ");	%>
	<%if(request.getAttribute("cnsltEmpNm") == null) 
		request.setAttribute("cnsltEmpNm", " ");	%>
	<%if(request.getAttribute("callSrtTime") == null) 
		request.setAttribute("callSrtTime", " ");	%>
	<%if(request.getAttribute("callEndTime") == null) 
		request.setAttribute("callEndTime", " ");	%>
	<%if(request.getAttribute("videoFileNm") == null) 
		request.setAttribute("videoFileNm", " ");	%>
		
	<%if(request.getAttribute("sResult") == null) 
		request.setAttribute("sResult", " ");	%>
  
   자문회사           : 	<input type="text" name="firmNo"  value="<%=request.getAttribute("firmNo") %>"><br>   
   영상통화번호      : 	<input type="text" name="videoCallNo"  value="<%=request.getAttribute("videoCallNo") %>"><br>

    <input type="submit" value="통화등록"> 
    <input type="reset" value="취소"><br><br>

   고객CI       : <input type="text" name="clntCi" value="<%=request.getAttribute("clntCi") %>"  ><br>   
   상품코드          : 	<input type="text" name="prdtCode" value="<%=request.getAttribute("prdtCode") %>" ><br>
   통화일자          : 	<input type="text" name="baseDt" value="<%=request.getAttribute("baseDt") %>" ><br>
   상담원             : 	<input type="text" name="cnsltEmpNm" value="<%=request.getAttribute("cnsltEmpNm") %>" ><br>
   통화시작시간(6): 	<input type="text" name="callSrtTime" value="<%=request.getAttribute("callSrtTime") %>" ><br>
   통화종료시간(6): 	<input type="text" name="callEndTime" value="<%=request.getAttribute("callEndTime") %>" ><br>
   영상파일명       : 	<input type="text" name="videoFileNm" value="<%=request.getAttribute("videoFileNm") %>" ><br><br><br>
   
  처리결과          : <input type="text" name="sResult"  value="<%=request.getAttribute("sResult") %>" size=40 disabled><br>
    
</form>

</body>
</html>



