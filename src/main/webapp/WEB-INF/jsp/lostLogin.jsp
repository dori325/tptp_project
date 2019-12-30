<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기</title>
</head>
<link href="./css/welcome.css" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css?family=Gamja+Flower|Nanum+Gothic+Coding&display=swap&subset=korean" rel="stylesheet">
<script type="text/javascript">
function password() {
	alert("성공 1");
	
	if (document.Form.ID.value == "") {
		alert("아이디를 입력해주세요");
		document.Form.ID.focus();
		return false;
	}
	if (document.Form.EFR.value == "") {
		alert("이메일를 입력해주세요");
		document.Form.EFR.focus();
		return false;
	}
	if (document.Form.EAD.value == "") {
		alert("이메일를 입력해주세요");
		document.Form.EAD.focus();
		return false;
	}
	
	alert("성공 2");
	var id = $('#id').val();
	var email = $('#efr').val() +'@'+ $('#ead').val();
		
	$.ajax({
		type : 'POST',
		data : {"email" : email, "id" : id},
		dataType : 'text',
		url : 'checkEmail.do',
		success : function(rData,textStatus, xhr){
			var check = rData;
			if(check != 0){
				alert("임시비밀번호: "+check); 
			} else {
				alert("아이디과 이메일이 일치하지 않습니다.\n다시 확인해주세요");
				$('#id').focus();
			}
		},
		error : function(xhr,status,e){
			alert("에러가 발생했습니다.");
		}
	});
	return false;
}
</script>
<body>
<%@ include file="topmenu.jsp" %>
<div id="welcomeList">
<%@ include file="LsideB.jsp" %>
<%@ include file="RsideB.jsp" %>
<div id="list">
<h2>아이디/비밀번호 찾기</h2>
<form action="findID.do" method="post" name="form">
	<table id="findID">
		<tr>
			<th>e-mail</th>
			<td><input name="e-fr" type="text" placeholder="이메일을 입력하세요">@<input type="text" name="e-ad" id="e-ad">
				<select>
					<option>선택하세요</option>
					<option>naver.com</option>
					<option>daum.net</option>
					<option>gmail.com</option>
				</select>
			</td>
		</tr>
	</table>
	<button type="submit" id="resultButt">아이디 찾기</button>
	<input type="hidden" name="url" value="${pageContext.request.requestURI}">
</form>
<form name="Form">
	<table id="findPW">
		<tr>
			<th>아이디</th>
			<td><input name="ID" id="id" type="text" placeholder="아이디를 입력하세요"></td>
		</tr>
		<tr>
			<th>e-mail</th>
			<td><input name="EFR" id="efr" type="text" placeholder="이메일을 입력하세요">@<input name="EAD" type="text" id="ead">
				<select>
					<option>선택하세요</option>
					<option>naver.com</option>
					<option>daum.net</option>
					<option>gmail.com</option>
				</select>
			</td>
		</tr>
	</table>
</form>
	<button id="resultButt" onclick="return password()">임시 비밀번호 발송</button>
	<c:if test="${map.l_nick != null }">
	<div id="afterId">
			<p id="p">${map.l_nick }님의 아이디는 ' ${map.l_id } ' 입니다.</p>
	</div>
	</c:if>
</div>
</div>
<%@ include file="bottonmenu.jsp" %>
</body>
</html>