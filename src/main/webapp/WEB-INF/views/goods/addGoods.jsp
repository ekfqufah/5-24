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
		
		
		
		��ǰ�̸� : <input type="text" name="g_name" />
		��ǰ���� : <input type="text" name="g_price"/>
		<input type="submit" value="����" />
	</form>
	<a href="mainview">��ϰ���</a>
</body>
</html>
