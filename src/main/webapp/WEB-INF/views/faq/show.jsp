<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<div id="content_area">
		<div id="title">
			<h1>${show.f_title}</h1>
		</div>
		
		<div id="boardArea">
			<table width="900" cellspacing="0" border="1">
				<tr height="25">
					<td width="150">카테고리</td>
					<td width="550">Question</td>
					<td width="200">작성일</td>
				</tr>
				<tr height="30" align="center">
					<td>${show.f_category}</td>
					<td>${show.f_title}</td>
					<td>${show.f_date}</td>
				</tr>
				<tr>
					<td colspan="3" style="padding: 10px; vertical-align: top">${show.f_content}</td>
				</tr>
			</table>
		</div>
		
		<div id="pageArea">
		<%
		String u_id = (String)session.getAttribute("u_id");
		String u_auth = (String)session.getAttribute("u_auth");
		%>
		<c:set var="admin" value="A"/>
		<c:if test="${admin eq u_auth}"> <!-- 관리자만 작성 버튼 활성화 -->
			<a href="modify_view?f_code=${show.f_code}">글 수정</a>
			<a href="delete?f_code=${show.f_code}">글 삭제</a>
		</c:if>
			<a href="list">글 목록</a>
		</div>
	</div>
</body>
</html>