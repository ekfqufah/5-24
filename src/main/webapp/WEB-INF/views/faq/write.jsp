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
	<div id="content_area">
		<div id="title">
			<h1>FAQ</h1>
		</div>
		<form name="faq_form" method="post" action="write">
		<input type="hidden" name="f_num" value="${num}">
			<table border="1" width="500">
				<tr>
					<td width="100">UserID</td> <!-- 유저 아이디 input이 아니라 나중에 회원테이블에서 받아야함 -->
					<td width="150">
					<%
					String id = (String)session.getAttribute("u_id");
					%>
						<input type="text" name="u_id" value="<%=id%>" readonly="readonly" maxlength="50">
					</td>
					<td width="100">카테고리</td>
					<td width="150">
						<select name="f_category">
							<option value="예매/매표">예매/매표</option>
							<option value="결제">결제</option>
							<option value="오류">오류</option>
							<option value="영화관이용">영화관이용</option>
							<option value="기타">기타</option>
						</select>
					</td>
				</tr>
				<tr height="20">
					<td colspan="4">제목</td>
				</tr>
				<tr height="40">
					<td colspan="4">
						<textarea rows="3" cols="65" name="f_title" placeholder="제목"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<textarea rows="10" cols="65" name="f_content" placeholder="내용"></textarea>
					</td>
				</tr>
				<tr height="50" align="center">
					<td colspan="4">
						<input type="button" onclick="check_ok()" value="작성완료">&nbsp;
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