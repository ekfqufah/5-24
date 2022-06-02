<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <title>영화 예매</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link href="${pageContext.request.contextPath}/resources/css/reserve.css" rel="stylesheet">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<%
    request.setCharacterEncoding("UTF-8");
%>
</head>
<body>
<%
    response.setContentType("text/html;charset=UTF-8");
%>
<script src="${pageContext.request.contextPath}/resources/js/reserve.js"></script>
<form action = "seat" method="post" name="resvform">
    <div class="res-wrapper">
        <div class="res-header">
                <!-- 선택 사항 알려줌 -->
                <div class="res-result">
                    <div class="res-result-movie">
                        영화 제목 : <input type="text" id="resultName" name="resultName" disabled/><br>
                        영화 코드 : <input type="text" id="resultNameCode" name="resultNameCode"/>
                        <input type="hidden" id="SresultName" name="SresultName"/><br>
                    </div>
                    <div class="res-result-theater">
                        지역 명 : <input type="text" id="resultRegion" name="resultRegion" disabled/><br>
                        지역 코드 : <input type="text" name="resultRegionCode" id="resultRegionCode"><br>
                        극장 명 : <input type="text" id="resultTheater" name="resultTheater" disabled/><br>
                        극장 코드 : <input type="text" name="resultTheaterCode" id="resultTheaterCode">

                        <input type="hidden" id="SresultRegion" name="SresultRegion"/><br>
                        <input type="hidden" id="SresultTheater" name="SresultTheater"/><br>
                    </div>
                    <div class="res-result-time">
                        날짜 : <input type="text" id="resultDate" name="resultDate" /><br>
                        상영관 : <input type="text" id="resultHall" name="resultHall" /><br>
                        시간 : <input type="text" id="resultTime" name="resultTime" />
                    </div>
<%--                    <input type="submit" value="좌석 선택">--%>
                    <input type="button" value="좌석 선택" onclick="sendData();">
                </div>
        </div>
        <script>
            function sendData(){
                var reserveform = document.resvform;

                var Mname = $('#resultName').val();
                var Mcode = $('#resultNameCode').val();
                if (!Mname == null || !Mcode == null){
                    alert("영화를 선택해주세요")
                    $('#movie').focus();
                }
                var Rname = $('#resultRegion').val();
                var Rcode = $('#resultRegionCode').val();
                if (!Rname|| !Rcode){
                    alert("지역을 선택해주세요")
                    $('#region').focus();
                }

                var Tname = $('#resultTheater').val();
                var Tcode = $('#resultTheaterCode').val();
                if (!Tname|| !Tcode){
                    alert("영화관을 선택해주세요")
                    $('#regionTheater').focus();
                }


                var Sdate = $('#resultDate').val();
                if(!Sdate){
                    alert('날짜를 선택해주세요');
                    $('#datepicker').focus();
                }
                var Shall = $('#resultHall').val();
                var Stime = $('#resultTime').val();

                if (!Tname|| !Tcode){
                    alert("상영관과 시간을 선택해주세요")
                    $('#regionTheater').focus();
                }

                if(Mname && Mcode && Rname && Rcode && Tname && Tcode && Sdate && Shall && Stime){
                    reserveform.submit();
                }
                console.log(form);
                console.log(Mname);
                console.log(Mcode);
                console.log(Rname);

                console.log(Rcode);
                console.log(Tname);
                console.log(Tcode);

                console.log(Sdate);
                console.log(Shall);
                console.log(Stime);


            }
        </script>
        <div class="res-content">
            <!-- 영화 선택 -->
            <div class="res-movie">
                <div class="res-movie-header">
                    <h2>영화</h2>
                </div>
                <div class="res-movie-content">
                    <select id='movie' name='movie' size='20'>
                        <c:forEach items="${mlist}" var="mdto" varStatus="status">
                            <option value="${mdto.m_code}">${mdto.m_title}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <!-- 극장 선택 -->
            <div class="res-theater">
                <div class="res-theater-header">
                    <h2>극장</h2>
                </div>
                <div class="res-theater-content">
                    <!-- 지역 선택  theaterList -->
                    <div class="res-theater-list1">
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
                                    $("#regionTheater").html(""); // 태그 초기화
                                    for(var i = 0; i<data.length;i++){
                                        $('#regionTheater').append("<option value="+data[i].t_code+">" +data[i].t_name + "</option>");
                                        // console.log(data[i].t_code);
                                        // console.log(data[i].t_name);
                                    }
                                },
                                error: function () {
                                    alert('fail');
                                }
                            });
                        });
                    </script>
                    <!-- 선택한 지역 영화관 -->
                    <div class="res-theater-list2 ">
                        <select id='regionTheater' name='t_name' size='20'>

                        </select>
                    </div>
                </div>
            </div>

            <!-- 날짜, 시간, 상영관 -->
            <script src="${pageContext.request.contextPath}/resources/js/datepick.js"></script>
            <div class="day-part">
                <div class="reserve-title">
                    <h2>날짜</h2>
                </div>
                <div class="reserve-date">
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
                                    $("#htlist1").html("");
                                    $("#htlist2").html("");
                                    $("#htlist3").html("");
                                    $("#htlist4").html("");
                                    html1='';
                                    html2='';
                                    html3='';
                                    html4='';
                                    for(var i =0;i<data.length;i++){
                                        // if(data[i].h_num == (i+1)){
                                        //     //div안의 i번째 자식
                                        // }
                                       if(data[i].h_num == 1){
                                           html1+="<option value="+data[i].h_num+">" + data[i].h_time +"</option>";
                                           // console.log(html1);
                                           // console.log(data[i].h_num);
                                           // console.log(data[i].h_time);
                                        }
                                        if(data[i].h_num == 2){
                                            html2+="<option value="+data[i].h_num+">" + data[i].h_time +"</option>";
                                        }
                                        if(data[i].h_num == 3){
                                            html3+="<option value="+data[i].h_num+">" + data[i].h_time +"</option>";
                                        }
                                        if(data[i].h_num == 4){
                                            html4+="<option value="+data[i].h_num+">" + data[i].h_time +"</option>";
                                        }
                                    }
                                    $('#htlist1').append(html1);
                                    $('#htlist2').append(html2);
                                    $('#htlist3').append(html3);
                                    $('#htlist4').append(html4);
                                },
                                error: function () {
                                    alert('fail');
                                }
                            });
                        };
                    </script>
                    <input type="text" id="datepicker" />

<%-- 2022.05.31 상영관 및 시간 출력 --%>
                    <div id = "hallAndTime">
                        <select id="htlist1" name="htlist1" size="10">
                            상영관1
                        </select>
                        <select id="htlist2" name="htlist2" size="10">
                            상영관2
                        </select>
                        <select id="htlist3" name="htlist3" size="10">
                            상영관3
                        </select>
                        <select id="htlist4" name="htlist4" size="10">
                            상영관4
                        </select>
                    </div>
                </div>
                <div class="reserve-getData">
                    <input type="button" id="findHall" value="조회하기" onclick="ajaxt();">
                </div>
            </div>
        </div>

        <script>
            $(function() {
                var today = getToday();

                $("#datepicker").datepicker();
                $("#datepicker").val();
                var resultdate = $('#resultDate');
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
    </div>
</form>
</body>
</html>
