<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta http-equiv="Expires" content="-1" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="No-Cache" />
    <meta http-equiv="imagetoolbar" content="no" />
    <meta name="viewport" content="width=1024" />
    
    <link rel="alternate" href="http://m.cgv.co.kr" />
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/webfont.css" />
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/reset.css" />
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/layout.css" />
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/module.css?20211209" />
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/content.css" />
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/common.css" />
    
    <link rel="stylesheet" media="print" type="text/css" href="https://img.cgv.co.kr/R2014/css/print.css" />    
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

    <!--[if lte IE 9]><script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.placeholder.js"></script><![endif]-->
    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.dotdotdot.min.js"></script>
    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/silverlight_link.js"></script>
	<script src="https://img.cgv.co.kr/R2014/js/slick/slick.js" type="text/javascript" charset="utf-8"></script>


    
     <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/common/jquery.bxslider.min.js"></script>



<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<%-- 0527 결제 API 아임포트 CDN - 근지 --%>
 <!-- jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- iamport.payment.js -->
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js" type="text/javascript"></script>
 <script>
	
 	$(function(){
		 $("#title").css("color","blue");   
 	});
	
 	// 직접결제시 실행됨
 	$(function(){
	     $(".buyBtn").on("click",function(){
	    	 if(confirm('구매하시겠습니까?')){
	    		
	    		var total_price = $('#g_price').val() * $('#c_amount').val();
	    		 
	    		
	    		var IMP = window.IMP;
	   		  	IMP.init('imp87572617');
	   		  	//결제시 전달되는 정보
	   			IMP.request_pay({
	   					    pg : 'inicis', 
	   					    pay_method : 'card',
	   					    merchant_uid : 'merchant_' + new Date().getTime(),
	   					    name : '주문명:team3'/*상품명*/,
	   					    amount : total_price /*상품 가격*/, 
	   					    buyer_email : 'iamport@siot.do'/*구매자 이메일*/,
	   					    buyer_name : '구매자이름',
	   					    buyer_tel : '010-1234-5678'/*구매자 연락처*/,
	   					    buyer_addr : '서울특별시 강남구 삼성동'/*구매자 주소*/,
	   					    buyer_postcode : '123-456'/*구매자 우편번호*/
	   					}, function(rsp) {
	   						var result = '';
	   					    if ( rsp.success ) {
	   					    	alert('결제성공');
	   					    	
	   					    	// 결제성공시 컨트롤러로 보내져서 history table에 추가됨
				 		    	var c_amount = $('#c_amount').val();
					    		document.goods_frm.submit();
	   					    } else {
	   					    	alert('결제실패');
	   					    }
	   					});
	    		 
	   	 	 }
    	});
 	});
	     
 	$(function(){
	     $(".cartBtn").on("click",function(){
	    	 var c_amount = $('#c_amount').val();
	    	 var g_name = $('#g_name').val();
	    	 if(c_amount==0){
	    		 alert("상품 수량을 선택해주세요.");
	    		 goods_frm.c_amount.focus();
	    	 }
	    	 else if(confirm('장바구니추가??')){
	    		// location.href="cartProcess?g_code="+${goods.g_code};
	    		alert("g_price"+${goods.g_price})
	    		 location.href="cartProcess?g_code="+${goods.g_code}+"&g_name="+g_name+"&g_price="+${goods.g_price}+"&c_amount="+c_amount+"&u_id=wjdcksgml";
	   	 	 }
    	});
 	});
   </script>
</head>
<body>
<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/giftstore/giftstore.js"></script>
<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/giftstore/commonstore.js"></script>

<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/giftstore/giftstore.css" />


	<%--  <h1 id="title">제목</h1>
	 <input type="button" value="버튼" id="btn2" class="btn2">
	 
	<a href="cartProcess?g_code=1">장바구니</a>
	<table border="1">
			<tr>
				<td>상품이름</td>
				<td>${goods.g_name}</td>
			</tr>
			<tr>
				<td>상품가격</td>
				<td>${goods.g_price}</td>
			</tr>
		<form method="post" action="buy" name="goods_frm">
			<input type="hidden" name="u_id" value="wjdcksgml">	0527 임시로 id 설정하여 같이 보냄 - 근지
			<input type="hidden" name="g_code" value="${goods.g_code}">
			<input type="hidden" name="g_name" value="${goods.g_name}">
			<input type="hidden" name="g_price" value="${goods.g_price}" id="g_price">
			<tr>
				<td>수량</td>
				<td>
					<select name="c_amount" id="c_amount">
							<option value="0" selected>수량을 선택하세요.</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>
					<input type="button" value="바로구매" id="buyBtn" class="buyBtn">
					<input type="button" value="장바구니" id="cartBtn" class="cartBtn">
				</td>
			</tr>
		
		</form>
	</table> --%>
	
	<div class='category_wrap'>
 <div class='category_contents_wrap'>
     <ul class='category_content'>
		<li id='cm1' name='categorymenu' class=''><a href='#' onclick="javascript:fnCategoryData('1');">팝콘</a></li>
		<li id='cm2' name='categorymenu' class=''><a href='#' onclick="javascript:fnCategoryData('2');">음료</a></li>
		<li id='cm3' name='categorymenu' class=''><a href='#' onclick="javascript:fnCategoryData('3');">스낵</a></li>
	</ul>
     <ul class='cart_content'>
         <li><a href='#' onclick='javascript:app.goLogin();return false;'>장바구니</a><span id='cartviewcnt'>0</span></li>     </ul>
 </div>
</div>

    <!-- E 카테고리 메뉴 & 받은선물/장바구니 -->
    
	<!-- 상품정보 -->
	<form method="post" action="buy" name="goods_frm">
			<input type="hidden" name="u_id" value="wjdcksgml">	<%-- 0527 임시로 id 설정하여 같이 보냄 - 근지 --%>
			<input type="hidden" name="g_code" value="${goods.g_code}">
			<input type="hidden" id="g_name" name="g_name" value="${goods.g_name}">
			<input type="hidden" name="g_price" value="${goods.g_price}" id="g_price">
			
		    <div class='category_product_detail_wrap'>   
		    	<strong class='category_product_detail_title'>${goods.g_name}</strong>   
		    <div class='category_product_detail_contents'>         
		   			<div class='category_product_detail_contents_img_wrap'>
		                 <ul class='bxslider'>
		              <li><img src='http://img.cgv.co.kr/GiftStore/Product/Pc/Detail/15463252014310.jpg' alt='#'></li>                 </ul>
		           	</div>           
		           	
		           	<div class='category_product_detail_contents_wrap'>               
		           	<p class='category_product_detail_sale_price_wrap'>    
		           		<span class="store_deatail_sale_price" id="spnSalePrice">${goods.g_price}</span>               
		           	</p>               
		           	
		           	<dl class='category_product_detail_add_info'>                   
			           	<dt>상품구성</dt>                   
			           	<dd>${goods.g_name}</dd>                  
			           	<dt>유효기간</dt>                  
			           	<dd>구매일로부터 6개월 이내</dd> 
			           	<dt>수량</dt>
						<dd>
							<select name="c_amount" id="c_amount">
									<option value="0" selected>수량을 선택하세요.</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
							</select>
						</dd>   
			           	
			            <div class='category_product_detail_price_wrap'>                   
			           <div class='com_form_number'>                     
			            
			            
						
		           <span class='com_total_price' id='spantotalprice'>?</span>               	
		           </div>               	
		           <div class='category_product_detail_total_price'>               		
		           <p class='com_form_total_price'>총 구매금액<span class='com_total_price0 com_product_total_price'>4,500</span></p>               	
		           </div>                
		           </div>               
				           <div align="right" class='category_product_detail_btn_wrap'> 
					           <a href='#'  id="cartBtn" class='btn_cart cartBtn'>장바구니</a>       
					           
					           <!-- <input type="button" value="장바구니" id="cartBtn" class="cartBtn">  -->       
					           <a href='#'class="buyBtn" >구매하기</a>              
		            		</div>           
		            	</div>       
		            </div>         
		           <p class='category_product_detail_txtbox'>${goods.g_name}</p>         
		           <dl class='category_product_detail_dlist'>         	
		           <dt>이용안내</dt>         	
		           <dd><strong>• 극장 사정에 따라 일부 메뉴 제공이 어려울 수 있습니다.</strong><br />
		• 해당 기프트콘은 오프라인 매점에서 실제 상품으로 교환할 수 있는 온라인 상품권입니다.<br />
		• <strong>구매 후 전송받으신 기프트콘은,</strong><br />
		사용가능한 TEAM3_CINEMA의 매점에서 지정된 해당 상품으로만 교환이 가능합니다.<br />
		(사용가능 TEAM3_CINEMA는 '상품교환'에서 확인 가능하며, 추가 상품을 포함하여 구매 시 지점에 따라 사용이 불가 할 수 있으니 발송되는 기프트콘의 정보를 확인해주시기 바랍니다.)<br />
		해당 상품 내에서 팝콘 맛 혹은 사이즈 변경 시 추가 비용 발생합니다.<br />
		교환 완료한 상품의 환불 및 반품은 불가합니다.<br />
		• <strong>유효기간 연장을 신청하는 경우,</strong><br />
		유효기간은 발급일로부터 5년 이내 횟수 제한 없이 기간 연장 가능하며, 1회 연장 시 3개월(92일) 단위로 유효기간이 연장됩니다.  <br />
		단, 이벤트 경품 및 프로모션 상품의 경우 유효기간 연장이 불가할 수 있습니다.<br />
		유효기간 만료 이후에는 결제금액의 90% 환불이 가능합니다.  <br />
		(모바일App,웹 > MY > 매점적립 or 홈페이지> My TEAM3_CINEMA > 매점이용 포인트 적립)<br />
		• 상기 이미지는 실제와 다를 수 있습니다.</dd>         	<dt>취소/환불</dt>         	<dd>• 구매자는 최초 유효기간 이내에 결제금액의 100%에 대해 결제취소/환불이 가능하며, 최초 유효기간 만료 후에는 수신자가 결제금액의 90%에 대해 환불 요청 가능합니다.<br />
		• 단, 이미 사용된 기프트콘에 대해서는 결제취소/환불 신청이 불가합니다. <br />
		<strong>• 결제취소/환불 방법</strong><br />
		결제취소는 모바일App,웹 > MY > 결제내역조회 > 스토어 or 홈페이지 > My TEAM3_CINEMA > 스토어 > 결제내역의 해당 주문 상세내역에서 가능합니다.<br />
		(기프트콘은 구매일로부터 60일 이내 결제취소 가능하며, 카드 결제취소 가능 기간이 경과하였을 경우, 고객센터로 연락주시면 됩니다)<br />
		환불은 모바일App,웹 > MY > 기프트콘 or 홈페이지 > My TEAM3_CINEMA > 스토어 > 내 기프트콘에서 환불을 원하는 기프트콘 등록 후 진행 가능하며, 비회원의 경우 고객센터로 신청 가능합니다.<br />
		단 이 때, 본인 확인 및 계좌 확인 절차가 진행됩니다.<br />
		• 수신자는 선물받은 기프트콘의 수신거절을 요청할 수 있으며, 이 경우 구매자에게 취소 및 환불에 대한 안내가 이루어집니다. <br />
		• 결제취소 가능 기간이 경과한 후 수신자가 수신거절을 요청할 경우 구매자에게 기프트콘이 재발송됩니다.<br />
		• TEAM3_CINEMA고객센터 1544-1122</dd>        <dt>미성년자 권리보호 안내</dt>        <dd>미성년자인 고객께서 계약을 체결하시는 경우 법정대리인이 그 계약에 동의하지 아니하면 미성년자 본인 또는 법정대리인이 그 계약을 취소할 수 있습니다.</dd>        <dt>분쟁 해결</dt>        <dd>1) 회사는 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해의 보상 등에 관한 처리를 위하여</br> &nbsp;&nbsp;TEAM3_CINEMA고객센터(1544-1122)를 설치 운영하고 있습니다.        </br>2) 회사는 고객센터를 통하여 이용자로부터 제출되는 불만사항 및 의견을 처리합니다. </br> &nbsp;&nbsp;다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 즉시 통보합니다.        </br>3) 전자상거래 분쟁(청약철회등)과 관련한 이용자의 피해구제는 이용약관 및 전자상거래법 등 관련 법령에 따릅니다.</dd>         
		</dl>     
		</div>
	
		    <!-- 추가상품 -->
	</form>
   
	
</body>
</html>