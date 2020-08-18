<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 파비콘 -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/assets/icons/LCB_icon.png">

<!--  부트스트렙 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap"
	rel="stylesheet">
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>

<style>
* {
	box-sizing: border-box;
	margin: 0;
}

a {
	background-color: transparent;
}

a:-webkit-any-link {
	color: -webkit-link;
	cursor: pointer;
	text-decoration: underline;
}

div {
	display: block;
}

body {
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	font-size: 14px;
	line-height: 1.42857143;
	color: #333;
	background-color: #fff;
}

.contents {
	width: 100%;
	margin: 0;
	padding: 40px 0 0 0;
}

.inner-wrap {
	width: 1100px;
	margin: 0 auto;
}

.store-view {
	margin: 0 0 40px 0;
}

.modal-layer {
	overflow-y: scroll;
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: 501;
	background-color: rgba(0, 0, 0, 0);
}

.box-pulldown {
	overflow: hidden;
}

.box-pulldown+.box-pulldown {
	margin-top: 20px;
}

.store-view .sub-info {
	overflow: hidden;
}

.store-view .box-store-view {
	overflow: hidden;
	position: relative;
	margin: 10px 0 0 0;
	border-top: 1px solid #555;
	border-bottom: 1px solid #d8d9db;
}

.store-view .box-store-view .left {
	float: left;
	width: 480px;
	padding: 0 0 30px 0;
}

.store-view .box-store-view .right {
	float: left;
	width: calc(100% - 480px);
	padding: 15px 0 30px 40px;
}

.store-view .box-store-view .right {
	float: left;
	width: calc(100% - 480px);
	padding: 15px 0 30px 40px;
}

.box-pulldown .tit {
	overflow: hidden;
	border-radius: 5px;
	border: 1px solid #d8d9db;
}

.box-pulldown .tit .btn-toggle {
	display: block;
	position: relative;
	width: 100%;
	height: 39px;
	margin: 0;
	padding: 0 20px;
	border: 0;
	text-align: left;
	background-color: #fff;
}

.box-pulldown .cont {
	/*  display: none;*/
	/*display사용시 자바스크립 사용해야됨*/
	margin: 0;
	padding: 20px;
}

button {
	cursor: pointer;
	letter-spacing: -.5px;
	font-weight: 400;
	font-family: NanumBarunGothic, Dotum, '돋움', sans-serif;
}

button n {
	text-rendering: auto;
	letter-spacing: normal;
	text-indent: 0px;
	text-shadow: none;
	align-items: flex-start;
	font: 400 13.3333px Arial;
}

.box-pulldown .cont {
	/*  display: none;*/
	/*display사용시 자바스크립 사용해야됨*/
	margin: 0;
	padding: 20px;
}

.store-view p {
	margin: 0;
	padding: 0;
}

h1, h2, h3, h4, h5, h6 {
	margin: 0;
}

/* tit*/
h2.tit {
	padding: 0 0 26px 0;
	font-size: 1.8666em;
	font-weight: 400;
	letter-spacing: -1px;
	line-height: 1.1;
	color: #222;
}

.store-view .sub-info .bundle {
	float: left;
}

button, select {
	text-transform: none;
}

button, input {
	overflow: visible;
}

button, input, optgroup, select, textarea {
	font-size: 1em;
	line-height: 1.15;
}

.btn-toggle.active {
	display: flex;
}

.iconset {
	overflow: hidden;
	display: inline-block;
	margin: -1px 0 0 0;
	padding: 0;
	font-size: 0;
	line-height: 0;
	vertical-align: middle;
	background-position: 0 0;
	background-repeat: no-repeat;
}

.ico-arr-toggle-down {
	overflow: hidden;
	width: 12px;
	height: 7px;
	background-image:
		url(https://img.megabox.co.kr/static/pc/images/common/ico/ico-arr-toggle-down.png);
}

.box-pulldown .tit .btn-toggle .iconset {
	position: absolute;
	right: 20px;
	top: 50%;
	margin-top: -4px;
}

.box-pulldown.on .tit .btn-toggle {
	background-color: #f3f4f6;
}

.box-pulldown.on .cont {
	display: block;
}

button.active {
	display: flex;
}

/* 증감 버튼 기격 수량표시 기능;*/
.store-view .box-store-view .right .type .cont {
	overflow: hidden;
	display: table-cell;
	width: calc(100% - 100px);
	padding-top: 20px;
	vertical-align: top;
}

.store-view .box-store-view .right .type .receipt .line .btn {
	display: block;
	float: left;
	width: 32px;
	height: 32px;
	margin: 0;
	padding: 0;
	border: 1px solid #ccc;
	background-color: #fff;
}

.btn {
	font-weight: 400;
	text-align: center;
	white-space: nowrap;
	vertical-align: middle;
	-ms-touch-action: manipulation;
	touch-action: manipulation;
	cursor: pointer;
	background-image: none;
	border: 1px solid transparent;
	padding: 6px 12px;
	font-size: 14px;
	line-height: 1.42857143;
	border-radius: 4px;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

/*감소 */
.ico-minus {
	width: 13px;
	height: 13px;
	background-image:
		url(https://img.megabox.co.kr/static/pc/images/common/ico/ico-minus.png);
}

/*증가 */
.ico-plus {
	width: 13px;
	height: 13px;
	background-image:
		url(https://img.megabox.co.kr/static/pc/images/common/ico/ico-plus.png);
}

.store-view .box-store-view .right .type .receipt .line .input-text {
	display: block;
	float: left;
	width: 42px;
	text-align: center;
	border: 1px solid #ccc;
	border-width: 1px 0;
}

/* 수량  1표시 */
.input-text[disabled], .input-text[readonly] {
	color: #aaa;
	background-color: #f7f8f9;
}

.input-text {
	display: inline-block;
	width: 100%;
	height: 32px;
	padding: 0 10px;
	line-height: 30px;
	color: #444;
	border: 1px solid #d8d9db;
	vertical-align: middle;
	font-family: NanumBarunGothic, Dotum, '돋움', sans-serif;
}

/*가격 표시*/
.store-view .box-store-view .right .type .receipt .line .money {
	float: right;
	color: #351f66;
	line-height: 32px;
}

.store-view .box-store-view .right .type .receipt .line .money em {
	float: left;
	font-weight: 400;
	font-size: 2em;
}

.store-view .box-store-view .right .type .receipt .line .money span {
	float: left;
	margin-left: 3px;
	font-size: 1.3333em;
}

.store-view .box-store-view .right .type .tit {
	display: table-cell;
	width: 100px;
	padding-top: 20px;
	color: #222;
	vertical-align: top;
}

.store-view .box-store-view .right .type .receipt .line {
	display: table;
	table-layout: fixed;
	width: 100%;
}

/* 구매 선물 버튼 */
.store-view .box-store-view .right .btn-group {
	margin: 20px 0 0 0;
	padding: 20px 0 0 0;
	border-top: 1px solid #ebebeb;
}

.btn-group {
	padding: 20px 0 30px 0;
	text-align: center;
}

.store-view .box-store-view .right .btn-group .button {
	float: left;
	margin: 0;
}

a.button:active, a.button:focus, a.button:hover, a.button:visited {
	color: #503396;
}

.button.large {
	height: 46px;
	padding: 0 30px;
}

a.button {
	text-decoration: none;
}

a:link {
	color: #444;
}

a.button.purple:active, a.button.purple:focus, a.button.purple:hover, a.button.purple:visited
	{
	color: #fff;
}

.button.purple {
	color: #fff;
	line-height: 42px;
	border: 0;
	background: #503396;
}

.button {
	height: 36px;
	margin: 0;
	padding: 0 15px;
	text-align: center;
	line-height: 42px;
	color: #503396;
	font-weight: 400;
	border-radius: 4px;
	font-family: NanumBarunGothic, Dotum, '돋움', sans-serif;
	text-decoration: none;
	border: 1px solid #503396;
	vertical-align: middle;
	background-color: #fff;
	cursor: pointer;
}

.btn-group, .btn-group-vertical {
	position: relative;
	vertical-align: middle;
}
#a2,#a4{
	display: none;
}

</style>




</head>

<body>
	<%@ include file="../include/header.jsp"%>
	<br>
	<br>
	<br>
	<div id="contents" class="">
		<div class="inner-wrap">

			<!-- store-view -->
			<div class="store-view">
				<h2 id="tit1"></h2>
				<div class="sub-info">
					<p id="tit2"></p>
				</div>

				<!-- box-store-view -->
				<div class="box-store-view">
					<div class="left">
						<div class="img">
							<p>
								<img id="image"
									src="" >
							</p>
						</div>
						<p class="origin"><!-- 원산지 : 팝콘: 옥수수-미국산, 오징어: 몸/다리-외국산) --></p>
					</div>

					<!-- right -->
					<div class="right">
						<!-- goods-info -->
						<div class="goods-info">
							<p id="content1"></p>
						</div>
						<!--// goods-info -->

						<!--
                            판매종료일때는 각 select, button 에 disabled 처리
                        -->
						<!-- type -->
						<div class="type">
							<!-- 수량 금액 일 때 -->

							<!--// 수량 금액 일 때 -->

							<!-- 기프트카드  -->

							<div class="receipt">


								<div class="line">
									<p class="tit">
										<span class="line32"><b>수량/금액</b></span>
									</p>


									<div class="cont">
										 <button type="button" class="btn minus" id="minus" title="수량감소">
											<i class="iconset ico-minus"></i>
										</button>
										<input type="text" title="수량 입력" class="input-text"
											readonly="readonly" value="1" id="result">
										<button type="button" class="btn plus" id="plus" title="수량증가">
											<i class="iconset ico-plus"></i>
										</button>										
 
										<div class="money">
											<em id="prdtSumAmt"></em> <span>원</span>


										</div>
									</div>
									


								</div>
							</div>
						</div>
						<!--// type -->

						<div class="btn-group">
							<a href="#" id="payBtn"
								class="button purple large" w-data="500" h-data="410" title="구매">구매</a>
						</div>
					</div>
					<!--// right -->
				</div>
				<!--// box-store-view -->
			</div>
			<!--// store-view -->

			<!-- 레이어 : 극장확인 -->
			<section id="layer_chk01" class="modal-layer"></section>
			<!--// 레이어 : 극장확인 -->

			<!-- 레이어 : 지점확인 -->
			<section id="layer_chk02" class="modal-layer"></section>
			<!--// 레이어 : 지점확인 -->

			<!-- 레이어 : 취소불가 -->
			<section id="layer_chk03" class="modal-layer"></section>
			<!--// 레이어 : 지점확인 -->


			<!-- box-pulldown -->
			<div class="box-pulldown">
				<div class="tit">
					<button type="button" id="a1" class="btn-toggle">
						구매 후 취소 <i class="iconset ico-arr-toggle-down"></i>
					</button>
				</div>

				<div id="a2" class="cont">
				

				</div>
			</div>
			<!--// box-pulldown -->

			<!-- box-pulldown -->
			<div class="box-pulldown">
				<div class="tit">
					<button type="button" id="a3" class="btn-toggle">
						상품이용안내 <i class="iconset ico-arr-toggle-down"></i>
					</button>
				</div>

				<div id="a4" class="cont">

					

				</div>
			</div>
			<!--// box-pulldown -->


		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<%@ include file="../include/footer.jsp"%>

	<script>
	
	var price;
	$(document).ready(function(){
		
		$.getJSON("${pageContext.request.contextPath}/storemenu/getList/${pno}",
				function(data){  
				console.log(data)
				$("#tit1").html(data.popcorn_TITLE1);
				$("#tit2").html(data.popcorn_TITLE2);
				$("#content1").html(data.popcorn_CONTENT1);
				$("#a2").html(data.popcorn_CONTENT2);
				$("#a4").html(data.popcorn_CONTENT3);
				$("#image").attr("src",data.popcorn_IMAGE);
				$("#prdtSumAmt").html(data.popcorn_PRICE);
				price=data.popcorn_PRICE;
		})
		
		
	})
	



	
var IMP = window.IMP; // 생략가능
IMP.init('iamport'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

var payBtn= document.getElementById("payBtn");



payBtn.onclick=function(){

   
IMP.request_pay({
    pg : 'inicis', // version 1.1.0부터 지원.
    pay_method : 'card',
    merchant_uid : 'merchant_' + new Date().getTime(),
    name : '주문명: Lcb 일반영화권(어른) ',
    amount : $("#prdtSumAmt").html(),
    buyer_email : 'magadan0617@naver.com',
    buyer_name : '한건희',
    buyer_tel : '010-2616-3248',
    buyer_addr : '서울특별시 강남구 역삼동 제이슨 타워',
    buyer_postcode : '123-456',
    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
}, function(rsp) {
    if ( rsp.success ) {
        var msg = '결제가 완료되었습니다.';
        msg += '고유ID : ' + rsp.imp_uid;
        msg += '상점 거래ID : ' + rsp.merchant_uid;
        msg += '결제 금액 : ' + rsp.paid_amount;
        msg += '카드 승인번호 : ' + rsp.apply_num;
    } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
    }
    alert(msg);
});
   
}




			
			var result = document.getElementById("result"); // result 창 
			var plus = document.getElementById("plus"); 
			var minus = document.getElementById("minus");  
			plus.onclick = function(){
				
				if (result.value >= 8) {
					alert("수량이 8개 이상 할 수 없습니다. ");
					return;
				} else {
					result.value++;// 1씩 증가
					console.log(result.value);
					console.log(price);
					$("#prdtSumAmt").html(result.value * price);
				}
			} 
			
			minus.onclick=function(){ //- button일때

				if (result.value <= 1) { // 0보다 작을 경우 내려가지 않게 함
					alert("1보다 작을 수 없습니다.");
					return;
				} else {
					result.value--; // 1씩 감소
					$("#prdtSumAmt").html(result.value * price);
				}
			}
			   
			     var toggle1=true;
			      $("#a1").click(function(){
			    	if(toggle1){
			    		$("#a2").css("display","table-row")
			    		toggle1=false;
			    	}else {
			    		$("#a2").css("display","none")
			    		toggle1=true;
			    	}
			    	  
			      })
			      
			       var toggle2=true;
			      $("#a3").click(function(){
			    	if(toggle2){
			    		$("#a4").css("display","table-row")
			    		toggle2=false;
			    	}else {
			    		$("#a4").css("display","none")
			    		toggle2=true;
			    	}
			    	  
			      })
			      
			      
			   </script>

</body>

</html>