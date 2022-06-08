<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
	tr:hover{
		background: yellow;	
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
	            								"<td><img src='${pageContext.request.contextPath}/resources/"+data[i].img_1+"'></td>"+
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
	<div>
		<input type="button" name="button" value="최신순" class="sort_default">
		<input type="button" name="button" value="오래된순">
		<input type="button" name="button" value="인기순">
	</div>
	<table width="500" border="1" id="datalist">
		
	 </table>
</body>
</html>