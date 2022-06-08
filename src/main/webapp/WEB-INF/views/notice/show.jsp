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
			<h1>${show.n_title}</h1>
		</div>
		
		<div id="boardArea">
			<table width="900" cellspacing="0" border="1">
				<tr height="30" align="center">
					<td width="150" align="center">글번호</td>
					<td width="300" align="center">${show.n_num}</td>
					<td width="150" align="center">조회수</td>
					<td width="300" align="center">${show.n_view}</td>
				</tr>
				<tr height="30">
					<td align="center">작성자</td>
					<td align="center">${show.u_id}</td>
					<td align="center">작성일</td>
					<td align="center">${show.n_date}</td>
				</tr>
				<tr height="30">
					<td align="center">글제목</td>
					<td colspan="3" style="padding-left: 10px">${show.n_title}</td>
				</tr>
				<tr>
					<td height="250" align="center">글내용</td>
					<td colspan="3" style="padding: 10px; vertical-align: top">${show.n_content}</td>
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
			<a href="modify_view?n_code=${show.n_code}">글 수정</a>
			<a href="delete?n_code=${show.n_code}">글 삭제</a>
		</c:if>
			<a href="list">글 목록</a>
		</div>
	</div>
</body>
</html>