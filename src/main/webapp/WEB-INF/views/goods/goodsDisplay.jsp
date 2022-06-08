<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<%-- 0527 결제 API 아임포트 CDN - 근지 --%>
 <!-- jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- iamport.payment.js -->
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js" type="text/javascript"></script>
 <script>
	
 	$(function(){
		 $("#title").css("color","blue");   
 	});
	
 	// 직접결제시 실행됨
 	$(function(){
	     $(".buyBtn").on("click",function(){
	    	 if(confirm('구매하시겠습니까?')){
	    		
	    		var total_price = $('#g_price').val() * $('#c_amount').val();
	    		 
	    		
	    		var IMP = window.IMP;
	   		  	IMP.init('imp87572617');
	   		  	//결제시 전달되는 정보
	   			IMP.request_pay({
	   					    pg : 'inicis', 
	   					    pay_method : 'card',
	   					    merchant_uid : 'merchant_' + new Date().getTime(),
	   					    name : '주문명:team3'/*상품명*/,
	   					    amount : total_price /*상품 가격*/, 
	   					    buyer_email : 'iamport@siot.do'/*구매자 이메일*/,
	   					    buyer_name : '구매자이름',
	   					    buyer_tel : '010-1234-5678'/*구매자 연락처*/,
	   					    buyer_addr : '서울특별시 강남구 삼성동'/*구매자 주소*/,
	   					    buyer_postcode : '123-456'/*구매자 우편번호*/
	   					}, function(rsp) {
	   						var result = '';
	   					    if ( rsp.success ) {
	   					    	alert('결제성공');
	   					    	
	   					    	// 결제성공시 컨트롤러로 보내져서 history table에 추가됨
				 		    	var c_amount = $('#c_amount').val();
					    		document.goods_frm.submit();
	   					    } else {
	   					    	alert('결제실패');
	   					    }
	   					});
	    		 
	   	 	 }
    	});
 	});
	     
 	$(function(){
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
			<input type="hidden" name="u_id" value="wjdcksgml">	<%-- 0527 임시로 id 설정하여 같이 보냄 - 근지 --%>
			<input type="hidden" name="g_code" value="${goods.g_code}">
			<input type="hidden" name="g_name" value="${goods.g_name}">
			<input type="hidden" name="g_price" value="${goods.g_price}" id="g_price">
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