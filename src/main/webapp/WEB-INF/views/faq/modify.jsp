<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script type="text/javascript" charset="UTF-8">
	function check_ok() {
		if (document.faq_form.f_title.value.length == 0) {
			alert("제목을 입력하세요.");
			faq_form.f_title.focus();
			return;
		}
		
		if (document.faq_form.f_content.value.length == 0) {
			alert("내용을 입력하세요.");
			faq_form.f_content.focus();
			return;
		}
		
		document.faq_form.submit();
	}

</script>
</head>
<body>
	<center>
		<h1>글 수 정 하 기</h1>
		<form name="faq_form" method="post" action="modify?f_code=${show.f_code}">
			<table border="1">
				<tr height="30">
					<td width="80">작성자</td>
					<td width="140">
						${show.u_id}
					</td>
				</tr>
				<tr height="30">
					<td width="80">카테고리</td>
					<td colspan="3" width="460">
						<select name="f_category">
							<option value="예매/매표">예매/매표</option>
							<option value="결제">결제</option>
							<option value="오류">오류</option>
							<option value="영화관이용">영화관이용</option>
							<option value="기타">기타</option>
						</select>
					</td>
				</tr>
				<tr height="30">
					<td width="80">글제목</td>
					<td colspan="3" width="460">
						<input type="text" name="f_title" size="55" maxlength="50" value="${show.f_title}">
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<textarea rows="10" cols="65" name="f_content">${show.f_content}</textarea>
					</td>
				</tr>
				<tr height="50" align="center">
					<td colspan="4">
						<input type="button" onclick="check_ok()" value="글수정">&nbsp;&nbsp;&nbsp;
						<input type="reset" value="다시작성">&nbsp;&nbsp;&nbsp;
						<a href="list">글목록</a>
					</td>				
				</tr>
			</table>
		</form>
	</center>
</body>
</html>