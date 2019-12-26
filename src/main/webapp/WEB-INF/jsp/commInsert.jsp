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
function commModi() {
	var comment = $('#commCon').val();
	var c_no = $('#c_no').val();	
	var b_no = $('#b_no').val();
	alert("여기 들어옴");
	
	if ($('#l_nick').val() == $('#s_nick').val()) {
		$('#Con').prop('readonly', false);
		$('#Con').focus(); //성공함 but c_no가 같은 애를 가져와야함
	alert("여기 들어옴22");
	return false;
	}
	
// 	$.ajax({
// 		type : 'POST',
// 		data : { "comment": commCon, "c_no": c_no, "b_no": b_no },
// 		dataType : 'text',
// 		url : 'commModi.do',
// 		success : function(rData,textStatus, xhr){
// 			var check = rData;
// 			if(check != 0){
				
// 			} else if(check = 0){
// 				alert("좋아요 안 올라감");
// 			}
// 		},
// 		error : function(xhr,status,e){
// 			alert("에러가 발생했습니다.");
// 		}
// 	});
// 	return false;
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
			<c:if test="${c.c_like != null || likeUp != null}">
				<td id="comm" >${c.c_like }${likeUp }</td>
			</c:if>
		</tr>
		<tr>
			<td id="commContent"><input readonly="readonly" type="text" name="commCon" id="Con" placeholder="${c.c_content }" onchange="return commModi();"></td>
			<c:if test="${sessionScope.nick == c.l_nick}">
			<td id="buttontd">
				<input style="width: 0px;" type="hidden" name="b_no" value="${c.b_no }">
				<input style="width: 0px;" type="hidden" name="c_no" value="${c.c_no }">
				<input style="width: 0px;" type="hidden" name="l_nick" value="${c.l_nick }">
				<input style="width: 0px;" type="hidden" name="s_nick" value="${sessionScope.nick }">
				<input style="width: 0px;" type="hidden" name="url" value="${pageContext.request.requestURI}">
				<button name="modi" id="up" onclick="return commModi()">수정</button>
			</td>
			<c:if test="${sessionScope.nick == c.l_nick || sessionScope.auth > 3}">
			<td id="buttontd">
				<form action="commDelete.do" method="post">
				<input style="width: 0px;" type="hidden" name="nick" value="${c.l_nick }">
				<input style="width: 0px;" type="hidden" name="b_no" value="${param.b_no }">
				<input style="width: 0px;" type="hidden" name="c_no" value="${c.c_no }">
				<input style="width: 0px;" type="hidden" name="url" value="${pageContext.request.requestURI}">
				<button id="up">삭제</button>
				</form>
			</td>
			</c:if>
			</c:if>
		</tr>
	</c:forEach>
	</table>
<!-- </form> -->
</div>
</body>
</html>