<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	.reg_title {
		padding: 30px 0px 30px 0px;
	}
	
	.reg_h3 {
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
		
	#reg_table {
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
		<div class="reg_title">
			<h3 class="reg_h3">[관리자] 영화 등록</h3>
		</div>
		<table class="table" id="reg_table">
			<form method="post" action="reg_movie_insert" enctype="multipart/form-data">
	<%--
				<tr>
					<td>영화 코드</td><td><input type="text" name="m_code"></td>
				</tr>
	 --%>
				<tr>
					<td>개봉 일자</td><td><input type="text" name="m_date" class="form-control"></td>
				</tr>
				<tr>
					<td>영화 제목</td><td><input type="text" name="m_title" class="form-control"></td>
				</tr>
				<tr>
					<td>영화 소개</td><td><input type="text" name="m_intro" class="form-control"></td>
				</tr>
				<tr>
					<td>영화 설명</td><td><textarea row="7" name="m_detail" class="form-control"></textarea></td>
				</tr>
				<tr>
					<td>상영 시간</td><td><input type="text" name="m_time" class="form-control"></td>
				</tr>
				<tr>
					<td>상영 기간</td><td><input type="text" name="m_period" class="form-control"></td>
				</tr>
				<tr>
					<td>관람 등급</td><td><input type="text" name="m_grade" class="form-control"></td>
				</tr>
				<tr>
					<td>장르</td><td><input type="text" name="m_genre" class="form-control"></td>
				</tr>
	<%--
				<tr>
					<td>리뷰 코드</td><td><input type="text" name="r_code"></td>
				</tr>
	 --%>
				<tr>
					<td>감독명</td><td><input type="text" name="m_director" class="form-control"></td>
				</tr>
				<tr>
					<td>배우</td><td><input type="text" name="m_actor" class="form-control"></td>
				</tr>
				<!-- <tr>
					<td>평점</td><td><input type="text" name="m_rate"></td>
				</tr> -->
				<tr>
					<td>영화 포스터</td><td><input type="button" class="btn1" value="파일넣기">
					<input type="file" name="m_position" multiple="multiple"  class="pic1_btn"></td>
				</tr>
				<tr>
					<td>영화 스틸컷</td><td><input type="button" class="btn2" value="파일넣기">
					<input type="file" name="m_pics" multiple="multiple" class="pic2_btn"></td>
				</tr>
				
				
				<tr class="btn_tr">
					<td colspan="2">
						<input type="submit" value="저장" class="save_btn">
						<input type="reset" value="글 지우기" class="reset_btn">
						<input type="button" value="목록보기" onclick="location.href='movie_list'" class="list_btn">
					</td>
				</tr>
			</form>
		</table>
	</div>
<jsp:include page="../main/mainFooter.jsp" flush="false"></jsp:include>
</body>
</html>