<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% request.setCharacterEncoding("utf-8"); %>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<style type="text/css">
	  .pageInfo{
	      list-style : none;
	      display: inline-block;
	    margin: 50px 0 0 0;      
	  }
	  .pageInfo li{
	      float: left;
	    font-size: 20px;
	    padding: 7px;
	    font-weight: 500;
	  }
	 a:link {color:black; text-decoration: none;}
	 a:visited {color:black; text-decoration: none;}
	 a:hover {color:black; text-decoration: underline;}
	 .active{
      background-color: #cdd5ec;
  }
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

<script type="text/javascript">
	$(".pageInfo a").on("click", function(e) {
        e.preventDefault();
        moveForm.find("input[name='pageNum']").val($(this).attr("href"));
        moveForm.attr("action", "/qnaList");
        moveForm.submit();
	})
</script>
</head>
<body>
<jsp:include page="../main/mainHeader.jsp" flush="false"></jsp:include>
	<div id="content_area">
		<div id="title">
			<h3>1대1문의</h3>
		</div>
		<div id="boardArea">
			<table cellspacing="0" class="table">
				<tr height="25">
					<td width="40" align="center">번호</td>
					<td width="120" align="center">작성자</td>
					<td width="610" align="center">글제목</td>
					<td width="130" align="center">작성일</td>
				</tr>
				<c:set var="id" value="0"/>
				<c:set var="answer" value="답변없음"/>
				<c:set var="num" value="${pageMaker.total - ((pageMaker.cri.pageNum - 1) * 10)}"></c:set>
				<c:forEach items="${list}" var="dto">
					<tr align="center">
						<td>${num}</td>
						<c:choose>
							<c:when test="${id eq dto.u_id}">
								<td>${dto.q_email}</td>
							</c:when>
							<c:otherwise>
								<td>${dto.u_id}</td>
							</c:otherwise>
						</c:choose>
						<td align="left">
							<a href="qnaShow?q_code=${dto.q_code}" style="text-decoration: none;">
							<c:choose>
								<c:when test="${answer eq dto.q_answer}">
									[미답변]&nbsp;&nbsp;
								</c:when>
								<c:otherwise>
									[답변완료]&nbsp;&nbsp;
								</c:otherwise>
							</c:choose>
							${dto.q_title}</a>
						</td>
						<td><fmt:formatDate pattern="yyyy/MM/dd" value="${dto.q_date}"/> </td>
					</tr>
				<c:set var="num" value="${num-1 }"></c:set>
				</c:forEach>
			</table>
			
			<div class="pageInfo_wrap" align="center">
				<div class="pageInfo_area">
					<ul id="pageInfo" class="pageInfo">
					
					    <!-- 이전페이지 버튼 -->
		                <c:if test="${pageMaker.prev}">
		                    <li class="pageInfo_btn previous"><a href="?pageNum=${pageMaker.startPage-1}&q_email=${pageMaker.cri.q_email}">Previous</a></li>
		                </c:if>
					
						<!-- 각 번호 페이지 버튼 -->
		                <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
		                    <li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }"><a href="?pageNum=${num}&q_email=${pageMaker.cri.q_email}">${num}</a></li>
		                </c:forEach>
		                
				        <!-- 다음페이지 버튼 -->
		                <c:if test="${pageMaker.next}">
		                    <li class="pageInfo_btn next"><a href="?pageNum=${pageMaker.endPage + 1 }&q_email=${pageMaker.cri.q_email}">Next</a></li>
		                </c:if>  
		                
					</ul>
				</div>
			</div>
			
			<form id="moveForm" method="get">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
			</form>
			
		</div>
 		<div id="writeBtn" align="right">
		<%
		String u_auth = (String)session.getAttribute("u_auth");
		%>
		<c:set var="admin" value="A"/>
		<c:choose>
			<c:when test="${admin eq u_auth}">
				<input type="button" class="btn btn-outline-secondary btn-sm" value="메인으로" onclick="location.href='index'">
			</c:when>
			<c:otherwise>
				<input type="button" class="btn btn-outline-secondary btn-sm" value="1대1 문의하기" onclick="location.href='qna_main'">
				<input type="button" class="btn btn-outline-secondary btn-sm" value="메인으로" onclick="location.href='index'">
			</c:otherwise>
		</c:choose>
		<%-- <c:if test="${admin eq u_auth}"> <!-- 관리자만 작성 버튼 활성화 -->
			<a href="write_view">공지사항 작성</a>
		</c:if>
			<a href="index">메인으로</a> --%>
		</div>
	</div>
	<jsp:include page="../main/mainFooter.jsp" flush="false"></jsp:include>
</body>
</html>