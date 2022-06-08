<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="fileForm" action="upload" method="post" enctype="multipart/form-data">
		<input multiple="multiple" type="file" name="file" />
		<input multiple="multiple" type="file" name="file" />
		
		
		
		상품이름 : <input type="text" name="g_name" />
		상품가격 : <input type="text" name="g_price"/>
		<input type="submit" value="전송" />
	</form>
	<a href="mainview">목록가기</a>
</body>
</html>
