<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<style>
body {
	line-height: 1.5;
	font-size: 15px;
	color: #444;
	font-weight: 400;
	font-family: NanumBarunGothic, Dotum, '돋움', sans-serif;
}

* {
	box-sizing: border-box;
}

.all {
	margin-left: 500px;
	margin-right: 120px;
}

h2.tit {
	padding: 0 0 26px 0;
	font-size: 1.8666em;
	font-weight: 400;
	letter-spacing: -1px;
	line-height: 1.1;
	color: #503396;;
	font-weight: bold;
}

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

th {
	padding: 10px 20px;
	border: 1px solid #eaeaea;
	background-color: #f7f8f9;
}

td {
	padding: 10px 20px;
	border: 1px solid #eaeaea;
}

tr {
	padding: 10px 20px;
	border: 1px solid #eaeaea;
}

.table-wrap mt10 {
	padding: 0px 500px;
}

.btn-group {
	padding: 20px;
	margin-left: 900px;
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

.count {
	text-align: right;
}
</style>
</head>
<body>
	<%@ include file="../include/header.jsp"%>
	<br>
	<br>
	<Br>
	<form action="noticeRegistForm" method="post">
	<div class="all">
		<h2 class="tit">공지사항 등록</h2>
		
		<br>
		
		<div class="table-wrap mt10">
		  	
			<table class="board-form va-m">
				<colgroup>
					<col style="width: 150px;">
					<col>
					<col style="width: 150px;">
					<col>
				</colgroup>
				<tbody>					
					<tr>
						<th scope="row"><label for="name">아이디</label> <em
							class="font-orange">*</em></th>
						<td colspan="3"><input type="text"  name="userId" id="userId"
							class="input-text w150px" readonly value="${sessionScope.MEMBERS_ID }" maxlength="15"></td>
					</tr>
					<tr>
						<th scope="row"><label for="title">제목</label> <em
							class="font-orange">*</em></th>
						<td colspan="3"><input type="text" name="title"
							id="title" class="input-text" maxlength="100"></td>
					</tr>
					<tr>
						<th scope="row"><label for="textarea">내용</label> <em
							class="font-orange">*</em></th>
						<td colspan="3">
							<div class="textarea">
								<textarea id="content" style="resize: none" name="content"
									rows="10" cols="98" title="내용입력"								
	
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
			
		</div>
	</div>
	<div class="btn-group pt40">
		<button type="submit" class="button purple large">등록</button>
	</div>
</form>
	<br>
	<br>
	<br>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>