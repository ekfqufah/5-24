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
			<h1>${show.q_title}</h1>
		</div>
		
		<div id="boardArea">
			<table width="900" cellspacing="0" border="1">
				<tr height="30" align="center">
					<td align="center" width="150">작성자</td>
					<td align="center" width="300">${show.u_id}</td>
					<td align="center" width="150">작성일</td>
					<td align="center" width="300">${show.q_date}</td>
				</tr>
				<tr height="30">
					<td align="center">질문제목</td>
					<td colspan="3" style="padding-left: 10px">${show.q_title}</td>
				</tr>
				<tr>
					<td height="250" align="center">질문내용</td>
					<td colspan="3" style="padding: 10px; vertical-align: top">${show.q_content}</td>
				</tr>
				<tr>
					<td height="250" align="center">답변</td>
					<td colspan="3" style="padding: 10px; vertical-align: top">${show.q_answer}</td>
				</tr>
			</table>
		</div>
		<div id="pageArea">
			<a href="modify_view?q_code=${show.q_code}">글 수정</a>
			<a href="delete?q_code=${show.q_code}">글 삭제</a>
			<a href="list?q_email=${show.q_email}">글 목록</a>
		</div>
	</div>
</body>
</html>