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

<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>

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
		height: 100px;
		width: 80px;
	}
	
	th, td {
		vertical-align: middle;
		text-align: center;
	}
	
	.button1, .button2, .button3, .button4, .edit_btn, .del_btn, .add_btn {
		background-color: white;
		border-color: #E0E0E0;
		border-radius: 5px;
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
    		alert(kind);
    	} else if ($(event.target).is('.button2')) {
 	       var kind = $('.button2').val();   		
	        var url = "ajax";
    		alert(kind);
    	} else if ($(event.target).is('.button3')) {
  	       var kind = $('.button3').val();    		
	        var url = "ajax";
    		alert(kind);
     	} else if ($(event.target).is('.button4')) {	//	검색시
  	       var kind = $('.serch_mov').val();  		
	        var url = "serch_mov";
    		alert(kind);
     	} else {
	        var kind = $('.button1').val();
	        var url = "ajax";
    		alert(kind);
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
            	$('#datalist').append("<tr><td>영화코드</td><td>영화포스터</td><td>영화제목</td><td>개봉일자</td><td>영화소개</td><td>상영시간</td><td>관람등급</td><td>장르</td><td>감독명</td><td>평점</td><td>비고</td></tr>")
            	for(var i = 0; i<data.length;i++){
            		console.log("@@@@@@@@"+data[i].m_position)
            		$('#datalist').append("<tr onclick='location.href=\"movieDisplay?m_code="+data[i].m_code+"\"' style='cursor:pointer'><td>"+data[i].m_code+"</td>"+ 
            		
            		/* $('#datalist').append("<tr style='cursor:pointer'><td>"+data[i].m_code+"</td>"+ */
            							     "<td><img src='${pageContext.request.contextPath}/resources/"+data[i].m_position+"' class='img_list'></td>"+
            							     "<td>"+data[i].m_title+"</td>"+
            								"<td>"+data[i].m_date2+"</td>"+
            							     "<td>"+data[i].m_intro+"</td>"+
            							     "<td>"+data[i].m_time+"</td>"+
            							     /* "<td>"+data[i].m_period+"</td>"+ */
            							     "<td>"+data[i].m_grade+"</td>"+
            							     "<td>"+data[i].m_genre+"</td>"+
            							     "<td>"+data[i].m_director+"</td>"+
            							     "<td>"+data[i].m_rate+"</td>"+
            							     "<td>"+
            									"<input type='button' value='수정' onclick='location.href=\"edit?m_code="+data[i].m_code+"\"' class='edit_btn'>"+
            									"<input type='button' value='삭제' onclick='check();' class='del_btn'>"+
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
<body>
<jsp:include page="../main/mainHeader.jsp" flush="false"></jsp:include> 
	<div class="main_body">
		<div class="list_title">
			<h3 class="title_h3">[관리자] 영화 리스트</h3>
		</div>
	    <div id="list_search_btn">
			<input type="text" class="serch_mov">
			<input type="button" value="검색" name="button" class="button4">
			<!-- <input type="submit" value="검색"> -->
		</div>   
		
		<div id="list_sort_btn">
			<input type="button" name="button" value="최신순" class="button1">
			<input type="button" name="button" value="오래된순" class="button2">
			<input type="button" name="button" value="인기순" class="button3">
		</div>
	
		<table width="500" border="1" id="datalist" class="table table-hover">
			<tr>
				<td>영화코드</td>
				<td>영화포스터</td>
				<td>영화제목</td>
				<td>개봉일자</td>
				<td>영화소개</td>
				<td>상영시간</td>
				<!-- <td>상영기간</td> -->
				<td>관람등급</td>
				<td>장르</td>
				<td>감독명</td>
				<td>평점</td>
				<td>비고</td>
			</tr>
			<c:forEach items="${list }" var="dto">
				<tr>
					<td>${dto.m_code }</td>
					<td><img src='${pageContext.request.contextPath}/resources/${dto.m_position}' class='img_list'></td>
					<td>${dto.m_title }</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${dto.m_date }" /></td>
					<td>${dto.m_intro }</td>
					<td>${dto.m_time }</td>
					<%-- <td><fmt:formatDate pattern="yyyy-MM-dd" value="${dto.m_period }" /></td> --%>
					<td>${dto.m_grade }</td>
					<td>${dto.m_genre }</td>
					<td>${dto.m_director }</td>
					<td>${dto.m_rate }</td>
					<td>
						<input type="button" value="수정" onclick="location.href='edit?m_code=${dto.m_code }'" class="edit_btn">
						<input type="button" value="삭제" onclick="check();" class="del_btn">
		 				<input type="hidden" id="m_code_hidden" value="${dto.m_code }">				
					</td>
				</tr>
			</c:forEach>
				<tr>
					<td colspan="12">
						<input type="button" value="영화 추가" onclick="location.href='reg_movie'" class="add_btn">					
					</td>
				</tr>
		</table>
	</div>
<jsp:include page="../main/mainFooter.jsp" flush="false"></jsp:include>
</body>
</html>