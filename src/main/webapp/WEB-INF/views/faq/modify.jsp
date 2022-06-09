<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
	<div id="content_area">
		<h3>글 수 정 하 기</h3>
		<form name="faq_form" method="post" action="faqModify?f_code=${show.f_code}">
			<table class="table">
				<tr height="30">
					<td width="80">작성자</td>
					<td width="140">
						${show.u_id}
					</td>
				</tr>
				<tr height="30">
					<td width="80">카테고리</td>
					<td colspan="3" width="460">
						<select name="f_category" class="form-control">
							<option value="예매/매표">예매/매표</option>
							<option value="결제">결제</option>
							<option value="오류">오류</option>
							<option value="영화관이용">영화관이용</option>
							<option value="기타">기타</option>
						</select>
					</td>
				</tr>
				<tr height="30">
					<td width="80">글제목</td>
					<td colspan="3" width="460">
						<input type="text" class="form-control" name="f_title" size="55" maxlength="50" value="${show.f_title}">
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<textarea rows="10" class="form-control" cols="65" name="f_content">${show.f_content}</textarea>
					</td>
				</tr>
				<tr height="50" align="right">
					<td colspan="4">
						<input type="button" class="btn btn-outline-secondary btn-sm" value="글 수정" onclick="check_ok()">
						<input type="reset" class="btn btn-outline-secondary btn-sm" value="다시작성">
						<input type="button" class="btn btn-outline-secondary btn-sm" value="글 목록" onclick="location.href='faqList'">
					</td>				
				</tr>
			</table>
		</form>
	</div>
	</div>
	<jsp:include page="../main/mainFooter.jsp" flush="false"></jsp:include>
</body>
</html>