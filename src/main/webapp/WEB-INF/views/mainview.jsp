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
 			 alert("舌郊姥艦亜 搾醸柔艦陥");
 		 }
	}; */
	
	$(function(){
		//alert("ぞしぞしぞしぞししぞし");
	    $("input:button[name='button']").on('click',function(){
	        var kind = $(this).val();	//獄動戚 適遣 鞠醸聖 獣, 鯵紺 獄動税 葵戚 kind 痕呪拭 眼沿
	      	
	        $.ajax({
	            url : "goodsajax",
	            type:"post",
	            dataType : "json",
	            data : {
	                 "kind":kind
	            },
	            success : function(data){
	            	
	            	$('#datalist').empty()
	            	$('#datalist').append("<tr><td>雌念腰硲</td><td>雌念戚硯</td><td>雌念亜維</td><td>雌念紫遭戚硯</td><td>雌念紫遭</td></tr>")
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
	            	//$('#datalist').append("<tr><td colspan='5'><input type='button' value='雌念 蓄亜' onclick='location.href=\"addmovie\"''></td></tr>");
	            	
	            												/* <input type="button" value="慎鉢 蓄亜" onclick="location.href='reg_movie'">			 */
	            },
	            error : function(data){
	            	alert("叔鳶");
	            	
	            	
	            }//error
	        })//ajax
	    });//button click
	    
	}); 
		
		// 凪戚走 硲窒馬切原切 是税 薦戚汀軒 叔楳
		$(document).ready(function(){
			$(".sort_default").trigger('click');
		});
</script>

</head>
<body>
	<a href="addGoods">雌念蓄亜</a>
	<a href="goodsDisplay?g_code=2">雌室舛左</a>
	<a href="cartlist?u_id=wjdcksgml">舌郊姥艦鯉系</a>
	<a href="movie_list">慎鉢鯉系</a>
	<%
	if(session.getAttribute("u_id")!=null){
		String u_id =(String)session.getAttribute("u_id");
		String u_auth =(String)session.getAttribute("u_auth");
		System.out.println("u_id@@@"+u_id);
		System.out.println("u_auth@@@"+u_auth);
		out.println("<a href='userPage?u_id=wjdcksgml'>原戚凪戚走</a>");	
	}
	%>
	<a href='faq/list'>faq</a>
	<a href='notice/list'>notice</a>
	<a href='qna_main'>qna</a>
	<a href='review/list'>/review</a>
	<div>
		<input type="button" name="button" value="置重授" class="sort_default">
		<input type="button" name="button" value="神掘吉授">
		<input type="button" name="button" value="昔奄授">
	</div>
	<table width="500" border="1" id="datalist">
		
	 </table>
</body>
</html>