<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>좌석 선택</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
<%--    <link href="${pageContext.request.contextPath}/resources/css/seat.css" rel="stylesheet">--%>
    <style>
        .wrapper{
            border: 1px solid navy;
            width: 80%;
            height: 90%;
            position: fixed;
            margin-left: 10%;
            border-radius: 30px;
        }
        .left-part{
            width: 44%;
            height: 100%;
            margin-left: 8%;
            margin-top: 3%;
            float: left;
            position: absolute;
        }
        .reserveInfo{
            margin-top: 5%;
            margin-left: 8%;
            width: 100%;
            height: 30%;
            border: 1px solid tomato;
            margin-bottom: 5px;
            border-radius: 15px;
        }
        .payInfo{
            margin-left: 8%;
            width: 100%;
            height: 50%;
            border: 1px solid tomato;
            margin-bottom: 5px;
            border-radius: 15px;
        }
        .right-part{
            width: 48%;
            height: 100%;
            margin-left: 53%;
            float: right;
            position: absolute;
        }
        .payment{
            width: 800px;
            height: 800px;
            margin-left: 18%;
            margin-top: 10%;
            border: 1px solid green;
        }

        #payIn{
            width: 60%;
            height: 100%;
            border: 1px solid lightblue;
            float: left;
            margin-right: 1%;
            margin-left: 1%;
        }
        #payIn select{
            overflow: hidden;
            text-align: center;
            width: 100%;
            height: 80%;
            margin-top: 6%;
            font-size: 16px;
        }
        #payProcess{
            width: 30%;
            height: 100%;
            border: 1px solid lightblue;
            float: left;
        }

        .middle-price{
            margin-top: 2%;
            width: 98%;
            height: 45%;
            border: 1px solid black;
            float: left;
        }
        .middle-price div{
            width: 98%;
            height: 45%;
            border: 1px solid black;
        }

        .left-price{
            width: 48%;
            height: 45%;
            border: 1px solid black;
            float: left;
            margin: auto;
        }
        .left-price input{
            margin-left: 15%;
            text-align: center;
            margin-top: 2%;
        }
        .right-price{
            float: left;
            width: 48%;
            height: 45%;
            border: 1px solid black;
            margin-left: 1%;
            margin: auto;
        }
        .right-price input{
            margin-left: 15%;
            text-align: center;
            margin-top: 2%;
        }

        .mainTheater{
            margin-top: 25%;
            margin-left: 10%;
            width: 600px;
            height: 500px;
            border: 1px solid navy;
        }
        .screen{
            width: 80%;
            height: 10%;
            border: 1px solid black;
            margin: auto;
            margin-top: 5%;
            transform: perspective(100px) rotateX(-10deg);
            text-align: center;
            line-height: 80%;
        }
        .leftSeat{
            padding-top: 3%;
            margin-left: 3%;
            margin-top: 15%;
            width: 15%;
            height: 60%;
            border: 1px solid tomato;
            float: left;
        }
        .middleSeat{
            padding-top: 3%;
            padding-left: 3%;
            margin-left: 5%;
            margin-top: 15%;
            width: 50%;
            height: 60%;
            border: 1px solid salmon;
            float: left;
        }
        .rightSeat{
            padding-top: 3%;
            margin-left: 5%;
            margin-top: 15%;
            width: 15%;
            height: 60%;
            border: 1px solid green;
            float: left;
        }
        .seat{
            zoom:2.1;
        }
    </style>
<%
    request.setCharacterEncoding("UTF-8");
%>
</head>
<body>
<%
    response.setContentType("text/html;charset=UTF-8");
%>
<div class="wrapper"></div>
<div class="left-part">
    <div class="reserveInfo">
        <table width="400" border="1">
            <tr>
                <td>영화 제목</td><td>${ReserveDetail.movieName}</td>
            </tr>
            <tr>
                <td>지역 명</td><td>${ReserveDetail.regionName}</td>
            </tr>
            <tr>
                <td>영화관 이름</td><td>${ReserveDetail.theaterName}</td>
            </tr>
            <tr>
                <td>상영관</td><td>${ReserveDetail.hall}</td>
            </tr>
            <tr>
                <td>시간</td><td>${ReserveDetail.time}</td>
            </tr>
            <tr>
                <td>날짜</td><td>${ReserveDetail.date}</td>
            </tr>
            <tr>
                <td>조조 여부</td> <td>${rst}</td>
            </tr>
        </table>
        조조 여부 : 0 => 조조 아님
        <table>
            <tr>
                <td>가격</td>
            </tr>
            <c:forEach items="${pList}" var="plist">
                <tr>
                    <td>${plist}</td>
                </tr>
            </c:forEach>

        </table>
    </div>
    <div class="payInfo">
        <div id="payIn">
            <div class="middle-price">
                <div class="total-num">
                    최대 4명까지 선택 가능합니다<br>
                    청소년 : <input type="text" name="tpay" id="tpay"><br>
                    성인 : <input type="text" name="apay" id="apay">
                </div>
                <div class="total-price">
                    가격) 청소년 : <input type="text" name="tprice" id="tprice" disabled><br>
                    가격) 성인 : <input type="text" name="aprice" id="aprice" disabled><br>
                    총 가격 : <input type="text" name="totalPayment" id="totalPayment" disabled>

                    <input type="hidden" name="htprice" id="htprice">
                    <input type="hidden" name="haprice" id="haprice">
                    <input type="hidden" name="htotalPayment" id="htotalPayment">
                </div>
            </div>
            <div class="left-price">
                <input type="text" value="청소년" disabled><br>
                <select id="teenPrice" name="teenPrice" size="4">
                    <option value="0">0</option>
                    <option value="${pList[0]}">1</option>
                    <option value="${pList[0]*2}">2</option>
                    <option value="${pList[0]*3}">3</option>
                    <option value="${pList[0]*4}">4</option>
                </select>
            </div>
            <div class="right-price">
                <input type="text" value="으른" disabled><br>
                <select id="adultPrice" name="adultPrice" size="4">
                    <option value="0">0</option>
                    <option value="${pList[1]}">1</option>
                    <option value="${pList[1]*2}">2</option>
                    <option value="${pList[1]*3}">3</option>
                    <option value="${pList[1]*4}">4</option>
                </select>
            </div>
        </div>
        <script>
            $('#teenPrice, #adultPrice').change(function (){
                var result1 = $('#tpay');
                var result2 = $('#apay');

                var price1 = $('#tprice');
                var price2 = $('#aprice');
                var totalprice = $('#totalPayment');

                var hprice1 = $('#htprice');
                var hprice2 = $('#haprice');
                var htotalprice = $('#htotalPayment');


                //인원수 불러옴 (MAX : 4명)
                var tNum = $('#teenPrice     option:selected').text();
                var aNum = $('#adultPrice option:selected').text();
                result1.val(tNum);
                result2.val(aNum);
                var total = Number(tNum)+Number(aNum);

                //가격
                var tPrice = $('#teenPrice option:selected').val();
                var aPrice = $('#adultPrice option:selected').val();
                price1.val(tPrice);
                price2.val(aPrice);

                hprice1.val(tPrice);
                hprice2.val(aPrice);

                var teenPrice = Number(hprice1.val());
                var AdultPrice = Number(hprice2.val());
                var totalSum = teenPrice + AdultPrice;

                console.log('청소년 가격 : ' + teenPrice);
                console.log('청소년 가격 : ' + teenPrice);
                console.log('총 가격 : ' +totalSum);

                totalprice.val(totalSum);
                htotalprice.val(totalSum);


                if(total>4){
                    alert('최대 4명까지 선택 가능합니다');
                    result1.val(null);
                    result2.val(null);
                    $('#teenPrice').val('0');
                    $('#adultPrice').val('0');
                    total=0;
                    price1.val(null);
                    price2.val(null);
                    totalprice.val(null);
                }
            });
        </script>
        <div id="payProcess">

            인원수, 영화 정보,지역 및 극장 명,총 가격,결제하기<br>
            인원수 선택한 값만큼 자리 고를 수 있게 해야함<br>
            모든 영화관은 위 상영관 공동으로 사용할 예정<br>
            모든 자리 코드화 해야함<br>
            A1~A10<br>
            G1~G10<br>
            이미 선택한 자리는 선택 못하도록
        </div>
    </div>
</div>
<div class="right-part">
    <div class="mainTheater">
        <div class="screen">
            <h1>SCREEN</h1>
        </div>
        <div class="leftSeat">
            <input type="checkbox" class="seat" name="" value="a1">
            <input type="checkbox" class="seat" name="" value="a2">
            <input type="checkbox" class="seat" name="" value="b1">
            <input type="checkbox" class="seat" name="" value="b2">
            <input type="checkbox" class="seat" name="" value="c1">
            <input type="checkbox" class="seat" name="" value="c2">
            <input type="checkbox" class="seat" name="" value="d1">
            <input type="checkbox" class="seat" name="" value="d2">
            <input type="checkbox" class="seat" name="" value="e1">
            <input type="checkbox" class="seat" name="" value="e2">
            <input type="checkbox" class="seat" name="" value="f1">
            <input type="checkbox" class="seat" name="" value="f2">
            <input type="checkbox" class="seat" name="" value="g1">
            <input type="checkbox" class="seat" name="" value="g2">
        </div>
        <div class="middleSeat">
            <input type="checkbox" class="seat" name="" value="a3">
            <input type="checkbox" class="seat" name="" value="a4">
            <input type="checkbox" class="seat" name="" value="a5">
            <input type="checkbox" class="seat" name="" value="a6">
            <input type="checkbox" class="seat" name="" value="a7">
            <input type="checkbox" class="seat" name="" value="a8">
            <input type="checkbox" class="seat" name="" value="b3">
            <input type="checkbox" class="seat" name="" value="b4">
            <input type="checkbox" class="seat" name="" value="b5">
            <input type="checkbox" class="seat" name="" value="b6">
            <input type="checkbox" class="seat" name="" value="b7">
            <input type="checkbox" class="seat" name="" value="b8">
            <input type="checkbox" class="seat" name="" value="c3">
            <input type="checkbox" class="seat" name="" value="c4">
            <input type="checkbox" class="seat" name="" value="c5">
            <input type="checkbox" class="seat" name="" value="c6">
            <input type="checkbox" class="seat" name="" value="c7">
            <input type="checkbox" class="seat" name="" value="c8">
            <input type="checkbox" class="seat" name="" value="d3">
            <input type="checkbox" class="seat" name="" value="d4">
            <input type="checkbox" class="seat" name="" value="d5">
            <input type="checkbox" class="seat" name="" value="d6">
            <input type="checkbox" class="seat" name="" value="d7">
            <input type="checkbox" class="seat" name="" value="d8">
            <input type="checkbox" class="seat" name="" value="e3">
            <input type="checkbox" class="seat" name="" value="e4">
            <input type="checkbox" class="seat" name="" value="e5">
            <input type="checkbox" class="seat" name="" value="e6">
            <input type="checkbox" class="seat" name="" value="e7">
            <input type="checkbox" class="seat" name="" value="e8">
            <input type="checkbox" class="seat" name="" value="f3">
            <input type="checkbox" class="seat" name="" value="f4">
            <input type="checkbox" class="seat" name="" value="f5">
            <input type="checkbox" class="seat" name="" value="f6">
            <input type="checkbox" class="seat" name="" value="f7">
            <input type="checkbox" class="seat" name="" value="f8">
            <input type="checkbox" class="seat" name="" value="g3">
            <input type="checkbox" class="seat" name="" value="g4">
            <input type="checkbox" class="seat" name="" value="g5">
            <input type="checkbox" class="seat" name="" value="g6">
            <input type="checkbox" class="seat" name="" value="g7">
            <input type="checkbox" class="seat" name="" value="g8">
        </div>
        <div class="rightSeat">
            <input type="checkbox" class="seat" name="" value="a9">
            <input type="checkbox" class="seat" name="" value="a10">
            <input type="checkbox" class="seat" name="" value="b9">
            <input type="checkbox" class="seat" name="" value="b10">
            <input type="checkbox" class="seat" name="" value="c9">
            <input type="checkbox" class="seat" name="" value="c10">
            <input type="checkbox" class="seat" name="" value="d9">
            <input type="checkbox" class="seat" name="" value="d10">
            <input type="checkbox" class="seat" name="" value="e9">
            <input type="checkbox" class="seat" name="" value="e10">
            <input type="checkbox" class="seat" name="" value="f9">
            <input type="checkbox" class="seat" name="" value="f10">
            <input type="checkbox" class="seat" name="" value="g9">
            <input type="checkbox" class="seat" name="" value="g10">
        </div>
    </div>
    <object width="400" height="400" data="https://www.youtube.com"></object>
</div>
</body>
</html>
