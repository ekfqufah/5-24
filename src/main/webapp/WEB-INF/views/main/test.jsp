<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	.dropbtn {
	  background-color: #ea2129;
	  color: white;
	  padding: 16px;
	  font-size: 16px;
	  border: none;
	}
	
	.dropdown {
	  position: relative;
	  display: inline-block;
	}
	
	.dropdown-content {
	  display: none;
	  position: absolute;
	  background-color: #f1f1f1;
	  min-width: 160px;
	  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	  z-index: 1;
	}
	
	.dropdown-content a {
	  color: black;
	  padding: 12px 16px;
	  text-decoration: none;
	  display: block;
	}
	
	.dropdown-content a:hover {background-color: #ddd;}
	
	.dropdown:hover .dropdown-content {display: block;}
	
	.dropdown:hover .dropbtn {background-color: #3e8e41;}
</style>
</head>
<body>
	<div class="dropdown">
	  <button class="dropbtn">메뉴</button>
	  <div class="dropdown-content">
	    <a href="#">홈</a>
	    <a href="#">회사소개</a>
	    <a href="#">제품소개</a>
	    <a href="#">오시는길</a>
	  </div>
	</div>
</body>
</html>