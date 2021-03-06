<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자-회원관리</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
    //검색
	function select() {
		var l_id = document.getElementById("l_id").value;
		var l_nick = document.getElementById("l_nick").value;		
		var l_auth = document.getElementById("l_auth").value;		
		var page = '${page}';
		location.href = "userList.do?l_id=" + l_id + "&page=" + page
				+ "&l_nick=" + l_nick + "&l_auth=" + l_auth;
	}
    
	 //권한변경
	function levelUpdate(l_no) {
		alert("l_no => : " + l_no)		
		var l_no = $('#l_no').val();
		var l_auth = $('#l_auth').val();
		var url = $('#u__rl').val();		
		//alert("여기 들어옴 : "+l_no);

	 	$.ajax({
	 		type : 'GET',
	 		data : { "l_auth": l_auth, "l_no": l_no },
	 		dataType : 'text',
	 		url : 'levelUpdate.do',
	 		success : function(rData,textStatus, xhr){
	 			var check = rData;
	 			if(check == 0){
					alert("요청하신 회원의 권한 변경가능합니다. 진행하시겠습니까?" + check);
					$('#l_auth').prop('disabled', true);
					$('#checkIt').prop('disabled', false);
	 			} else if(check != 0){
	 			}
	 		},
	 		error : function(xhr,status,e){
	 			alert("에러가 발생했습니다.");
	 		}
	 	});
		//alert("마지막 성공!");
		return false;
	}    

</script>
</head>
<link href="./css/board.css" rel="stylesheet" />
<link href="./css/page.css" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Gamja+Flower|Nanum+Gothic+Coding&display=swap&subset=korean" rel="stylesheet">
<body>
	<div id="Tlistboard">
		<%@ include file="topmenu.jsp"%>
		<%@ include file="AllBar.jsp"%>
		<div id="listTop">
			<h2>회원관리</h2>
			<button onclick="location.href='userList.do'">전체</button>
		</div>
 	    
		
			<table id="admCommList">
				<c:if test="${sessionScope.id ne null }">
					<tr>
						<th id="no">번호</th>
						<th id="no" style="text-align: center;">count</th>
						<th id="name" style="text-align: left;">아이디</th>
						<th id="name" style="text-align: left;">닉네임</th>
						<th id="comment" style="text-align: left;">e-mail</th>
						<th id="no">가입날짜</th>
						<th id="no" style="text-align: left;">권한</th>
						<th id="no">변경</th>
					</tr>

					<c:choose>
						<c:when test="${u_list ne null }">
							<c:forEach items="${u_list }" var="u">
								<tr>
									<td id="no">${u.l_no }</td>
									<td id="no" style="text-align: center;">${u.l_count}</td>
									<td id="name" style="text-align: left;">${u.l_id }</td>
									<td id="name" style="text-align: left;">${u.l_nick}</td>
									<td id="comment" style="text-align: left;">${u.l_email }</td>
									<td id="no">${u.l_date}</td>
									<td id="no" style="text-align: left;">
										<c:if test="${u.l_auth eq 3}">일반</c:if>
										<c:if test="${u.l_auth eq 5}">관리자</c:if>
										<c:if test="${u.l_auth eq 1}">탈퇴</c:if>
										</td>
								<td id="no"><form action="levelUpdate.do" method="post">								
										<input type="hidden" name="l_no" value="${u.l_no }"> 
											<select name="l_auth" id="log_do" onchange="return levelUpdate()">
											<option value="3">일반</option>
											<option value="5">관리자</option>
											<option value="1">탈퇴</option>
										</select>
									<button type="submit" id="checkIt" disabled="disabled">변경</button>
									</form>
									</td>
							</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<c:if test="${ul_search eq null }">
								<tr id="boardTr">
									<td colspan="8">출력할 게시물이 없습니다.</td>
								</tr>
							</c:if>
						</c:otherwise>
					</c:choose>

					<c:forEach items="${ul_search }" var="ul">
						<tr>
							<td id="no">${ul.l_no }</td>
							<td id="no" style="text-align: center;">${ul.l_count}</td>
							<td id="name" style="text-align: left;">${ul.l_id }</td>
							<td id="name" style="text-align: left;">${ul.l_nick}</td>
							<td id="comment" style="text-align: left;">${ul.l_email }</td>
							<td id="no">${u.l_date}</td>
							<td id="no" style="text-align: left;">
										<c:if test="${u.l_auth eq 3}">일반</c:if>
										<c:if test="${u.l_auth eq 5}">관리자</c:if>
										<c:if test="${u.l_auth eq 1}">탈퇴</c:if>
										</td>
								<td id="no"><form action="levelUpdate.do" method="post">								
										<input style="width: 0px;" type="hidden" name="l_no"
											value="${u.l_no }"> 
											<select name="l_auth" id="log_do" onchange="return levelUpdate()">
											<option value="3" selected>일반</option>
											<option value="5" selected>관리자</option>
											<option value="1" selected>탈퇴</option>
										</select>
									<button type="submit" id="checkIt">변경</button>
									</form>
									</td>
						</tr>
					</c:forEach>
					
				</c:if>
			</table>

		<!-- 페이징 -->
		<div id="page">
			<c:if test="${u_list ne null}">
				<%@include file="page.jsp"%>
				<!-- 페이지 찍기 -->
				<div id="pagepre">
					<c:if test="${page gt 10 }">
						<div id="pre10"
							onclick="location.href='userList.do?page=${page - 10 }'">◀</div>
					</c:if>
					<c:if test="${page gt 1 }">
						<div id="pre"
							onclick="location.href='userList.do?page=${page - 1 }'">◁</div>
					</c:if>
				</div>
				<div id="pagenum">
					<c:forEach begin="${startPage }" end="${endPage }" var="i">
						<c:if test="${i eq page }">
							<div id="curpage"
								onclick="location.href='userList.do?page=${i }'">${i }</div>
						</c:if>
						<c:if test="${i ne page }">
							<div id="ncurpage"
								onclick="location.href='userList.do?page=${i }'">${i }</div>
						</c:if>
					</c:forEach>
				</div>
				<div id="pagenex">
					<c:if test="${page lt totalPage }">
						<div id="nex"
							onclick="location.href='userList.do?page=${page + 1 }'">▷</div>
					</c:if>
					<c:if test="${page lt totalPage - 9 }">
						<div id="nex10"
							onclick="location.href='userList.do?page=${page + 10 }'">▶</div>
					</c:if>
				</div>
			</c:if>
		</div>

		<form action="userList.do" method="get">
			<div id="listBottom">
				<select name="searchID" id="id" onchange="select()">
					<option value="l_id">아이디</option>
					<option value="l_nick">닉네임</option>
					<option value="l_auth">권한</option>
				</select>
				<div id="search">
					<input name="searchCont" placeholder="검색어">
					<button onchange="select()"></button>
					<!--<button onclick="location.href='userListSearch.do?searchCont=' ">-->
					<!--<button onclick="location.href="userList.do?l_id="+l_id+"&page="+page+"&l_nick="+l_lick+"&l_auth="+l_auth >-->
				</div>
			</div>
		</form>

	</div>
<%@ include file="bottonmenu.jsp"%>
</body>
</html>