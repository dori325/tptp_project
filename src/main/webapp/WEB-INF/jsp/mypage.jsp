<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link href="./css/welcome.css" rel="stylesheet"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
function checkNick() {
	var nick = $('#renick').val();	
	if ($('#renick').val() == '') {
		alert("닉네임를 입력해주세요");
		$('#renick').focus();
		return false;
	}
	$.ajax({
		type : 'POST',
		data : "nick="+nick,
		dataType : 'text',
		url : 'checkNick.do',
		success : function(rData,textStatus, xhr){
			var check = rData;
			if(check == 0){
				alert("사용가능한 닉네임입니다. 진행하시겠습니까?");
				$('#renick').prop('disabled', true);
				$('#checkIt').prop('disabled', false);
			} else {
				alert("이미 등록된 닉네임입니다.\n다른 닉네임을 입력하세요.");
				$('#renick').focus();
			}
		},
		error : function(xhr,status,e){
			alert("에러가 발생했습니다.");
		}
	});
	return false;
}

function checkPW() {
	var pw = $('#repw').val();	
	if ($('#repw').val() == '') {
		alert("비밀번호를 입력해주세요");
		$('#repw').focus();
		return false;
	}
	$.ajax({
		type : 'POST',
		data : "pw="+pw,
		dataType : 'text',
		url : 'checkPW.do',
		success : function(rData,textStatus, xhr){
			var check = rData;
			if(check == 1){
				alert("비밀번호가 일치합니다. 진행하시겠습니까?");
				$('#repw').prop('disabled', true);
				$('#checkit').prop('disabled', false);
			} else {
				alert("잘못된 비밀번호입니다. \n다시 입력해주세요");
				$('#repw').focus();
			}
		},
		error : function(xhr,status,e){
			alert("에러가 발생했습니다.");
		}
	});
	return false;
}
</script>
</head>
<body>
<%@ include file="topmenu.jsp" %>
<div id="welcomeList">
<%@ include file="AllBar.jsp" %>
<div id="list">
	<h2>마이페이지</h2>
	<form action="nickUpdate.do" method="POST">
		<table>
		<c:if test="${sessionScope.id ne null }">
			<tr>
				<th>아이디</th>
				<td>${mylist.l_id }</td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td>${mylist.l_nick }<input type="text" name="renick" onchange="return checkNick()" style="margin-left: 5px; width: 90px;">
				<button style="width: 70px; height: 32px;" id="checked" onclick="return checkNick()">중복확인</button>
				<button style="width: 70px; height: 32px;" type="submit" id="checkIt" disabled="disabled">변경하기</button></td>
			</tr>
			<tr>
				<th>게시글 수</th>
				<td>${mylist.countB }</td>
			</tr>
			<tr>
				<th>댓글 수</th>
				<td>${mylist.countC }</td>
			</tr>
		</c:if>
		</table>
		</form>
		<table>
			<c:if test="${sessionScope.id ne null }">
			<tr>
				<th>비밀번호</th>
				<td><input type="password" id="repw" placeholder="비밀번호를 입력해주세요" onchange="checkPW()">
				<button onclick="checkPW()" id="re">비밀번호 확인하기</button>
				<button style="width: 70px; height: 32px;" id="checkit" disabled="disabled" onclick="location.href='repw.do'">변경하기</button></td>
			</tr>
			</c:if>
		</table>
	</div>
</div>
</body>
</html>