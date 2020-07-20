<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>인덱스를 만들어 보자</title>
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!--개인 디자인 추가-->
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
</head>
<body>
	<%@ include file="../include/header.jsp"%>
	<!--게시판-->
	<section>
		<div class="container-fluid">
			<div class="row">
				<!--lg에서 9그리드, xs에서 전체그리드-->
				<div class="col-lg-9 col-xs-12 board-table">
					<div class="titlebox">
						<p>자유게시판</p>
					</div>
					<hr>
					<!--form select를 가져온다 -->
					<form action="freeList">
						<div class="search-wrap">
							<span>총${pageVO.total}개</span>
							<button type="button" class="btn btn-info search-btn" onclick="submit();">검색</button>
							<input type="text" class="form-control search-input" name="searchName" value="${pageVO.cri.searchName}">
							<select class="form-control search-select" name="searchType">
								<option value="title" ${pageVO.cri.searchType eq 'title' ? 'selected' : ''}>제목</option>
								<option value="content" ${pageVO.cri.searchType eq 'content' ? 'selected' : ''}>내용</option>
								<option value="writer" ${pageVO.cri.searchType eq 'writer' ? 'selected' : ''}>작성자</option>
								<option value="titcont" ${pageVO.cri.searchType eq 'titcont' ? 'selected' : ''}>제목+내용</option>
							</select>
						</div>
						<input type="hidden" name="pageNum" id="pageNum" value="1">
						<input type="hidden" name="amount" id="amount" value="${pageVO.cri.amount}">
					</form>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>번호</th>
								<th class="board-title">제목</th>
								<th>작성자</th>
								<th>등록일</th>
								<th>수정일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="vo" items="${boardList}" varStatus="num">
								<tr>
									<td>${vo.bno}</td>
									<td><a href="freeDetail?bno=${vo.bno}">${vo.title}</a></td>
									<td>${vo.writer}</td>
									<td><fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
									<td><fmt:formatDate value="${vo.updatedate}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<!--페이지 네이션을 가져옴-->
					<form action="freeList" name="pageForm">
						<div class="text-center">
							<hr>
							<%--
		                    <ul class="pagination pagination-sm">
		                        <c:if test="${pageVO.prev}">
		                        <li><a href="freeList?pageNum=${pageVO.startPage-1}&amount=${pageVO.amount}">이전</a></li>
		                        </c:if>
		                        <c:forEach var="num" begin="${pageVO.startPage}" end="${pageVO.endPage}">
		                        <li class="${num==pageVO.pageNum?'active':''}"><a href="freeList?pageNum=${num}&amount=${pageVO.amount}">${num}</a></li>
		                        </c:forEach>
		                        <c:if test="${pageVO.next}">
		                        <li><a href="freeList?pageNum=${pageVO.endPage+1}&amount=${pageVO.amount}">다음</a></li>
		                        </c:if>
		                    </ul>
		                    --%>
							<ul class="pagination pagination-sm" id="pagination">
								<c:if test="${pageVO.prev}">
								<li><a href="freeList?pageNum=${pageVO.startPage-1}&amount=${pageVO.amount}&searchType=${pageVO.cri.searchType}&searchName=${pageVO.cri.searchName}" data-pagenum="${pageVO.startPage-1}">이전</a></li>
								</c:if>
								<c:forEach var="num" begin="${pageVO.startPage}" end="${pageVO.endPage}">
								<li class="${num==pageVO.pageNum?'active':''}"><a href="freeList?pageNum=${num}&amount=${pageVO.amount}&searchType=${pageVO.cri.searchType}&searchName=${pageVO.cri.searchName}" data-pagenum="${num}">${num}</a></li>
								</c:forEach>
								<c:if test="${pageVO.next}">
								<li><a href="freeList?pageNum=${pageVO.endPage+1}&amount=${pageVO.amount}&searchType=${pageVO.cri.searchType}&searchName=${pageVO.cri.searchName}" data-pagenum="${pageVO.endPage+1}">다음</a></li>
								</c:if>
							</ul>
							<input type="hidden" name="pageNum" id="pageNum" value="${pageVO.cri.pageNum}">
							<input type="hidden" name="amount" id="amount" value="${pageVO.cri.amount}">
							<input type="hidden" name="searchType" id="searchType" value="${pageVO.cri.searchType}">
							<input type="hidden" name="searchName" id="searchName" value="${pageVO.cri.searchName}">
							<button type="button" class="btn btn-info" onclick="location.href='freeRegist'">글쓰기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
</body>
<%@ include file="../include/footer.jsp"%>
<script type="text/javascript">
	window.onload=function(){
		console.log(history.state);
		if(history.state===''){
			return;
		}
		var msg='${msg}';
		if(msg!==''){
			alert(msg);
		}
		//(추가할데이터,페이지제목,변경할주소) - 기존 기록을 삭제하고 새로운 기록을 추가
		//이렇게 추가된 데이터를 history.state로 확인이 가능
		history.replaceState('',null,null);
		console.log(history.state);
	}
	//페이저
	/*
	1. 아래 페이지 버튼을 a태그에서 ->폼 전송으로 변경
	2. Criteria에 검색 키워드를 추가
	3. 검색 폼과, 페이지 폼이 동일한 값을 가지고 넘어가도록 hidden값을 추가
	4. sql문을 동적 쿼리로 변경, total sql문을 동적 쿼리로 변경
	5. pageVO에 검색 키워드를 지정하도록 처리
	6. 화면에서 페이지 폼과 검색 폼 select 박스 키워드 처리, input 태그 키워드 처리
	7. 페이지를 이동하거나, 검색 버튼을 클릭했을 때 검색 조건이 유지되도록 처리
	*/
	var pagination=document.getElementById("pagination");
	pagination.onclick=function(){
		event.preventDefault();
		console.log(event.target);
		console.log(event.target.dataset);
		console.log(event.target.dataset.pagenum);
		var value=event.target.dataset.pagenum;
		document.pageForm.pageNum.value=value;
		document.pageForm.submit();
	}
</script>
</html>