<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통합검색</title>
<link href="./css/board.css" rel="stylesheet" />
<link href="./css/page.css" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Gamja+Flower|Nanum+Gothic+Coding&display=swap&subset=korean" rel="stylesheet">
<style>
div {
	background: #FFF;
	padding: 5px;
	margin: 5px;
	text-decoration: none;
}

.highlight {
	background-color: yellow;
	color: red;	
}

#b_content{
    background :rgba(247, 198, 84, 0.3);    
}

#b_content p{
    color : red;
}

</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		//ID가 Content인 요소를 찾아 배경을 "red"로 변경한다. 
		$("#b_content").css("color", "red");  

		// 해당 검색어
		var sKey1 = $("#b_content");
		if (sKey1 != '') {
			// 하이라이트(여러개의 검색어라면 단순하게 여러번 사용
			//$('.sch1').highlight(sKey1);
			$('.sch1').css("color","red");
		}
		//스페이스로 구분되어 and 연산자 검색을 한 검색어의 경우
		var sKey = $("#b_content");
		var splitKey = sKey.split(" ");
		if (splitKey.length > 1) {
			for (var i = 0; i < splitKey.length; i++) {
				//$('.sch1').highlight(splitKey[i]);// 검색어 하이라이트 
				//$('.sch1').css("background","rgba(45, 158, 206, 0.3)", "color:red" );// 검색어 하이라이트 
				$('.sch1').css("color","red" );// 검색어 하이라이트 
			}
		} else {
			//$('.sch1').highlight(sKey);
			$('.sch1').css("color","red");
		}
	});
</script>
</head>
<body>

	<div id="listboard">
		<%@ include file="topmenu.jsp"%>
		<%@ include file="AllBar.jsp"%>
		<div id="listTop">
			<h2>통합검색결과..</h2>
		</div>
		<div id="TS_Board">
			<table>
				<tr>
					<th id="count">추천</th>
					<th id="sort">분류1</th>
					<th id="sort">분류2</th>
					<th id="title">제목</th>
					<th rowspan="2" id="name">작성자</th>
					<th rowspan="2" id="date">날짜</th>
				</tr>
				<tr>
					<th colspan="4">내용</th>
				</tr>

				<c:forEach items="${ts_list }" var="ts">
					<tr>
						<td id="count">${ts.b_like }</td>
						<td id="sort">
						<c:if test="${ts.b_cate1 eq 'no'}">공지</c:if>
						<c:if test="${ts.b_cate1 eq 'nw'}">뉴스</c:if>
						<c:if test="${ts.b_cate1 eq 'b1'}">모나미</c:if>
						<c:if test="${ts.b_cate1 eq 'b2'}">동아</c:if>
						<c:if test="${ts.b_cate1 eq 'b3'}">모닝글로리</c:if>						
						<c:if test="${ts.b_cate1 eq 'q'}">질문</c:if>						
						</td>
						<td id="sott">${ts.b_cate2 }</td>
						<td style="text-align: left;">
							<div id="b_content" class="sch1">
								<a href="detail.do?b_no=${ts.b_no }">${ts.b_title}</a>
							</div>
						</td>
						<td rowspan="2" id="name">${ts.l_nick }</td>
						<td rowspan="2" id="date">${ts.b_date }</td>
					</tr>
					<tr>
						<td colspan="4" style="text-align: left;">
							<div id="b_content" class="sch1">
								<c:set var="b_content" value="${ts.b_content}" />
								<c:if test="${fn:contains(b_content,'b_content')}">
								${b_content }
								</c:if>							
								<c:choose>
									<c:when test="${fn:length(ts.b_content) gt 71}">								
										<a href="detail.do?b_no=${ts.b_no }">
											${fn:substring(ts.b_content, 0, 70)}">...</a>
									</c:when>
									<c:otherwise>
											<a href="detail.do?b_no=${ts.b_no }">${ts.b_content}</a>
									</c:otherwise>
								</c:choose>								
							</div>
						</td>
					</tr>
					<c:if test="${ts_list eq null }">
						<tr id="boardTr">
							<td colspan="6">검색하신 게시물이 없습니다.</td>
						</tr>
					</c:if>
				</c:forEach>

			</table>


			<!-- 페이징 -->
			<div id="page">
				<%@include file="page.jsp"%>
				<!-- 페이지 찍기 -->
				<c:if test="${page gt 10 }">
					<button onclick="location.href='totalSearch.do?page=${page - 10 }'">이전</button>
				</c:if>
				<c:if test="${page gt 1 }">
					<button onclick="location.href='totalSearch.do?page=${page - 1 }'">
						◀</button>
				</c:if>
				<c:forEach begin="${startPage }" end="${endPage }" var="i">

					<c:if test="${i eq page }">
						<button onclick="location.href='totalSearch.do?page=${i }'">
							<b style="color: blue;">${i }</b>
						</button>
					</c:if>
					<c:if test="${i ne page }">
						<button onclick="location.href='totalSearch.do?page=${i }'">
							${i }</button>
					</c:if>

				</c:forEach>
				<c:if test="${page lt totalPage }">
					<button onclick="location.href='totalSearch.do?page=${page + 1 }'">
						▶</button>
				</c:if>
				<c:if test="${page lt totalPage - 9 }">
					<button onclick="location.href='totalSearch.do?page=${page + 10 }'">다음</button>
				</c:if>
			</div>

		</div>
	</div>
<%@ include file="bottonmenu.jsp"%>
</body>
</html>