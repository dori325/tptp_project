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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
function commModi(c__no) {
	alert("짠" + c__no)
	
	var b_no = $('#b__no').val();
	var url = $('#u__rl').val();
	
	alert("여기 들어옴"+b_no);
	

 	$.ajax({
 		type : 'POST',
 		data : { "c_no": c__no, "b_no": b_no },
 		dataType : 'text',
 		url : 'commModi.do',
 		success : function(rData,textStatus, xhr){
 			var check = rData;
 			if(check != null){
//  				$('#dd').prop('readonly', false);
//  				document.getElmentBylId('Con').focus();
// //  				c__no.attr.readonly = 'false';
// //  				c__no.focus();
//  				//확인 취소 버튼 만들고
//  				//수정 삭제 버튼 가리고
//  				//확인 이나 취소 누르면 다시 처음으로 돌아갈 수 있도록
				alert("완전 성공" + check);
 			} else if(check != 0){
//  				alert("댓글 수정 못함");
 			}
 		},
 		error : function(xhr,status,e){
 			alert("에러가 발생했습니다.");
 		}
 	});
	alert("여기까지 성공");
	return false;
}
</script>
<body>
<div id="insert">
<form action="commUpdate.do" method="POST">
	<table id="commP">
		<tr>
			<td><input name="ccontent" type="text" placeholder="댓글 입력"/></td>
			<td><button type="submit">댓글 쓰기</button>
			<input type="hidden" name="b_no" value="${param.b_no }">
			<input type="hidden" name="url" value="${pageContext.request.requestURI}">
			</td>
		</tr>
	</table>
</form>
	<hr>
<!-- <form action="commShow.do" method="post"> -->
	<table id="commL">
	<c:forEach items="${commdetail }" var="c">
		<tr>
			<td id="nick">${c.l_nick }</td>
			<td id="ip"> <%-- ${c.l_ip } --%></td>
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
		<tr>
			<td id="commContent">
			<input readonly="readonly" type="text" id="Con" placeholder="${c.c_content }">
			<c:if test="${sessionScope.nick eq c.l_nick || sessionScope.auth eq 5}">
				<form action="commDelete.do" method="post">
				<input style="width: 0px;" type="hidden" name="nick" value="${c.l_nick }">
				<input style="width: 0px;" type="hidden" name="b_no" value="${param.b_no }">
				<input style="width: 0px;" type="hidden" name="c_no" value="${c.c_no }">
				<input style="width: 0px;" type="hidden" name="u__rl" value="${pageContext.request.requestURI}">
				<button id="up">삭제</button>
				</form>
			</c:if>
			<c:if test="${sessionScope.nick eq c.l_nick}">
				<form action="modiComm.do" method="post">
				<input style="width: 0px;" type="hidden" name="b_no" value="${param.b_no }">
				<input style="width: 0px;" type="hidden" name="c_no" value="${c.c_no }">
				<input style="width: 0px;" type="hidden" name="url" value="${pageContext.request.requestURI}">
				<button id="up">수정</button>
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