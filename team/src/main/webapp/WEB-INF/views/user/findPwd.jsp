<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div class="wrapper">
 <table align="center" width="400" border="1px solid black">
  <td colspan="3"><h2 align="center" style="color: black; font-size: 25px; font-weight: 500; font-family: Malgun Gothic,돋움;"">비밀번호 찾기</h2><br></td>
   <form method="post" action="findPwdOk">
      	<tr>
          <td colspan="3">
      	        <br><div>등록하신 아이디를 입력해 주세요.</div><br>
      		  <input type="text" name="u_id" placeholder="아이디" ><br><br>
      	  </td>
      	</tr>
      	
     	<tr>
      	  <td colspan="3">
      	         <div>등록하신 이메일 주소를 입력해 주세요.</div><br>
      	      <input type="text" name="u_email" placeholder="E-mail"><br><br><br>
          </td>
      	</tr> 
  
   <tr>
     <td colspan="3">
      	 <button type="submit">확인</button><br><br>  
     </td>
   </tr>
  
</form>
</table>
</div>

<p style="font-size: 13px; font-family: Malgun Gothic,돋움; margin-top: 25px;">아이디가 기억나지 않으세요? <a href="findId">아이디 찾기 바로가기</a><p>
</body>
</html>