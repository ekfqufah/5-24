<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022-05-25
  Time: 오전 11:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <title>영화 예매</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link href="${pageContext.request.contextPath}/resources/css/reserve.css" rel="stylesheet">
</head>
<body>
<script src ="${pageContext.request.contextPath}/resources/js/reserve.js"></script>
<form method = "post" name="resvform">
    <div class="res-wrapper">
        <div class="res-header">
            <div>
                1
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
                        <option value='apple'>사과</option>
                        <option value='banana'>바나나</option>
                        <option value='lemon'>레몬</option>
                    </select>
                </div>
            </div>
            <!-- 극장 선택 -->
            <div class="res-theater">
                <div class="res-theater-header">
                    <h2>극장</h2>
                </div>
                <div class="res-theater-content">
                    <!-- 지역 선택 -->
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
                    <!-- 선택한 지역 영화관 -->
                    <div class="res-theater-list2 layer1">
                        <select id='regionTheater1' name='t_name' size='18'>
                            <option value = "101">강남</option>
                            <option value = "102">강변</option>
                            <option value = "103">건대입구</option>
                            <option value = "104">구로</option>
                            <option value = "105">대학로</option>
                            <option value = "106">동대문</option>
                            <option value = "107">등촌</option>
                            <option value = "108">명동</option>
                            <option value = "109">목동</option>
                            <option value = "110">미아</option>
                            <option value = "111">방학</option>
                            <option value = "112">송파</option>
                            <option value = "113">수유</option>
                            <option value = "114">압구정</option>
                            <option value = "115">여의도</option>
                            <option value = "116">연남</option>
                            <option value = "117">영등포</option>
                            <option value = "118">홍대</option>
                        </select>
                    </div>
                    <div class="res-theater-list2 layer2">
                        <select id='regionTheater2' name='t_name' size='21'>
                            <option value="201">경기광주</option>
                            <option value="202">고양행신</option>
                            <option value="203">광교</option>
                            <option value="204">광명역</option>
                            <option value="205">구리</option>
                            <option value="206">기흥</option>
                            <option value="207">김포</option>
                            <option value="208">동수원</option>
                            <option value="209">동탄</option>
                            <option value="210">부천</option>
                            <option value="211">산본</option>
                            <option value="212">수원</option>
                            <option value="213">스파틸드시티위례</option>
                            <option value="214">시흥</option>
                            <option value="215">용인</option>
                            <option value="216">의정부</option>
                            <option value="217">일산</option>
                            <option value="218">판교</option>
                            <option value="219">평촌</option>
                            <option value="220">평택</option>
                            <option value="221">포천</option>
                        </select>
                    </div>

                    <option value=""></option>

                    <div class="res-theater-list2 layer3">
                        <select id='regionTheater3' name='t_name' size='7'>
                            <option value="301">계양</option>
                            <option value="302">부평</option>
                            <option value="303">송도타임스페이스</option>
                            <option value="304">인천</option>
                            <option value="305">인천논현</option>
                            <option value="306">주안</option>
                            <option value="307">청라</option>
                        </select>
                    </div>
                    <div class="res-theater-list2 layer4">
                        <select id='regionTheater4' name='t_name' size='4'>
                            <option value="401">강릉</option>
                            <option value="402">원주</option>
                            <option value="403">인제</option>
                            <option value="404">춘천</option>
                        </select>
                    </div>
                    <div class="res-theater-list2 layer5">
                        <select id='regionTheater5' name='t_name' size='9'>
                            <option value="501">논산</option>
                            <option value="502">당진</option>
                            <option value="503">대전</option>
                            <option value="504">대전탄방</option>
                            <option value="505">세종</option>
                            <option value="506">천안</option>
                            <option value="507">청주</option>
                            <option value="508">청주터미널</option>
                            <option value="509">홍성</option>
                        </select>
                    </div>
                    <div class="res-theater-list2 layer6">
                        <select id='regionTheater6' name='t_name' size='4'>
                            <option value="601">대구수성</option>
                            <option value="602">대구스타디움</option>
                            <option value="603">대구연경</option>
                            <option value="604">대구한일</option>
                        </select>
                    </div>
                    <div class="res-theater-list2 layer7">
                        <select id='regionTheater7' name='t_name' size='9'>
                            <option value="701">동래</option>
                            <option value="702">부산명지</option>
                            <option value="703">서면</option>
                            <option value="704">센텀시티</option>
                            <option value="705">울산동구</option>
                            <option value="706">울산신천</option>
                            <option value="707">정관</option>
                            <option value="708">해운대</option>
                            <option value="709">화명</option>
                        </select>
                    </div>
                    <div class="res-theater-list2 layer8">
                        <select id='regionTheater8' name='t_name' size='9'>
                            <option value="801">거제</option>
                            <option value="802">고성</option>
                            <option value="803">김해</option>
                            <option value="804">김해율하</option>
                            <option value="805">김해장유</option>
                            <option value="806">마산</option>
                            <option value="807">진주혁신</option>
                            <option value="808">창원</option>
                            <option value="809">통영</option>
                        </select>
                    </div>
                    <div class="res-theater-list2 layer9">
                        <select id='regionTheater9' name='t_name' size='11'>
                            <option value="901">광양</option>
                            <option value="902">광주상무</option>
                            <option value="903">광주첨단</option>
                            <option value="904">광주터미널</option>
                            <option value="905">군산</option>
                            <option value="906">나주</option>
                            <option value="907">목포</option>
                            <option value="908">순천</option>
                            <option value="909">익산</option>
                            <option value="910">정읍</option>
                            <option value="911">제주</option>
                        </select>
                    </div>
                </div>
            </div>
            <!-- 날짜, 시간, 상영관 -->
            <div class="day-part">
                <div class="reserve-title">
                    <h2>날짜</h2>
                </div>
                <div class="reserve-date">
                    <script>
                        function callByAjax(){
                            var form = document.resvform;

                            var obj1 = document.getElementById("movie");
                            var idx1 = obj1.options.selectedIndex;

                            var resultName = obj1.options[idx1].value
                            var resultRegionCode = form.resultRegionCode.value;
                            var resultTheaterCode = form.resultTheaterCode.value;
                            console.log(resultName);
                            console.log(resultRegionCode);
                            console.log(resultTheaterCode);
                            alert('clicked');
                            $.ajax({
                                url:"reserve?resultName="+resultName+"&resultRegionCode="+resultRegionCode+"&resultTheaterCode="+resultTheaterCode,
                                type:"get",
                                success:function(data){
                                    alert('success');
                                },
                                error:function(){
                                    alert('fail');
                                }
                            });
                        }
                    </script>

                    <input type="date" id="currentDate">
                    <script>
                        document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10); //오늘 날짜 출력
                    </script>
                    <input type="button" onclick = "callByAjax();" value="조회하기">
                    <input type = "text" name="re1" id="re1">
                    <input type = "text" name="re2" id="re2">
                    <input type = "text" name="re3" id="re3">
                </div>
            </div>
        </div>
        <!-- 선택 사항 알려줌 -->
        <div class="res-result">
            <div class="res-result-movie">
                <input type="text" id="resultName" name="resultName" disabled/>
            </div>
            <div class="res-result-theater">
                <input type="text" id="resultRegion" name="resultRegion" disabled/>
                <input type="hidden" name="resultRegionCode" id="resultRegionCode">
                <input type="text" id="resultTheater" name="resultTheater" disabled/>
                <input type="hidden" name="resultTheaterCode" id="resultTheaterCode">
            </div>
            <div class="res-result-time">
                <input type="text" id=""/>
            </div>

            <input type="submit" value="좌석 선택" onclick="javascript:form.action='selectSeats'">
        </div>

        <script>

            jQuery('#region').change(function(){
                var state = jQuery('#region option:selected').val();
                if(state =='1'){
                    jQuery('.layer1').show();
                    jQuery('.layer2').hide();
                    jQuery('.layer3').hide();
                    jQuery('.layer4').hide();
                    jQuery('.layer5').hide();
                    jQuery('.layer6').hide();
                    jQuery('.layer7').hide();
                    jQuery('.layer8').hide();
                    jQuery('.layer9').hide();
                }else if(state =='2'){
                    jQuery('.layer1').hide();
                    jQuery('.layer2').show();
                    jQuery('.layer3').hide();
                    jQuery('.layer4').hide();
                    jQuery('.layer5').hide();
                    jQuery('.layer6').hide();
                    jQuery('.layer7').hide();
                    jQuery('.layer8').hide();
                    jQuery('.layer9').hide();
                }else if(state == '3'){
                    jQuery('.layer1').hide();
                    jQuery('.layer2').hide();
                    jQuery('.layer3').show();
                    jQuery('.layer4').hide();
                    jQuery('.layer5').hide();
                    jQuery('.layer6').hide();
                    jQuery('.layer7').hide();
                    jQuery('.layer8').hide();
                    jQuery('.layer9').hide();
                }else if(state =='4'){
                    jQuery('.layer1').hide();
                    jQuery('.layer2').hide();
                    jQuery('.layer3').hide();
                    jQuery('.layer4').show();
                    jQuery('.layer5').hide();
                    jQuery('.layer6').hide();
                    jQuery('.layer7').hide();
                    jQuery('.layer8').hide();
                    jQuery('.layer9').hide();
                }else if(state =='5'){
                    jQuery('.layer1').hide();
                    jQuery('.layer2').hide();
                    jQuery('.layer3').hide();
                    jQuery('.layer4').hide();
                    jQuery('.layer5').show();
                    jQuery('.layer6').hide();
                    jQuery('.layer7').hide();
                    jQuery('.layer8').hide();
                    jQuery('.layer9').hide();
                }else if(state == '6'){
                    jQuery('.layer1').hide();
                    jQuery('.layer2').hide();
                    jQuery('.layer3').hide();
                    jQuery('.layer4').hide();
                    jQuery('.layer5').hide();
                    jQuery('.layer6').show();
                    jQuery('.layer7').hide();
                    jQuery('.layer8').hide();
                    jQuery('.layer9').hide();
                }else if(state =='7'){
                    jQuery('.layer1').hide();
                    jQuery('.layer2').hide();
                    jQuery('.layer3').hide();
                    jQuery('.layer4').hide();
                    jQuery('.layer5').hide();
                    jQuery('.layer6').hide();
                    jQuery('.layer7').show();
                    jQuery('.layer8').hide();
                    jQuery('.layer9').hide();
                }else if(state =='8'){
                    jQuery('.layer1').hide();
                    jQuery('.layer2').hide();
                    jQuery('.layer3').hide();
                    jQuery('.layer4').hide();
                    jQuery('.layer5').hide();
                    jQuery('.layer6').hide();
                    jQuery('.layer7').hide();
                    jQuery('.layer8').show();
                    jQuery('.layer9').hide();
                }else if(state == '9'){
                    jQuery('.layer1').hide();
                    jQuery('.layer2').hide();
                    jQuery('.layer3').hide();
                    jQuery('.layer4').hide();
                    jQuery('.layer5').hide();
                    jQuery('.layer6').hide();
                    jQuery('.layer7').hide();
                    jQuery('.layer8').hide();
                    jQuery('.layer9').show();
                }
            });

            $(function(){
                var idval = $('#resultName');
                $('#movie').change(function(){
                    var element = $(this).find('option:selected');
                    var myTag = element.text();
                    // var myTag = element.attr('value');
                    idval.val(myTag);
                });
            });
            $(function(){
                var idval = $('#resultRegion');
                $('#region').change(function(){
                    var element = $(this).find('option:selected');
                    var myTag = element.text();
                    // var myTag = element.attr('value');
                    idval.val(myTag);
                });
            });

            $(function(){
                var idval = $('#resultRegionCode');
                $('#region').change(function(){
                    var element = $(this).find('option:selected');
                    var myTag = element.attr('value');
                    idval.val(myTag);
                });
            });

            $(function(){
                var outer = $('#resultTheater');
                var inner = $('#resultTheaterCode');
                $('#regionTheater1').change(function(){
                    var element = $(this).find('option:selected');
                    var rtouter = element.text();
                    var rtinner = element.attr('value');
                    outer.val(rtouter);
                    inner.val(rtinner);
                });
            });
            $(function(){
                var outer = $('#resultTheater');
                var inner = $('#resultTheaterCode');
                $('#regionTheater2').change(function(){
                    var element = $(this).find('option:selected');
                    var rtouter = element.text();
                    var rtinner = element.attr('value');
                    outer.val(rtouter);
                    inner.val(rtinner);
                });
            });
            $(function(){
                var outer = $('#resultTheater');
                var inner = $('#resultTheaterCode');
                $('#regionTheater3').change(function(){
                    var element = $(this).find('option:selected');
                    var rtouter = element.text();
                    var rtinner = element.attr('value');
                    outer.val(rtouter);
                    inner.val(rtinner);
                });
            });
            $(function(){
                var outer = $('#resultTheater');
                var inner = $('#resultTheaterCode');
                $('#regionTheater4').change(function(){
                    var element = $(this).find('option:selected');
                    var rtouter = element.text();
                    var rtinner = element.attr('value');
                    outer.val(rtouter);
                    inner.val(rtinner);
                });
            });
            $(function(){
                var outer = $('#resultTheater');
                var inner = $('#resultTheaterCode');
                $('#regionTheater5').change(function(){
                    var element = $(this).find('option:selected');
                    var rtouter = element.text();
                    var rtinner = element.attr('value');
                    outer.val(rtouter);
                    inner.val(rtinner);
                });
            });
            $(function(){
                var outer = $('#resultTheater');
                var inner = $('#resultTheaterCode');
                $('#regionTheater6').change(function(){
                    var element = $(this).find('option:selected');
                    var rtouter = element.text();
                    var rtinner = element.attr('value');
                    outer.val(rtouter);
                    inner.val(rtinner);
                });
            });
            $(function(){
                var outer = $('#resultTheater');
                var inner = $('#resultTheaterCode');
                $('#regionTheater7').change(function(){
                    var element = $(this).find('option:selected');
                    var rtouter = element.text();
                    var rtinner = element.attr('value');
                    outer.val(rtouter);
                    inner.val(rtinner);
                });
            });
            $(function(){
                var outer = $('#resultTheater');
                var inner = $('#resultTheaterCode');
                $('#regionTheater8').change(function(){
                    var element = $(this).find('option:selected');
                    var rtouter = element.text();
                    var rtinner = element.attr('value');
                    outer.val(rtouter);
                    inner.val(rtinner);
                });
            });
            $(function(){
                var outer = $('#resultTheater');
                var inner = $('#resultTheaterCode');
                $('#regionTheater9').change(function(){
                    var element = $(this).find('option:selected');
                    var rtouter = element.text();
                    var rtinner = element.attr('value');
                    outer.val(rtouter);
                    inner.val(rtinner);
                });
            });
        </script>
    </div>
</form>
</body>
</html>
