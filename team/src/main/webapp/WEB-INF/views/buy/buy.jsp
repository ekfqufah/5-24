<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table>
		<c:forEach items="${cartlist}" var="cartlist">
				<tr>
					<td>${cartlist.c_code}</td>
					<td>${cartlist.c_amount}</td>
					<td>${cartlist.g_price}</td>
					<td>${cartlist.u_id}</td>
					<td>${cartlist.g_code}</td>
				</tr>
		</c:forEach>
	</table>
</body>
</html>