<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자-회원관리</title>
<script type="text/javascript">
	function select() {
		var l_id = document.getElementById("l_id").value;
		var l_nick = document.getElementById("l_nick").value;
		var l_auth = document.getElementById("l_auth").value;
		var page = '${page}';
		location.href = "userList.do?l_id=" + l_id + "&page=" + page
				+ "&l_nick=" + l_nick + "&l_auth=" + l_auth;
	}
</script>
</head>
<link href="./css/board.css" rel="stylesheet" />
<body>

	<div id="listboard">
		<%@ include file="topmenu.jsp"%>
		<%@ include file="AllBar.jsp"%>
		<div id="listTop">
			<h2>회원관리</h2>
			<button onclick="location.href='userList.do'">전체</button>
		</div>
		<table id="admCommList">
			<tr>
				<th id="no">번호</th>
				<th id="no">count</th>
				<th id="name">아이디</th>
				<th id="name">닉네임</th>
				<th id="comment">e-mail</th>
				<th id="no">가입날짜</th>
				<th id="no">권한</th>
				<th id="no">수정</th>
			</tr>
			<c:forEach items="${u_list }" var="u">
				<tr>
					<td id="no">${u.l_count }</td>
					<td id="no">${u.l_count}</td>
					<td id="name">${u.l_id }
					<td id="name">${u.l_nick }</td>
					<td id="comment"><a href="userList.do" id="title">${u.l_email }</a></td>
					<td id="no">${u.l_date}</td>
					<td id="no">
					<select name="l_auth" id="log_do" onchange="select()">
						<c:if test="${u.l_auth eq 1}"><option value="1">탈퇴</option></c:if>
						<c:if test="${u.l_auth eq 3}"><option value="3">일반</option></c:if>
						<c:if test="${u.l_auth eq 5}"><option value="5">관리자</option></c:if>
					</select></td>
					<td id="no"><button disabled="disabled">수정</button></td>
				</tr>
			</c:forEach>
		</table>

		<!-- 페이징 -->
		<div id="page">
	<%@include file="page.jsp" %>
		<!-- 페이지 찍기 -->
		<c:if test="${page gt 10 }">
			<button onclick="location.href='userList.do?page=${page - 10 }'">이전</button>
		</c:if>
		<c:if test="${page gt 1 }">
			<button onclick="location.href='userList.do?page=${page - 1 }'"> ◀ </button>
		</c:if>
		<c:forEach begin="${startPage }" end="${endPage }" var="i">

			<c:if test="${i eq page }">
				<button onclick="location.href='userList.do?page=${i }'">
					<b style="color: blue;">${i }</b>
				</button>
			</c:if>
			<c:if test="${i ne page }">
				<button onclick="location.href='userList.do?page=${i }'">
					${i }
				</button>
			</c:if>
			
		</c:forEach>
		<c:if test="${page lt totalPage }">
			<button onclick="location.href='userList.do?page=${page + 1 }'"> ▶ </button>
		</c:if>
		<c:if test="${page lt totalPage - 9 }">
			<button onclick="location.href='userList.do?page=${page + 10 }'">다음</button>
		</c:if>
	</div>			
		
		<form action="userList.do" method="post">
			<div id="listBottom">
				<select name="searchID" id="id" onchange="select()">
					<option value="l_id">아이디</option>
					<option value="l_nick">닉네임</option>
					<option value="l_auth">권한</option>
				</select>
				<div id="search">
					<input name="searchCont" placeholder="검색어 입력">
					<button onchange="select()">
						<!--<button onclick="location.href='userListSearch.do?searchCont=' ">-->
						<!--<button onclick="location.href="userList.do?l_id="+l_id+"&page="+page+"&l_nick="+l_lick+"&l_auth="+l_auth >-->
						<img alt="검색" src="./img/search.png">
					</button>
				</div>
			</div>
		</form>

		<%@ include file="bottonmenu.jsp"%>
	</div>
</body>
</html>