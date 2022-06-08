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
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<style type="text/css">
        #content_area
    {
        /* min-width : 1120px;	
    	max-width : 1280px;	
    	margin:auto; */

        /* float: left; */
        margin: 5px 250px 0px 250px;
        /* display: flex;  */
        
    }
</style>
</head>
<body>
<jsp:include page="../main/mainHeader.jsp" flush="false"></jsp:include>
	<div id="content_area">
	<div id="content_area">
		<div id="title">
			<h3>FAQ</h3>
		</div>
		<form name="faq_form" method="post" action="faqWrite">
		<input type="hidden" name="f_num" value="${num}">
			<table class="table">
				<tr>
					<td width="100">UserID</td> <!-- 유저 아이디 input이 아니라 나중에 회원테이블에서 받아야함 -->
					<td width="150">
					<%
					String id = (String)session.getAttribute("u_id");
					%>
						<input type="text" name="u_id" value="<%=id%>" class="form-control" readonly="readonly" maxlength="50">
					</td>
					<td width="100">카테고리</td>
					<td width="150">
						<select name="f_category" class="form-control">
							<option value="예매/매표">예매/매표</option>
							<option value="결제">결제</option>
							<option value="오류">오류</option>
							<option value="영화관이용">영화관이용</option>
							<option value="기타">기타</option>
						</select>
					</td>
				</tr>
				<tr height="40">
					<td colspan="4">
						<textarea rows="3" class="form-control" cols="65" name="f_title" placeholder="제목"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<textarea rows="10" class="form-control" cols="65" name="f_content" placeholder="내용"></textarea>
					</td>
				</tr>
				<tr height="50" align="right">
					<td colspan="4">
						<input type="button" class="btn btn-outline-secondary btn-sm" value="작성완료" onclick="check_ok()">
						<input type="reset" class="btn btn-outline-secondary btn-sm" value="다시작성">
						<input type="button" class="btn btn-outline-secondary btn-sm" value="글목록" onclick="location.href='faqList'">
					</td>				
				</tr>
			</table>
		</form>
	</div>
	</div>
	<jsp:include page="../main/mainFooter.jsp" flush="false"></jsp:include>
</body>
</html>