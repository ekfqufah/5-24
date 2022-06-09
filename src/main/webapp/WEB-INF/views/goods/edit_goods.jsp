<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>

<link href="resources/css/main.css" rel="stylesheet" />
<style>
	.edit_title {
		padding: 30px 0px 30px 0px;
	}
	
	.edit_h3 {
		color: #222;
	    font-weight: 500;
	    font-size: 36px;
	    font-family: system-ui;
	}
	
	.save_btn, .reset_btn, .list_btn, .btn1, .btn2 {
		background-color: white;
		border-color: #E0E0E0;
		border-radius: 5px;
	} 
	
	.pic1_btn, .pic2_btn {
		display: none;
	}
	
	#edit_table {
		margin-left: auto;
		margin-right: auto;
	}
	
	.btn_tr {
		text-align: center;
	}
</style>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>

	$(function() {
		$(".btn1").click(function () {
		    $(".pic1_btn").trigger('click');
		});
	});

	$(function() {
		$(".btn2").click(function () {
		    $(".pic2_btn").trigger('click');
		});
	});
</script>
</head>
<body>
<jsp:include page="../main/mainHeader.jsp" flush="false"></jsp:include>
	<div class="main_body">
		<div class="edit_title">
			<h3 class="edit_h3">[관리자] 상품 수정</h3>
		</div>
		<table class="table" id="edit_table">
			<form method="post" action="edit_goods" enctype="multipart/form-data">
				<input type="hidden" name="g_code" value="${dto.g_code}">
				<tr>
					<td>상품 코드</td><td>${dto.g_code }</td>
				</tr>
				<tr>
					<td>상품 이름</td><td><input type="text" name="g_name" value="${dto.g_name }" class="form-control"></td>
				</tr>
				<tr>
					<td>상품 가격</td><td><input type="text" name="g_price" value="${dto.g_price}" class="form-control"></td>
				</tr>
				<tr>
					<td>상품 사진</td><td><input type="button" class="btn1" value="파일넣기">
					<input type="file" name="file" multiple="multiple" class="pic1_btn"></td>
				</tr>
				<tr>
					<td>상품 상세 사진</td><td><input type="button" class="btn2" value="파일넣기"> 
					<input type="file" name="file" multiple="multiple" class="pic2_btn"></td>
				</tr>
				<tr class="btn_tr">
					<td colspan="2" >
						<input type="submit" value="저장" class="save_btn">
						<input type="reset" value="글 지우기" class="reset_btn">
						<input type="button" value="목록보기" onclick="location.href='goodsList'" class="list_btn">
					</td>
				</tr>
			</form>
		</table>
	</div>
	
<jsp:include page="../main/mainFooter.jsp" flush="false"></jsp:include>
</body>
</html>