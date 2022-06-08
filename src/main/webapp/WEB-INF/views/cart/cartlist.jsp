<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
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

.userMovie{
	clear:both;

	margin:auto;
	min-width : 1120px;	
	max-width : 1400px;	

}
.userMovie1{
	margin-top: 50px;
	border: 1px solid black;
	
}
.userMovie img{

	width: 80px;
	height: 80px;
}


.lists{
	font-size: 17px;
	font-weight: 500px;
	line-height: 34px;
	
}
td{
	font-size: 17px;
	font-weight: 400px;
	line-height: 80px;
	
}
</style>


	<form method="post" action="buy?u_id=<%=u_id%>">
	
	<div class="userMovie" style="font-size: 12px; text-align: center;  ">
		<table class="table table-hover userMovie1" id="table_cus">
			  <thead>
			    <tr >
		    		
		    		<td></td>
		    		<td></td>
						<td >선택하기</td>
						<td></td>
						<td>상품이름</td>
						<td>상품갯수</td>
						<td>상품총가격</td>
						<td>삭제</td>
					<td></td>
		    		<td></td>
				 	
			    </tr>
			  </thead>
		  <tbody>
				<script>
				var count =0;
				</script>
		 	<c:forEach items="${cartlist}" var="cartlist" varStatus="status">
					<tr >
						<td></td>
		    			<td></td>
						<td style="width: 100px;"><input type="checkbox" name="cart_listc_code" value="${cartlist.c_code}"></td>
						<script>
								 count ++;
						</script>
						<td style="width: 100px;"><img src='${pageContext.request.contextPath}/resources/${cartlist.img_1}'></td>
						<td>${cartlist.g_name}</td>
											<td>	
						<input type="hidden" id="stcount${status.count}" value="${status.count}">
						<input type="hidden" id="stcount${cartlist.c_code}" value="${cartlist.c_code}">
						<input type="hidden" id="stcount${cartlist.u_id}" value="${cartlist.u_id}">
						
							<select name="c_amount" id="c_amount1" class="c_amount${status.count}" onclick="change('${status.count}','${cartlist.c_code}','${cartlist.u_id}','${cartlist.g_code}')">
								<option value="1" onclick="change()">1</option>
								<option value="2" onclick="change()">2</option>
								<option value="3" onclick="change()">3</option>
								<option value="4" onclick="change()">4</option>
								<option value="5" onclick="change()">5</option>
							</select>
						</td>
						
						<script>
							amount(${status.count},${cartlist.c_amount});
						</script>
						<td  id="price">${cartlist.g_price}</td>
						<%-- <td>${cartlist.u_id}</td> --%>
						<%-- <td>${cartlist.c_code}</td> --%>
						<td><input  type="button" value="삭제" onclick="deleteCart('${cartlist.c_code}','${cartlist.u_id}')"></td>
							<td></td>
		    				<td></td>
						
					</tr>
				</c:forEach> 
				<tr>
			   	<td colspan="5" style="text-align: center;">
			   		<input type="submit" value="구매하기">
			   	</td>
		   </tr>
		   </tbody>
		   
		</table>
	</div>
	
		</form>
		
			<script>
				if(count == 0){
					alert("장바구니가 비었습니다.")
					location.href="index"
				}
			</script>
			 
	

</body>
</html>