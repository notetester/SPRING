<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>
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
    margin-left: 400px;
   
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

<h4 class="tit">공지사항 상세</h4>

<br>	
<form action="noticeUpdate" method="post">
<div class="table-wrap mt10">
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
											<input class="form-control" name="tno" value=" ${noticeBoardVO.tno}" readonly>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="ID">ID</label> <em class="font-orange">*</em></th>
										<td colspan="3"><input type="text" name="writer" id="writer" class="input-text w150px" value="${noticeBoardVO.writer}" maxlength="15" readonly></td>
									</tr>
									
									<tr>
										<th scope="row"><label for="title">제목</label> <em class="font-orange">*</em></th>
										<td colspan="3"><input type="text" name="title" id="title" class="input-text" maxlength="100" value="${noticeBoardVO.title}" ></td>
									</tr>
									<tr>
										<th scope="row"><label for="textarea">내용</label> <em class="font-orange">*</em></th>
										<td colspan="3">
											<div class="textarea">
											<textarea style="resize: none" id="textarea" name="content" rows="10" cols="94" title="내용입력" placeholder="※ 여기는 공지사항입니다." class="input-textarea" style="margin-top: 0px; margin-bottom: 0px;" >${noticeBoardVO.content} </textarea>
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
							<button type="submit" class="button purple large">변경</button>
							<button type="button" onclick="location.href='noticeRegist'" class="button purple large">등록</button>
							<button type="button" onclick="location.href='noticeDelete?tno=${noticeBoardVO.tno}'" class="button purple large">삭제</button>
					</div>
				</div>
			</form>
		</div>
	
	
<br>
<br>
<br>
<%@ include file = "../include/footer.jsp" %>
<script>
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