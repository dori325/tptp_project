<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
function checkID(){
	var id = $('#insertID').val();
	if($('#insertID').val() == ''){
		alert("아이디를 입력하세요.");
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
				$('#checkit').prop('disabled', false);
				$('#resulttext').css('color','blue');
				$('#resulttext').text('가입할 수 있는 ID입니다.');
			} else {
				alert("이미 등록된 ID입니다.\n다른 ID를 입력하세요.");
				$('#resulttext').css('color','red');
				$('#resulttext').text('이미 등록된 ID입니다.');
			}
		},
		error : function(xhr,status,e){
			alert("에러가 발생했습니다.");
		}
	});
	return false;
}
function check(){
	if (document.frm.id.value == "") {
		alert("아이디를 입력해주세요");
		document.frm.nick.focus();
		return false;
	}
	if (document.frm.nick.value == "") {
		alert("닉네임을 입력해주세요");
		document.frm.nick.focus();
		return false;
	}
	if (document.frm.pw1.value == "") {
		alert("비밀번호를 입력해주세요");
		document.frm.pw1.focus();
		return false;
	}
	if (document.frm.pw2.value == "") {
		alert("비밀번호 확인을 입력해주세요");
		document.frm.pw2.focus();
		return false;
	}
	if (document.frm.pw1.value != document.frm.pw2.value) {
		alert("비밀번호가 일치하지 않습니다.");
		return false;
	}
}
</script>
</head>
<body>
	<div>
		<h1>회원가입</h1>
		<form action="joinReg.do" method="post" name="frm">
<!-- 		post = db에 저장하기 -->
			<table border="1" style="border-collapse: collapse; width: 500px;">
				<tr>
					<th>ID</th>
					<td>
						<input type="text" name="id" id="insertID" placeholder="아이디를 입력하세요" onchange="return checkID();">
						<button onclick="return checkID()">ID확인</button><br>
						<p id="resulttext">ID확인을 눌러주세요.</p>
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" name="pw1" placeholder="비밀번호를 입력하세요"><br>
						<input type="password" name="pw2" placeholder="비밀번호를 입력하세요">
					</td>				
				</tr>
				<tr>
					<th>이름</th>
					<td>
						<input type="text" name="nick" placeholder="이름을 입력하세요">
					</td>
				</tr>
			</table>
			Id검사를 눌러야 가입하기가 활성화 됩니다.
			<button disabled="disabled" type="submit" id="checkit" onclick="return check();">가입하기</button>
		</form>
	</div>
</body>
</html>