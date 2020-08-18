<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/assets/icons/LCB_icon.png">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/kakao.js"> </script>

<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/includebootstrap.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet">



<style>
#contents {
   width: 100%;
   margin: 0;
   padding: 40px 0 0 0;
}

.event-detail {
   position: relative;
   margin: 0 0 40px 0;
   padding: 0 0 30px 0;
}

.event-detail h2.tit {
   width: 1100px;
   margin: 0 auto;
   padding: 0;
}

h2.tit {
   padding: 0 0 26px 0;
   font-size: 1.8666em;
   font-weight: 400;
   letter-spacing: -1px;
   line-height: 1.1;
   color: #222;
}

.event-detail .event-detail-date {
   overflow: hidden;
   width: 1100px;
   margin: 0 auto 30px auto;
   padding: 15px 0 25px 0;
   line-height: 1.1;
   border-bottom: 1px solid #555;
}

.event-detail .event-html {
   overflow: hidden;
   width: 1100px;
   margin: 0 auto;
   text-align: center;
}

.go-mobile {
   display: none;
   height: 97px;
   min-width: 1100px;
   text-align: center;
   font-size: 2.1333em;
   color: #fff;
   background-color: #513397;
}
</style>
</head>
<body>
<%@ include file = "../include/header.jsp" %>
    <br>
    <br>
    <br>

   <div id="contents" class="">

      <!-- event-detail -->
      <div class="event-detail">
         <h2 class="tit">함께만드는 안전한 영화관람</h2>
         <p class="event-detail-date">
            <span>기간</span> 
            <em>
               2020.06.02 ~ 2020.12.31
      
            </em>
         </p>
               <div class="share container" style="text-align: right;">
               <h4><b>공유하기 >>></b></h4><br> 
               <a id="kakao-link-btn"   href="javascript:kakaoLink()">
               <img src="${pageContext.request.contextPath}/resources/img/kakao.png"   alt="카카오톡 공유" width="30px" height="30px"></a>
                
               <a   id="kakao-story-btn" href="javascript:kakaostoryLink()">
               <img src="${pageContext.request.contextPath}/resources/img/kakaostory.png" alt="카카오스토리 공유" width="30px" height="30px"></a> 
               
               <a id="facebook-btn" href="javascript:facebookLink()">
               <img src="${pageContext.request.contextPath}/resources/img/facebook.jpg" alt="페이스북 공유" width="30px" height="30px"></a>
               
               <a id="twitter-btn" href="javascript:twitterLink()">
               <img src="${pageContext.request.contextPath}/resources/img/twitter.jpg" alt="트위터 공유" width="30px" height="30px"></a>
               
               <a class="img_url" id="URL-btn" href="javascript:URLLink()">
               <img src="${pageContext.request.contextPath}/resources/img/URL.png" alt="URL 공유" width="30px" height="30px"></a>
     		 </div>
          <div class="event-html">
					<img  src="${pageContext.request.contextPath}/resources/img/함께만드는영화.jpg" width= "1100px" height= "3522px" alt="스펀지 새창" onerror="errorImage(this)">
       				</div>




	


         <!--// iframe 아닐 때  -->
      </div>
      <!--// event-detail -->

      <!-- 댓글 이벤트 상세페이지 -->


      <!-- 빵원쿠폰플러스/빵원쿠폰/응모하기/쿠폰다운/URL링크 이벤트 상세페이지 -->
   </div>
    <br>
    <br>
    <br>
   <%@ include file = "../include/footer.jsp" %>
   
   <script>
    Kakao.init('03e93abfc5eb0def6a90ac6ee266241a');
     function kakaoLink() {
         Kakao.Link.sendDefault({
             objectType: 'feed',
             content: {
                 title: "${vo.title}",
                 description: "${vo.content}",
                 imageUrl: document.images[0].src,
                 link: {
                     mobileWebUrl: document.location.href,
                     webUrl: document.location.href,
                 },
             },
             buttons: [{
                 title: '웹으로 보기',
                 link: {
                     mobileWebUrl: document.location.href,
                     webUrl: document.location.href,
                 }
             }]
         });
     }
     function kakaostoryLink(){
         Kakao.Story.share({
             url: document.location.href,
             text: "${vo.content}",
         });
     }
     function facebookLink(){
         var sharer = "https://www.facebook.com/sharer/sharer.php?u=";
      var content_url = encodeURIComponent(document.location.href);
         window.open(sharer + content_url, 'facebook_share_dialog', 'width=626,height=436');
     }
     function twitterLink(){
         window.open("https://twitter.com/intent/tweet?text="+"${vo.content}"+"&url="+document.location.href);
     }
     function URLLink(){
         alert_content = "해당 글의 주소입니다.\nCtrl+C를 눌러 클립보드로 복사하세요.";
      temp = prompt(alert_content, document.location.href);
     }
   
   </script>
   
</body>
</html>