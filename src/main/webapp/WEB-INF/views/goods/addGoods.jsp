<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>

<link href="resources/css/main.css" rel="stylesheet" />
<style>
	.add_title {
		padding: 30px 0px 30px 0px;
	}
	
	.add_h3 {
		color: #222;
	    font-weight: 500;
	    font-size: 36px;
	    font-family: system-ui;
	}
		
	.button, .btn1, .btn2 {
		background-color: white;
		border-color: #E0E0E0;
		border-radius: 5px;
	} 
		
	.pic1_btn, .pic2_btn {
		display: none;
	}		
	
	#add_table {
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
		<div class="add_title">
			<h3 class="add_h3">[관리자] 상품 등록</h3>
		</div>
			<table class="table" id="add_table">
				<form name="fileForm" action="upload" method="post" enctype="multipart/form-data">
				<tr>
					<td>상품 이름</td><td><input type="text" name="g_name"  class="form-control"/></td>
				</tr>
				<tr>
					<td>상품 가격</td><td><input type="text" name="g_price" class="form-control"/></td>
				</tr>
				<tr>
					<td>상품 사진</td><td><input type="button" class="btn1" value="파일넣기">
					<input multiple="multiple" type="file" name="file" class="pic1_btn" /></td>
				</tr>
				<tr>
					<td>상품 상세 사진</td><td><input type="button" class="btn2" value="파일넣기">
					<input multiple="multiple" type="file" name="file" class="pic2_btn" /></td>
				</tr>
				<tr class="btn_tr">
					<td colspan="2">
					<input type="submit" value="전송" class="button"/></td>
				</tr>
				</form>
			</table>
		<a href="goodsList">목록가기</a>
	</div>
<jsp:include page="../main/mainFooter.jsp" flush="false"></jsp:include>
</body>
</html>
