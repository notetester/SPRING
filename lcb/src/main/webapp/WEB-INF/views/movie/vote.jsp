<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

     <!-- 부트 스트랩 디자인 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

	<!-- <script  src="https://code.jquery.com/jquery-3.5.1.js"  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="  crossorigin="anonymous"></script> -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>
    <link href="${pageContext.request.contextPath}/resources/css/includebootstrap.css" rel="stylesheet">
    
    
    <style>
       .niky-inner img{
          width:250px;
          height: 300px;
       }
       .info{
          float:left;
       }
       .price{
       	  float:right;
       }
      
       .prod-content > .price{
       	 margin-right: 13px;   
       }
       button{
          width:70px;
          color: #fff;
          background-color: rgb(40, 0, 78);
          cursor: pointer;
       }
       
       button:focus {
		   outline: 1px dotted #000;
		}
		
		button:hover {
		   background-color: #351f67;
		}
    </style>
    
</head>
<body>
    <%@ include file = "../include/header.jsp" %>

<br><br><Br>

    <section class="prod">
        <div class="container">
            <h2>다시 보고싶은 영화 리스트</h2>            
            <div class="row ">
            	<c:forEach var="vo" items="${list}">
                <div class="col-xs-12 col-md-3 col-sm-6">                
                    <div class="niky-inner">
                        <a href="${vo.vote_num}">
                            <img class="poster${vo.vote_num}" src="${pageContext.request.contextPath}/resources/img/${vo.vote_img}" alt="vote">
                        </a>
                        
                        <div class="prod-content">
                            <div class="info">
                                <span>${vo.vote_name}</span><br>
                                <span>좋아요</span>                                
                            </div>
                            <div class="price">
                                <button type="button" id="Btn${vo.vote_num}">투표하기</button>
                                <br>
                                <span id="cnt${vo.vote_num}">${vo.vote_cnt}</span>  
                            </div>
                        </div>
                    </div>
                </div>
                </c:forEach>
                
                
                
                <%-- <div class="col-xs-12 col-md-3 col-sm-6">
                    <div class="niky-inner">
                        <a href="">
                            <img src="${pageContext.request.contextPath}/resources/img/다크나이트.jpg" alt="vote">
                        </a>
                        <div class="prod-content">
                            <div class="info">
                                <span></span>
                                <span>좋아요</span>                                
                            </div>
                            <div class="price">
                                <button type="button" id="Btn2">투표하기</button>
                                <br>
                                <span></span>  
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-xs-12 col-md-3 col-sm-6">
                    <div class="niky-inner">
                        <a href="">
                            <img src="${pageContext.request.contextPath}/resources/img/도리.png" alt="vote">
                        </a>
                        <div class="prod-content">
                            <div class="info">
                                <span></span>
                                <span>좋아요</span>                                
                            </div>
                            <div class="price">
                                <button type="button" id="Btn3">투표하기</button>
                                <br>
                                <span></span>  
                            </div>
                        </div>                        
                    </div>
                </div>
                
                
                
                <div class="col-xs-12 col-md-3 col-sm-6">
                    <div class="niky-inner">
                        <a href="">
                            <img src="${pageContext.request.contextPath}/resources/img/죽은시인의 사회.jpg" alt="vote">
                        </a>
                        <div class="prod-content">
                            <div class="info">
                                <span></span>
                                <span>좋아요</span>                                
                            </div>
                            <div class="price">
                                <button type="button" id="Btn4">투표하기</button>
                                <br>
                                <span></span>  
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-xs-12 col-md-3 col-sm-6">
                    <div class="niky-inner">
                        <a href="">
                            <img src="${pageContext.request.contextPath}/resources/img/식스센스.jpg" alt="vote">
                        </a>
                        <div class="prod-content">
                            <div class="info">
                                <span></span>
                                <span>좋아요</span>                                
                            </div>
                            <div class="price">
                                <button type="button" id="Btn5">투표하기</button>
                                <br>
                                <span></span>  
                            </div>
                        </div>
                    </div>
                </div>
                
                
                
                
                <div class="col-xs-12 col-md-3 col-sm-6">
                    <div class="niky-inner">
                        <a href="">
                            <img src="${pageContext.request.contextPath}/resources/img/타이타닉.jpg" alt="vote">
                        </a>
                        <div class="prod-content">
                            <div class="info">
                                <span></span>
                                <span>좋아요</span>                                
                            </div>
                            <div class="price">
                                <button type="button" id="Btn6">투표하기</button>
                                <br>
                                <span></span>  
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-xs-12 col-md-3 col-sm-6">
                    <div class="niky-inner">
                        <a href="">
                            <img src="${pageContext.request.contextPath}/resources/img/완득이.jpg" alt="vote">
                        </a>
                        <div class="prod-content">
                            <div class="info">
                                <span></span>
                                <span>좋아요</span>                                
                            </div>
                            <div class="price">
                                <button type="button" id="Btn7">투표하기</button>
                                <br>
                                <span></span>  
                            </div>
                        </div>
                    </div>
                </div>
                
                
                
                <div class="col-xs-12 col-md-3 col-sm-6">
                    <div class="niky-inner">
                        <a href="">
                            <img src="${pageContext.request.contextPath}/resources/img/어벤져스.jpg" alt="vote">
                        </a>
                       <div class="prod-content">
                            <div class="info">
                                <span></span>
                                <span>좋아요</span>                                
                            </div>
                            <div class="price">
                                <button type="button" id="Btn8">투표하기</button>
                                <br>
                                <span></span>  
                            </div>
                        </div>        
                    </div>
                </div> --%>

                
            </div>
        </div>
    </section>

<br>
<br>
<br>
<%@ include file = "../include/footer.jsp" %>

<script>

	


   $("#Btn1").click(function(){
            
      var cnt = $(this).next().next().html();
      var num = $(this).parents([".niky-inner"]).children("a").attr("href")
	  var userId = 'kkk123';
      
      cnt++;
      
      
  		 $.getJSON("${pageContext.request.contextPath}/vote/getList/"+cnt+"/"+num,
  			function(data){        				
  				if(data==1){
  					$("#cnt1").html(cnt);
  				} else{
  					alert("투표를 끝내신 회원입니다.");
  					return;
  				} 			
  		})
  		
  		location.reload();
   })
   
	$("#Btn2").click(function(){
      
		 var cnt = $(this).next().next().html();
	      var num = $(this).parents([".niky-inner"]).children("a").attr("href")
		  var userId = 'kkk123';
	      
	      cnt++;
	      
	      
	  		 $.getJSON("${pageContext.request.contextPath}/vote/getList/"+cnt+"/"+num,
	  			function(data){        				
	  				if(data==1){
	  					$("#cnt2").html(cnt);
	  				} else{
	  					alert("투표를 끝내신 회원입니다.");
	  					return;
	  				} 			
	  		})  
	  		location.reload();
   })
   
	$("#Btn3").click(function(){
      
		 var cnt = $(this).next().next().html();
	      var num = $(this).parents([".niky-inner"]).children("a").attr("href")
		  var userId = 'kkk123';
	      
	      cnt++;
	      
	      
	  		 $.getJSON("${pageContext.request.contextPath}/vote/getList/"+cnt+"/"+num,
	  			function(data){        				
	  				if(data==1){
	  					$("#cnt3").html(cnt);
	  				} else{
	  					alert("투표를 끝내신 회원입니다.");
	  					return;
	  				} 			
	  		})  
	  		location.reload();
   })
   
	$("#Btn4").click(function(){
      
		 var cnt = $(this).next().next().html();
	      var num = $(this).parents([".niky-inner"]).children("a").attr("href")
		  var userId = 'kkk123';
	      
	      cnt++;
	      
	      
	  		 $.getJSON("${pageContext.request.contextPath}/vote/getList/"+cnt+"/"+num,
	  			function(data){        				
	  				if(data==1){
	  					$("#cnt4").html(cnt);
	  				} else{
	  					alert("투표를 끝내신 회원입니다.");
	  					return;
	  				} 			
	  		})  
	  		location.reload();
   })
   
	$("#Btn5").click(function(){
      
		 var cnt = $(this).next().next().html();
	      var num = $(this).parents([".niky-inner"]).children("a").attr("href")
		  var userId = 'kkk123';
	      
	      cnt++;
	      
	      
	  		 $.getJSON("${pageContext.request.contextPath}/vote/getList/"+cnt+"/"+num,
	  			function(data){        				
	  				if(data==1){
	  					$("#cnt5").html(cnt);
	  				} else{
	  					alert("투표를 끝내신 회원입니다.");
	  					return;
	  				} 			
	  		})  
	  		location.reload();
   })
   
	$("#Btn6").click(function(){
      
		 var cnt = $(this).next().next().html();
	      var num = $(this).parents([".niky-inner"]).children("a").attr("href")
		  var userId = 'kkk123';
	      
	      cnt++;
	      
	      
	  		 $.getJSON("${pageContext.request.contextPath}/vote/getList/"+cnt+"/"+num,
	  			function(data){        				
	  				if(data==1){
	  					$("#cnt6").html(cnt);
	  				} else{
	  					alert("투표를 끝내신 회원입니다.");
	  					return;
	  				} 			
	  		})  
	  		location.reload();
   })
   
	$("#Btn7").click(function(){
      
		 var cnt = $(this).next().next().html();
	      var num = $(this).parents([".niky-inner"]).children("a").attr("href")
		  var userId = 'kkk123';
	      
	      cnt++;
	      
	      
	  		 $.getJSON("${pageContext.request.contextPath}/vote/getList/"+cnt+"/"+num,
	  			function(data){        				
	  				if(data==1){
	  					$("#cnt7").html(cnt);
	  				} else{
	  					alert("투표를 끝내신 회원입니다.");
	  					return;
	  				} 			
	  		})  
	  		location.reload();
   })
   
	$("#Btn8").click(function(){
      
		 var cnt = $(this).next().next().html();
	      var num = $(this).parents([".niky-inner"]).children("a").attr("href")
		  var userId = 'kkk123';
	      
	      cnt++;
	      
	      
	  		 $.getJSON("${pageContext.request.contextPath}/vote/getList/"+cnt+"/"+num,
	  			function(data){        				
	  				if(data==1){
	  					$("#cnt8").html(cnt);
	  				} else{
	  					alert("투표를 끝내신 회원입니다.");
	  					return;
	  				} 			
	  		})  
	  		location.reload();
   })
</script>

</body>
</html>