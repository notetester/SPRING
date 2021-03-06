<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "${pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
<link href="${pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet">
<style>
.all {
	margin-left: 200px;
	margin-right: 200px
}

.select {

	text-align: center;
}

h2.tit {
	padding: 0 0 26px 0;
	font-size: 1.8666em;
	font-weight: 300;
	letter-spacing: -1px;
	line-height: 1.1;
	color: #503396;;
	font-weight: bold;
	margin-left: 220px;
}

.searchkey {
	height: 50px;
	line-height: 40px;
	padding: 0 10px;
	border-radius: 4px;
	-webkit-border-radius: 4px;
	-moz-border-radius: 4px;
	-ms-border-radius: 4px;
	-o-border-radius: 4px;
	background-color: #fff;
	font-size: 14px;
	box-sizing: border-box;
	border: 1px solid #DDD;
}

.select {
	margin-left: 230px;
	margin-right: 230px;
	position: relative;
	border: 1px solid #DDDDDD;
	border-radius: 4px;
	background: #F8F8F8;
	padding: 20px 60px;
	-webkit-border-radius: 4px;
	-moz-border-radius: 4px;
	-ms-border-radius: 4px;
	-o-border-radius: 4px;
	font-size: 0;
}

input {
	color: -internal-light-dark(black, white);
	text-transform: none;
	text-indent: 0px;
	text-shadow: none;
	display: inline-block;
	text-align: start;
	appearance: textfield;
	background-color: -internal-light-dark(rgb(255, 255, 255),
		rgb(59, 59, 59));
	-webkit-rtl-ordering: logical;
	cursor: text;
	margin: 0em;
	font: 400 13.3333px Arial;
	padding: 1px 2px;
	border-width: 2px;
	border-style: inset;
	border-color: -internal-light-dark(rgb(118, 118, 118),
		rgb(195, 195, 195));
	border-image: initial;
}

.btn_col2 {
	display: inline-block;
	box-sizing: border-box;
	border-radius: 4px;
	border: 1px solid #414141;
	font-size: 14px;
	color: #ffffff !important;
	text-align: center;
	vertical-align: middle;
	background-color: #414141;
	width: 86px;
	height: 50px;
	line-height: 34px;
	vertical-align: middle;
	margin-left: 20px;
	margin-bottom: 9px;
}


table {
	padding-left: 400px;
	padding-right:132px;
	
    width: 69.5%;
    margin: 0;
    border: 0;
    table-layout: fixed;
    border-collapse: collapse;
    empty-cells: show;
    display: table;
    border-collapse: separate;
    box-sizing: border-box;
    border-spacing: 2px;
    -webkit-border-horizontal-spacing: 2px;
    -webkit-border-vertical-spacing: 2px;
    border-color: grey;
  	border-collapse: collapse;
  	margin-left: 230px;
  	
}


th{
	padding: 10px 20px;
	border:1px solid #eaeaea;
	background-color: #f7f8f9;
}

td{
	padding: 10px 20px;
	border:1px solid #eaeaea;
}
tr{	
	padding: 10px 20px;
	border:1px solid #eaeaea;
}
.button.purple {
	color: #fff;
	line-height: 36px;
	border: 0;
	background: #503396;
}

.button.large {
	height: 46px;
	padding: 0 30px;
	line-height: 44px;
}

a.button.purple:active, a.button.purple:focus, a.button.purple:hover, a.button.purple:visited
	{
	color: #fff;
}

.button.purple:hover {
	background-color: #351f67;
}

a.button:focus {
	outline: 1px dotted #000;
}

.button.purple {
	color: #fff;
	line-height: 36px;
	border: 0;
	background: #503396;
}

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


.text-center{text-align:center;}
   #page li a{
      border: 1px solid #503396;
   }
   #page li{
      display:inline-block;
   }   
.pt40{
text-align:right;
margin-right: 230px;
}
</style>
</head>

<body>
	   <%@ include file = "../include/header.jsp" %>
	   <Br><Br><Br>
	<div class="all">
	<Br><Br><Br>
		<h2 class="tit">1:1 문의 게시판</h2>
		<br>
		<br>
		<form action="QNAList" name="searchForm" method="post">
		<div class="select" width="80%">
			<input type="text" class="searchkey" placeholder="제목을 입력해주세요."
				id="searchKeyword" name="searchKey" style="width: 800px;">
			<button type="submit" class="btn_col2">검색</button>
		</div>
		</form>
		<table class="tbl_list text_c" summary="분실물 검색내용에 대한 표입니다">
			<br><br>
			<colgroup>
				<col style="width: 10%;">
				<col style="width: 15%;">
				<col style="width: auto;">
				<col style="width: 15%;">
			</colgroup>
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">작성자</th>
					<th scope="col">제목</th>
					<th scope="col">등록일</th>
				</tr>
			</thead>
			<tbody>
			
				
				<c:forEach var="vo" items="${QNABoardList}" >
	         	<tr>
	                <td>${vo.qna_number}</td>
	                <td>${vo.members_id}</td>
	                <td><a href="QNADetail?bno=${vo.qna_number}&MEMBERS_ID=${vo.members_id}">${vo.qna_title}</a></td>
	                <td><fmt:formatDate value="${vo.qna_regdate}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
	            </tr>
                </c:forEach>
                            
			
			</tbody>
		</table>
		
		<form action="QNAList" name="pageForm" method="post">
                    <div class="text-center">
                    <br><br>
                    <ul class="pagination pagination-sm" id="page">
                              <!-- 2. 이전버튼 활성화 여부 -->
                        <c:if test="${pageVO.prev }">
                           <li><a href="${pageVO.startPage-1}" data-pagenum="${pageVO.startPage-1}">이전</a></li>
                        </c:if>   
                              <!-- 1. 페이지 번호처리 -->
                        <c:forEach var="num" begin="${pageVO.startPage }" end="${pageVO.endPage }">
                           <li class="${num == pageVO.pageNum ? 'active' : '' }"><a href="${num}" data-pagenum="${num}">${num }</a></li>
                        </c:forEach>
                              <!-- 3. 다음버튼 활성화 여부 -->
                        <c:if test="${pageVO.next }">
                           <li><a href="${pageVO.endPage+1}" data-pagenum="${pageVO.endPage+1}">다음</a></li>
                        </c:if>
                    </ul>
                    
                    <!-- 페이징 클릭시 숨겨서 보낼 값 -->
                    <input type="hidden" name="pageNum" value="${cri.pageNum}">
                    <input type="hidden" name="amount" value="${cri.amount}">
                    <input type="hidden" name="searchKey" value="${cri.searchKey}">
                    <div class="btn-group pt40">
                  <button type="button" onclick="location.href='QNA'" class="button purple large" >문의글 쓰기</button>
               </div>

               
               </div>
               

                    </div>
          </form>
		
	
			
		   
	</div>
	<br><br><br><br><br>
	<%@ include file = "../include/footer.jsp" %>
</body>
<script>
$(document).ready(function(){
	(function(){
		var msg="${msg}";
		if(msg!=''){
			alert(msg);
		}
	})();
})
var page = document.getElementById("page");
page.onclick = function(){
    event.preventDefault();                   
    
    var pageNum = event.target.dataset.pagenum;          
    document.pageForm.pageNum.value = pageNum;          
    document.pageForm.submit();
}


</script>
</html>