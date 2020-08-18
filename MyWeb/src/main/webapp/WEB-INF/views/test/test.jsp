<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/index.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/sockjs.min.js"></script>

</head>
<body>
	<div id="main">
        <div id="chat">
            <!-- 채팅 메시지 영역 -->
			<div id="messageArea"></div>
        </div>
        <div>
			<input type="text" id="message" placeholder="메시지를 입력해주세요." />
			<input type="button" id="sendBtn" value="전송"/>
        </div>
    </div>
</body>
<script type="text/javascript">
	var name="${sessionScope.MEMBERSID}";
	if(name==''){
		name="손님";
	}
	$("#sendBtn").click(function() {
		sendMessage();
		$('#message').val('')
	});

	let sock = new SockJS("http://118.130.22.161:8181/myweb/echo/");
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	// 메시지 전송
	function sendMessage() {
		sock.send(name+" : "+$("#message").val());
	}
	// 서버로부터 메시지를 받았을 때
	function onMessage(msg) {
		var data = msg.data;
		var cname = data.substring(0,data.indexOf(" "));
		var mclass="other";
		if(cname==name){
			mclass="me";
		}
		$("#messageArea").append("<div class='"+mclass+"'>"+data+"</div><br/>");
	}
	// 서버와 연결을 끊었을 때
	function onClose(evt) {
		$("#messageArea").append("<div class='disconnect'>연결 끊김</div>");

	}
</script>
</html>