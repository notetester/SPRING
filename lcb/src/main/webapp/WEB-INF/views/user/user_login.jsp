<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/kakao.js"></script>
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
    @import url('https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200&display=swap');
    	  
    	 
    	.kakaoBtn{
    		margin-left:460px;
    	}
    	  	
 
        *{margin: 0; padding: 0; box-sizing: border-box;}
        body{            
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: url() no-repeat center;
            background-color: rgba(0, 0,0,1.7);
            background-size: cover;
        }
        body::before{
            content: "";            
            top: 0; right: 0; bottom: 0; left: 0;
            background-color: rgba(0,0,0,.7);
        }
        .login-form{position: relative; z-index: 2;}
        .login-form h1{
            font-size: 32px; color: #fff;
            text-align: center;
            margin-bottom: 60px;
        
        }
        .int-area{width: 400px;
            position: relative;
            margin:0 auto;
        }

        .int-area:first-child{margin-top: 0;}
        
        .int-area input{
            width: 100%;
            padding: 20px 10px 10px;
            background-color: transparent;
            border: none;
            border-bottom: 1px solid #999;
            font-size: 18px; color: #fff;
            outline: none;

        }
        .int-area label{
            position: absolute; left: 10px; top: 15px;
            font-size: 18px; color: #999;
            transition: all .5s ease;
        }
        .int-area label.warning{
            color: red !important;
            animation: warning .3s ease;
            animation-iteration-count: 3;
        }
        @keyframes warning{
            0% {transform: translateX(-8px);}
            25% {transform: translateX(8px);}
            50% {transform: translateX(-8px);}
            70% {transform: translateX(8px);}
        }
        .int-area input:focus + label,
        .int-area input:valid + label{
            top:-2px;
            font-size: 13px; color: #166cea;
        }
        .btn-area{
        	margin-top: 30px;
        	text-align:center;
        	
        }
        .btn-area button{
            width: 25%; height: 50px;
            background:rgba(40,0,78);
            color: #fff;
            font-size: 20px;
            border: none;
            border-radius: 25px;
            cursor: pointer;            
        }
        .caption{
            margin-top: 20px;
            text-align: center;
        }
        .caption a{
            font-size: 15px; color: #999;
            text-decoration: none;
        }        
        .menu-a ul,.menu-a ul li{
        	list-style: none;
        }
    </style>
</head>

<body>
	<%@ include file = "../include/header.jsp" %>
	<br><br><br>
    <section class="login-form container"> 
    <br><br><br>
        <h1>LOGIN</h1>
        <form action="loginForm" method="post" style="padding:25px">
            <div class="int-area">
                <input type="text" name="MEMBERS_ID" id="MEMBERS_ID"
                
                autocomplete="off" required>
                <label for="id">USER NAME</label>
            </div>
            <div class="int-area">
                <input type="password" name="MEMBERS_PW" id="MEMBERS_PW"
                
                autocomplete="off" required>
                <label for="pw">PASSWORD</label>
            </div>
            <div class="btn-area">
                <button type="submit">LOGIN</button>
            </div>
            <div class="btn-area">
                <button type="button" onclick="location.href='user_join' ">회원가입</button>
            </div> 
             
        </form>
        
        <form action="KakaoJoin" class="kakao" method="post" style="padding:0px" name="kakaoLogin">
            <div class="int-area">
                <input type="hidden" name="Kakao_ID" id="Kakao_ID" value="" autocomplete="off" required>
              
            </div>
            <div class="int-area">
                <input type="hidden" name="Kakao_Email" id="Kakao_Email"
                
                autocomplete="off" required>
               
            </div>
            <div class="int-area">
                <input type="hidden" name="Kakao_NickName" id="Kakao_NickName"
                
                autocomplete="off" required>
               
            </div>
            <div >
               <a id="custom-login-btn" href="javascript:loginWithKakao()">
        <img class="kakaoBtn" src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg" width="222" />
    </a>
                
            </div>
            
             
        </form>
        
    </section>
	<br><br><br>
	<br><br><br>
	<br><br><br>
	<br><br><br>
	<br><br><br>
	<br><br><br>
	<%@ include file = "../include/footer.jsp" %>
    <script>
    $(document).ready(function(){
    	(function(){
    		if(history.state ===''){
    			return;
    		}
    		var msg="${msg}";
    		if(msg!=''){
    			alert(msg);
    			history.replaceState('',null,null); 
    		}
    	})();
    })
    
       let MEMBERS_ID = $('#MEMBERS_ID');
        let MEMBERS_PW = $('#MEMBERS_PW');
        let btn = $('#btn');

        $(btn).on('click', function(){
            if($(id).val() == ""){
                $(id).next('label').addClass('warning');
                setTimeout(function(){
                    $('label').removeClass('warning');
                },1500);
            }
            else if($(pw).val()== ""){
                $(id).next('label').addClass('warning');
                setTimeout(function(){
                    $('label').removeClass('warning');
                },1500);
            }
        }); 
        
        Kakao.init('315fb5a2031fae3db4efeb50b2748701');
        console.log(Kakao.isInitialized());
        function loginWithKakao() {
            Kakao.Auth.login({
                success: function (authObj) {
                    getInfo();
                },
                fail: function (err) {
                    alert(JSON.stringify(err))
                },
            })
        }
        function getInfo() {
            Kakao.API.request({
                url: '/v2/user/me',
                success: function (res) {
                    console.log(res)
                    
                    var id = res.id;
                    var email = res.kakao_account.email;
                    var name = res.kakao_account.profile.nickname;
                    var profile_img = res.kakao_account.profile.profile_image_url;
                    console.log(id, email, name, profile_img)
                    
                    document.kakaoLogin.Kakao_ID.value = id;
                    document.kakaoLogin.Kakao_Email.value = email;
                    document.kakaoLogin.Kakao_NickName.value = name;
                    document.kakaoLogin.submit();
                },
                fail: function (error) {
                    alert("사용자 요청 정보에 실패했습니다. 동의 항목을 확인하세요.");
                },
            })
        }
        Kakao.Link.createScrapButton({
            container: '#kakao-link-btn',
            requestUrl: 'https://developers.kakao.com'
        });
    </script>
</body>
</html>
