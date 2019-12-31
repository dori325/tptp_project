<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기</title>
<link href="https://fonts.googleapis.com/css?family=Gamja+Flower|Nanum+Gothic+Coding&display=swap&subset=korean" rel="stylesheet">
<script type="text/javascript">
function password() {
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
	
	var id = $('#id').val();
	var email = $('#fre').val() +'@'+ $('#ade').val();
		
	$.ajax({
		type : 'POST',
		data : {"email" : email, "id" : id},
		dataType : 'text',
		url : 'checkEmail.do',
		success : function(rData,textStatus, xhr){
			var check = rData;
			if(check != 0){
				alert("임시비밀번호: "+check+"\n비밀번호를 반드시 변경해주세요"); 
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

function findId() {	
	if ($('#e-fr').val() == '') {
		alert("이메일를 입력해주세요");
		$('#e-fr').focus();
		return false;
	}
	
	if ($('#e--ad').val() == '') {
		alert("이메일를 입력해주세요");
		$('#e--ad').focus();
		return false;
		
	}
	var email = $('#e-fr').val() + "@" + $('#e--ad').val()
	
	$.ajax({
		type : 'POST',
		data : {"email" : email},
		dataType : 'text',
		url : 'findID.do',
		success : function(rData,textStatus, xhr){
			var check = rData;
			if(check != ''){
				$('#afterId').css('display', 'block');
				$('#p').text(check);
				$('#e-fr').val()='';
				$('#e--ad').val()='';
			} else {
				alert("이메일이 올바르지 않습니다.\n다시 확인해주세요");
				$('#e-fr').focus();
			}
		},
		error : function(xhr,status,e){
			alert("에러가 발생했습니다.");
		}
	});
	return false;
}

function Select() {
	if($('#SelectEmail').val()=="0"){
		$('#e-ad').val("");
	} else {
		$('#e-ad').val($('#SelectEmail').val());
		$('#e-ad').attr('readonly', true);
	}
}

function Email() {
	if($('#eSelect').val()=="1"){
		$('#e-ad2').val("");
	} else {
		$('#e-ad2').val($('#eSelect').val());
		$('#e-ad2').attr('readonly', true);
	}
}
</script>
<link href="./css/welcome.css" rel="stylesheet"/>
</head>
<body>
<%@ include file="topmenu.jsp" %>
<div id="lostList">
<%@ include file="AllBar.jsp" %>
<div id="list">
<h2>아이디/비밀번호 찾기</h2>
<form action="findID.do" method="post" name="IDform">
	<table id="findID">
		<tr>
			<th>e-mail</th>
			<td><input name="e-fr" id="e-fr" type="text" placeholder="이메일을 입력하세요">@<input type="text" name="e-ad" id="e-ad">
				<select id="SelectEmail" onchange="Select()">
					<option value="0" selected="selected">직접입력</option>
					<option value="naver.com">naver.com</option>
					<option value="hanmail.net">hanmail.net</option>
					<option value="gmail.com">gmail.com</option>
				</select>
			</td>
		</tr>
	</table>
	<button id="resultButt" type="submit" onclick="return findId();">아이디 찾기</button>
</form>

<form name="Form">
	<table id="findPW">
		<tr>
			<th>아이디</th>
			<td><input name="ID" id="id" type="text" placeholder="아이디를 입력하세요"></td>
		</tr>
		<tr>
			<th>e-mail</th>
			<td><input name="EFR" id="e-fr2" type="text" placeholder="이메일을 입력하세요">@<input name="EAD" type="text" id="e-ad2">
				<select id="eSelect" onchange="Email()">
					<option value="1" selected="selected">직접입력</option>
					<option value="naver.com">naver.com</option>
					<option value="hanmail.net">hanmail.net</option>
					<option value="gmail.com">gmail.com</option>
				</select>
			</td>
		</tr>
	</table>
</form>
	<button id="resultButt" onclick="return password()">임시 비밀번호 발송</button>

	<div style="display: none;" id="afterId">
			<p>아이디는 '<a id="p"></a>' 입니다.</p>
	</div>

</div>
</div>
<%@ include file="bottonmenu.jsp" %>
</body>
</html>