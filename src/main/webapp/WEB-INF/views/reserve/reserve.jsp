<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <title>영화 예매</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
<%--    <link href="${pageContext.request.contextPath}/resources/css/reserve.css" rel="stylesheet">--%>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <style>

        *{
            margin: 0;
            padding: 0;
            margin: auto;
        }
        .header{
            width: 100%;
            height: 123px;
            border-bottom: 3px solid #ced4da;
        }

        .main{
            margin-top: 4%;
            width: 90%;
            height: 450px;
        }
        .footer{
            width: 50%;
            height: 200px;
            margin-top: 1%;
        }

        /*헤더*/

        /*메인*/
        .movielist{
            width: 33%;
            height: 100%;
            float: left;
            border: 2px solid #495057;
        }
        .movietitle{
            line-height: 500%;
            text-align: center;
            width: 100%;
            height: 19.5%;
            background-color: #212529;
            color: white;
        }
        .moviecontent{
            width: 100%;
            height: 83%;
            overflow: hidden;
        }
        #movie{
            text-align: center;
            margin-left: 0.8%;
            width: 98%;
            height: 96%;
            overflow: hidden;
            font-size: 18px;
        }

        .theaterlist{
            width: 33%;
            height: 100%;
            float: left;
            border: 2px solid #495057;
        }
        .theatertitle{
            line-height: 500%;
            text-align: center;
            width: 100%;
            height: 19.5%;
            background-color: #212529;
            color: white;
        }
        .theatercontent{
            height: 83%;
            overflow: hidden;
            margin-left: 0.8%;
        }
        .theatercontent>div{
            width: 48%;
            height: 95%;
            display: inline-block;
            margin-left: 0.5%;
            margin-top: 0.5%;
        }
        #region{
            border: none;
            text-align: center;
            width: 100%;
            height: 100%;
            overflow: hidden;
        }
        #regionTheater{
            border: none;
            text-align: center;
            width: 100%;
            height: 100%;
            overflow: hidden;
        }

        .timelist{
            width: 33%;
            height: 100%;
            float: left;
            text-align: center;
            border: 2px solid #495057;
        }
        .timelisttitle{
            text-align: center;
            width: 100%;
            height: 9.5%;
            background-color: #212529;
            color: white;
        }
        .timelistdate{
            padding-top: 1.7%;
            width: 100%;
            height: 8%;
            background-color: #212529;
        }
        .timelistcontent{
            height: 70%;
            overflow: hidden;
        }
        .timelistcontent div{
            width: 23%;
            height: 95%;
            display: inline-block;
            margin-left: 0.15%;
        }
        .timelistcontent input{
            text-align: center;
            color: white;
            width: 100%;
            height: 10%;
            margin-top: 2%;
        }

        #htlist1{
            border: none;
            overflow: hidden;
            text-align: center;
            width: 100%;
            height: 93%;
        }
        #htlist2{
            border: none;
            overflow: hidden;
            text-align: center;
            width: 100%;
            height: 93%;

        }
        #htlist3{
            border: none;
            overflow: hidden;
            text-align: center;
            width: 100%;
            height: 93%;
        }
        #htlist4{
            border: none;
            overflow: hidden;
            text-align: center;
            width: 100%;
            height: 93%;
        }
        #findHall{
            width: 80%;
        }
        /*푸터*/
        .box-result01{
            width: 30%;
            height: 100%;
            float: left;
            background-color: white;
            border-right: 1px solid #f8f9fa;
        }
        .box-result02{
            width: 30%;
            height: 100%;
            float: left;
            background-color: white;
            border-right: 1px solid #f8f9fa;

        }
        .box-result03{
            width: 30%;
            height: 100%;
            float: left;
            background-color: white;
        }
        .btn-result{
            width: 8%;
            height: 95%;
            margin-left: 0.8%;
            margin-top: 0.2%;
        }
        .back{
            position: fixed;
            top: 13%;
            left: 0;
            width: 100%;
            height: 90%;
            background-color: #6c757d;
            z-index: -2;
        }
    </style>
<% request.setCharacterEncoding("UTF-8"); %>
</head>
<body>
<%
   String id = (String)session.getAttribute("u_id");
%>

<% response.setContentType("text/html;charset=UTF-8"); %>
<script src="${pageContext.request.contextPath}/resources/js/reserve.js"></script>
<form action = "seat" method="post" name="resvform">
    <div class="back"></div>
        <script>
            function sendData(){
                var reserveform = document.resvform;
                let id = $('#uid').val();
                console.log(id);
                var Mname = $('#resultName').val(); var Mcode = $('#resultNameCode').val();
                if (!Mname == null || !Mcode == null){
                    alert("영화를 선택해주세요")
                    $('#movie').focus();
                }
                var Rname = $('#resultRegion').val(); var Rcode = $('#resultRegionCode').val();
                if (!Rname|| !Rcode){
                    alert("지역을 선택해주세요")
                    $('#region').focus();
                }
                var Tname = $('#resultTheater').val(); var Tcode = $('#resultTheaterCode').val();
                if (!Tname|| !Tcode){
                    alert("영화관을 선택해주세요")
                    $('#regionTheater').focus();
                }
                var Sdate = $('#resultDate').val();
                if(!Sdate){
                    alert('날짜를 선택해주세요');
                    $('#datepicker').focus();
                }
                var Shall = $('#resultHall').val(); var Stime = $('#resultTime').val();
                if (!Tname|| !Tcode){
                    alert("상영관과 시간을 선택해주세요")
                    $('#regionTheater').focus();
                }
                if(!id){
                	alert('로그인을 해주세요');
                }else if(Mname && Mcode && Rname && Rcode && Tname && Tcode && Sdate && Shall && Stime && id){
                	reserveform.submit();
                }
            }
        </script>
    <div class="header">

    </div>

    <div class="main">
        <div class="movielist">
            <div class="movietitle">
                <h1>영화</h1>
            </div>
            <div class="moviecontent">
                <select id='movie' name='movie' size='20'>
                    <c:forEach items="${mlist}" var="mdto" varStatus="status">
                        <option value="${mdto.m_code}">${mdto.m_title}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="theaterlist">
            <div class="theatertitle">
                <h1>지역</h1>
            </div>
            <div class="theatercontent">
                <div class="lefttheatercontent">
                    <select id='region' name='region' size='9'>
                        <option value="1">서울</option>
                        <option value="2">경기</option>
                        <option value="3">인천</option>
                        <option value="4">강원</option>
                        <option value="5">대전/충청</option>
                        <option value="6">대구</option>
                        <option value="7">부산/울산</option>
                        <option value="8">경상</option>
                        <option value="9">광주/전라/제주</option>
                    </select>
                </div>
                <div class="righttheatercontent">
                    <select id='regionTheater' name='t_name' size='20'>
                    </select>
                </div>
            </div>
        </div>
                    <script>
                        jQuery('#region').change(function () {
                            var Rcode = jQuery('#region option:selected').val();
                            $.ajax({
                                url: "ajaxOne",
                                type: "post",
                                dataType:"json",
                                data: {
                                    "Rcode": Rcode
                                },
                                success: function (data) {
                                    $("#regionTheater").html("");
                                    for(var i = 0; i<data.length;i++){
                                        $('#regionTheater').append("<option value="+data[i].t_code+">" +data[i].t_name + "</option>");
                                    }
                                },
                                error: function () {
                                    alert('fail');
                                }
                            });
                        });
                    </script>
            <!-- 날짜, 시간, 상영관 -->
        <script src="${pageContext.request.contextPath}/resources/js/datepick.js"></script>
        <div class="timelist">
            <div class="timelisttitle">
                <h1>상영관</h1>
            </div>
            <div class="timelistdate">
                <input type="text" id="datepicker"/>
            </div>

            <div class="timelistcontent">
                <div class="hall1">
                    <input type="text" value="1관" disabled>
                    <select id="htlist1" name="htlist1" size="10">
                    </select>
                </div>
                <div class="hall2">
                    <input type="text" value="2관" disabled>
                    <select id="htlist2" name="htlist2" size="10">
                    </select>
                </div>
                <div class="hall3">
                    <input type="text" value="3관" disabled>
                    <select id="htlist3" name="htlist3" size="10">
                    </select>
                </div>
                <div class="hall4">
                    <input type="text" value="4관" disabled>
                    <select id="htlist4" name="htlist4" size="10">
                    </select>
                </div>
            </div>
            <input type="button" id="findHall" value="조회하기" onclick="ajaxt();">
        </div>
    </div>
                    <script>
                        function ajaxt(){
                            var Mcode = document.getElementById("resultNameCode").value;
                            $.ajax({
                                url: "ajaxTwo",
                                type: "post",
                                dataType:"json",
                                data: {
                                    "Mcode": Mcode
                                },
                                success: function (data) {
                                    $("#htlist1").html(""); $("#htlist2").html(""); $("#htlist3").html(""); $("#htlist4").html("");
                                    html1=''; html2=''; html3=''; html4='';
                                    for(var i =0;i<data.length;i++){
                                        // if(data[i].h_num == (i+1)){
                                        //     //div안의 i번째 자식
                                        // }
                                       if(data[i].h_num == 1) html1+="<option value="+data[i].h_num+">" + data[i].h_time +"</option>";
                                       if(data[i].h_num == 2) html2+="<option value="+data[i].h_num+">" + data[i].h_time +"</option>";
                                       if(data[i].h_num == 3) html3+="<option value="+data[i].h_num+">" + data[i].h_time +"</option>";
                                       if(data[i].h_num == 4) html4+="<option value="+data[i].h_num+">" + data[i].h_time +"</option>";
                                    }
                                    $('#htlist1').append(html1); $('#htlist2').append(html2); $('#htlist3').append(html3); $('#htlist4').append(html4);
                                },
                                error: function () {
                                    alert('fail');
                                }
                            });
                        };
                    </script>

    <div class="footer">
        <div class="box-result01">id
            영화 제목 : <input type="text" id="resultName" name="resultName" disabled/><br>
            영화 코드 : <input type="text" id="resultNameCode" name="resultNameCode"/>
            <input type="hidden" id="SresultName" name="SresultName"/><br>
            <input type="hidden" id="uid" name="uid" value="<%=id%>"/><br>
        </div>
        <div class="box-result02">
            지역 명 : <input type="text" id="resultRegion" name="resultRegion" disabled/><br>
            지역 코드 : <input type="text" name="resultRegionCode" id="resultRegionCode"><br>
            극장 명 : <input type="text" id="resultTheater" name="resultTheater" disabled/><br>
            극장 코드 : <input type="text" name="resultTheaterCode" id="resultTheaterCode">
            <input type="hidden" id="SresultRegion" name="SresultRegion"/><br>
            <input type="hidden" id="SresultTheater" name="SresultTheater"/><br>
        </div>
        <div class="box-result03">
            날짜 : <input type="text" id="resultDate" name="resultDate" /><br>
            상영관 : <input type="text" id="resultHall" name="resultHall" /><br>
            시간 : <input type="text" id="resultTime" name="resultTime" />
        </div>
        <input type="button" class="btn-result" value="좌석 선택" onclick="sendData();">
    </div>
<%--  space_magic -> test.html backup --%>
            <script>
                $(document).ready(function (){
                    let date = $('#datepicker').val();
                    $('#resultDate').val(date);
                });
            $(function() {
                var today = getToday();
                $("#datepicker").datepicker(); $("#datepicker").val(); var resultdate = $('#resultDate');
                $("#datepicker").on("change",function(){
                    var selected = $(this).val();
                    if(selected < today){
                        alert('지난 날짜는 선택할 수 없습니다.');
                        resultdate.val('');
                    }else{
                        resultdate.val(selected);
                    }
                });
            });
            function getToday(){
                var date= new Date();
                return date.getFullYear() + "-" + ("0"+(date.getMonth()+1)).slice(-2)+ "-" + ("0"+date.getDate()).slice(-2);
            };
        </script>
        <script>
            $(function () {
                var outer = $("#resultName");
                var hidden = $("#SresultName");
                var inner = $("#resultNameCode");
                $("#movie").change(function () {
                    var element = $(this).find("option:selected");
                    var rtouter = element.text(); //지역 명
                    var rtinner = element.attr("value"); //지역 코드
                    outer.val(rtouter);
                    hidden.val(rtouter);
                    inner.val(rtinner);
                });
            });
            $(function () {
                var outer = $("#resultRegion");
                var hidden = $("#SresultRegion");
                var inner = $("#resultRegionCode");
                $("#region").change(function () {
                    var element = $(this).find("option:selected");
                    var rtouter = element.text(); //지역 명
                    var rtinner = element.attr("value"); //지역 코드
                    outer.val(rtouter);
                    hidden.val(rtouter);
                    inner.val(rtinner);
                });
            });
            $(function () {
                var outer = $('#resultTheater');
                var hidden = $('#SresultTheater');
                var inner = $('#resultTheaterCode');
                $('#regionTheater').change(function () {
                    var element = $(this).find('option:selected');
                    var rtouter = element.text(); //극장 명
                    var rtinner = element.attr('value'); // 극장 코드
                    outer.val(rtouter);
                    hidden.val(rtouter);
                    inner.val(rtinner);
                });
            });
            $(function () {
                var hall = $('#resultHall');
                var time = $('#resultTime');
                $('#htlist1').change(function () {
                    hall.val('');
                    time.val('');
                    var element = $(this).find('option:selected');
                    var mtime = element.text(); //시간
                    var mcode = element.attr('value'); // 상영관코드(H_NUM)
                        hall.val(mcode);
                        time.val(mtime);
                 });
            });
            $(function () {
                var hall = $('#resultHall');
                var time = $('#resultTime');
                $('#htlist2').change(function () {
                    hall.val('');
                    time.val('');
                    var element = $(this).find('option:selected');
                    var mtime = element.text(); //시간
                    var mcode = element.attr('value'); // 상영관코드(H_NUM)
                    hall.val(mcode);
                    time.val(mtime);
                });
            });
            $(function () {
                var hall = $('#resultHall');
                var time = $('#resultTime');
                $('#htlist3').change(function () {
                    hall.val('');
                    time.val('');
                    var element = $(this).find('option:selected');
                    var mtime = element.text(); //시간
                    var mcode = element.attr('value'); // 상영관코드(H_NUM)
                    hall.val(mcode);
                    time.val(mtime);
                });
            });
            $(function () {
                var hall = $('#resultHall');
                var time = $('#resultTime');
                $('#htlist4').change(function () {
                    hall.val('');
                    time.val('');
                    var element = $(this).find('option:selected');
                    var mtime = element.text(); //시간
                    var mcode = element.attr('value'); // 상영관코드(H_NUM)
                    hall.val(mcode);
                    time.val(mtime);
                });
            });
        </script>
</form>
</body>
</html>
