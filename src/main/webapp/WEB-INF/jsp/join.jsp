<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link href="https://fonts.googleapis.com/css?family=Gamja+Flower|Nanum+Gothic+Coding&display=swap&subset=korean" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
function checkID() {
	var id = $('#insertID').val();
	if ($('#insertID').val() =='') {
		alert("아이디를 입력해주세요");
		$('#insertID').focus();
		return false;
	}
	$.ajax({
		type : 'POST',
		data : "id="+id,
		dataType : 'text',
		url : 'checkID.do',
		success : function(rData,textStatus, xhr){
			var check = rData;
			if(check == 0){
				alert("사용가능한 아이디입니다. 진행하시겠습니까?"); 
				$('#checkID').prop('disabled', true);
				$('#insertNick').focus();
			} else {
				alert("이미 등록된 아이디입니다.\n다른 ID를 입력하세요.");
				$('#insertID').focus();
			}
		},
		error : function(xhr,status,e){
			alert("에러가 발생했습니다.");
		}
	});
	return false;
}
function checkNick() {
	var nick = $('#insertNick').val();	
	if ($('#insertNick').val() == '') {
		alert("닉네임를 입력해주세요");
		$('#insertNick').focus();
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
				$('#checkNick').prop('disabled', true);
				$('#checkIt').prop('disabled', false);
				$('#insertPW1').focus();
			} else {
				alert("이미 등록된 닉네임입니다.\n다른 닉네임을 입력하세요.");
				$('#insertNick').focus();
			}
		},
		error : function(xhr,status,e){
			alert("에러가 발생했습니다.");
		}
	});
	return false;
}
function check(){
	if (document.form.id.value == "") {
		alert("아이디를 입력해주세요");
		document.form.id.focus();
		return false;
	}
	if (document.form.nick.value == "") {
		alert("닉네임을 입력해주세요");
		document.form.nick.focus();
		return false;
	}
	if (document.form.pw1.value == "") {
		alert("비밀번호를 입력해주세요");
		document.form.pw1.focus();
		return false;
	}
	if (document.form.pw2.value == "") {
		alert("비밀번호 확인을 입력해주세요");
		document.form.pw2.focus();
		return false;
	}
	if (document.form.pw1.value != document.form.pw2.value) {
		alert("비밀번호가 일치하지 않습니다.");
		$('#notCorr').css('color','red');
		document.form.pw2.focus();
		return false;
	}
	if (document.form.eFront.value == "") {
		alert("이메일을 입력해주세요")
		document.form.eFront.focus();
		return false;
	}
	if (document.form.eBack.valus == "") {
		alert("이메일을 입력해주세요")
		document.form.eBack.focus();
		return false;
	}
}
</script>
</head>
<link href="./css/welcome.css" rel="stylesheet"/>
<body>
<div id="welcomeList">
<%@ include file="AllBar.jsp" %>
<div id="list">
	<h2>회원 가입</h2>
<form action="joinReg.do" method="POST" name="form">
		<table>
			<tr>
				<th>*아이디</th>
				<td>
					<input type="text" name="id" id="insertID" placeholder="아이디을 입력하세요" onchange="return checkID();">
					<button type="submit" onclick="return checkID()">중복확인</button>
					<small>변경 불가</small>
				</td>
			</tr>
			<tr>
				<th>*닉네임</th>
				<td>
					<input type="text" name="nick" id="insertNick" placeholder="닉네임을 입력하세요" onchange="return checkNick();">
					<button type="submit" onclick="return checkNick()">중복확인</button>
					<small>변경 가능</small>
				</td>
			</tr>
			<tr>
				<th>*비밀번호 입력</th>
				<td>
					<input type="password" name="pw1" id="insertPW1" placeholder="비밀번호를 입력하세요">
				</td>
			</tr>
			<tr>
				<th>*비밀번호 확인</th>
				<td>
					<input type="password" name="pw2" id="insertPW2" placeholder="동일한 비밀번호를 입력하세요">
					<a id="notCorr" style="color: gray;">비밀번호가 일치하지 않습니다.</a>
				</td>
			</tr>
			<tr>
				<th>*e-mail</th>
				<td>
					<input type="text" name="eFront" id="e-fr">@<input type="text" name="eBack" id="e-ad">
					<select>
						<option>선택하세요</option>
						<option>naver.com</option>
						<option>daum.net</option>
						<option>gmail.com</option>
					</select><br>
					<small style="color: gray;">아이디와 비밀번호 찾기 시 필요합니다.</small>
				</td>
			</tr>
		</table>
	<button type="submit" disabled="disabled" id="checkIt" onclick="return check();">가입하기</button>
</form>
	</div>	
</div>
</body>
</html>
