<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
 <script>
	
	
 	$(function(){
 		
 		
		 $("#title").css("color","blue");   
		 
	    
	     
	     $(".buyBtn").on("click",function(){
	    	 if(confirm('구매하시겠습니까?')){
	    		 document.goods_frm.submit();
	   	 	 }
    	});
	     
	     $(".cartBtn").on("click",function(){
	    	 var c_amount = $('#c_amount').val();
	    	 if(c_amount==0){
	    		 alert("상품 수량을 선택해주세요.");
	    		 goods_frm.c_amount.focus();
	    	 }
	    	 else if(confirm('장바구니추가??')){
	    		// location.href="cartProcess?g_code="+${goods.g_code};
	    		alert("g_price"+${goods.g_price})
	    		 location.href="cartProcess?g_code="+${goods.g_code}+"&g_name="+${goods.g_name}+"&g_price="+${goods.g_price}+"&c_amount="+c_amount+"&u_id=wjdcksgml";
	   	 	 }
    	});
     	
	     
	
		
	
 	});
   </script>
</head>
<body>

	 <h1 id="title">제목</h1>
	 <input type="button" value="버튼" id="btn2" class="btn2">
	 
	<a href="cartProcess?g_code=1">장바구니</a>
	<table border="1">
			<tr>
				<td>상품이름</td>
				<td>${goods.g_name}</td>
			</tr>
			<tr>
				<td>상품가격</td>
				<td>${goods.g_price}</td>
			</tr>
		<form method="post" action="buy" name="goods_frm">
		<input type="hidden" name="g_code" value="${goods.g_code}">
		<input type="hidden" name="g_name" value="${goods.g_name}">
		<input type="hidden" name="g_price" value="${goods.g_price}">
		<input type="hidden" name="u_id" value="wjdcksgml">
			<tr>
				<td>수량</td>
				<td>
					<select name="c_amount" id="c_amount">
							<option value="0" selected>수량을 선택하세요.</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>
					<input type="button" value="바로구매" id="buyBtn" class="buyBtn">
					<input type="button" value="장바구니" id="cartBtn" class="cartBtn">
				</td>
			</tr>
		
		</form>
	</table>
	
</body>
</html>