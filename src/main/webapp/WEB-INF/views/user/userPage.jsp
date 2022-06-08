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
		<tr>
			<td>글번호</td>
			<td>문의유형</td>
			<td>제목</td>
			<td>등록일</td>
		</tr>
		<c:forEach items="${myQnaList}" var="myQnaList">
				<tr>
					<td>${myQnaList.q_code}</td>
					<td>${myQnaList.q_category}</td>
					<td>${myQnaList.q_title}</td>
					<td>${myQnaList.q_date}</td>
				</tr>
		</c:forEach>
	</table>
	
	<table border="1">
	
	<tr>
		<td>글번호</td>
		<td>유형</td>
		<td>제목</td>
		<td>등록일</td>
	</tr>
	
	
		<c:forEach items="${myFaqList}" var="myFaqList">
				<tr>
					<td>${myFaqList.f_code}</td>
					<td>${myFaqList.f_category}</td>
					<td>${myFaqList.f_title}</td>
					<td>${myFaqList.f_date}</td>
				</tr>
		</c:forEach>
		
		
	</table>
	
	
	 <table border="1">
		 <tr>
		 	<td>상품번호</td>
		 	<td>상품가격</td>
		 	<td>상품수</td>
		 </tr>
		 
		<c:forEach items="${mygoodsList}" var="mygoodsList">
				<tr>
					<td>${mygoodsList.g_code}</td>
					<td>${mygoodsList.g_price}</td>
					<td>${mygoodsList.c_amount}</td>
				</tr>
		</c:forEach>
	</table>  
	
	
	 <table border="1">
	 	<tr>
		 	<td>내리뷰번호</td>
		 	
		 </tr>
		 
		<c:forEach items="${myReviewList}" var="myReviewList">
				<tr>
					<td>${myReviewList.r_code}</td>
				</tr>
		</c:forEach>
	</table> 
	
	<jsp:include page="../main/mainFooter.jsp" flush="false"></jsp:include>
</body>
</html>