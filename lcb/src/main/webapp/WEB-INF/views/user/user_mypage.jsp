<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="${pageContext.request.contextPath}/resources/js/kakao.js"></script>
    <style>
        * {
    box-sizing: border-box;
}
        p {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}

h2{text-align: center;}

.my-magabox-info .top .grade{
	float:left;
}
.my-magabox-info .top .grade .link {
    padding: 15px 0 0 0;
}

.my-magabox-info .top .grade .name {
    font-size: 1.8666em;
    line-height: 1.3;
    color: #222;
}
.my-magabox-info .top .grade .link a {
    margin-right: 10px;
    color: #666;
}
.my-magabox-info .bottom .coupon .list ul li span {
    display: block;
    float: left;
}
.my-magabox-info .top {
    position: relative;
    height: 198px;
    padding: 30px 30px 0 0;
    float:left;
}
.my-magabox-info .bottom {
	float:right;
    overflow: hidden;
    height: 205px;
    padding: 26px 30px 29px 30px;
    background-color: #eaebed;
    margin: -2px 0px 0px 51px;
}
.my-magabox-info .bottom .coupon {
    float: left;
    width: 206px;
    height: 100%;
    padding: 0 0 20px 0px;
    /* border-left: 1px solid #d8d9db; */
}
.ico-arr-right-gray {
    overflow: hidden;
    width: 10px;
    height: 22px;
    background-image: url(https://img.megabox.co.kr/static/pc/images/common/ico/ico-arr-right-gray.png);
}
.iconset {
    overflow: hidden;
    display: inline-block;
    margin: 0px 0 0 0;
    padding: 0;
    font-size: 0;
    line-height: 0;
    vertical-align: middle;
    background-position: 0 0;
    background-repeat: no-repeat;
}
.my-magabox-info .bottom .coupon .list ul li {
    overflow: hidden;
    padding: 9px 0 0 0;
    line-height: 1.1;
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
div {
    display: block;
}
.my-magabox-info {
    overflow: hidden;
    height: 205px;
    border-radius: 10px;
    background-color: #f3f4f6;
    width: 45%;
    text-align: center;
    margin: 0 auto;
    border: 1px solid #d8d9db;
    border-radius: 10px;
  
}
.my-magabox-info .top {
    position: relative;
    height: 700px;
    padding: 0px 0px 0 0;
    text-align: center;
}
.my-magabox-info .top .photo {
    float: left;
    width: 200px;
    padding: 20px 0 0 60px;
}
.kakao{ text-align: center;}

    </style>
</head>
<body>
<%@ include file = "../include/header.jsp" %>
    <br><br><br>
			<h2>마이페이지</h2>
			<br><br><br>
    <div class="my-magabox-info ">
        <div class="top">
            <div class="photo" id="myPhoto">
                <div class="wrap">
                    <form name="fileForm" style="display: none;">
                        <input type="file" name="file">
                        <input type="hidden" name="fileMbNo" value="10216371">
                    </form>
                    
                    <i class="iconset ico-add-photo"></i>
                    
                    <button type="button" class="img">
                        <img src="${pageContext.request.contextPath}/resources/img/bg-photo.png" alt="배담호" onerror="noImg(this, 'human')">
                    </button>
                </div>
            </div>
            
            <div class="grade">
                <p class="name"> ${sessionScope.MEMBERS_ID} 님은<br>${UserVO.MEMBERS_GRADE }등급입니다.</p>
                
                <div class="link">
                    <a href="${pageContext.request.contextPath }/user/user_update">개인정보수정 <i class="iconset ico-arr-right-reverse"></i></a>
                    
                    
                </div>
            </div>
       </div>
            
            <!-- 바텀 -->
        <div class="bottom">
            <div class="point" id="myPoint">
               
            
            <!-- coupon -->
            <div class="coupon" id="myCoupon">
                <div class="tit-area">
                    <p class="tit">소지 쿠폰</p>       
                   
                </div>
                
                <div class="list">
                    <ul>
                        <li>
                            <span>할인쿠폰</span>
                            <em>${UserVO.ticket } 매</em>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
     </div>
   </div>
   <br><br><br>
   <br><br><br>
   <br><br><br>
   <div class="kakao">
	
	<a id="send-to-btn" href="#" onclick="sendTo()">
        <img  class ="kakao-img"src="//k.kakaocdn.net/14/dn/btqc6xrxbuT/7VJk7YSWITkz9K9pbXEffk/o.jpg"/>
    </a>
    </div>
    <br><br><br>
    <%@ include file = "../include/footer.jsp" %>
   <script>
   Kakao.init('87287a13aec2bc16fb653b8361200129');
   function sendTo() {
         Kakao.Auth.login({
             scope: 'PROFILE,TALK_MESSAGE',
             success: function (response) {
                 Kakao.API.request({
               	  url: '/v2/api/talk/memo/default/send',
               	  data: {
               	    template_object: {
               	      object_type: 'feed',
               	      content: {
               	        title: '날씨정보',
               	        description: '티켓: 1장',
               	        
               	        image_url: 'https://img.megabox.co.kr/SharedImg/store/2020/07/09/o9qHmEvE7s13Ha2Q9hUhGgZFyZej5JjN_280.jpg'
               	          ,
               	        link: {
               	          web_url: 'http://dev.kakao.com',
               	          mobile_web_url: 'http://dev.kakao.com',
               	        },
               	      },
               	      social: {
               	        like_count: 100,
               	        comment_count: 200,
               	      },
               	      button_title: '바로 확인',
               	    }, 
                     },
                     success: function(res) {                   	  
                   	  alert('success: ' + JSON.stringify(res))
                     },
                     fail: function(err) {
                       alert('error: ' + JSON.stringify(err))
                     },
                   })
                 
             },
             fail: function (err) {
                 alert('failed to login: ' + JSON.stringify(err))
             },
         })
     }   
   </script>
    </body>
    </html>
    