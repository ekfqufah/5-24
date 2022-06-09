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
		<div id="title">
			<h3>${show.n_title}</h3>
		</div>
		
		<div id="boardArea">
			<table width="900" cellspacing="0" class="table">
				<tr height="30" align="center">
					<td width="150" align="center">글번호</td>
					<td width="300" align="center">${show.n_num}</td>
					<td width="150" align="center">조회수</td>
					<td width="300" align="center">${show.n_view}</td>
				</tr>
				<tr height="30">
					<td align="center">작성자</td>
					<td align="center">${show.u_id}</td>
					<td align="center">작성일</td>
					<td align="center"><fmt:formatDate pattern="yyyy/MM/dd" value="${show.n_date}"/> </td>
				</tr>
				<tr height="30">
					<td align="center">글제목</td>
					<td colspan="3" style="padding-left: 10px">${show.n_title}</td>
				</tr>
				<tr>
					<td height="250" align="center">글내용</td>
					<td colspan="3" height="400" style="padding: 10px; vertical-align: top">${show.n_content}</td>
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
			<input type="button" class="btn btn-outline-secondary btn-sm" value="글 수정" onclick="location.href='noticeModify_view?n_code=${show.n_code}'">
			<input type="button" class="btn btn-outline-secondary btn-sm" value="글 삭제" onclick="location.href='noticeDelete?n_code=${show.n_code}'">
		</c:if>
			<input type="button" class="btn btn-outline-secondary btn-sm" value="글목록" onclick="location.href='noticeList'">
		</div>
	</div>
<jsp:include page="../main/mainFooter.jsp" flush="false"></jsp:include>
</body>
</html>