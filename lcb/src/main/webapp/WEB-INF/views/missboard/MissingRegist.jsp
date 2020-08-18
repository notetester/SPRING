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
    font-weight: 400;
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



</style>
</head>
<body>
<%@ include file = "../include/header.jsp" %>
<br><br><Br>
<div class ="all">

<h4 class="tit">분실물 문의</h4>

<li>1:1 문의글 답변 운영시간 09:00 ~ 21:00</li>
<br>   
<div class="table-wrap mt10">
                <form action ="MissingRegist" method = "POST" name="MissingRegistForm">
                  <table class="board-form va-m" >
                     <colgroup>
                        <col style="width:150px;">
                        <col>
                        <col style="width:150px;">
                        <col>
                     </colgroup>
                        <tbody>
                           <tr>
                              <th scope="row"><label for="place">문의지점</label> <em class="font-orange">*</em></th>
                              <td colspan="3">
                                 
                                 <select id=theater02 title="극장선택" class="small ml07"name = "found_place">
                                    
                                 <option value="극장선택" selected >극장선택</option><option value="강남">강남</option><option value="홍대">홍대</option><option value="일산">일산</option>
                                 
                                 </select>
                              </td>
                           </tr>
                           <tr>
                              <th scope="row"><label for="ID">ID</label> <em class="font-orange">*</em></th>
                              <td colspan="3"><input type="text" name="members_id" id="members_id" class="input-text w150px" readonly value="${sessionScope.MEMBERS_ID }" maxlength="15"></td>
                           </tr>
                           <tr>
                              <th scope="row"><label for="hpNum1">연락처</label> <em class="font-orange">*</em></th>
                              <td>
                                 
                                     
                                    
                                       <input type="text" name="found_hpnum1" id="found_hpnum1" size="3" class="input-text w60px numType" maxlength="3" title="핸드폰번호 첫자리 입력">
                                       <span>-</span>
                                       <input type="text" name="found_hpnum2" id="found_hpnum2"size="4" class="input-text w60px numType" maxlength="4" title="핸드폰번호 중간자리 입력">
                                       <span>-</span>
                                       <input type="text" name="found_hpnum3" id="found_hpnum3"size="4" class="input-text w60px numType" maxlength="4" title="핸드폰번호 마지막자리 입력">
                                    
                                 
                              </td>
                              <th scope="row"><label for="email">이메일</label> <em class="font-orange">*</em></th>
                              <td><input type="text" name="found_email" id="found_email" class="input-text" value="" autocomplete="new-password" maxlength="50"></td>
                           </tr>
                           <tr>
                              <th scope="row"><label for="title">제목</label> <em class="font-orange">*</em></th>
                              <td colspan="3"><input type="text" name="found_title" id="found_title" class="input-text" maxlength="100"></td>
                           </tr>
                           <tr>
                              <th scope="row"><label for="textarea">내용</label> <em class="font-orange">*</em></th>
                              <td colspan="3">
                                 <div class="textarea">
                                 <textarea id="content" style="resize: none" name="found_content"
                           rows="10" cols="95" title="내용입력"
                           placeholder="※ 분실장소와 분실물에 대한 상세 정보를 작성해주시면 분실물을 찾는데 도움이 됩니다.
   - 관람 영화정보(영화제목, 상영 회차, 상영시간 등) :
   - 극장/좌석/장소 정보 :
   - 분실물 상세정보"
                           class="input-textarea"></textarea>
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
                  <button type="button" class="button purple large" id ="MissingregistBtn">등록</button>
               </div>
                     </form>
                  </div>
                  
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

var MissingregistBtn = document.getElementById("MissingregistBtn");

MissingregistBtn.onclick=function(){
	
	
	if($("#theater02 option:selected").val() === '극장선택'){
		alert("극장을 선택해주세여");
		return;

	}
	else if(document.MissingRegistForm.found_hpnum1.value ===''){
		alert("번호를 적어주세요");
		return;
	}else if(document.MissingRegistForm.found_hpnum2.value ===''){
		alert("번호를 적어주세요");
		return;
	}else if(document.MissingRegistForm.found_hpnum3.value ===''){
		alert("번호를 적어주세요");
		return;
	}else if(document.MissingRegistForm.found_email.value === ''){
			alert("이메일을 적어주세요");
	}else if(document.MissingRegistForm.found_title.value === ''){
			alert("제목을 적어주세요");		
	}else if(document.MissingRegistForm.found_content.value === ''){
			alert("내용을 적어주세요");
	}else{
		document.MissingRegistForm.submit();
	
	}
	
}




</script>
</body>
</html>