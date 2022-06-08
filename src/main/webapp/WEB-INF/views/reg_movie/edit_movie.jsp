<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<form method="post" action="edit_movie">
			<input type="hidden" name="m_code" value="${dto.m_code}">
			<tr>
				<td>영화 코드 : ${dto.m_code }</td>
			</tr>
			<tr>
				<td>개봉 일자 : <input type="text" name="m_date" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${dto.m_date }" />"></td>
			</tr>
			<tr>
				<td>영화 제목 : <input type="text" name="m_title" value="${dto.m_title}"></td>
			</tr>
			<tr>
				<td>영화 소개 : <input type="text" name="m_intro" value="${dto.m_intro}"></td>
			</tr>
			<tr>
				<td>상영 시간 : <input type="text" name="m_time" value="${dto.m_time}"></td>
			</tr>
			<tr>
				<td>마지막 상영일 : <input type="text" name="m_period" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${dto.m_period }" />"></td>
			</tr>
			<tr>
				<td>관람 등급 : <input type="text" name="m_grade" value="${dto.m_grade}"></td>
			</tr>
			<tr>
				<td>장르 : <input type="text" name="m_genre" value="${dto.m_genre}"></td>
			</tr>
<%--
			<tr>
				<td>리뷰 코드 : <input type="text" name="r_code"></td>
			</tr>
 --%>
			<tr>
				<td>감독명 : <input type="text" name="m_director" value="${dto.m_director}"></td>
			</tr>
			<tr>
				<td>평점 : <input type="text" name="m_rate" value="${dto.m_rate}"></td>
			</tr>
			<tr>
				<td>영화 포스터 : <input type="text" name="m_position" value="${dto.m_position}"></td>
			</tr>
			<tr>
				<td>영화 스틸컷 : <input type="text" name="m_pics" value="${dto.m_pics}"></td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="저장">
					<input type="reset" value="글 지우기">
					<input type="button" value="목록보기" onclick="location.href='movie_list'">
				</td>
			</tr>
		</form>
	</table>
</body>
</html>