<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<%
	String u_auth = (String)session.getAttribute("u_auth");
%>
</head>
<body>
	<center>
		<h1>글 수 정 하 기</h1>
		<form name="notice_form" method="post" action="modify?q_code=${show.q_code}">
			<table width="900" cellspacing="0" border="1">
				<tr height="30" align="center">
					<td align="center" width="150">작성자</td>
					<td align="center" width="300">${show.u_id}</td>
					<td align="center" width="150">작성일</td>
					<td align="center" width="300">${show.q_date}</td>
				</tr>
				<tr height="30">
					<td align="center">질문구분</td>
					<td colspan="3" style="padding-left: 10px">
						<select name="q_category">
							<option value="일반문의">일반문의</option>
							<option value="칭찬">칭찬</option>
							<option value="불만">불만</option>
							<option value="제안">제안</option>
						</select>
					<input type="text" name="q_category" value="${show.q_category}">
					</td>
				</tr>
				<tr height="30">
					<td align="center">질문제목</td>
					<td colspan="3" style="padding-left: 10px">
					<input type="text" name="q_title" value="${show.q_title}">
					</td>
				</tr>
				<tr>
					<td height="250" align="center">질문내용</td>
					<td colspan="3" style="padding: 10px; vertical-align: top">
						<textarea rows="10" cols="65" name="q_content" >${show.q_content}</textarea>
					</td>
				</tr>
				<tr>
					<td height="250" align="center">답변</td>
					<td colspan="3" style="padding: 10px; vertical-align: top">
					<c:set var="admin" value="A"/>
					<c:choose>
						<c:when test="${admin eq u_auth}">
							<textarea rows="10" cols="65" name="q_answer">${show.q_answer}</textarea>
						</c:when>
						<c:otherwise>
							<textarea rows="10" cols="65" name="q_answer" readonly="readonly">${show.q_answer}</textarea>
						</c:otherwise>
					</c:choose>
					</td>
				</tr>
				<tr height="50" align="center">
					<td colspan="4">
						<input type="submit" value="글수정">&nbsp;&nbsp;&nbsp;
						<input type="reset" value="다시작성">&nbsp;&nbsp;&nbsp;
						<a href="list?q_email=${show.q_email}">글목록</a>
					</td>				
				</tr>
			</table>
		</form>
	</center>
</body>
</html>