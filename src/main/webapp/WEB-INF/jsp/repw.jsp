<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<link href="./css/welcome.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
function reqw() {
	var oldpw = $('#pw1').val();	
	var newpw = $('#pw1').val();

	$.ajax({
		type : 'POST',
		data : "pw="+oldpw,
		dataType : 'text',
		url : 'checkPW.do',
		success : function(rData,textStatus, xhr){
			var check = rData;
			if(check == 1){
				alert("비밀번호가 일치합니다. 변경하시겠습니까?");
			} else {
				alert("잘못된 비밀번호입니다. \n다시 입력해주세요");
				$('#pw1').focus();
				$('#notcorr1').css('color', 'red');
			}
		},
		error : function(xhr,status,e){
			alert("에러가 발생했습니다.");
		}
	});
	return false;
	
	if ($('#pw1').val() == '') {
		alert("기존 비밀번호를 입력해주세요");
		$('#pw1').focus();
		return false;
	}
	
	if ($('#pw2').val() == '') {
		alert("새로운 비밀번호를 입력해주세요");

		$('#pw2').focus();
		return false;
	}
	
	if ($('#pw3').val() == '') {
		alert("비밀번호 확인을 입력해주세요");
		$('#pw3').focus();
		return false;
	}
	
	if ($('#pw2').val() != $('#pw3').val()) {
		alert("신규 비밀번호가 일치하지 않습니다. \n 다시 입력해주세요");
		$('#pw3').focus();
		$('#notCorr3').css('color','red');
	}
}
</script>
</head>
<body>
<%@ include file="topmenu.jsp" %>
<div id="welcomeList">
<%@ include file="AllBar.jsp" %>
	<div id="list">
	<h2>비밀번호 변경</h2>
<form action="pwModi.do">
		<table>
			<tr>
				<th>기존 비밀번호</th>
				<td><input type="password" id="pw1">
					<small id="notCorr1" style="color: gray;">비밀번호가 올바르지 않습니다.</small>
				</td>
			</tr>
			<tr>
				<th>새로운 비밀번호</th>
				<td><input type="password" id="pw2"></td>
			</tr>
			<tr>
				<th>새로운 비밀번호 확인</th>
				<td><input type="password" id="pw3">
					<small id="notCorr3" style="color: gray;">비밀번호가 일치하지 않습니다.</small>
				</td>
			</tr>
		</table>
		<button id="resultButt" onclick="reqw()">변경하기</button>
</form>
	</div>
</div>
</body>
</html>