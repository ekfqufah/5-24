<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022-05-25
  Time: 오후 4:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<table width="500" border="1">
    <tr>
        <td>번호</td>
        <td>이름</td>
        <td>인덱스</td>
    </tr>
    <c:forEach items="${plist}" var="dto" varStatus="status">
        <tr>
            <td>${dto.m_code}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
