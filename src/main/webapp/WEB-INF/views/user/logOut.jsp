<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	
</head>
<body>
<%
	
	System.out.println("들어옴?");
	request.setCharacterEncoding("UTF-8");
	session.invalidate();
	//response.sendRedirect("/");
%>
	<script>
	window.onload = function() {
		alert("로그아웃 되었습니다.");
	
		location.href="/team/";
		
	}
	</script>
</body>
</html>