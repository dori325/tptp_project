<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<link href="./css/commInsert.css" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css?family=Gamja+Flower|Nanum+Gothic+Coding&display=swap&subset=korean" rel="stylesheet">
<body>
<div id="insert">
<form action="commUpdate.do" method="POST">

<!-- 댓글 입력창 -->
	<table id="commP">
<!-- 	로그인 X -->
	<c:if test="${sessionScope.id eq null }">
		<tr>
			<td><input disabled="disabled" placeholder="로그인을 해주세요"/></td>
			<td><button disabled="disabled">댓글 쓰기</button>
			</td>
		</tr>
	</c:if>
<!-- 	로그인 O -->
	<c:if test="${sessionScope.id ne null }">
		<tr>
			<td><input name="ccontent" type="text" placeholder="댓글 입력"/></td>
			<td><button type="submit">댓글 쓰기</button>
			<input type="hidden" name="b_no" value="${param.b_no }">
			<input type="hidden" name="url" value="${pageContext.request.requestURI}">
			</td>
		</tr>
	</c:if>
	</table>
</form>
	<hr>
	
<!-- 댓글 리스트 -->
	<table id="commL">
	<c:forEach items="${commdetail }" var="c">
<!-- 	댓글 상단 -->
		<tr>
			<td id="nick">${c.l_nick }</td>
			<td id="ip">(${c.l_ip })</td>
			<td id="date">${c.c_date }</td>
			<td id="commLike"><form action="likeUp.do" method="post">
				<button type="submit" id="but"><img style="width: 28px;" alt="추천" src="./img/comm_heart.png"></button>
				<input style="width: 0px;" type="hidden" name="b_no" value="${param.b_no }">
				<input style="width: 0px;" type="hidden" name="cno" value="${c.c_no }">
				<input style="width: 0px;" type="hidden" name="likeCount" value="${c.c_like }">
				<input style="width: 0px;" type="hidden" name="url" value="${pageContext.request.requestURI}">
			</form></td>
			<c:if test="${c.c_like ne null || likeUp ne null}">
				<td id="comm" >${c.c_like }${likeUp }</td>
			</c:if>
		</tr>
<!-- 	댓글 하단 -->
		<tr>
			<td id="commContent">
			
<!-- 			댓글 수정 창 -->
<!-- 			<form action="commModi.do" method="post">  -->
			<c:if test="${sessionScope.nick eq c.l_nick}">
			<c:if test="${param.num eq c.c_no}">
			<div class="area">
				<button id="up1" onclick="location.href='detail.do?b_no=${c.b_no}'">취소</button>
				<form action="commSave.do" method="post">
				<input type="text" name="commCon" id="show" placeholder="${c.c_content }">
				<input type="hidden" name="l_nick" value="${c.l_nick }">
				<input type="hidden" name="c_no" value="${c.c_no }">
				<input type="hidden" name="b_no" value="${c.b_no }">
				<button id="up1">저장</button>
				</form>
			</div>
			</c:if>
			</c:if>
<!-- 			</form>	 -->

<!--			 댓글 보여주기 창 -->

			<c:if test="${param.num ne c.c_no}">
			<div class="hidearea">
			<input readonly="readonly" type="text" id="Con" value="${c.c_content }">
			<c:if test="${sessionScope.nick eq c.l_nick || sessionScope.auth eq 5}">
				<form action="commDelete.do" method="post">
					<input style="width: 0px;" type="hidden" name="nick" value="${c.l_nick }">
					<input style="width: 0px;" type="hidden" name="b_no" value="${param.b_no }">
					<input style="width: 0px;" type="hidden" name="c_no" value="${c.c_no }">
					<input style="width: 0px;" type="hidden" name="url" value="${pageContext.request.requestURI}">
					<button id="up">삭제</button>
				</form>
			</c:if>
			</div>
			
			<form action="modi.do" method="post">
			<c:if test="${sessionScope.nick eq c.l_nick}">
				<input style="width: 0px;" type="hidden" name="b__no" value="${param.b_no }">
				<input style="width: 0px;" type="hidden" name="c__no" value="${c.c_no }">
				<input style="width: 0px;" type="hidden" name="l_nick" value="${c.l_nick }">
				<button name="modi" id="up" type="submit">수정</button>
			</c:if>
			</form>
			
			</c:if>
			</td>
		</tr>
	</c:forEach>
	</table>
<!-- </form> -->
</div>
</body>
</html>