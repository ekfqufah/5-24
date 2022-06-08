<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
	<center>
		<h1>글 수 정 하 기</h1>
		<form name="notice_form" method="post" action="modify?n_code=${show.n_code}">
			<table border="1">
				<tr height="30">
					<td width="80">작성자</td>
					<td width="140">
						${show.u_id}
					</td>
				</tr>
				<tr height="30">
					<td width="80">글제목</td>
					<td colspan="3" width="460">
						<input type="text" name="n_title" size="55" maxlength="50" value="${show.n_title}">
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<textarea rows="10" cols="65" name="n_content">${show.n_content}</textarea>
					</td>
				</tr>
				<tr height="50" align="center">
					<td colspan="4">
						<input type="submit" value="글수정">&nbsp;&nbsp;&nbsp;
						<input type="reset" value="다시작성">&nbsp;&nbsp;&nbsp;
						<!-- <input type="button" value="글목록" onclick="list"> -->
						<a href="list">글목록</a>
					</td>				
				</tr>
			</table>
		</form>
	</center>
</body>
</html>