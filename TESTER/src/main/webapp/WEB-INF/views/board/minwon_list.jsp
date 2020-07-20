<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML>
<html>

<head>
	<title>연습용</title>

	<meta charset="UTF-8" />
	<meta charset="EUC-KR" />

	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/index.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/jquery-ui.min.css" />
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css"
		integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
	<script src="${pageContext.request.contextPath}/resources/js/jquery-1.12.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/style.js"></script>

</head>

<body>
	<div class="wrap">
		<div class="header"><span class="admin_id"><b style="color:#7866c9;">관리자</b>홍길동</span></div>
		<div class="warp_inner">

			<!-- left_menu end -->
			<div class="right_content">
				<div class="midiaq">
					<div class="page_title">민원센타 관리 > 민원접수 관리</div>

					<div class="search_block flfull">
						<div class="fl">

							<div>
								<span class="search_th">내용 검색</span>
								<input type="text" class="" placeholder="내용 검색">
							</div>
							<div>
								<span class="search_th">대분류</span>
								<select class="">
									<option value="전체" checked="checked">전체</option>
									<option value="F3001">무선</option>
									<option value="F3002">유선</option>
									<option value="F3003">방문</option>
									<option value="F3005">통신판매</option>
									<option value="F3007">신분증스캐너</option>
								</select>
							</div>
							<div>
								<span class="search_th">소분류</span>
								<select class="">
									<option value="전체" checked="checked">전체</option>

									<option value="F3002">대분류에 따라 선택 가능</option>

								</select>
							</div>
							<div>
								<span class="search_th">처리자 ID</span>
								<input type="text" class="" placeholder="처리자 ID">
							</div>

							<!-- 2row -->
							<div class="pdt15"></div>
							<div>
								<span class="search_th">접수일</span>
								<input type="text" class="datepicker" readonly placeholder="날짜선택" /> -
								<input type="text" class="datepicker" readonly placeholder="날짜선택" />
							</div>
							<div>
								<span class="search_th">접수시간</span>
								<select class="" name="">
									<option value="전체" checked="checked">전체</option>
									<option value="분류01">오전</option>
									<option value="분류01">오후</option>
								</select>
							</div>
							<div>
								<span class="search_th">처리상태</span>
								<select class="" name="">
									<option value="">처리완료</option>
									<option value="">보류</option>
									<option value="">전달</option>
								</select>
							</div>
						</div>

						<div class="fr">
							<div class="search_btn_area">
								<a href="#" class="normal_btn purplebtn">검색</a>
								<a href="minwon_reg.html" class="normal_btn purplebtn02">등록</a>
							</div>
						</div>
					</div>

					<div class="full_collum collum">
						<ul>
							<li class="collum_tit">
								<h2>민원접수 관리</h2>

								<select class="">
									<option value="10">10개 보기</option>
									<option value="20">20개 보기</option>
									<option value="40">40개 보기</option>
									<option value="80">80개 보기</option>
								</select>
								<span class="showtoggle minus"></span>
								<ul>
									<li>
										<table cellpadding="0" cellspacing="0" class="col_8" width="100%;">
											<tr>
												<th>표시</th>
												<th>번호</th>
												<th>대분류</th>
												<th>소분류</th>
												<th>제목</th>
												<th>접수일</th>
												<th>접수시간</th>
												<th>진행상태</th>
												<th>처리자</th>
											</tr>
										<c:forEach var="vo" items="${boardList}" varStatus="num">
											<tr>
												<td></td>
												<td>${vo.COMPNUM}</td>
												<td>${vo.SECTOR}</td>
												<td>${vo.COMPTYPE}</td>
												<td><a title="상세보기(클릭)" href="regView?bno=${vo.COMPNUM}">${vo.TITLE}</a></td>
												<td><fmt:formatDate value="${vo.REGDATE}" pattern="yyyy-MM-dd"/></td>
												<td><fmt:formatDate value="${vo.REGDATE}" pattern="hh시 mm분"/></td>
												<td>${vo.STATUS}</td>
												<td>${vo.ADNAME}</td>
											</tr>
										</c:forEach>
										</table>

										<div class="page">
											<ul>
												<c:if test="${pageVO.prev}">
												<li><a href="list?pageNum=1&amount=${pageVO.amount}"><i class="fa fa-angle-double-left" aria-hidden="true"></i></a></li>
												<li style="margin-right:5px;"><a href="list?pageNum=${pageVO.startPage-1}&amount=${pageVO.amount}"><i class="fa fa-angle-left" aria-hidden="true"></i></a></li>
												</c:if>
												<c:forEach var="num" begin="${pageVO.startPage}" end="${pageVO.endPage}">
												<li class="${num==pageVO.pageNum?'on':''}"><a href="list?pageNum=${num}&amount=${pageVO.amount}">${num}</a></li>
												</c:forEach>
												<c:if test="${pageVO.next}">
												<li style="margin-left:5px;"><a href="list?pageNum=${pageVO.endPage+1}&amount=${pageVO.amount}"><i class="fa fa-angle-right" aria-hidden="true"></i></a></li>
												<li><a href="List?pageNum=${pageVO.realEnd}&amount=${pageVO.amount}"><i class="fa fa-angle-double-right" aria-hidden="true"></i></a></li>
												</c:if>
											</ul>
										</div>
									</li>

								</ul>
							</li>

					</div>

</body>

</html>