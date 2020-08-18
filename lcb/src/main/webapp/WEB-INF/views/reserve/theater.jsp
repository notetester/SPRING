<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	
<style>
a{text-align: center;}

 .navbar {
      overflow: hidden;
      background-color: #333;
      font-family: Arial, Helvetica, sans-serif;
    }
    
    .navbar a {
      float: left;
      font-size: 16px;
      color: white;
      text-align: center;
      padding: 14px 16px;
      text-decoration: none;
    }
    
    .dropdown {
      float: left;
      overflow: hidden;
    }
    
    .dropdown .dropbtn {
      font-size: 16px;  
      border: none;
      outline: none;
      color: white;
      padding: 14px 16px;
      background-color: inherit;
      font: inherit;
      margin: 0;
    }
    
    .navbar a:hover, .dropdown:hover .dropbtn {
      background-color: red;
    }
    
    .dropdown-content {
      display: none;
      position: absolute;
      background-color: #f9f9f9;
      width: 100%;
      left: 0;
      box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
      z-index: 1;
    }
    
    .dropdown-content .header {
      background: red;
      padding: 16px;
      color: white;
    }
    
    .dropdown:hover .dropdown-content {
      display: block;
    }
    
.locationText {
	margin-left: 100px;
}

.reserveBtn {
	font-family: NanumBarunGothic, Dotum, '돋움', sans-serif;
	padding: 20px;
	color: #fff;
	padding: 0 30px;
	background: #503396;
	height: 46px;
	cursor: pointer;
	margin-left: 20px;
}

.reserveBtn:focus {
	outline: 1px dotted #000;
}

.reserveBtn:hover {
	background-color: #351f67;
}

.all {
	overflow: hidden;
	display: none;
}

#map {
	float: left;
}

.locationText {
	margin-left: 200px;
	float: left;
}

.theater-box {
	position: relative;
	display: block;
	width: 100%;
	min-height: 190px;
	border: 3px solid #686571;
	border-radius: 10px;
}

* {
	box-sizing: border-box;
}

.theater-box .theater-place>ul>li.on>button {
	color: #fff;
}

.theater-box .theater-place>ul>li>button {
	display: block;
	width: 100%;
	height: 48px;
	background: 0 0;
	border: none;
}

[type=button], [type=reset], [type=submit], button {
	-webkit-appearance: button;
}

button {
	cursor: pointer;
	letter-spacing: -.5px;
	font-weight: 400;
	font-family: NanumBarunGothic, Dotum, '돋움', sans-serif;
}
button, select {
	text-transform: none;
}

button, input {
	overflow: visible;
}

.theater-box .theater-place>ul>li {
	float: left;
	width: 136px;
	height: 48px;
	line-height: 48px;
	border: 1px solid #e0e0e0;
	border-width: 0 1px 1px 0;
	text-align: center;
	box-sizing: border-box;
	list-style: none;
}

.theater-box .theater-list ul li a {
	color: #444;
}

a:visited {
	color: #666;
	text-decoration: none;
	outline: 1px dotted #000;
}

a:link {
	color: #444;
	text-decoration: none;
}

a {
	background-color: transparent;
}

.theater-box .theater-list ul {
	overflow: hidden;
	width: 100%;
}

ol, ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
}

.theater-box .theater-place>ul>li.on .theater-list {
	display: block;
}

.theater-box .theater-list {
	display: none;
	position: absolute;
	left: 0;
	top: 48px;
	width: 100%;
	min-height: 85px;
	padding: 30px 0;
}

.theater-box .theater-list ul li:nth-child(2):after {
	position: absolute;
	content: '';
	left: 0;
	top: 0;
	width: 1px;
	height: 1000%;
	background: #e0e0e0;
}

a.button:active, a.button:focus, a.button:hover, a.button:visited {
	color: #503396;
}
.title{background-color: #f7f8f9;}

.button {
	display: inline-block;
	height: 36px;
	margin: 0;
	padding: 0 15px;
	text-align: center;
	line-height: 34px;
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

.button.small {
	height: 32px;
	padding: 0 12px;
	line-height: 30px;
	font-size: .9333em;
}

div {
	display: block;
}

.theater-box .user-theater {
	position: absolute;
	padding: 0 20px;
	width: 100%;
	bottom: 0;
	left: 0;
	line-height: 54px;
	border-radius: 0 0 10px 10px;
	background-color: #ecf0f4;
}

.theater-box .theater-list ul:after {
	display: block;
	clear: both;
	content: '';
}

.theater-box .theater-place {
	width: 100%;
	height: 48px;
}

.theater-box .theater-list ul li {
	position: relative;
	float: left;
	width: 25%;
	line-height: 26px;
	text-align: left;
	padding-left: 40px;
}

.theater-box .theater-place>ul>li.on {
	background: #555;
	border: 1px solid #555;
}

p {
	font-size: 20px;
}
.carousel-inner>.item>a>img{
display:inline-block;
}
.carousel-indicators li {
    display: inline-block;
    width: 10px;
    height: 10px;
    margin: 1px;
    text-indent: -999px;
    cursor: pointer;    
    background-color: #999;
    border: #999;
    border-radius: 10px;
}

.carousel-indicators .active {
    width: 12px;
    height: 12px;
    margin: 0;
    background-color: #999;
}

.theater-box{position: relative;}
#myCarousel{position: absolute; right:120px; top:50px; width: 350px}
.a3{float:none;}
.box{width:150px;}
.carousel-indicators{
	bottom: -21px
}
.container h2{
	font-size:2.0em;
	color: #503396;
}
</style>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/kakao.js"></script>


</head>
<body>

	<%@ include file="../include/header.jsp"%>
	<br>
	<br>
	<Br>
	<div class="container">
		
		<h2><strong>극장 찾기</strong></h2>
		<br>
		<div class="theater-box" style="height: 289px;">
			<div class="theater-place">
				<ul>


					<li id="a1" class="on">
						<button type="button" class="sel-city seoul">서울</button>

						<div class="theater-list">
							<ul>

								<li data-brch-no="1372"><a href="#" title="강남" id="gangnam">강남</a>


								</li>


								<li data-brch-no="1212"><a href="#" title="홍대" id="hongdae">홍대</a>


								</li>





							</ul>
						</div>
					</li>

					<li id="a2" class="">
						<button type="button" class="sel-city ilsan">경기</button>

						<div class="theater-list">
							<ul>



								<li data-brch-no="4104"><a href="#" title="일산벨라시타"
									id="bela">일산벨라시타</a></li>


							</ul>
						</div>
					</li>

				<div id = "a3">				
				<div class="box">
                <div id="myCarousel" class="carousel slide" data-ride="carousel">
                    <!-- Indicators는 숨어있는 사진 개수 -->
                    <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class="active" style="margin-right: 5px;"></li>
                        <li data-target="#myCarousel" data-slide-to="1" style="margin-left:5px; margin-right: 5px;"></li>
                        <li data-target="#myCarousel" data-slide-to="2" style="margin-left:5px;" ></li>
                    </ol>

                    <!-- Wrapper for slides는 사진 영역 -->
                    <div class="carousel-inner">
                        <div class="item active">							
                            <a>
                                <img src="${pageContext.request.contextPath}/resources/img/옴팡이.jpg" alt="사진 1" style="width:250%">
                            </a>
                        </div>

                        <div class="item">
                            <a>
                                <img src="${pageContext.request.contextPath}/resources/img/반도티켓.jpg" alt="사진 4" style="width:250%">
                            </a>
                        </div>

                        <div class="item">
                            <a>
                                <img src="${pageContext.request.contextPath}/resources/img/알라딘티켓.jpg" alt="사진 7" style="width:250%">
                            </a>
                            
                        </div>
                    </div>
                </div>      
                </div>
				</div>
				</ul>
			</div>


			<div class="user-theater"></div>
		</div>


		<br>
		<br>
		<br>
		<br>



		<div class="all" id="all">
			<div class="title">
				<h2><strong>영화관 위치</strong></h2>
			</div>
			<br>
			<br>
			<div id="map" style="width: 500px; height: 400px;"></div>
			<div class="locationText">
			<div class="title">
				<h2 id="moviename" class = "title">영화관이름</h2>
			</div>

				<p>주소 :
				<p id="location"></p>
				<br>
				<br> <br>
				<br>
				<br> <br>
				<br>
				<br> <br>
				<br>
				<button type="button" 					
					class="reserveBtn">예매하러가기</button>

			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f7b5d1ce8c93201ef71aa32d8f747151"></script>
	<script>
			
		var seoul = document.querySelector(".seoul");
		var ilsan = document.querySelector(".ilsan");
		var gangnam = document.querySelector(".gangnam");
		var hongdae = document.querySelector(".hongdae");
		var bela = document.querySelector(".bela");
		
		seoul.onclick = function(){
			
			$("#a1").addClass("on");
			$("#a2").removeClass("on");
			
		}
		
		
		
		ilsan.onclick = function(){
			
			$("#a2").addClass("on");
			$("#a1").removeClass("on");
		}
		
		 $(".theater-list").click(function(){
			if(event.target.title == '강남'){
			 $("#all").css("display","inline");
			 $(".reserveBtn").attr("onclick","onclick=location.href='${pageContext.request.contextPath}/reserve/ticketSchedule?num=10#d1'");
				$("#moviename").html("강남점");
				$("#location").html("강남역 4번출구")
				var x = 37.494593;
			    var y = 127.029584;
			    
			   
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = { 
			        center: new kakao.maps.LatLng(x, y), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };

			var map = new kakao.maps.Map(mapContainer, mapOption);

			// 마커가 표시될 위치입니다 
			var markerPosition  = new kakao.maps.LatLng(x, y); 

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
			    position: markerPosition
			});

			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);

			var iwContent = '<div style="padding:5px;">강남점! <br> <a href="https://map.kakao.com/link/to/강남점!,37.494593,127.029584" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			    iwPosition = new kakao.maps.LatLng(x, y); //인포윈도우 표시 위치입니다

			// 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
			    position : iwPosition, 
			    content : iwContent 
			});
			  
			// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
			infowindow.open(map, marker); 
			}
			else if(event.target.title == '홍대'){
				 $("#all").css("display","inline");
				 $(".reserveBtn").attr("onclick","onclick=location.href='${pageContext.request.contextPath}/reserve/ticketSchedule?num=11#f1'");
				$("#moviename").html("홍대점");
				$("#location").html("홍대입구역 4번출구")
				var x = 37.558124;
			    var y = 126.925840;
			    
			   
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = { 
			        center: new kakao.maps.LatLng(x, y), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };

			var map = new kakao.maps.Map(mapContainer, mapOption);

			// 마커가 표시될 위치입니다 
			var markerPosition  = new kakao.maps.LatLng(x, y); 

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
			    position: markerPosition
			});

			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);

			var iwContent = '<div style="padding:5px;">홍대점! <br> <a href="https://map.kakao.com/link/to/홍대점!,37.558124,126.925840" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			    iwPosition = new kakao.maps.LatLng(x, y); //인포윈도우 표시 위치입니다

			// 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
			    position : iwPosition, 
			    content : iwContent 
			});
			  
			// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
			infowindow.open(map, marker); 
			}
			
			else if(event.target.title == '일산벨라시타'){
				 $("#all").css("display","inline");
				 $(".reserveBtn").attr("onclick","onclick=location.href='${pageContext.request.contextPath}/reserve/ticketSchedule?num=12#f2'");
				$("#moviename").html("일산벨라시타점");
				$("#location").html("백석역 3번출구")
				var x = 37.642351;
			    var y = 126.792241;
			    
			   
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = { 
			        center: new kakao.maps.LatLng(x, y), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };

			var map = new kakao.maps.Map(mapContainer, mapOption);

			// 마커가 표시될 위치입니다 
			var markerPosition  = new kakao.maps.LatLng(x, y); 

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
			    position: markerPosition
			});

			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);

			var iwContent = '<div style="padding:5px;">벨라시타점! <br> <a href="https://map.kakao.com/link/to/벨라시타점!,37.642351,126.792241" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			    iwPosition = new kakao.maps.LatLng(x, y); //인포윈도우 표시 위치입니다

			// 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
			    position : iwPosition, 
			    content : iwContent 
			});
			  
			// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
			infowindow.open(map, marker); 
			}
			
			
		})	
		</script>


<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<%@ include file="../include/footer.jsp"%>
</body>


</html>