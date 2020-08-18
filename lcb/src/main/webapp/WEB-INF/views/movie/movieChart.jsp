<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!-- css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/reset10.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/style10.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/swiper.css">
    <link href="${pageContext.request.contextPath}/resources/css/includebootstrap.css" rel="stylesheet">

    <!-- 파비콘 -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/icons/LCB_icon.png">


    <!-- 웹 폰트 -->
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&amp;subset=korean"
        rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            list-style: none;
            text-decoration: none;


        }
          .dropdown:hover .dropdown-content {
            display: block;
          }
          
          /* Create three equal columns that floats next to each other */
          .column {
            float: left;
            width: 33.33%;
            padding: 10px;
            background-color: #ccc;
            height: 250px;
          }
          
          .column a {
            float: none;
            color: black;
            padding: 16px;
            text-decoration: none;
            display: block;
            text-align: left;
          }
          
          .column a:hover {
            background-color: #ddd;
          }
          
          /* Clear floats after the columns */
          .row:after {
            content: "";
            display: table;
            clear: both;
          }  
      
          /* Clear floats after the columns */
          .row:after {
          content: "";
          display: table;
          clear: both;
          }
      
          .carousel-inner>.item>a>img,
          .carousel-inner>.item>img,
          .img-responsive,
          .thumbnail a>img,
          .thumbnail>img {
                  display: inline;
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
          button, input, select, textarea {
              font-family: inherit;
              font-size: inherit;
              line-height: inherit;
          }
          button, html input[type=button], input[type=reset], input[type=submit] {
              -webkit-appearance: button;
              cursor: pointer;
          }
          button, select {
              text-transform: none;
          }
          button {
              overflow: visible;
          }
          button, input, optgroup, select, textarea {
              color: inherit;
              font: inherit;
              margin: 0;
          }
          input, button, select, textarea {
              font-family: inherit;
              font-size: inherit;
              line-height: inherit;
          }
          button, html input[type="button"], input[type="reset"], input[type="submit"] {
              -webkit-appearance: button;
              cursor: pointer;        
          }
          button, select {
              text-transform: none;
          }
          button {
              overflow: visible;
          }
          button, input, optgroup, select, textarea {
              margin: 0;
              font: inherit;
              color: inherit;
          }
          * {
              box-sizing: border-box;
          }
          * {
              -webkit-box-sizing: border-box;
              -moz-box-sizing: border-box;
              box-sizing: border-box;
          }
          
      
          
          .card ul {position: relative;}
          button {
              -webkit-appearance: button;        
              text-rendering: auto;
              color: -internal-light-dark-color(buttontext, rgb(170, 170, 170));
              letter-spacing: normal;
              word-spacing: normal;
              text-transform: none;
              text-indent: 0px;
              text-shadow: none;
              display: inline-block;
              text-align: center;
              align-items: flex-start;
              cursor: default;
              background-color: -internal-light-dark-color(rgb(239, 239, 239), rgb(74, 74, 74));
              box-sizing: border-box;
              margin: 0em;
              font: 400 13.3333px Arial;
              padding: 1px 6px;
              border-width: 2px;
              border-style: outset;
              border-color: -internal-light-dark-color(rgb(118, 118, 118), rgb(195, 195, 195));
              border-image: initial;
          }
          *{
              padding: 0;
              margin: 0;
               }
           @media screen and (max-width: 600px) {
              .column {
                width: 100%;
                height: auto;
              }
            }
          h3 strong{font-size:20px;}
      
          </style>

          </head>
          <body>
        <%@ include file = "../include/header.jsp" %>
    <br>
    <br>
    <br>

    <!-- //banner -->


    <section id="movie">
        <div class="container">
            <div class="row">
                <h2 class="ir_so">영화 예매</h2>
                <div class="movie">
                    <div class="movie_title">
                        <ul class="clearfix">
                            <li class="active"><a href="#">박스오피스</a></li>
                            <li><a href="#">최신개봉작</a></li>

                        </ul>
                    </div>
                    <div class="movie_chart">
                        <div class="swiper-container2">
                            <div class="chart_cont1 swiper-wrapper">
                                <div >
                                    <!--class=  "swiper-slide"기능은 묶여있음 -->
                                    <div class="poster">
                                        <figure>
                                            <img src="${pageContext.request.contextPath}/resources/assets/img/반도.jpg" srcset="assets/img/반도.jpg 2x" alt="반도">

                                        </figure>

                                        <div class="rank"><strong>1</strong></div>

                                    </div>
                                    <div class="infor">
                                        <h3><span class="icon a19 ir_pm">19세</span> <strong>반도</strong></h3>
                                        <!-- 관람 설정 icon ( 1> all: 전체관람  2> a12: 12세 3> a15: 15tp 4> a19:19세-->
                                        <div class="infor_btn">
                                            <a href="${pageContext.request.contextPath}/movie/movieDetail?mno=1">상세보기</a> <!-- 상세보기는 detail -->
                                            <a href="${pageContext.request.contextPath}/reserve/ticketSchedule">예매하기</a>
                                        </div>
                                    </div>
                                </div>
                                <div >
                                    <div class="poster">
                                        <figure>
                                            <img src="${pageContext.request.contextPath}/resources/assets/img/살아있다.jpg" srcset="assets/img/살아있다.jpg 2x" alt="살아있다">
                                        </figure>
                                        <div class="rank"><strong>2</strong></div>

                                    </div>
                                    <div class="infor">
                                        <h3><span class="icon a19 ir_pm">19세</span> <strong>살아있다</strong></h3>
                                        <div class="infor_btn">
                                            <a href="${pageContext.request.contextPath}/movie/movieDetail?mno=4">상세보기</a>
                                            <a href="${pageContext.request.contextPath}/reserve/ticketSchedule">예매하기</a>
                                        </div>
                                    </div>
                                </div>
                                <div >
                                    <div class="poster">
                                        <figure>
                                            <img src="${pageContext.request.contextPath}/resources/assets/img/밤쉘.jpg" srcset="assets/img/밤쉘.jpg 2x"
                                                alt="밤쉘: 세상을 바꾼 폭탄선언">
                                        </figure>
                                        <div class="rank"><strong>3</strong></div>

                                    </div>
                                    <div class="infor">
                                        <h3><span class="icon a19 ir_pm">19세</span> <strong>밤쉘</strong></h3>
                                        <div class="infor_btn">
                                            <a href="${pageContext.request.contextPath}/movie/movieDetail?mno=5">상세보기</a>
                                            <a href="${pageContext.request.contextPath}/reserve/ticketSchedule">예매하기</a>
                                        </div>
                                    </div>
                                </div>
                                <div >
                                    <div class="poster">
                                        <figure>
                                            <img src="${pageContext.request.contextPath}/resources/assets/img/소년시절.jpg" srcset="assets/img/소년시절.jpg 2x"
                                                alt="소년시절의 너">
                                        </figure>
                                        <div class="rank"><strong>4</strong></div>

                                    </div>
                                    <div class="infor">
                                        <h3><span class="icon a19 ir_pm">19세</span> <strong>소년시절의 너</strong></h3>
                                        <div class="infor_btn">
                                            <a href="${pageContext.request.contextPath}/movie/movieDetail?mno=7">상세보기</a>
                                            <a href="${pageContext.request.contextPath}/reserve/ticketSchedule">예매하기</a>
                                        </div>
                                    </div>
                                </div>
                                <div >
                                    <div class="poster">
                                        <figure>
                                            <img src="${pageContext.request.contextPath}/resources/assets/img/알라딘.jpg" srcset="assets/img/알라딘.jpg 2x"
                                                alt="알라딘">
                                        </figure>
                                        <div class="rank"><strong>5</strong></div>

                                    </div>
                                    <div class="infor">
                                        <h3><span class="icon all ir_pm">전체관람</span> <strong>알라딘</strong></h3>
                                        <div class="infor_btn">
                                            <a href="${pageContext.request.contextPath}/movie/movieDetail?mno=3">상세보기</a>
                                            <a href="${pageContext.request.contextPath}/reserve/ticketSchedule">예매하기</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- //chart_cont1-->

                        <div class="swiper-container2">
                            <div class="chart_cont2 swiper-wrapper">
                                <div>   <!--class=  "swiper-slide"기능은 묶여있음 -->
                                    <div class="poster">
                                        <figure>
                                            <img src="${pageContext.request.contextPath}/resources/assets/img/블루아워.jpg" srcset="블루아워.jpg 2x" alt="블루아워">
                                        </figure>
                                        <div class="rank"><strong>1</strong></div>
                                    </div>
                                    <div class="infor">
                                        <h3><span class="icon a19 ir_pm">19세</span> <strong>블루아워</strong></h3>
                                        <div class="infor_btn">
                                            <a href="${pageContext.request.contextPath}/movie/movieDetail?mno=6">상세정보</a>
                                            <a href="${pageContext.request.contextPath}/reserve/ticketSchedule">예매하기</a>
                                        </div>
                                    </div>
                                </div>

                                <div>
                                    <div class="poster">
                                        <figure>
                                            <img src="${pageContext.request.contextPath}/resources/assets/img/팬데믹.jpg" srcset="팬데믹.jpg 2x" alt="팬데믹">
                                        </figure>
                                        <div class="rank"><strong>2</strong></div>
                                    </div>
                                    <div class="infor">
                                        <h3><span class="icon a19 ir_pm">19세</span> <strong>팬데믹</strong></h3>
                                        <div class="infor_btn">
                                            <a href="${pageContext.request.contextPath}/movie/movieDetail?mno=8">상세정보</a>
                                            <a href="${pageContext.request.contextPath}/reserve/ticketSchedule">예매하기</a>
                                        </div>
                                    </div>
                                </div>
                                <div>
                                    <div class="poster">
                                        <figure>
                                            <img src="${pageContext.request.contextPath}/resources/assets/img/아디오스.jpg" srcset="아디오스.jpg 2x" alt="아디오스">
                                        </figure>
                                        <div class="rank"><strong>3</strong></div>
                                    </div>
                                    <div class="infor">
                                        <h3><span class="icon a19 ir_pm">19세</span> <strong>아디오스</strong></h3>
                                        <div class="infor_btn">
                                            <a href="${pageContext.request.contextPath}/movie/movieDetail?mno=9">상세정보</a>
                                            <a href="${pageContext.request.contextPath}/reserve/ticketSchedule">예매하기</a>
                                        </div>
                                    </div>
                                </div>
                                <div >
                                    <div class="poster">
                                        <figure>
                                            <img src="${pageContext.request.contextPath}/resources/img/온워드.jpg" srcset="반도.jpg 2x" alt="반도">
                                        </figure>
                                        <div class="rank"><strong>4</strong></div>
                                    </div>
                                    <div class="infor">
                                        <h3><span class="icon all ir_pm">전체관람</span> <strong>온워드</strong></h3>
                                        <div class="infor_btn">
                                            <a href="${pageContext.request.contextPath}/movie/movieDetail?mno=2">상세정보</a> 
                                            <a href="${pageContext.request.contextPath}/reserve/ticketSchedule">예매하기</a>
                                        </div>
                                    </div>
                                </div>
                                

                            </div>
                        </div>


                        <!-- //chart_cont4-->
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- //movie -->
    <br>
    <br>
    <br>
<%@ include file = "../include/footer.jsp" %>


    <!-- 자바스크립트 라이브러리 -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/jquery.min_1.12.4.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/modernizr-custom.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/ie-checker.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/swiper.min.js"></script>
    <script>
        //배너 이미지 슬라이드
        var swiper = new Swiper('.swiper-container', {
            pagination: {
                el: '.swiper-pagination',
            },
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
            autoplay: {
                delay: 5000,
            },
        });

        //영화차트 이미지 슬라이드
        var swiper = new Swiper('.swiper-container2', {
            slidesPerView: 4,
            spaceBetween: 24,
            mousewheel: {
                invert: true,
            },
            keyboard: {
                enabled: true,
                onlyInViewport: false,
            },
            autoplay: {
                delay: 6000,
            },
            breakpoints: {
                600: {
                    slidesPerView: 1.4,
                    spaceBetween: 24
                },
                768: {
                    slidesPerView: 2,
                    spaceBetween: 24
                },
                960: {
                    slidesPerView: 3,
                    spaceBetween: 24
                }
            }
        });

        //영화차트 탭 메뉴
        var movBtn = $(".movie_title > ul > li");
        var movCont = $(".movie_chart > div");

        movCont.hide().eq(0).show();

        movBtn.click(function (e) {
            e.preventDefault();
            var target = $(this);
            var index = target.index();
            movBtn.removeClass("active");
            target.addClass("active");
            movCont.css("display", "none");
            movCont.eq(index).css("display", "block");
        });
    </script>

    <footer>


    </footer>
</body>

</html>