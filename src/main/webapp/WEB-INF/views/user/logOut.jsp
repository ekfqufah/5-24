<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script>
		
	
	
	window.onload = function() {
		alert("로그아웃 되었습니다.")
	}
	
	</script>
</head>
<body>
<%
	out.print ("<script> alert('로그아웃 되었습니다.') ");
	System.out.println("들어옴?");
	request.setCharacterEncoding("UTF-8");
	session.invalidate();
	response.sendRedirect("index");
%>
</body>
</html>