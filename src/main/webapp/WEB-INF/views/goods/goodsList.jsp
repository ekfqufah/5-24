<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<link href="resources/css/main.css" rel="stylesheet" />

<style>
	.table {
		border: 0px;
	}
	
	.list_title {
		padding: 30px 0px 10px 0px;
	}
		
	.title_h3 {
		color: #222;
	    font-weight: 500;
	    font-size: 36px;
	    font-family: system-ui;
	}
	
	#list_search_btn, #list_sort_btn {
		text-align: right;
		margin: 15px 0px;
	}
	
	.img_list {
		height: 200px;
		width: 250px;
	}	
	
	th, td {
		vertical-align: middle;
		text-align: center;
	}	
	
	.sort_default, .button2 {
		background-color: white;
		border-color: #E0E0E0;
		border-radius: 5px;
	} 

</style>
<script type="text/javascript">
 /* 	window.onload = function() {
 		 if(${cart} == 0){
 			 alert("장바구니가 비었습니다");
 		 }
	}; */
	
	$(function(){
		//alert("ㅎㅇㅎㅇㅎㅇㅎㅇㅇㅎㅇ");
	    $("input:button[name='button']").on('click',function(){
	        var kind = $(this).val();	//버튼이 클릭 되었을 시, 개별 버튼의 값이 kind 변수에 담김
	      	
	        $.ajax({
	            url : "goodsajax",
	            type:"post",
	            dataType : "json",
	            data : {
	                 "kind":kind
	            },
	            success : function(data){
	            	
	            	$('#datalist').empty()
	            	$('#datalist').append("<tr><td>상품번호</td><td>상품이름</td><td>상품가격</td><td>상품사진이름</td><td>상품사진</td></tr>")
	            	for(var i = 0; i<data.length;i++){
	            		console.log("@@@@@@@@1"+data[i].img_origin)
	            		console.log("@@@@@@@@2"+data[i].img_1)
	            		
	             		$('#datalist').append("<tr onclick='location.href=\"goodsDisplay?g_code="+data[i].g_code+"\"' style='cursor:pointer'>"+
	             				
	            								"<td>"+data[i].g_code+"</td>"+
	            								"<td>"+data[i].g_name+"</td>"+
	            								"<td>"+data[i].g_price+"</td>"+
	            								"<td>"+data[i].img_origin+"</td>"+
	            								"<td><img src='${pageContext.request.contextPath}/resources/"+data[i].img_1+"' class='img_list'></td>"+
	            		  					  "</tr>") 
	            	}
	            	//$('#datalist').append("<tr><td colspan='5'><input type='button' value='상품 추가' onclick='location.href=\"addmovie\"''></td></tr>");
	            	
	            												/* <input type="button" value="영화 추가" onclick="location.href='reg_movie'">			 */
	            },
	            error : function(data){
	            	alert("실패");
	            	
	            	
	            }//error
	        })//ajax
	    });//button click
	    
	}); 
		
		// 페이지 호출하자마자 위의 제이쿼리 실행
		$(document).ready(function(){
			$(".sort_default").trigger('click');
		});
</script>

</head>
<body>
<jsp:include page="../main/mainHeader.jsp" flush="false"></jsp:include>
	<div class="main_body">
		<div class="list_title">
			<h3 class="title_h3">[관리자] 상품 리스트</h3>
			<div id="list_search_btn">
				<a href="addGoods">상품추가</a>
				<a href="goodsDisplay?g_code=2">상세정보</a>
				<a href="cartlist?u_id=wjdcksgml">장바구니목록</a>
				<a href="movie_list">영화목록</a>
				<%
				if(session.getAttribute("u_id")!=null){
					String u_id =(String)session.getAttribute("u_id");
					String u_auth =(String)session.getAttribute("u_auth");
					System.out.println("u_id@@@"+u_id);
					System.out.println("u_auth@@@"+u_auth);
					out.println("<a href='userPage?u_id=wjdcksgml'>마이페이지</a>");	
				}
				%>
				<a href='faq/list'>faq</a>
				<a href='notice/list'>notice</a>
				<a href='qna_main'>qna</a>
				<a href='review/list'>/review</a>
			</div>
		</div>
		<div id="list_sort_btn">
			<input type="button" name="button" value="최신순" class="sort_default">
			<input type="button" name="button" value="오래된순" class="button2">
		</div>
		<table width="500" border="1" id="datalist" class="table table-hover">
			
		</table>
	</div>
<jsp:include page="../main/mainFooter.jsp" flush="false"></jsp:include>
</body>
</html>