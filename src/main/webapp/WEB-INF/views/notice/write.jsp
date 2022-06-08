<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script type="text/javascript" charset="UTF-8">
	function check_ok() {
		if (document.notice_form.n_title.value.length == 0) {
			alert("제목을 입력하세요.");
			notice_form.n_title.focus();
			return;
		}
		
		if (document.notice_form.n_content.value.length == 0) {
			alert("내용을 입력하세요.");
			notice_form.n_content.focus();
			return;
		}
		
		document.notice_form.submit();
	}

</script>
</head>
<body>
	<div id="content_area">
		<div id="title">
			<h1>공지사항</h1>
		</div>
		<form name="notice_form" method="post" action="write">
		<input type="hidden" name="n_num" value="${num}">
			<table border="1">
				<tr height="30">
					<td>UserID</td> <!-- 유저 아이디 input이 아니라 나중에 회원테이블에서 받아야함 -->
					<td>
					<%
					String id = (String)session.getAttribute("u_id");
					%>
						<input type="text" name="u_id" size="50" value="<%=id%>" readonly="readonly" maxlength="50">
					</td>
				</tr>
				<tr height="30">
					<td>제목</td>
					<td>
						<input type="text" name="n_title" size="50" maxlength="50">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea rows="10" cols="65" name="n_content" placeholder="내용"></textarea>
					</td>
				</tr>
				<tr height="50" align="center">
					<td colspan="2">
						<input type="button" onclick="check_ok()" value="작성완료" >&nbsp;
						<input type="reset" value="다시작성">&nbsp;
						<!-- <input type="button" value="글목록" onclick="list"> -->
						<a href="list">글목록</a>
					</td>				
				</tr>
			</table>
		</form>
	</div>
</body>
</html>