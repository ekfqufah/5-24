<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8"); 
	
	String id = (String)session.getAttribute("u_id");
	String admin = (String)session.getAttribute("u_auth");
%>
<!DOCTYPE html>
<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" charset="UTF-8">
	function check_ok() {
		if (document.qna_form.q_email.value.length == 0) {
			alert("이메일을 입력하세요.");
			qna_form.q_email.focus();
			return;
		}

		if (document.qna_form.q_title.value.length == 0) {
			alert("제목을 입력하세요.");
			qna_form.q_title.focus();
			return;
		}
		
		if (document.qna_form.q_content.value.length == 0) {
			alert("내용을 입력하세요.");
			qna_form.q_content.focus();
			return;
		}
		
		document.qna_form.submit();
	}

	function check_ok1() {
		if (document.qna_form1.q_email.value.length == 0) {
			alert("이메일을 입력하세요.");
			qna_form1.q_email.focus();
			return;
		}

		if (document.qna_form1.q_title.value.length == 0) {
			alert("제목을 입력하세요.");
			qna_form1.q_title.focus();
			return;
		}
		
		if (document.qna_form1.q_content.value.length == 0) {
			alert("내용을 입력하세요.");
			qna_form1.q_content.focus();
			return;
		}
		
		document.qna_form1.submit();
	}
	

</script>

<head>
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
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../main/mainHeader.jsp" flush="false"></jsp:include>
	<div id="content_area">
	<div id="content_area">
		<div id="title">
			<h3>1대1 문의하기</h3>
		</div>
		<c:set var="admin2" value="C"/>
		<c:choose>
		<c:when test="${admin2 eq userInfo.u_auth}">
			<!-- 회원일 경우의 작성 테이블 -->		
		<form name="qna_form" method="post" action="qnaWrite">
			<input type="hidden" name="q_num" value="0">
			<input type="hidden" name="q_answer" value="답변없음">
			<a href="qnaList?q_email=${userInfo.u_email}"><p align="right">문의한 글 보기</p></a>
			<table class="table">
				<tr>
					<td width="150">문의유형</td>
					<td width="750">
						<select name="q_category" class="form-control">
							<option value="일반문의">일반문의</option>
							<option value="칭찬">칭찬</option>
							<option value="불만">불만</option>
							<option value="제안">제안</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>아이디</td>
					<td>
						<input type="text" class="form-control" name="u_id" value="${userInfo.u_id}" readonly="readonly">
					</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>
						<input type="text" class="form-control" name="q_email" size="25" value="${userInfo.u_email}">
					</td>
				</tr>
				<tr>
					<td>제목</td>
					<td>
						<input type="text" class="form-control" name="q_title" size="50">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea rows="10" class="form-control" cols="50" name="q_content" placeholder="내용"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input type="button" class="btn btn-outline-secondary btn-sm" value="작성완료" onclick="check_ok()">
						<input type="reset" class="btn btn-outline-secondary btn-sm" value="다시작성">
					</td>				
				</tr>
			</table>
		</form>
		</c:when>
		<c:otherwise>
			<!-- 비회원일 경우의 작성 테이블 -->
		<form name="qna_form1" method="post" action="qnaWrite">
			<!-- 비회원은 안쓰지만 write메소드에 필요한 변수값 -->
			<input type="hidden" name="u_id" value="0">
			<input type="hidden" name="q_num" value="0">
			<input type="hidden" name="q_answer" value="답변없음">
			<table class="table">
				<tr>
					<td width="150">이메일</td> <!-- 이메일 인증 api 넣자 -->
					<td width="300">
						<div class="form-group email-form">
							<input class="form-control" type="text" id="u_email" name="q_email" size="30" placeholder="이메일을 기입해 주세요">
						</div>
					</td>
					<td width="100">
						<div class="input-group-addon">
							<button class="btn btn-outline-secondary btn-sm" type="button" id="mail-Check-Btn">본인인증</button>
						</div>
					</td>
					<td width="200">
						<div class="mail-check-box">
							<input class="form-control mail-check-input" placeholder="인증번호 6자리 입력" disabled="disabled" maxlength="6">
						</div>
						<span id="mail-check-warn"></span>
					</td>
				</tr>
				<tr>
					<
				</tr>
				<tr>
					<td>문의유형</td>
					<td colspan="3">
						<select name="q_category" class="form-control">
							<option value="일반문의">일반문의</option>
							<option value="칭찬">칭찬</option>
							<option value="불만">불만</option>
							<option value="제안">제안</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>제목</td>
					<td colspan="3">
						<input type="text" class="form-control" name="q_title" size="50">
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<textarea rows="10" class="form-control" cols="50" name="q_content" placeholder="내용"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="4" align="right">
						<input type="button" class="btn btn-outline-secondary btn-sm" value="작성완료" onclick="check_ok1()">
						<input type="reset" class="btn btn-outline-secondary btn-sm" value="다시작성">
					</td>				
				</tr>
			</table>
		</form>
		<form name="qna_form2" action="qnaList">
			<table class="table">
				<tr>
					<td colspan="4">문의한 글 보기</td>
				</tr>
				<tr>
					<td width="300">
						<div class="form-group email-form">
							<input class="form-control" type="text" id="u_email" size="30" placeholder="이메일을 기입해 주세요">
						</div>
					</td>
					<td width="100">
						<div class="input-group-addon">
							<button class="btn btn-outline-secondary btn-sm" type="button" id="mail-Check-Btn1">본인인증</button>
						</div>
					</td>
					<td width="200">
						<div class="mail-check-box">
							<input class="form-control mail-check-input" placeholder="인증번호 6자리 입력" disabled="disabled" maxlength="6">
						</div>
						<span id="mail-check-warn"></span>
					</td>
					<td>
						<input type="submit" class="btn btn-outline-secondary btn-sm" value="조회" oncl>
					</td>
				</tr>
			</table>
		</form>
		</c:otherwise>
		</c:choose>
	</div>
	</div>
	<jsp:include page="../main/mainFooter.jsp" flush="false"></jsp:include>
	<script type="text/javascript">
	$('#mail-Check-Btn').click(function() {
		const email = $('#u_email').val(); // 이메일 주소값 얻어오기!
		console.log('완성된 이메일 : ' + email); // 이메일 오는지 확인
		const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 
		
		$.ajax({
			type : 'get',
			//url : '<c:url value ="mailCheck?email="/>'+email, // GET방식이라 Url 뒤에 email을 뭍힐수있다.
			url : "mailCheck1",
			data : {"email" : email},		
			success : function (data) {
				console.log("data : " +  data);
				checkInput.attr('disabled', false);
				code = data;
				alert('인증번호가 전송되었습니다.')
			}			
		}); // end ajax
	}); // end send eamil
	
	// 인증번호 비교 
	// blur -> focus가 벗어나는 경우 발생
	$('.mail-check-input').blur(function () {
		const inputCode = $(this).val();
		const $resultMsg = $('#mail-check-warn');
		
		if(inputCode === code){
			$resultMsg.html('<p style="font-size: x-small;">인증번호가 일치합니다.</p>');
			$resultMsg.css('color','green');
			$('#mail-Check-Btn').attr('disabled',true);
			$('#u_email').attr('readonly',true);
			$('#u_email').attr('onFocus', 'this.initialSelect = this.selectedIndex');
	         $('#u_email').attr('onChange', 'this.selectedIndex = this.initialSelect');
		}else{
			$resultMsg.html('<p style="font-size: x-small;">인증번호가 불일치 합니다. 다시 확인해주세요!</p>');
			$resultMsg.css('color','red');
		}
	});
	</script>
	<script type="text/javascript">
	$('#mail-Check-Btn1').click(function() {
		const email = $('#u_email').val(); // 이메일 주소값 얻어오기!
		console.log('완성된 이메일 : ' + email); // 이메일 오는지 확인
		const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 
		
		$.ajax({
			type : 'get',
			//url : '<c:url value ="mailCheck?email="/>'+email, // GET방식이라 Url 뒤에 email을 뭍힐수있다.
			url : "mailCheck1",
			data : {"email" : email},		
			success : function (data) {
				console.log("data : " +  data);
				checkInput.attr('disabled', false);
				code = data;
				alert('인증번호가 전송되었습니다.')
			}			
		}); // end ajax
	}); // end send eamil
	
	// 인증번호 비교 
	// blur -> focus가 벗어나는 경우 발생
	$('.mail-check-input').blur(function () {
		const inputCode = $(this).val();
		const $resultMsg = $('#mail-check-warn');
		
		if(inputCode === code){
			$resultMsg.html('<p style="font-size: x-small;">인증번호가 일치합니다.</p>');
			$resultMsg.css('color','green');
			$('#mail-Check-Btn').attr('disabled',true);
			$('#u_email').attr('readonly',true);
			$('#u_email').attr('onFocus', 'this.initialSelect = this.selectedIndex');
	         $('#u_email').attr('onChange', 'this.selectedIndex = this.initialSelect');
		}else{
			$resultMsg.html('<p style="font-size: x-small;">인증번호가 불일치 합니다. 다시 확인해주세요!</p>');
			$resultMsg.css('color','red');
		}
	});
	</script>
</body>
</html>