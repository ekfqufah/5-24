<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" align="center">
		<form method="post" action="login_yn">
			<tr height="30">
				<td width="100" align="center">
					사용자ID
				</td>
				<td width="100">
					<input type="text" name="u_id">
				</td>
			</tr>
			<tr height="30">
				<td width="100" align="center">
					비밀번호
				</td>
				<td width="100">
					<input type="password" name="u_pwd">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="로그인">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="button" onclick="location.href='register'">회원가입</button>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<a href="findId">아이디 찾기</a>
					<a href="findPwd">| 비밀번호 찾기</a>
				</td>
			</tr>
		</form>
	</table>
</body>
</html>