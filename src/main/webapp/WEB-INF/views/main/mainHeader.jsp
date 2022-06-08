<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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
	    font-family: 'Noto Sans KR', 'CJONLYONENEW', '���� ���', '����', Dotum, sans-serif;
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
    /* a�±׿� �ؽ�Ʈ ������ ���ְ� ������ #333 */
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

</style>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
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

    </script>
</head>
<body>
	<div class="header_div">
        <div>
            <div class="cgv-ad-wrap" id="cgv_main_ad">
                <div id="TopBarWrapper" class="sect-head-ad">
                    <div class="top_extend_ad_wrap">
                        <div class="adreduce" id="adReduce">                    
                            <iframe src="//ad.cgv.co.kr/NetInsight/html/CGV/CGV_201401/main@TopBar_EX" width="100%" height="80" title="" frameborder="0" scrolling="no" topmargin="0" leftmargin="0" marginwidth="0" marginheight="0" name="TopBanner" id="TopBanner"></iframe>
                        </div> 
                        <div class="adextend" id="adExtend"></div>
                    </div>
                </div>    
            </div> 
        </div>
	    <div class="contents">
	        <h1 class="header_title">
	        	<a href="index" class="main_index">
		        	<img src="https://img.icons8.com/cotton/64/undefined/popcorn.png"/>
		        	<span class="header_title_span">TEAM3_CINEMA</span>
	        	</a>
	        </h1>
	        <ul class="header_login">
	          <li class="header_con"><a href="login" class="header_a"><img src="https://img.cgv.co.kr/R2014/images/common/ico/loginPassword.png" alt="�α���" class="cgv_img"/><span>�α���</span></a></li>
	            <li class="header_con"><a href="register" class="header_a"><img src="https://img.cgv.co.kr/R2014/images/common/ico/loginJoin.png" alt="ȸ������" class="cgv_img"/><span>ȸ������</span></a></li>
	            <li class="header_con"><a href="userPage?u_id=wjdcksgml" class="header_a"><img src="https://img.cgv.co.kr/R2014/images/common/ico/loginMember.png" alt="����������" class="cgv_img"/><span>����������</span></a></li>
	            <li class="header_con"><a href="#" class="header_a"><img src="https://img.cgv.co.kr/R2014/images/common/ico/loginCustomer.png" alt="������" class="cgv_img"/><span>������</span></a></li>
	        </ul>
	    </div>
        
        <hr id="first_line">
        
        <nav class="navbar navbar-expand-lg">
		  <div class="container-fluid">
		    <div class="collapse navbar-collapse" id="navbarSupportedContent">
		      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
		        <li class="nav-item dropdown">
		          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
		            <span class="dropdown_span">��ȭ</span>
		          </a>
		          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
		            <li><a class="dropdown-item" href="movie_list">��ȭ</a></li>
		            <li><a class="dropdown-item" href="movie_list">������Ʈ</a></li>
		          </ul>
		        </li>
		        <li class="nav-item dropdown">
		          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
		            <span class="dropdown_span" id="reservation">����</span>
		          </a>
		          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
		            <li><a class="dropdown-item" href="reser">����</a></li> 		<!-- ���� ��ũ  -->
		          </ul>
		        </li>
		        <li class="nav-item dropdown">
		          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
		            <span class="dropdown_span">�����</span>
		          </a>
		          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
		            <li><a class="dropdown-item" href="goodsList">��ȭ������</a></li>
		            <li><a class="dropdown-item" href="goodsList">����Ʈī��</a></li>
		            <li><a class="dropdown-item" href="goodsList">�޺�</a></li>
		            <li><a class="dropdown-item" href="goodsList">����</a></li>
		            <li><a class="dropdown-item" href="goodsList">����</a></li>
		            <li><a class="dropdown-item" href="goodsList">����</a></li>
		          </ul>
		        </li>
		        <li class="nav-item dropdown">
		          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
		            <span class="dropdown_span">��������</span>
		          </a>
		          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
		            <li><a class="dropdown-item" href="notice/list">��������</a></li>
		            <li><a class="dropdown-item" href="qna_main">QnA</a></li>
		            <li><a class="dropdown-item" href="faq/list">FaQ</a></li>
		            <!-- <li><a class="dropdown-item" href="#">��ȭ/����</a></li>
		            <li><a class="dropdown-item" href="#">�����</a></li> -->
		            <li><a class="dropdown-item" href="review">��������</a></li>
		          </ul>
		        </li>
		        
		        <li>
		          <a href="reg_movie">
		            <span class="dropdown_span">��ȭ���</span>
		          </a>
		        </li>
		        &nbsp;&nbsp;&nbsp;&nbsp;
		        
		        <li>
		         <a href="addGoods">
		            <span class="dropdown_span">��ǰ���</span>
		          </a>
		        </li>
		      </ul>
		      <form class="d-flex" role="search">
		        <input class="form-control me-2 sm" type="search" placeholder="�������� �˻�" aria-label="Search">
		        <button class="btn btn-outline-secondary btn-sm" type="submit">Search</button>
		      </form>
		    </div>
		  </div>
		</nav>
		
		<div class="layer_popup">
			<button type="button" class="btn btn-danger btn-lg" id="res_btn">�����ϱ�</button>
			<button type="button" id="goTop_btn" onclick="goTop()">
				<img src="https://img.cgv.co.kr/R2014/images/common/btn/gotoTop.png" alt="�ֻ������ �̵�" class="goTop_img"/>
			</button>
		</div>
		
	</div>
	<hr>
</body>
</html>