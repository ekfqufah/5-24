<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% request.setCharacterEncoding("utf-8");
	String u_id = (String)session.getAttribute("u_id");
%>
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

<script type="text/javascript">
	$(".pageInfo a").on("click", function(e) {
        e.preventDefault();
        moveForm.find("input[name='pageNum']").val($(this).attr("href"));
        moveForm.attr("action", "/reviewList");
        moveForm.submit();
	})
	
/* 	$(function() {
		$("input:button[name='good']").on('click',function(){
			var yn = $(this).val(); //버튼이 클릭 되었을 시, 개별 버튼의 값이 yn 변수에 담김
			var u_id = $('.u_id').val();
			var r_code = $('.r_code').val();
			$.ajax({
				url:"good",
				type:"post",
				dataType:"json",
				data:{
					"yn":yn,
					"u_id":u_id,
					"r_code":r_code
				},
				success:function(data) {
					console.log(data);
				},
			});
		});
	}); */
</script>
</head>
<body>
<jsp:include page="../main/mainHeader.jsp" flush="false"></jsp:include>
	<div id="content_area">
	<div id="content_area">
		<div id="title">
			<h3>리뷰 게시판</h3>
		</div>
		<div id="boardArea">
			<table class="table" cellspacing="0">
				<tr height="25">
					<td width="40" align="center">No.</td>
					<td width="550" align="center">리뷰</td>
					<td width="120" align="center">작성자</td>
					<td width="130" align="center">작성일</td>
					<td width="60" align="center">추천</td>
				</tr>
				<c:set var="num" value="${pageMaker.total - ((pageMaker.cri.pageNum - 1) * 10)}"></c:set>
				<c:forEach items="${list}" var="dto">
					<tr>
						<td>${num}</td>
						<td>
							${dto.r_name}</a>
						</td>
						<td>${dto.u_id}</td>
						<td><fmt:formatDate pattern="yyyy/MM/dd" value="${dto.n_date}"/> </td>
						<td>
						<a href="reviewGood?u_id=<%= u_id %>&r_code=${dto.r_code}">추천</a>
						<!-- <input type="button" name="good" value="추천"> -->
						<%-- <input type="hidden" class="u_id" value="<%= u_id %>">
						<input type="hidden" class="r_code" value="${dto.r_code}"> --%>
						</td>
					</tr>
					<!-- 여기 수정해야함 분기처리 작성자랑 관리자만 수정삭제 버튼 보이게 -->
					<c:set var="admin" value="A"/>
					<c:set var="id" value="<%= u_id %>"/>
					<c:choose>
						<c:when test="${admin eq dto.u_auth}">
							<tr>
								<td colspan="5" align="right">
								<button type="button" onclick="location.href='reviewModify'">수정</button>&nbsp;&nbsp;
								<button type="button" onclick="location.href='reviewDelete'">삭제</button>&nbsp;&nbsp;&nbsp;&nbsp;
								</td>
							</tr>
						</c:when>
						<c:when test="${dto.u_id eq id}">
							<tr>
								<td colspan="5" align="right">
								<button type="button" onclick="location.href='reviewModify'">수정</button>&nbsp;&nbsp;
								<button type="button" onclick="location.href='reviewDelete'">삭제</button>&nbsp;&nbsp;&nbsp;&nbsp;
								</td>
							</tr>
						</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose>
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
		<div id="writeBtn" align="right">
		<%-- <%
		String u_auth = (String)session.getAttribute("u_auth");
		%>
		<c:set var="admin" value="A"/>
		<c:if test="${admin eq u_auth}"> <!-- 관리자만 작성 버튼 활성화 -->
			<a href="write_view">공지사항 작성</a>
		</c:if> --%>
			<a href="index">메인으로</a>
		</div>
	</div>
	</div>
	<jsp:include page="../main/mainFooter.jsp" flush="false"></jsp:include>
</body>
</html>