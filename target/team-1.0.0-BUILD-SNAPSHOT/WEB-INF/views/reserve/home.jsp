<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="UTF-8" %>
<html>
<head>
	<title>home</title>
</head>
<style>
	.main{
		width: 1000px;
		height: 800px;
		border: 10px dotted navy;
		margin: auto;
		text-align: center;
		line-height: 4000%;
		font-size: larger;
		background-color: tomato;
	}
	.deco1{
		position: fixed;
		width: 200px;
		height: 200px;
		border: 5px solid yellow;
		left: 44.5%;
		bottom: 48%;

	}
	.deco2{
		position: fixed;
		width: 100px;
		height: 100px;
		border: 5px solid green;
		left: 47.2%;
		bottom: 52.5%;

	}
	.deco3{
		position: fixed;
		width: 300px;
		height: 300px;
		border: 5px solid purple;
		left: 42%;
		bottom: 43%;

	}
	.deco4{
		position: fixed;
		width: 400px;
		height: 400px;
		border: 5px solid powderblue;
		left: 39.5%;
		bottom: 38%;

	}
</style>
<body>
<div class="main">
	<a href="getreserved">예매 하기</a>
</div>
<div class="deco1"></div>
<div class="deco2"></div>
<div class="deco3"></div>
<div class="deco4"></div>
<a href="getreserved">예매 하기</a>
<a href="gspage">좌석 선택 하기</a>
<a href="selecttest">jdbcTest</a>

</body>
</html>
