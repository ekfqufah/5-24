<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.javalec.team.dto.MovieDto"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	tr:hover{
		background: yellow;	
	}
	.img_list {
		height: 100px;
		width: 80px;
	}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<script type="text/javascript">

$(function (){
    
    $("input:button[name='button']").on('click',function btnFunc(){
/*     	alert('눌러짐');
    	console.log(event.target); */
    	
    	if($(event.target).is('.button1')) {
	        var kind = $('.button1').val();	//버튼이 클릭 되었을 시, 개별 버튼의 값이 kind 변수에 담김
	        var url = "ajax";
    		alert('하이1'+kind);
    	} else if ($(event.target).is('.button2')) {
 	       var kind = $('.button2').val();   		
	        var url = "ajax";
    		alert('하이2'+kind);
    	} else if ($(event.target).is('.button3')) {
  	       var kind = $('.button3').val();    		
	        var url = "ajax";
    		alert('하이3'+kind);
     	} else if ($(event.target).is('.button4')) {	//	검색시
  	       var kind = $('.serch_mov').val();  		
	        var url = "serch_mov";
    		alert('하이4'+kind);
     	} else {
	        var kind = $('.button1').val();
	        var url = "ajax";
    		alert('하이1'+kind);     		
     	}
        
        $.ajax({
            
            url : url,
            type:"post",
            dataType : "json",
            data : {
                 "kind":kind
            },
            success : function(data){
            	console.log(data);
            	$('#datalist').empty()
            	$('#datalist').append("<tr><td>영화코드</td><td>개봉일자</td><td>영화제목</td><td>영화소개</td><td>상영시간</td><td>상영기간</td><td>관람등급</td><td>장르</td><td>감독명</td><td>평점</td><td>영화포스터</td><td>비고</td></tr>")
            	for(var i = 0; i<data.length;i++){
            		console.log("@@@@@@@@"+data[i].m_position)
            /* 		$('#datalist').append("<tr onclick='location.href=\"../movieDisplay?m_code="+data[i].m_code+"\"' style='cursor:pointer'><td>"+data[i].m_code+"</td>"+ */
            		$('#datalist').append("<tr style='cursor:pointer'><td>"+data[i].m_code+"</td>"+
            								"<td>"+data[i].m_date2+"</td>"+
            							     "<td>"+data[i].m_title+"</td>"+
            							     "<td>"+data[i].m_intro+"</td>"+
            							     "<td>"+data[i].m_time+"</td>"+
            							     "<td>"+data[i].m_period+"</td>"+
            							     "<td>"+data[i].m_grade+"</td>"+
            							     "<td>"+data[i].m_genre+"</td>"+
            							     "<td>"+data[i].m_director+"</td>"+
            							     "<td>"+data[i].m_rate+"</td>"+
            							     "<td><img src='${pageContext.request.contextPath}/resources/"+data[i].m_position+"' class='img_list'></td>"+
            							     "<td>"+
            									"<input type='button' value='수정' onclick='location.href=\"edit?m_code="+data[i].m_code+"\"'>"+
            									"<input type='button' value='삭제' onclick='check();'>"+
            					 				"<input type='hidden' id='m_code_hidden' value='"+data[i].m_code+"'>"+				
            								 "</td>"+
            							  "</tr>")
            	}
            	$('#datalist').append("<tr><td colspan='12'><input type='button' value='영화 추가' onclick='location.href=\"reg_movie\"''></td></tr>");
            	
            												/* <input type="button" value="영화 추가" onclick="location.href='reg_movie'">			 */
            },
            error : function(data){
             	console.log(data);
            	alert("실패");
            	
            	
            }//error
        })//ajax
    });//button click
});
	
	// 페이지 호출하자마자 위의 제이쿼리 실행
	$(document).ready(function(){
		$(".button1").trigger('click');
		btnFunc();
	});
</script>


    <script type="text/javascript">	
		function check(){
			var value = $('#m_code_hidden').val();
		    if(confirm("삭제하시겠습니까?")){
		        location.href = "del_movie?m_code="+value;
		    } else {
		    }
		}
	</script>
</head>
<body >
    <img src="../resources/16539651397101.jpg">
    
    <div>
		<input type="text" class="serch_mov">
		<input type="button" value="검색" name="button" class="button4">
		<!-- <input type="submit" value="검색"> -->
	</div>   
	
	<div>
		<input type="button" name="button" value="최신순" class="button1">
		<input type="button" name="button" value="오래된순" class="button2">
		<input type="button" name="button" value="인기순" class="button3">
	</div>

	<table width="500" border="1" id="datalist">
		<tr>
			<td>영화코드</td>
			<td>개봉일자</td>
			<td>영화제목</td>
			<td>영화소개</td>
			<td>상영시간</td>
			<td>상영기간</td>
			<td>관람등급</td>
			<td>장르</td>
			<td>감독명</td>
			<td>평점</td>
			<td>영화포스터</td>
			<td>비고</td>
		</tr>
		<c:forEach items="${list }" var="dto">
			<tr>
				<td>${dto.m_code }</td>
				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${dto.m_date }" /></td>
				<td>${dto.m_title }</td>
				<td>${dto.m_intro }</td>
				<td>${dto.m_time }</td>
				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${dto.m_period }" /></td>
				<td>${dto.m_grade }</td>
				<td>${dto.m_genre }</td>
				<td>${dto.m_director }</td>
				<td>${dto.m_rate }</td>
				<td><img src='${pageContext.request.contextPath}/resources/${dto.m_position}' class='img_list'></td>
				<td>
					<input type="button" value="수정" onclick="location.href='edit?m_code=${dto.m_code }'">
					<input type="button" value="삭제" onclick="check();">
	 				<input type="hidden" id="m_code_hidden" value="${dto.m_code }">				
				</td>
			</tr>
		</c:forEach>
			<tr>
				<td colspan="12">
					<input type="button" value="영화 추가" onclick="location.href='reg_movie'">					
				</td>
			</tr>
	</table>

</body>
</html>