<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8"); 
	
	String id = (String)session.getAttribute("u_id");
	String admin = (String)session.getAttribute("u_auth");
%>
<!DOCTYPE html>
<html>
<script type="text/javascript" charset="UTF-8">
	function check_ok() {
		if (document.qna_form.q_email.value.length == 0) {
			alert("이메일을 입력하세요.");
			qna_form.q_email.focus();
			return;
		}

		if (document.qna_form.q_title.value.length == 0) {
			alert("제목을 입력하세요.");
			qna_form.q_title.focus();
			return;
		}
		
		if (document.qna_form.q_content.value.length == 0) {
			alert("내용을 입력하세요.");
			qna_form.q_content.focus();
			return;
		}
		
		document.qna_form.submit();
	}
	
</script>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<div id="content_area">
		<div id="title">
			<h1>1대1 문의하기</h1>
		</div>
		<c:set var="admin2" value="C"/>
		<c:choose>
		<c:when test="${admin2 eq userInfo.u_auth}">
			<!-- 회원일 경우의 작성 테이블 -->		
		<form name="qna_form" method="post" action="qna/write">
			<input type="hidden" name="q_num" value="0">
			<input type="hidden" name="q_answer" value="답변없음">
			<a href="qna/list?q_email=${userInfo.u_email}">문의한 글 보기</a>
			<table border="1" width="900">
				<tr>
					<td width="150">문의유형</td>
					<td width="750">
						<select name="q_category">
							<option value="일반문의">일반문의</option>
							<option value="칭찬">칭찬</option>
							<option value="불만">불만</option>
							<option value="제안">제안</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>아이디</td>
					<td>
						<input type="text" name="u_id" value="${userInfo.u_id}" readonly="readonly">
					</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>
						<input type="text" name="q_email" size="25" value="${userInfo.u_email}">
					</td>
				</tr>
				<tr>
					<td>제목</td>
					<td>
						<input type="text" name="q_title" size="50">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea rows="10" cols="50" name="q_content" placeholder="내용"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" onclick="check_ok()" value="작성완료">&nbsp;
						<input type="reset" value="다시작성">&nbsp;
					</td>				
				</tr>
			</table>
		</form>
		</c:when>
		<c:otherwise>
			<!-- 비회원일 경우의 작성 테이블 -->
		<form name="qna_form" method="post" action="qna/write">
			<!-- 비회원은 안쓰지만 write메소드에 필요한 변수값 -->
			<input type="hidden" name="u_id" value="0">
			<input type="hidden" name="q_num" value="0">
			<input type="hidden" name="q_answer" value="답변없음">
			<table border="1" width="900">
				<tr>
					<td width="150">문의유형</td>
					<td width="750">
						<select name="q_category">
							<option value="일반문의">일반문의</option>
							<option value="칭찬">칭찬</option>
							<option value="불만">불만</option>
							<option value="제안">제안</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>이메일</td> <!-- 이메일 인증 api 넣자 -->
					<td>
						<input type="text" id="q_email" class="q_email" name="q_email" size="25">
						<button type="button" id="email_auth_btn" >인증번호 받기</button>
					</td>
				</tr>
				<tr>
					<td>인증번호</td>
					<td>
						<input type="text" placeholder="인증번호 입력" id="email_auth_key">
					</td>
				</tr>
				<tr>
					<td>제목</td>
					<td>
						<input type="text" name="q_title" size="50">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea rows="10" cols="50" name="q_content" placeholder="내용"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" onclick="check_ok()" value="작성완료">&nbsp;
						<input type="reset" value="다시작성">&nbsp;
					</td>				
				</tr>
			</table>
		</form>
		<form name="qna_form" action="qna/list">
			<table border="1">
				<tr>
					<td colspan="2">문의한 글 보기</td>
				</tr>
				<tr>
					<td>
						<input type="text" name="q_email" size="25">
					</td>
					<td>
						<input type="submit" value="조회">
					</td>
				</tr>
			</table>
		</form>
		</c:otherwise>
		</c:choose>
	</div>
</body>
</html>