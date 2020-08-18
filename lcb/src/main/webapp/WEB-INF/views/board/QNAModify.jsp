<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "${pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
<style>
.all{margin-left: 500px; margin-right:120px;}


body {
 
    
    line-height: 1.5;
    font-size: 15px;
    color: #444;
    font-weight: 500;
    font-family: NanumBarunGothic,Dotum,'돋움',sans-serif;
}
* {
    box-sizing: border-box;
}
.tit{
	  padding: 0 0 26px 0;
    font-size: 1.8666em;
    font-weight: 400;
    letter-spacing: -1px;
    line-height: 1.1;
    color : #503396;;
    font-weight: bold; 
    
}
.tit-content{
font-size : 1.6em;}

table {
	
    width: 70%;
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

.textarea {
	
    display: inline-block;
    width: 100%;
    height: 200px;
    padding: 10px;
    line-height: 16px;
    color: #333;
    border-radius: 0!important;
    border: 1px solid #d8d9db;
    vertical-align: middle;
    font-family: NanumBarunGothic,Dotum,'돋움',sans-serif;
}

.count {
	text-align: right;
}

.uploadBtn{
display: inline-block;
}
.table-wrap mt10{padding:0px 500px;}

.btn-group {
    padding: 20px;
    margin-left: 330px;
   
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
a.button.purple:active, a.button.purple:focus, a.button.purple:hover, a.button.purple:visited {
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
    font-family: NanumBarunGothic,Dotum,'돋움',sans-serif;
    text-decoration: none;
    border: 1px solid #503396;
    vertical-align: middle;
    background-color: #fff;
    cursor: pointer;
}
.menu-a ul li>a{
	color: #fff;
	text-decoration:none;
	font-weight: 600;
}
.menu-b ul li>a{
	color: #fff;
	text-decoration:none;
	font-weight: 600;
}

</style>
</head>
<body>
<%@ include file = "../include/header.jsp" %>

<br><br><Br>
<div class ="all">

<h4 class="tit">1:1 문의글 변경페이지</h4>

<li>1:1 문의글 답변 운영시간 09:00 ~ 21:00</li>
<br>	
<div class="table-wrap mt10">
 <form action="ModifyForm" method="post" name ="modifyForm">
						<table class="board-form va-m" >
							<colgroup>
								<col style="width:150px;">
								<col>
								<col style="width:150px;">
								<col>
							</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="place">글번호</label> <em class="font-orange">*</em></th>
										<td colspan="3">
											<input class="form-control" name="qna_number" value="${QNABoardVO.qna_number}" readonly >
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="placename">지점명</label> <em class="font-orange">*</em></th>
										<td colspan="3">
											<input class="form-control" name="qna_place" value="${QNABoardVO.qna_place}" readonly >
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="ID">ID</label> <em class="font-orange">*</em></th>
										<td colspan="3"><input type="text" name="members_id" id="members_id" class="input-text w150px" maxlength="15" value="${QNABoardVO.members_id}"  readonly></td>
									</tr>
									
									<tr>
										<th scope="row"><label for="title">제목</label> <em class="font-orange">*</em></th>
										<td colspan="3"><input type="text" name="qna_title" id="qna_title" class="input-text" maxlength="100" value="${QNABoardVO.qna_title}"></td>
									</tr>
									<tr>
										<th scope="row"><label for="textarea">내용</label> <em class="font-orange">*</em></th>
										<td colspan="3">
											<div class="textarea">
											<textarea id="qna_content" style="resize: none" name="qna_content"
                           rows="10" cols="97" title="내용입력"
                           
                           class="input-textarea">${QNABoardVO.qna_title}</textarea>
											<div class="util">
												<p class="count">
													<span id="textareaCnt">0</span> / 2000
												</p>
											</div>
										</div>
										</td>
									</tr>									
									
								</tbody>
							</table>
							<div class="btn-group pt40">
							<button type="submit" class="button purple large" id = "updateBtn">변경</button>
							<button type="button" class="button purple large" onclick="location.href='QNAList'">목록</button>
							<button type="button" class="button purple large" id = "deleteBtn">삭제</button>
					</div>
							</form>
						</div>
						
					</div>
	
	
</div>
</div>
<br>
<br>
<br>
<%@ include file = "../include/footer.jsp" %>
<script>
var updateBtn = document.getElementById("updateBtn");
updateBtn.onclick = function(){
	document.modifyForm.action="ModifyForm";
	 document.modifyForm.submit();
}


var deleteBtn = document.getElementById("deleteBtn");
deleteBtn.onclick=function(){
	//var bno = document.getElementsByName("bno")[0].value;        	
	document.modifyForm.action="QNADelete"; 
	document.modifyForm.submit();
}        
$(function() {
    $('#textarea').keyup(function (e){
        var textarea = $(this).val();
        $(this).height(((textarea.split('\n').length + 1) * 1.5) + 'em');
        $('#textareaCnt').html(textarea.length + '/300');
    });
    $('#textarea').keyup();
});


</script>
</body>
</html>