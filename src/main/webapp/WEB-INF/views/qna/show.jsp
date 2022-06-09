<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="../main/mainHeader.jsp" flush="false"></jsp:include>
	<div id="content_area">
		<div id="title">
			<h3>${show.q_title}</h3>
		</div>
		
		<div id="boardArea">
			<table cellspacing="0" class="table">
				<tr height="30" align="center">
					<td align="center" width="150">작성자</td>
					<td align="center" width="300">${show.u_id}</td>
					<td align="center" width="150">작성일</td>
					<td align="center" width="300"><fmt:formatDate pattern="yyyy/MM/dd" value="${show.q_date}"/></td>
				</tr>
				<tr height="30">
					<td align="center">질문제목</td>
					<td colspan="3" style="padding-left: 10px">${show.q_title}</td>
				</tr>
				<tr>
					<td height="250" align="center">질문내용</td>
					<td colspan="3" style="padding: 10px; vertical-align: top">${show.q_content}</td>
				</tr>
				<tr>
					<td height="250" align="center">답변</td>
					<td colspan="3" style="padding: 10px; vertical-align: top">${show.q_answer}</td>
				</tr>
			</table>
		</div>
		<div id="pageArea" align="right">
			<input type="button" class="btn btn-outline-secondary btn-sm" value="글 수정" onclick="location.href='qnaModify_view?q_code=${show.q_code}'">
			<input type="button" class="btn btn-outline-secondary btn-sm" value="글 삭제" onclick="location.href='qnaDelete?q_code=${show.q_code}'">
			<input type="button" class="btn btn-outline-secondary btn-sm" value="글 목록" onclick="location.href='qnaList?q_email=${show.q_email}'">
		</div>
	</div>
	<jsp:include page="../main/mainFooter.jsp" flush="false"></jsp:include>
</body>
</html>