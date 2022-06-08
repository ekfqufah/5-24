<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
  <!-- <meta id="ctl00_og_image" property="og:image" content="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000085/85829/85829_185.jpg"></meta> -->
    <link rel="alternate" href="http://m.cgv.co.kr" />
   <!--  <link rel="shortcut icon" href="https://img.cgv.co.kr/theater_img/favicon.ico" type="image/x-icon" /> -->
    <title id="ctl00_headerTitle">${movie.m_title}&lt;</title>
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/webfont.css" />
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/reset.css" />
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/layout.css" />
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/module.css?20211209" />
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/content.css" />
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/common.css" />
    
    <!-- <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/eggupdate.css" />
    <link rel="stylesheet" media="print" type="text/css" href="https://img.cgv.co.kr/R2014/css/print.css" />     -->
    <link rel="stylesheet" type="text/css" href="https://img.cgv.co.kr/R2014/js/jquery.ui/smoothness/jquery-ui-1.10.4.custom.min.css" />
    
    <script type="text/javascript" src="/common/js/extraTheaters.js"></script>
    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/app.config.js"></script>
    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.tmpl.min.js"></script>
    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.validate.js"></script>
    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.paging.min.js"></script>
    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.ui/jquery-ui-1.10.4.custom.min.js"></script>
    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.utils.js"></script>
    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/app.utils.js"></script>
	<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.utils.pageing.js"></script>
    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/app.init.js"></script>

    <!-- [if lte IE 9]><script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.placeholder.js"></script><![endif] -->
    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.dotdotdot.min.js"></script>
    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/silverlight_link.js"></script>
	<script src="https://img.cgv.co.kr/R2014/js/slick/slick.js" type="text/javascript" charset="utf-8"></script>

    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/phototicket/phototicket.css" />
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/slick.css" />
	<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/slick-theme-custom.css" />

    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/icheck/login.timer.js"></script>
    <script src="https://img.cgv.co.kr/R2014/js/icheck/icheck.min.js" type="text/javascript" charset="utf-8"></script>
    <link rel="stylesheet" type="text/css" href="https://img.cgv.co.kr/R2014/js/icheck/iCheck.css" />
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
    </script> <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js">
    </script> <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap-5.1.3-dist/css/bootstrap-grid.min.css">
    <link rel="stylesheet" href="../fontstyle/fontello-4581031e/css/fontello.css">
    <link rel="stylesheet" href="../css/jquery.bxslider.css">
<html>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>

	<!-- Contaniner -->
	<div id="contaniner"  class=""><!-- 벽돌 배경이미지 사용 시 class="bg-bricks" 적용 / 배경이미지가 없을 경우 class 삭제  -->
        

		<!-- Contents Area -->
		 <div id="contents" class="">
        
            
            <!-- Contents Start -->
			

<!-- 실컨텐츠 시작 -->
<div class="wrap-movie-detail" id="select_main">

    
<!--
<div class="tit-heading-wrap">
    <h3>영화상세</h3>
</div>
    //-->
<div class="sect-base-movie">
    <h3><strong>${movie.m_title}</strong>기본정보</h3>
    <div class="box-image">
            <span class="thumb-image"> 
                <img src="${pageContext.request.contextPath}/resources/${movie.m_position}" alt="브로커 포스터 새창" onerror="errorImage(this)"/>
            </span> 
        </a> 
    </div>
    <div class="box-contents">
        <div class="title"> 
            <strong>${movie.m_title}</strong>
            
            <em class="round brown"><span>예매중</span></em>
            <em class="round red"><span>D-6</span></em>
            <p>Broker</p>
        </div>
        <div class="score"> 
            <strong class="percent">예매율&nbsp;<span>10.9%</span></strong>
        </div>
        <!-- 떨어지는 얘 이전 요소에 class=on을 넣는다 -->
        <div class="spec">
            <dl>
                <dt>감독 :&nbsp;</dt>
                <dd>
                    
                        
                        <span>${movie.m_director}</span>                    
                        
                </dd>
                

                <dt>&nbsp;/ 배우 :&nbsp;</dt>
                <dd class="on">
                    
                        
                        <span>${movie.m_actor}</span>                    
                        
                </dd>

                <dt>장르 :&nbsp;${movie.m_genre}</dt> 
                <dd></dd>
                <dt>&nbsp;/ 기본 :&nbsp;</dt>
                <dd class="on">${movie.m_grade}세 이상, ${movie.m_time}분, ${movie.m_intro}</dd>
                <dt>개봉 :&nbsp;</dt>
                <dd class="on">${movie.m_date}</dd>


            

            </dl>
        </div>
        <span class="screentype">
        
        </span>

        <span class="like">
        
            <a class="link-reservation" href="/ticket/?MOVIE_CD=20029409&MOVIE_CD_GROUP=20029409">예매</a> 
        
        </span>

    </div>
</div><!-- .sect-base -->



    <div class="cols-content" id="menu">
        <div class="col-detail">
            <!-- 메뉴가 선택되면 a 에 title="선택" 이라고 넣는다 -->
            <div class="sect-story-movie">
             <pre>${movie.m_detail}</pre>
            </div>
            
       
            
            <div id="ctl00_PlaceHolderContent_Section_Still_Cut" class="sect-stillcut">
                <div class="heading">
                    <h4>스틸컷</h4><span class="count"><strong id="stillcut_current"></strong></span>
                    
                </div>
                <div class="">
                           <c:forEach items="${dtoList}" var="dto">
		                        <div class="item-wrap">
		                            <div class="item">
		                                <img src="${pageContext.request.contextPath}/resources/${dto.m_pics}" onerror="errorImage(this)" />
		                            </div>
		                        </div>
                           </c:forEach>
                        
                </div>
            </div><!-- .sect-stillcut -->
         
    
            <div class="sect-grade">   
                <!-- preegg.css 연관 UI -->
                <div class="real-rating">
                    <p class="title">관람일 포함 7일 이내 관람평을 남기시면 <strong> 20P</strong>가 적립됩니다. </p>
                    <p class="desc"><span><em>2</em> 명의 실관람객이 평가해주셨습니다.</span></p>
                    <div class="wrap_btn">
                        <a class="link-gradewrite" href="javascript:void(0);"><span>평점작성</span><br>
                        </a><a class="link-reviewwrite" href="/movies/point/my-list.aspx"><span>내 평점</span></a>
                    </div>
                </div>
                <!-- //preegg.css 연관 UI -->
                <ul class="sort" id="sortTab">
                    <li class="sortTab on" data-order-type="0" id="test"><a href="javascript:void(0);" title="현재선택">최신순<span class="arrow-down"></span></a></li>
                    <li class="sortTab" data-order-type="3"><a href="javascript:void(0);">추천순<span class="arrow-down"></span></a></li>
                </ul>
                                
                <div class="wrap-persongrade">
                    <!-- 평점 목록 -->
                    <ul id="movie_point_list_container" class="point_col2"></ul>
                </div>
            </div><!-- .sect-grade -->
                      
            <div class="paging">
				<ul id="paging_point"></ul>
			</div>

             
            
           
        </div><!-- .col-detail -->
        <iframe class="layer-wrap review_pop" name="ifrm_movie_time_table1" id="ifrm_movie_time_table1" style="display:none" title="상세리스트" height="993px" width="849px" frameborder="0" marginheight="0" marginwidth="0" scrolling="no" allowTransparency="true"></iframe><!--회원 평점 모아보기 iframe. mwpark_RR2015-->
        <form method="post" id="frmPointPopup" action="/movies/point/default-irm.aspx">
            <input type="hidden" name="userid" id="frmPointUserId" >
            <input type="hidden" name="nick" id="frmPointNick" >
        </form>

        
<div class="col-aside">
    <div class="ad-partner01">
        <iframe src="http://ad.cgv.co.kr/NetInsight/html/CGV/CGV_201401/sub@M_Rectangle" width="160" height="300" title="" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" name="M_Rectangle" id="M_Rectangle"></iframe>
    </div>

       

</div>

    </div>
    <span style="display:none" class="modifyCommentDummy"></span>
</div>
<!-- 실컨텐츠 끝 -->
<script type="text/javascript">
    _TRK_CP = _TRK_CP.replace("{0}", "주요정보");
</script>


<!-- 평점 작성 -->

            
            <!--/ Contents End -->
		 </div>
		<!-- /Contents Area -->
	</div>
    <!-- E Container -->
    
      
    <!-- S 예매하기 및 TOP Fixed 버튼 -->
    <div class="fixedBtn_wrap">
     
        <a href="/ticket/" class="btn_fixedTicketing">예매하기</a>
        
        <a href="#none" class="btn_gotoTop"><img src="https://img.cgv.co.kr/R2014/images/common/btn/gotoTop.png" alt="최상단으로 이동" /></a>
    </div>
	
    <footer>
	</footer>

    <!-- Aside Banner :  -->
    
	<!-- <div id="ctl00_sect_person_right" class="sect-aside-banner" style="padding:0; margin:0; position:fixed; z-index:1;display:none">
		<div class="aside-content-top">
			<div class="aside-content-btm">
				<a href="/theaters/"><img src="https://img.cgv.co.kr/R2014/images/common/btn/btn_person_theater.gif" alt="CGV THEATER" /></a>
				<a href="/arthouse/"><img src="https://img.cgv.co.kr/R2014/images/common/btn/btn_person_arthouse.gif" alt="CGV arthouse" /></a>
				<a href="/theaters/special/"><img src="https://img.cgv.co.kr/R2014/images/common/btn/btn_person_special.gif" alt="CGV SPECIAL" /></a>

				<a href="/user/mycgv/reserve/" class="required-login" data-url="/user/mycgv/reserve/"><img src="https://img.cgv.co.kr/R2014/images/common/btn/btn_person_ticket.gif" alt="CGV TICKET INFO" /></a>
				<a href="/discount/discountlist.aspx"><img src="https://img.cgv.co.kr/R2014/images/common/btn/btn_person_discount.gif" alt="CGV DISCOUNT INFO" /></a>
			</div>
		</div>
		<div class="btn-top">
            <a href="#" onclick="window.scrollTo(0,0);return false;"><span>최상단으로 이동</span></a>
		</div>
	</div> -->
   
	<!-- //Aside Banner -->
    
</div>



</body>
</html>