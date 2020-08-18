<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 <script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>
  
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
<style>


 @import url('https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200&display=swap');
        
 
        *{margin: 0; padding: 0; box-sizing: border-box;}
        body{            
            justify-content: center;
            align-items: center;
            height: 100vh;
            color:#333;
            background: url() no-repeat center;
            background-color: white;
            background-size: cover;
        }
        body::before{
            content: "";            
            top: 0; right: 0; bottom: 0; left: 0;
            background-color: rgba(0,0,0,.7);
        }
        .login-form{position: relative; z-index: 2; text-align: center;}
        .login-form h1{
            font-size: 32px; color: #333;
            text-align: center;
            margin-bottom: 60px;
        
        }
        .int-area{width: 400px;
            position: relative;
            margin:0 auto;
        }

        .int-area:first-child{margin-top: 0;}
        
        .int-area input{
            padding: 20px 10px 10px;
            background-color: transparent;
            border: none;
            border-bottom: 1px solid #999;
            font-size: 18px; color: #333;
            outline: none;

        }
        .int-area label{
            position: absolute; left: 10px; top: 15px;
            font-size: 18px; color: #e61693;
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
            font-size: 15px;  color:#e61693;
            text-decoration: none;
        }        
        .menu-a ul,.menu-a ul li{
           list-style: none;
        }    
      .hide{
         display: none;
      }
      .btn-area .Btn{
         font-size: 10px;
      }
      .login-form .pyb{font-size:40px;  color: #503396;background-color: #f7f8f9}
		.kakao{display : none;}

      
</style>

</head>
<body>
   <%@ include file = "../include/header.jsp" %>
   <br><br><br>
   <input type="radio">
    <section class="login-form">
        <div class="container">    
        
        
        <form action="KakaoJoinForm" method="post" name="KakaoJoinForm" id ="KakaoJoinForm">
        <br><br><br> 
        <div class= "pybp">       
                   <h1 class="pyb">카카오 간편 회원가입</h1>
                   
                   </div>   
               <br><br>
                <div class="register int-area kakao">
                    <input type="hidden"  size="25" id="MEMBERS_ID" name="MEMBERS_ID" autocomplete="off" value="${Kakao_ID}" required readonly>
                    <label for="id">회원ID</label>
              	</div>
              	
                <div class="int-area " >                    
                    <input type="text"   name="MEMBERS_NAME" id ="MEMBERS_NAME" size="25" autocomplete="off" required >
                    <label for="name">이 름</label>
                </div>
                    <div>
                    <span id="msgName"></span><!--자바스크립트에서 추가-->
                    </div>
                <div class="int-area kakao">
                    <input type="hidden"    name="MEMBERS_NICKNAME" id="MEMBERS_NICKNAME"  size="25" autocomplete="off" value="${Kakao_NickName}" required>
                    <label for="phone">닉네임</label>
                </div>
                    <div>
                    <span id="msgNick"></span><!--자바스크립트에서 추가-->
                    </div>
                 <div class="int-area" >
                    <input type="tel"    name="MEMBERS_PHONE" id="MEMBERS_PHONE"  size="25" autocomplete="off"  required>
                    <label for="phone">핸드폰 번호</label>
                </div>
                    <div>
                    <span id="msgPhone"></span><!--자바스크립트에서 추가-->
                    </div>
                
                <div class="int-area kakao">                    
                    <input type="hidden" class = "kakao"  name="MEMBERS_EMAIL"  size="25" autocomplete="off" value="${Kakao_Email}" required>
                    <label for="email">이메일</label>
                </div>
                    <div>
                    <span id="msgEmail"></span><!--자바스크립트에서 추가-->
                    </div>
                <div class="register int-area">                                  
                        <input type="text"  name="addrZipNum" size="13" id="addrZipNum" readonly="readonly"  >
                       <label for="address">주 소</label>  
                  <span class="btn-area">
                        <button type="button" class="Btn" onclick="goPopup()">우편번호 찾기</button>
                    </span>
            </div>
              <div class="int-area">                        
                    <input type="text"  name="addrBasic"  size="25" id="addrBasic" placeholder="지번주소" readonly="readonly" onclick="goPopup()">                           
                        
                </div>
                    <div>
                    <span id="msgAddr"></span><!--자바스크립트에서 추가-->
                    </div>
                <div class="int-area">  
                    <input type="text" name="addrDetail" id ="addrDetail"  size="25" placeholder="나머지 주소" size="25"  autocomplete="off" required>
                    
                </div>    
                
                <div class="btn-area">
                   <button type="submit" id="joinBtn" >가입하기</button>
               </div>
              
        </form>
        </div>
    </section>
   <br><br><br>
   <br><br><br>
   <%@ include file = "../include/footer.jsp" %>
	<script>
	console.log("${Kakao_ID}")
	
	
	var joinBtn = document.getElementById("joinBtn");
	joinBtn.onclick = function(){
		document.KakaoJoinForm.action="KakaoJoinForm";
		 document.KakaoJoinForm.submit();
	}


	 //주소 팝업창
    function goPopup(){
    	var pop = window.open("${pageContext.request.contextPath}/resources/popup/jusoPopup.jsp" ,"pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
    	
    	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
        //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
    }


    function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
    		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
    		
    		document.getElementById("addrZipNum").value = zipNo;
    		document.getElementById("addrBasic").value = roadAddrPart1;
    		document.getElementById("addrDetail").value = addrDetail;
    		
    		/*
    		document.form.roadAddrPart1.value = roadAddrPart1; //도로명주소
    		document.form.addrDetail.value = addrDetail; //고객입력상세주소
    		document.form.zipNo.value = zipNo; //우편번호
    		document.form.admCd.value = admCd;
    		document.form.rnMgtSn.value = rnMgtSn;
    		document.form.bdMgtSn.value = bdMgtSn;
    		document.form.detBdNmList.value = detBdNmList;
    		document.form.bdNm.value = bdNm;
    		document.form.bdKdcd.value = bdKdcd;
    		document.form.siNm.value = siNm;
    		document.form.sggNm.value = sggNm;
    		document.form.emdNm.value = emdNm;
    		document.form.liNm.value = liNm;
    		document.form.rn.value = rn;
    		document.form.udrtYn.value = udrtYn;
    		document.form.buldMnnm.value = buldMnnm;
    		document.form.buldSlno.value = buldSlno;
    		document.form.mtYn.value = mtYn;
    		document.form.lnbrMnnm.value = lnbrMnnm;
    		document.form.lnbrSlno.value = lnbrSlno;
    		document.form.emdNo.value = emdNo;
    		*/
    }  
	</script>
</body>
</html>