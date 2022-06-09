<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js" type="text/javascript"></script>
 <script>
 function deleteCart(c_code,u_id) { 
	 //alert("들어오냐?"+c_code);
		alert(u_id)
		if(confirm("해당 상품을 장바구니에서 삭제하시겠습니까?")){ 
			//location.href = "deleteCart.jsp?cart_number="+cart_number; 
			$.ajax({
				url:"deleteCart",
				type:"post",
				data:{"c_code":c_code,"u_id":u_id
					 },
				success:function(data){	
					//document.getElementById("tablebox").innerHTML =data;
					//alert("성공?")
					location.href="cartlist?u_id="+u_id;
					
				},
				error:function(){
					//alert("실패?")
					
					//document.getElementById("tablebox").innerHTML ="<h3>data fail</h3>";
				}
			}); 
			
		} 
	} 
 

 		
		function amount(classcount,c_maount) { 
			$('.c_amount'+classcount).val(c_maount).prop("selected",true);
		} 
	
		
	  	var count = 0;
		var c_code = 0;
		var u_id = null;
		var g_cdoe = 0;
	   function change(cou,code,id,gcode){ 
		   count = cou
		   c_code = code
		   u_id =  id 
		   g_cdoe = gcode
	  }
	   
	   $(document).ready(function() {
		   $('.c_amount1').change(function() {
			   var c_amount = $('.c_amount'+count).val();
			   aj(c_amount,c_code,u_id,g_cdoe);
		   });
		   $('.c_amount2').change(function() {
			   var c_amount = $('.c_amount'+count).val();
			   aj(c_amount,c_code,u_id,g_cdoe);
		   }); 
		   $('.c_amount3').change(function() {
			   var c_amount = $('.c_amount'+count).val();
			   aj(c_amount,c_code,u_id,g_cdoe);
		   }); 
		   $('.c_amount4').change(function() {
			   var c_amount = $('.c_amount'+count).val();
			   aj(c_amount,c_code,u_id,g_cdoe);
		   }); 
		   $('.c_amount5').change(function() {
			   var c_amount = $('.c_amount'+count).val();
			   aj(c_amount,c_code,u_id,g_cdoe);
		   }); 
	  }); 
	  function aj(ajc_amount,ajc_code,aju_id,ajg_cdoe){ 
		   //alert(ajc_amount+"@@"+ajc_code+"@@"+aju_id+"@@"+ajg_cdoe)	
			$.ajax({
				url:"updateCart",
				type:"post",
				data:{"c_code":ajc_code,"c_amount":ajc_amount,"u_id":aju_id,"g_code":ajg_cdoe
					 },
				success:function(data){	
					//document.getElementById("price").innerHTML =data; 
					
					location.href="cartlist?u_id="+u_id;
					
				},
				error:function(){
					
					/* document.getElementById("tablebox").innerHTML ="<h3>data fail</h3>"; */
				}
			});
	  }
	   
	
		
	//0530 결제api. 실행된 후 form action으로 감 - 근지
	 	$(function(){
		     $(".cart_buyBtn").on("click",function(){
		    	 
	/* 	    	 var chk_val_arr = [];
		    	 $("input:checkbox[name=cart_listc_code]").each(function() {
		    		var chk = $(this).val();
		    		chk_val_arr.push(chk);
		    		console.log(chk_val_arr);
		    	 }); */
		    	 
		    	 if(confirm('구매하시겠습니까?')){
		    		
		    		var IMP = window.IMP;
		   		  	IMP.init('imp87572617');
		   		  	//결제시 전달되는 정보
		   			IMP.request_pay({
		   					    pg : 'inicis', 
		   					    pay_method : 'card',
		   					    merchant_uid : 'merchant_' + new Date().getTime(),
		   					    name : '주문명:team3'/*상품명*/,
		   					    amount : 100/*상품 가격*/, 
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
						    		document.buy_frm.submit();
		   					    } else {
		   					    	alert('결제실패');
		   					    }
		   					});
		    		 
		   	 	 }
	    	});
	 	});
	  

 </script>
</head>
<body>
<%
	String u_id = (String)session.getAttribute("u_id");
      
      	if(u_id == null) {
      		%>
      		<script>
      			alert("로그인해주세요.");
      			location.href="login";
      			
      		</script>
      		<%
      	}
%>
			
<jsp:include page="../main/mainHeader.jsp" flush="false"></jsp:include> 

<style>
.body{
		min-width: 1100px;
		max-width: 1280px;
		margin: 0 auto;
	
	
		font-size:11px;
		font-family: "Nanum Gothic","Malgun Gothic","맑은 고딕","돋움","Dotum","Apple Gothic","Apple SD Gothic Neo",sans-serif;
 	}
 	.cart_h2 {
		font-size:12px;
		margin-top: 3%;
	}
	#table {
		border-top: 1px solid black;max-width: 1400px;
		margin: auto;
	}

	#row1 {
		width: 100px;
	}
	#row1, #row2, #row3, #row4, #row5, #row6, #row7, #row8 {
		text-align: center;
		height: 100px;
	}
	#row1, #row3, #row4, #row5, #row6, #row7, #row8 {
		padding-top: 40px;
	}
	#editBtn {
		padding: 2px 5px 2px 5px;
		background-color: white;
		border-color:#E0E0E0;
		border-radius: 3px;
	}
	#editBtn:hover {
		background-color:#E0E0E0;
		border-color:#E0E0E0;
		border-radius: 3px;
	}
	#delBtn {
		padding: 3px 15px 3px 15px;
		background-color: white;
		border-color:#E0E0E0;
		border-radius: 3px;
	}
	#delBtn:hover {
		background-color:#E0E0E0;
		border-color:#E0E0E0;
	}
	.buyImg {
		width: 80px;
		height: 80px;
	}
	.blank {
		height: 30px;
	}
	.buyBtnClass {
		text-align:center;
		border:0;
	}
	#buyBtn {
		padding: 13px 40px 13px 40px;
		background-color: #404040;
		border-color: #404040;
		border-radius: 5px;
		color: white;
		font-weight: bold;
		font-size: 12px;		
	}
	#buyBtn:hover {
		background-color:white;
		color:black;
		border-color: #E0E0E0;
	}

</style>



	
		<table class="table" id="table" style="border-top: none">
		<tr >
			<td colspan="6" style="border-bottom: solid 1px  #404040;"><h2 class="cart_h2"><%= u_id %>님의 장바구니</h2></td>
		</tr>
			<tr align="center">
				<td >선택하기</td>
				<td></td>
				<td>상품이름</td>
				<td>상품갯수</td>
				<td>상품총가격</td>
				<td>삭제</td>
			</tr>	
	
			
			<form method="post" action="buy?u_id=<%=u_id%>" name="cart_frm">
			<script>
				var count =0;
			</script>
				<c:forEach items="${cartlist}" var="cartlist" varStatus="status">
			<script>
					 count ++;
			</script>
						<input type="hidden" id="stcount${status.count}" value="${status.count}">
						<input type="hidden" id="stcount${cartlist.c_code}" value="${cartlist.c_code}">
						<input type="hidden" id="stcount${cartlist.u_id}" value="${cartlist.u_id}">
						
					<tr>
						<td id="row1">
							<input type="checkbox" name="cart_listc_code" value="${cartlist.c_code}">
						</td>
						
						<td id="row2" width="200">
							<img src='${pageContext.request.contextPath}/resources/${cartlist.img_1}'>
						</td>	
											
						<td id="row3">
							${cartlist.g_name}
						</td>
						
						<td id="row4">
							<select name="c_amount" id="c_amount1" class="c_amount${status.count}" onclick="change('${status.count}','${cartlist.c_code}','${cartlist.u_id}','${cartlist.g_code}')">
								<option value="1" onclick="change()">1</option>
								<option value="2" onclick="change()">2</option>
								<option value="3" onclick="change()">3</option>
								<option value="4" onclick="change()">4</option>
								<option value="5" onclick="change()">5</option>
							</select>
						</td>
						
						<td id="row6">
							<script>
								amount(${status.count},${cartlist.c_amount});
							</script>
							${cartlist.g_price}
						</td>
						
						<td id="row8">
							<input type="button" value="삭제" onclick="deleteCart('${cartlist.c_code}','${cartlist.u_id}')">
						</td>
					</tr>
		
		</c:forEach> 
				
				<tr class="blank"></tr>
				<tr class="buyBtnClass">
					<td colspan="8">
						<input type="button" value="선택상품주문"  id="buyBtn" class="cart_buyBtn">
					</td>
				</tr>
			</form>
		</table>



	
			<script>
				if(count == 0){
					alert("장바구니가 비었습니다.")
					location.href="/team/"
				}
			</script>
			 
	

</body>
</html>