<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/resources/css/includebootstrap.css" rel="stylesheet">

<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');

	body{font-family: 'Noto Sans KR', sans-serif;}

	*	{
        padding: 0;
        margin: 0;
         }
     @media screen and (max-width: 600px) {
        .column {
          width: 100%;
          height: auto;
        }
      }  
        

        .menu-a{            
            text-align: center;
            background-color: rgb(40, 0, 78) ;
            color: white;
            width: 100%;
            font-weight: 600;
            
        }
        .menu-a ul{
            
            background-color: rgba(128, 0, 128, 0.562);
        }
        .menu-a > ul {
        	
            margin-left: 190px;
            background-color: rgb(40, 0, 78) ;
            display: inline-block;
            border-radius: 5px;
            padding: 40px, 10px;
            margin:0;
            
        }
        .menu-a > ul >li {
            display: inline-block;       
        }

        .menu-a li> a {
            /* background-color: red;  */
            padding: 10px;
            display: block;
        }
        .menu-a li:hover{
            background-color: black;
            color: white;
            text-decoration: none;
        }
        .menu-a li {
            position: relative;
        
        }
        .menu-a ul ul {
            display: none;
            position: absolute;
            margin:0;
            left: 0;
        }
        .menu-a li:hover>ul {
            display: block;
        }
        .menu-a, .on {
          font-size: large;
          z-index: 1;
        }
        .on{ font-size: small;}
        .menu-b{          
          background-color: rgb(40, 0, 78) ;
          color: white;
          width: 100%;          
          font-weight: 600;          
        }
        .menu-b ul{
          float: right;
        }
        .menu-b ul li{display: inline-block;}
        .menu-a li> a {
        	color: white;
        	text-decoration:none;
        }
        .menu-b li> a {
        	color: white;
        	text-decoration:none;
        }
        img{
        	vertical-align: middle;
        }
        
</style>
</head>
<header>
<nav class="menu-b"> 
        <ul style="margin-top: 15px;">
        <c:choose>
			<c:when test="${sessionScope.MEMBERS_ID == null }">
			<li><a id="join" href="${pageContext.request.contextPath }/user/user_join"><span class="glyphicon glyphicon-user"></span>회원가입</a></li>&nbsp;&nbsp;
			<li><a id="login" href="${pageContext.request.contextPath }/user/user_login"><span class="glyphicon glyphicon-log-in"></span>로그인</a></li>&nbsp;&nbsp;
			</c:when>
			<c:otherwise>
			<li><a id="mypage" href="${pageContext.request.contextPath }/user/user_mypage"><span class="glyphicon glyphicon-user"></span>마이페이지</a></li>&nbsp;&nbsp;
			<li><a id="logout" href="${pageContext.request.contextPath }/user/user_logout"><span class="glyphicon glyphicon-log-out"></span>로그아웃</a></li>&nbsp;&nbsp;
			</c:otherwise>
			</c:choose>
        
        </ul>
</nav>

      <nav class="menu-a"> 
        <ul>
        	<li>
				<span>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;				
				</span>
        	</li>
            <li><a href="#">영화</a>
                <ul class="on">
                    <li><a href="${pageContext.request.contextPath }/movie/movieChart">무비차트</a></li>
                    <li><a href="${pageContext.request.contextPath }/movie/vote">투표하기</a></li>             
                </ul>
            </li>
            <li><a href="#">예매</a>
                <ul class="on">
                    <li><a href="${pageContext.request.contextPath }/reserve/ticketSchedule?num=0">상영시간표</a></li>             
                </ul>
            </li>
            <li><a href="#">극장</a>
                <ul class="on">
                    <li><a href="${pageContext.request.contextPath }/reserve/theater">전체극장</a></li>
                                       
                </ul>
            </li>
            <li>
            <a href="${pageContext.request.contextPath}/">
              <img src="${pageContext.request.contextPath}/resources/img/Lcb.png" width="50%" height="39px">
              </a>
            </li>
            <li><a href="#">이벤트</a>
                <ul class="on">
                    <li><a href="${pageContext.request.contextPath }/menuevent/memberShip">포인트 멤버쉽</a></li>                    
                    <li><a href="${pageContext.request.contextPath }/menuevent/events">이벤트</a></li>
                </ul>
            </li>
            <li><a href="#">스토어</a>
                <ul class="on">
                    <li><a href="${pageContext.request.contextPath }/storemenu/store">팝콘 & 스낵</a></li>                    
                </ul>
            </li> 
            <li><a href="#">쇼 예고</a>
                <ul class="on">
                    <li><a href="${pageContext.request.contextPath }/show/trailer">같이 보기</a></li>                    
                </ul>
            </li>            
        </ul>
    </nav>
    
</header>