<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새소식게시판</title>
<script type="text/javascript">
	function select() {
		var b_title = document.getElementById("b_title").value;
		var b_content = document.getElementById("b_content").value;
		var page = '${page}';
		location.href = "userList.do?b_title=" + b_title + "&page=" + page
				+ "&b_content=" + b_content;
	}
	
	function check(){
		if(document.frm.searchCont.value==""){
			alert("검색어를 넣어주세요.");
			document.frm.name.focus();
			return false;
		}
	}
</script>
</head>
<link href="./css/board.css" rel="stylesheet" />
<body>

	<div id="listboard">
		<%@ include file="topmenu.jsp"%>
		<%@ include file="AllBar.jsp"%>
		<div id="listTop">
			<h2>새소식게시판</h2>
			<button onclick="location.href='news.do'">전체</button>
		</div>
		<table id="newsboard">
			<tr>
				<th id="comment">추천</th>
				<th id="sort">분류1</th>
				<th id="sort">분류1</th>
				<th id="title">제목</th>
				<th id="name">작성자</th>
				<th id="date">날짜</th>
			</tr>
			<c:forEach items="${n_list }" var="n">
				<tr id="boardTr">
					<td id="comment">${n.b_like }</td>
					<td id="sort">${n.b_cate1 }</td>
					<td id="sort">${n.b_cate2 }</td>
					<td id="title"><a href="detail.do?b_no=${i.login_name }"
						id="title">${n.b_title }</a></td>
					<td id="name">${n.l_nick }</td>
					<td id="date">${n.b_date }</td>
				</tr>
			</c:forEach>
		</table>

		<!-- 페이징 -->
		<form action="news.do" method="post">
			<div id="listBottom">
				<select name="searchID" id="id" onchange="select()" >
					<option value="b_title">제목</option>
					<option value="b_content">내용</option>
				</select>
				<div id="search">
					<input name="searchCont" placeholder="검색어 입력" onchange="return check();">
					<button onchange="select()">
						<!--<button onclick="location.href='news.do?searchCont=' ">-->
						<!-- <button onclick='"location.href="+news.do?b_title="+searchCont+"&b_content="+searchCont; "'>-->
						<img alt="검색" src="./img/search.png">
					</button>
				</div>
				<a id="writelink" href="write.do">글쓰기</a>
			</div>
		</form>

		<%@ include file="bottonmenu.jsp"%>
	</div>

</body>
</html>
