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

	마이페이지입니다.
	<jsp:include page="../main/mainHeader.jsp" flush="false"></jsp:include>
	
	<table border="1">
		<c:forEach items="${myQnaList}" var="myQnaList">
				<tr>
					<td>${myQnaList.q_code}</td>
					<td>${myQnaList.q_code}</td>
					<td>${myQnaList.q_code}</td>
					<td>${myQnaList.q_code}</td>
					<td>${myQnaList.q_code}</td>
				</tr>
		</c:forEach>
	</table>
	
	<table border="1">
		<c:forEach items="${myFaqList}" var="myFaqList">
				<tr>
					<td>${myFaqList.f_code}</td>
				</tr>
		</c:forEach>
	</table>
	
	
		 <table border="1">
		<c:forEach items="${mygoodsList}" var="mygoodsList">
				<tr>
					<td>${mygoodsList.g_code}</td>
				</tr>
		</c:forEach>
	</table> 
	<jsp:include page="../main/mainFooter.jsp" flush="false"></jsp:include>
	
	<%-- <table border="1">
		<c:forEach items="${myReviewList}" var="myReviewList">
				<tr>
					<td>${myReviewList.r_code}</td>
				</tr>
		</c:forEach>
	</table> --%>
</body>
</html>