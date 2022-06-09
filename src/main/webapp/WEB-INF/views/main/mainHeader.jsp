<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>

<!-- icon -->
<script src="https://kit.fontawesome.com/259d5f1852.js" crossorigin="anonymous"></script>
<style type="text/css">
	.header_div
	{
		font-size: 13px;
	    line-height: 1.2;
	    color: #666;
	    font-family: 'Noto Sans KR', 'CJONLYONENEW', '맑은 고딕', '돋움', Dotum, sans-serif;
	    font-weight: 400;

        /* min-width : 1120px;	
    	max-width : 1280px;	
    	margin:auto; */
	}

    .contents
    {
        /* min-width : 1120px;	
    	max-width : 1280px;	
    	margin:auto; */

        /* float: left; */
        margin: 5px 250px 0px 250px;
        display: flex; 
        
    }

	.header_con
	{
		display: inline-block;
		width: 80px;
		padding: 5px 10px;
		text-align: center;
        font-size: 11px;
	}
	.cgv_img
	{
		width: 36px;
        height: 36px;
        display: block;
        margin: 0px auto; 
        
	}
	.header_title {
		margin-top: 20px;
	}
	.header_title_span {
        margin: 10px;
        margin-bottom: 50px;
    }

    .header_login {
        margin-top: 15px;
        margin-left: auto;
    }

       .header_con {
            list-style: none;
        }
    /* a태그에 텍스트 밑줄을 없애고 색상을 #333 */
        .header_a {
            text-decoration: none;
            color:#333;
        }
        
        .navbar {
   	        margin: 5px 250px 0px 250px;
        }
        
        .nav-link {
        	margin-right: 30px;
        }
        
        .dropdown:hover .dropdown-menu {
		    display: block;
		    margin-top: 0;
		}
		
		.dropdown_span {
			color: black;
			font-size: 15px;
			font-weight: bold;
		}
		
		.dropdown-item {
			font-size: 13px;
			margin: 10px 0px;
		}
		
		#reservation {
			color: red;
		}

/*  	.fixed {
        position: fixed;
        top: 0px;
        z-index: 1;
        background-color: rgba(232, 0, 8, 1);
        color: white;
        width: max;
        height: 80px;
        
      } */
      
      .layer_popup{
			position: fixed;
            text-align:center;
            right: 300px;
            bottom: 100px;
            z-index: 2;
            
            display: none;
        }
      
      #res_btn {
      	border-radius: 30px;
      	width: 130px;
      	font-size: 15px;
      	background-image: linear-gradient(to left, rgb(255, 115, 86), rgb(251, 67, 87));
      }
      #goTop_btn {
      	border: 1px;
      	border-radius: 100px;
      	width: 40px;
      	height: 40px;
      }
      .goTop_img {
      	width: 20px;
      	height: 20px;
      }
      .main_index, .main_index:hover{
      	text-decoration: none;
      	color:#333;
      }
      
      #cart_img {
      	width: 30px;
      	height: 30px;
      	margin-bottom: 3px;
      }
	
	.adreduce {
		text-align: center;
		background-color: black;
	}
	
	/*레이어 팝업 영역*/
	#popup {
	 opacity: 0;
	 display: none;
	 position: relative;
	 width: auto;
	 border: black;
	 padding: 20px;
	 background-color: black;
	}  
</style>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<!-- Bpopup -->
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bPopup/0.11.0/jquery.bpopup.js"></script>

    <script>
		function goTop(){
			$('html').scrollTop(0);
		}
	
/*       $( document ).ready( function() {
        var jbOffset = $( '.container-fluid' ).offset();
        $( window ).scroll( function() {
          if ( $( document ).scrollTop() > jbOffset.top ) {
            $( '.container-fluid' ).addClass( 'fixed' );
          }
          else {
            $( '.container-fluid' ).removeClass( 'fixed' );
          }
        });
      } ); */

      
      function searchCheck() {
/*      	alert(document.getElementById("search_con").value); */

     	if (!document.getElementById('search_con').value) {
     		alert("제목을 입력해주세요.");
		} else {
			document.search_frm.submit();
		}
      }
      
	$(function(){
		$(".hi").click(function(){ //레이어 팝업 열기 버튼 클릭 시
			$('#popup').bPopup(); //  
		});
				
	});
	
      $(document).ready(function () {
    	  
    	   //  특정 위치에서 부터 버튼 나타고, 사라지게..효과는 fade로
    	    $(window).scroll(function () {
    			if ($(this).scrollTop() > 230) {
    				$('.layer_popup').fadeIn(200);
    			} else {
    				$('.layer_popup').fadeOut(200);
    			}
    		});

    	});
      
    </script>
</head>
<body>
	<div class="header_div">
        <div>
            <div class="cgv-ad-wrap" id="cgv_main_ad">
                <div id="TopBarWrapper" class="sect-head-ad">
                    <div class="top_extend_ad_wrap">
                        <div class="adreduce" id="adReduce">                    
                           <!--  <iframe src="//ad.cgv.co.kr/NetInsight/html/CGV/CGV_201401/main@TopBar_EX" width="100%" height="80" title="" frameborder="0" scrolling="no" topmargin="0" leftmargin="0" marginwidth="0" marginheight="0" name="TopBanner" id="TopBanner"></iframe> -->
                        	<img src="https://adimg.cgv.co.kr/images/202205/Witch2/0602_980x80.jpg" class="hi">
                        </div>
                        <div id="popup">
						   <p>
						     <iframe src='https://tv.naver.com/embed/26947241?autoPlay=true' frameborder='no' scrolling='no' marginwidth='0' marginheight='0' WIDTH='544' HEIGHT='306' allow='autoplay' allowfullscreen></iframe>
						   </p>
						</div>
                        <div class="adextend" id="adExtend"></div>
                    </div>
                </div>    
            </div> 
        </div>
	    <div class="contents">
	        <h1 class="header_title">
	        	<a href="/team/" class="main_index">
		        	<img src="https://img.icons8.com/cotton/64/undefined/popcorn.png"/>
		        	<span class="header_title_span">TEAM3_CINEMA</span>
	        	</a>
	        </h1>
	             <%
				String u_id = (String)session.getAttribute("u_id");
	        
	        	if(u_id == null) {
			%>
		        <ul class="header_login">
		          <li class="header_con"><a href="login" class="header_a"><img src="https://img.cgv.co.kr/R2014/images/common/ico/loginPassword.png" alt="로그인" class="cgv_img"/><span>로그인</span></a></li>
		            <li class="header_con"><a href="register" class="header_a"><img src="https://img.cgv.co.kr/R2014/images/common/ico/loginJoin.png" alt="회원가입" class="cgv_img"/><span>회원가입</span></a></li>
		            <li class="header_con"><a href="userPage?u_id=<%=u_id%>" class="header_a"><img src="https://img.cgv.co.kr/R2014/images/common/ico/loginMember.png" alt="마이페이지" class="cgv_img"/><span>마이페이지</span></a></li>
		            <li class="header_con"><a href="#" class="header_a"><img src="https://img.cgv.co.kr/R2014/images/common/ico/loginCustomer.png" alt="고객센터" class="cgv_img"/><span>고객센터</span></a></li>
		        </ul>
	        <%
	        	} else {
	        %>
		        <ul class="header_login">
		          <li class="header_con"><a href="logOut" class="header_a"><img src="https://img.cgv.co.kr/R2014/images/common/ico/loginPassword.png" alt="로그아웃" class="cgv_img"/><span>로그아웃</span></a></li>
		            <li class="header_con"><a href="cartlist?u_id=<%=u_id%>" class="header_a"><img src="https://cdn-icons.flaticon.com/png/512/2997/premium/2997834.png?token=exp=1654572631~hmac=808157ccee560e484daf3e6b70424210" alt="장바구니" class="cgv_img" id="cart_img"/><span>장바구니</span></a></li>
		            <li class="header_con"><a href="userPage?u_id=<%=u_id%>" class="header_a"><img src="https://img.cgv.co.kr/R2014/images/common/ico/loginMember.png" alt="마이페이지" class="cgv_img"/><span>마이페이지</span></a></li>
		            <li class="header_con"><a href="#" class="header_a"><img src="https://img.cgv.co.kr/R2014/images/common/ico/loginCustomer.png" alt="고객센터" class="cgv_img"/><span>고객센터</span></a></li>
		        </ul>
		    <% 
	        	}
		    %>
	    </div>
        
        <hr id="first_line">
        
        <nav class="navbar navbar-expand-lg">
		  <div class="container-fluid">
		    <div class="collapse navbar-collapse" id="navbarSupportedContent">
		      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
		        <li class="nav-item dropdown">
		          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
		            <span class="dropdown_span">영화</span>
		          </a>
		          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
		           <li><a class="dropdown-item" href="movie_list">영화</a></li>
		            <li><a class="dropdown-item" href="movie_list">무비차트</a></li>
		          </ul>
		        </li>
		        <li class="nav-item dropdown">
		          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
		            <span class="dropdown_span" id="reservation">예매</span>
		          </a>
		          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
		            <li><a class="dropdown-item" href="reser">예매</a></li>
		          </ul>
		        </li>
		        <li class="nav-item dropdown">
		          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
		            <span class="dropdown_span">스토어</span>
		          </a>
		          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
		             <li><a class="dropdown-item" href="goodsList">영화관람권</a></li>
		            <li><a class="dropdown-item" href="goodsList">기프트카드</a></li>
		            <li><a class="dropdown-item" href="goodsList">콤보</a></li>
		            <li><a class="dropdown-item" href="goodsList">팝콘</a></li>
		            <li><a class="dropdown-item" href="goodsList">음료</a></li>
		            <li><a class="dropdown-item" href="goodsList">스낵</a></li>
		          </ul>
		        </li>
		        <li class="nav-item dropdown">
		          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
		            <span class="dropdown_span">공지사항</span>
		          </a>
		          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
		             <li><a class="dropdown-item" href="noticeList">공지사항</a></li>
		            <li><a class="dropdown-item" href="qna_main">QnA</a></li>
		            <li><a class="dropdown-item" href="faqList">FaQ</a></li>
		             <li><a class="dropdown-item" href="reviewList">reivew</a></li>
		            <!-- <li><a class="dropdown-item" href="#">영화/예매</a></li>
		            <li><a class="dropdown-item" href="#">멤버십</a></li> -->
		            
		            
		            <li><a class="dropdown-item" href="review">제휴할인</a></li>
		          </ul>
		        </li>
		        
		        <li>
		          <a href="reg_movie">
		            <span class="dropdown_span">영화등록</span>
		          </a>
		        </li>
		        &nbsp;&nbsp;&nbsp;&nbsp;
		        
		        <li>
		         <a href="addGoods">
		            <span class="dropdown_span">상품등록</span>
		          </a>
		        </li>
		        
		      </ul>
		      <form class="d-flex" role="search" method="post" action="serch_mov_main" name="search_frm">
		        <input class="form-control me-2 sm" type="search" placeholder="제목으로 검색" aria-label="Search" name="kind" id="search_con">
		        <button class="btn btn-outline-secondary btn-sm" type="button" onclick="searchCheck()">Search</button>
		      </form>
		    </div>
		  </div>
		</nav>
		
		<div class="layer_popup">
			<button type="button" class="btn btn-danger btn-lg" id="res_btn" onclick="location.href='reser' ">예매하기</button>
			<button type="button" id="goTop_btn" onclick="goTop()">
				<img src="https://img.cgv.co.kr/R2014/images/common/btn/gotoTop.png" alt="최상단으로 이동" class="goTop_img"/>
			</button>
		</div>
		
	</div>
	<hr>
</body>
</html>