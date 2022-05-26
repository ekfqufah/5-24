<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="UTF-8" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<a href="reserve/ajaxtest">Ajax</a><br>
<a href="reserve/at2">Ajax2</a><br>
<a href="reserve/reservePage">좌석 선택</a>
<a href="reserve/list">list뽑기</a>
</body>
</html>
