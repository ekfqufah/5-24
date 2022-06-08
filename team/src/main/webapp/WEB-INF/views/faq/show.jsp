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
			<h3>${show.f_title}</h3>
		</div>
		
		<div id="boardArea">
			<table cellspacing="0" class="table">
				<tr height="25" align="center">
					<td width="100">카테고리</td>
					<td width="100">${show.f_category}</td>
					<td width="150">작성일</td>
					<td width="150"><fmt:formatDate pattern="yyyy/MM/dd" value="${show.f_date}"/></td>
				</tr>
				<tr height="30" align="center">
					<td colspan="1">질문</td>
					<td colspan="3" align="left">${show.f_title}</td>
				</tr>
				<tr>
					<td colspan="1" align="center">답변</td>
					<td colspan="3" style="padding: 10px; vertical-align: top">${show.f_content}</td>
				</tr>
			</table>
		</div>
		
		<div id="pageArea" align="right">
		<%
		String u_id = (String)session.getAttribute("u_id");
		String u_auth = (String)session.getAttribute("u_auth");
		%>
		<c:set var="admin" value="A"/>
		<c:if test="${admin eq u_auth}"> <!-- 관리자만 작성 버튼 활성화 -->
			<input type="button" class="btn btn-outline-secondary btn-sm" value="글 수정" onclick="location.href='faqModify_view?f_code=${show.f_code}'">
			<input type="button" class="btn btn-outline-secondary btn-sm" value="글 삭제" onclick="location.href='faqDelete?f_code=${show.f_code}'">
		</c:if>
			<input type="button" class="btn btn-outline-secondary btn-sm" value="글 목록" onclick="location.href='faqList'">
		</div>
	</div>
	<jsp:include page="../main/mainFooter.jsp" flush="false"></jsp:include>
</body>
</html>