<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% request.setCharacterEncoding("utf-8"); %>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style type="text/css">
	  .pageInfo{
	      list-style : none;
	      display: inline-block;
	    margin: 50px 0 0 100px;      
	  }
	  .pageInfo li{
	      float: left;
	    font-size: 20px;
	    margin-left: 18px;
	    padding: 7px;
	    font-weight: 500;
	  }
	 a:link {color:black; text-decoration: none;}
	 a:visited {color:black; text-decoration: none;}
	 a:hover {color:black; text-decoration: underline;}
	 .active{
      background-color: #cdd5ec;
  }
</style>

<script type="text/javascript">
	$(".pageInfo a").on("click", function(e) {
        e.preventDefault();
        moveForm.find("input[name='pageNum']").val($(this).attr("href"));
        moveForm.attr("action", "/notice/list");
        moveForm.submit();
	})
</script>
</head>
<body>
	<div id="content_area">
		<div id="title">
			<h1>공지사항</h1>
		</div>
		<div id="boardArea">
			<table width="900" cellspacing="0" style="margin-bottom: 20px" border="1">
				<tr height="25">
					<td width="40" align="center">번호</td>
					<td width="550" align="center">글제목</td>
					<td width="120" align="center">작성자</td>
					<td width="130" align="center">작성일</td>
					<td width="60" align="center">조회수</td>
				</tr>
				<c:set var="num" value="${pageMaker.total - ((pageMaker.cri.pageNum - 1) * 10)}"></c:set>
				<c:forEach items="${list}" var="dto">
					<tr>
						<td>${num}</td>
						<td>
							<a href="show?n_code=${dto.n_code}">${dto.n_title}</a>
						</td>
						<td>${dto.u_id}</td>
						<td><fmt:formatDate pattern="yyyy/MM/dd" value="${dto.n_date}"/> </td>
						<td>${dto.n_view}</td>
					</tr>
				<c:set var="num" value="${num-1 }"></c:set>
				</c:forEach>
			</table>

			<div class="pageInfo_wrap">
				<div class="pageInfo_area">
					<ul id="pageInfo" class="pageInfo">
					
					    <!-- 이전페이지 버튼 -->
		                <c:if test="${pageMaker.prev}">
		                    <li class="pageInfo_btn previous"><a href="?pageNum=${pageMaker.startPage-1}">Previous</a></li>
		                </c:if>
					
						<!-- 각 번호 페이지 버튼 -->
		                <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
		                    <li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }"><a href="?pageNum=${num}">${num}</a></li>
		                </c:forEach>
		                
				        <!-- 다음페이지 버튼 -->
		                <c:if test="${pageMaker.next}">
		                    <li class="pageInfo_btn next"><a href="?pageNum=${pageMaker.endPage + 1 }">Next</a></li>
		                </c:if>  
		                
					</ul>
				</div>
			</div>
			
			<form id="moveForm" method="get">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
			</form>
		</div>
		<div id="writeBtn">
		<%
		String u_auth = (String)session.getAttribute("u_auth");
		%>
		<c:set var="admin" value="A"/>
		<c:if test="${admin eq u_auth}"> <!-- 관리자만 작성 버튼 활성화 -->
			<a href="write_view">공지사항 작성</a>
		</c:if>
			<a href="login_yn">메인으로</a>
		</div>
	</div>
</body>
</html>