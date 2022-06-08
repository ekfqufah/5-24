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
		if (document.notice_form.n_title.value.length == 0) {
			alert("제목을 입력하세요.");
			notice_form.n_title.focus();
			return;
		}
		
		if (document.notice_form.n_content.value.length == 0) {
			alert("내용을 입력하세요.");
			notice_form.n_content.focus();
			return;
		}
		
		document.notice_form.submit();
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
			<h3>공지사항 작성</h3>
		</div><hr>
		<div align="center">
		<form name="notice_form" method="post" action="noticeWrite">
	<%
	String id = (String)session.getAttribute("u_id");
	%>
		<input type="hidden" name="n_num" value="${num}">
		<input type="hidden" name="u_id" value="<%=id%>">
			<table class="table">
				</tr>
				<tr height="30">
					<td colspan="2">
						<input class="form-control" type="text" name="n_title" placeholder="제목">
					</td>
				</tr>
				<tr>
					<td colspan="2">
					<div class="form-floating">
						<textarea style="height: 200px" class="form-control" id="floatingTextarea2" rows="" cols="100" name="n_content" placeholder="내용"></textarea>
					</div>
					</td>
				</tr>
				<tr height="50" align="right">
					<td colspan="2">
						<input type="button" class="btn btn-outline-secondary btn-sm" onclick="check_ok()" value="작성완료" >&nbsp;
						<input type="reset" class="btn btn-outline-secondary btn-sm" value="다시작성">&nbsp;
						<input type="button" class="btn btn-outline-secondary btn-sm" value="글목록" onclick="location.href='noticeList'">
					</td>				
				</tr>
			</table>
		</form>
		</div>
	</div>
	</div>
<jsp:include page="../main/mainFooter.jsp" flush="false"></jsp:include>
</body>
</html>