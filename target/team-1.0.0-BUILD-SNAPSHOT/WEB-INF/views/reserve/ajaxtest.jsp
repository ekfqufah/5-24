<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>

<script>
    function callByAjax(){
        var form = document.form1;
        var num1 = form1.num1.value;
        var num2 = form1.num2.value;
        alert(num1);

         $.ajax(
             "ajaxtesting",
             {
                 num1:num1,
                 num2:num2
             },
             function(data){
                 var rs = data.rs;
                 var msg = data.msg;
                 $('.rs').text(rs);
                 $('.rs-msg').text(msg);
             },
             'json'
         );
    }
</script>

<form name="form1" action="ajaxtesting" method="get">
    <input type="text" name="num1"> <br>
    <input type="text" name="num2"> <br>
    <%--    <input type="submit" value="더하기"> <br>--%>
    <input onclick = "callByAjax();" type="button" value="더하기ajax"> <br>
</form>

<div class="rs" style="border: 1px solid black; height: 50px;"></div> <br>
<div class="rs-msg" style="border: 1px solid black; height: 50px;"></div>

</body>
</html>
