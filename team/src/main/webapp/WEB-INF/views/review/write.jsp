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
		if (document.review_form.r_rate.value.length == 0) {
			alert("평점을 입력하세요.");
			review_form.r_rate.focus();
			return;
		}

		if (document.review_form.r_name.value.length == 0) {
			alert("리뷰내용을 입력하세요.");
			review_form.r_name.focus();
			return;
		}
		
		document.review_form.submit();
	}

</script>
</head>
<body>
<jsp:include page="../main/mainHeader.jsp" flush="false"></jsp:include>
	<div id="content_area">
		<div id="title">
			<h1>리뷰글 작성</h1>
		</div>
		<form name="review_form" method="post" action="write">
		<input type="hidden" name="b_code" value="##########################">  <!-- 마이페이지에서 받은 예매코드 정보 -->   
			<table border="1" width="500">
				<tr>
					<td width="100">UserID</td> <!-- 유저 아이디 input이 아니라 나중에 회원테이블에서 받아야함 -->
					<td width="150">
					<%
					String id = (String)session.getAttribute("u_id");
					%>
						<input type="text" name="u_id" value="<%=id%>" readonly="readonly" width="145">
					</td>
					<td width="100">평점</td>
					<td width="150">
						<input type="number" name="r_rate" width="145">
					</td>
				</tr>
				<tr>
					<td colspan="4">리뷰내용</td>
				</tr>
				<tr>
					<td colspan="4">
					<textarea rows="3" cols="50" name="r_name" placeholder="리뷰내용"></textarea>
					<!-- <input type="text" name="r_name" width="495"> -->
					</td>
				</tr>
				<tr height="50" align="center">
					<td colspan="2">
						<input type="button" onclick="check_ok()" value="작성완료">&nbsp;
						<input type="reset" value="다시작성">&nbsp;
						<input type="button" value="리뷰목록" onclick="location.href='list'">
					</td>				
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="../main/mainFooter.jsp" flush="false"></jsp:include>
</body>
</html>