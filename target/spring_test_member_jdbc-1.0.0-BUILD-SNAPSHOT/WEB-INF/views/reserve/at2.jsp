<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>      //필수 script입니다.
    <script type="text/javascript">
        $(function(){
            $("input:button[name='button']").on('click',function(){
                alert("클릭됨");
                var kind = $(this).val();       //버튼이 클릭 되었을 시, 개별 버튼의 값이 kind 변수에 담겨집니다.
                $.ajax({
                    url : "at2",
                    type : "post",
                    data : {
                        "kind":kind
                    },
                    success : function(data){
                        $('.ajaxBody').html(data)

                    },
                    error : function(data){
                        alert('error');
                        alert('code: ' + request.status + "\n" + "message : " + request.responseText + "\n" + "error : "+error);
                    }//error
                })//ajax
            });//button click
        });
    </script>
</head>
<body>
<div>
    <input type="button" name="button" value="53">
    <input type="button" name="button" value="54">
    <input type="button" name="button" value="3">
</div>
<div class="ajaxBody">
    ${hihi }
</div>
</body>
</html>














