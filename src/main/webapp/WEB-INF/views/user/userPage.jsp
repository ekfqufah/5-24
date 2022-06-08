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

	�����������Դϴ�.
	<jsp:include page="../main/mainHeader.jsp" flush="false"></jsp:include>
	
	<table border="1">
		<tr>
			<td>�۹�ȣ</td>
			<td>��������</td>
			<td>����</td>
			<td>�����</td>
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
		<td>�۹�ȣ</td>
		<td>����</td>
		<td>����</td>
		<td>�����</td>
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
		 	<td>��ǰ��ȣ</td>
		 	<td>��ǰ����</td>
		 	<td>��ǰ��</td>
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
		 	<td>�������ȣ</td>
		 	
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