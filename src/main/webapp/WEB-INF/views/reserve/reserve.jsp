<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <title>영화 예매</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link href="${pageContext.request.contextPath}/resources/css/reserve.css" rel="stylesheet">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
<script src="${pageContext.request.contextPath}/resources/js/reserve.js"></script>
<form action = "seat" method="post" name="resvform">
    <div class="res-wrapper">
        <div class="res-header">
            <div id="t1">
<%--        Bean Space     --%>
            </div>
        </div>
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
                            console.log(Rcode);
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
                                        $('#regionTheater').append("<option id=rtat value="+data[i].t_code+">" +data[i].t_name + "</option>");
                                        console.log(data[i].t_code);
                                        console.log(data[i].t_name);
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
                        jQuery('#findHall').onclick(function () {
                            //얘네는 form문으로 넘길 때 필요
                            //이 ajax에서는 영화 코드만 가지고 놀기
                            // var MovieName = $('#resultName').val();
                            var MovieCode = $('#resultNameCode').val();
                            console.log(MovieCode);
                            // if (MovieName == null || MovieCode == null) {
                            //     alert('영화를 선택해주세요');
                            // }
                            // var RegionName = $('#resultRegion').val();
                            // var RegionCode = $('#resultRegionCode').val();
                            // if (RegionName == null || RegionCode == null) {
                            //     alert('지역를 선택해주세요');
                            // }
                            // var TheaterName = $('#resultTheater').val();
                            // var TheaterCode = $('#resultTheaterCode').val();
                            // if (TheaterName == null || TheaterCode == null) {
                            //     alert('영화관를 선택해주세요');
                            // }
                            //
                            // var SelectedDate = $('#resultDate').val();
                            // var SelectedHall = $('#resultHall').val();
                            // var SelectedTime = $('#resultTime').val();
                            //
                            // var form = document.resvform;
                            // var obj1 = document.getElementById("movie");
                            // var idx1 = obj1.options.selectedIndex;
                            // var resultName = obj1.options[idx1].value
                            // var resultRegionCode = form.resultRegionCode.value;
                            // var resultTheaterCode = form.resultTheaterCode.value;
                        // }
                        //     $.ajax({
                        //         url: "reserve?resultName=" + resultName + "&resultRegionCode=" + resultRegionCode + "&resultTheaterCode=" + resultTheaterCode,
                        //         type: "get",
                        //         success: function (data) {
                        //             alert('success');
                        //         },
                        //         error: function () {
                        //             alert('fail');
                        //         }
                        //     });
                        }
                    </script>

                    <input type="text" id="datepicker" />
                    <input type="button" id="findHall" value="조회하기"><br>
                </div>
            </div>
        </div>
        <!-- 선택 사항 알려줌 -->
        <div class="res-result">
            <div class="res-result-movie">
                영화 제목 : <input type="text" id="resultName" name="resultName" disabled/><br>
                영화 코드 : <input type="text" id="resultNameCode" name="resultNameCode" disabled/>
            </div>
            <div class="res-result-theater">
                지역 명 : <input type="text" id="resultRegion" name="resultRegion" disabled/><br>
                지역 코드 : <input type="text" name="resultRegionCode" id="resultRegionCode"><br>
                극장 명 : <input type="text" id="resultTheater" name="resultTheater" disabled/><br>
                극장 코드 : <input type="text" name="resultTheaterCode" id="resultTheaterCode">
            </div>
            <div class="res-result-time">
                날짜 : <input type="text" id="resultDate" name="resultDate" /><br>
                상영관 : <input type="text" id="resultHall" name="resultHall" /><br>
                시간 : <input type="text" id="resultTime" name="resultTime" />
            </div>
            <input type="submit" value="좌석 선택">
        </div>
        <script>
            $(function() {
                var today = getToday();
                console.log(today);

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
                var inner = $("#resultNameCode");
                $("#movie").change(function () {
                    var element = $(this).find("option:selected");
                    var rtouter = element.text(); //지역 명
                    var rtinner = element.attr("value"); //지역 코드
                    outer.val(rtouter);
                    inner.val(rtinner);
                });
            });


            $(function () {
                var outer = $("#resultRegion");
                var inner = $("#resultRegionCode");
                $("#region").change(function () {
                    var element = $(this).find("option:selected");
                    var rtouter = element.text(); //지역 명
                    var rtinner = element.attr("value"); //지역 코드
                    outer.val(rtouter);
                    inner.val(rtinner);
                });
            });

            $(function () {
                var outer = $('#resultTheater');
                var inner = $('#resultTheaterCode');
                $('#regionTheater').change(function () {
                    var element = $(this).find('option:selected');

                    var rtouter = element.text(); //극장 명
                    var rtinner = element.attr('value'); // 극장 코드
                    outer.val(rtouter);
                    inner.val(rtinner);
                });
            });
        </script>
    </div>
</form>
</body>
</html>
