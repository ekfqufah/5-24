<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<meta charset="utf-8">
<title>Insert title here</title>
<%
	String u_auth = (String)session.getAttribute("u_auth");
%>
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
		<h3>글 수 정 하 기</h3>
		<form name="qna_form" method="post" action="qnaModify?q_code=${show.q_code}">
			<table cellspacing="0" class="table">
				<tr height="30" align="center">
					<td align="center" width="100">작성자</td>
					<td align="center" width="200">${show.u_id}</td>
					<td align="center" width="100">작성일</td>
					<td align="center" width="200"><fmt:formatDate pattern="yyyy/MM/dd" value="${show.q_date}"/> </td>
				</tr>
				<tr height="30">
					<td align="center">질문구분</td>
					<td colspan="3" style="width: 40">
						<select name="q_category" class="form-control">
							<option value="일반문의">일반문의</option>
							<option value="칭찬">칭찬</option>
							<option value="불만">불만</option>
							<option value="제안">제안</option>
						</select>
					</td>
				</tr>
				<tr height="30">
					<td align="center">질문제목</td>
					<td colspan="3" style="padding-left: 10px">
					<input type="text" class="form-control" name="q_title" value="${show.q_title}">
					</td>
				</tr>
				<tr>
					<td height="250" align="center">질문내용</td>
					<td colspan="3" style="padding: 10px; vertical-align: top">
						<textarea rows="10" class="form-control" cols="65" name="q_content" >${show.q_content}</textarea>
					</td>
				</tr>
				<tr>
					<td height="250" align="center">답변</td>
					<td colspan="3" style="padding: 10px; vertical-align: top">
					<c:set var="admin" value="A"/>
					<c:choose>
						<c:when test="${admin eq u_auth}">
							<textarea class="form-control" rows="10" cols="65" name="q_answer">${show.q_answer}</textarea>
						</c:when>
						<c:otherwise>
							<textarea class="form-control" rows="10" cols="65" name="q_answer" readonly="readonly">${show.q_answer}</textarea>
						</c:otherwise>
					</c:choose>
					</td>
				</tr>
				<tr height="50" align="right">
					<td colspan="4">
						<input type="submit" class="btn btn-outline-secondary btn-sm" value="글수정">&nbsp;
						<input type="submit" class="btn btn-outline-secondary btn-sm" onclick="location.href='qnaList?q_email=${show.q_email}'" value="글목록">&nbsp;
						<input type="reset" class="btn btn-outline-secondary btn-sm" value="다시작성">&nbsp;
					</td>				
				</tr>
			</table>
		</form>
	</div>
	</div>
	<jsp:include page="../main/mainFooter.jsp" flush="false"></jsp:include>
</body>
</html>