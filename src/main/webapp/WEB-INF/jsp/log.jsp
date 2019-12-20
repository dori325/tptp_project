<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Log</title>
<script type="text/javascript">
function select(){
	var log_do = document.getElementById("log_do").value;
	var name = document.getElementById("id").value;
	var ip = document.getElementById("ip").value;
	var page = '${page}';
	location.href="log.do?log_do="+log_do+"&page="+page+"&ip="+ip+"&name="+name;//나중엔 페이지도 같이 보내야 해요.
}
</script>
</head>
<link href="./css/board.css" rel="stylesheet"/>
<body>
<div id="listboard">
<%@ include file="topmenu.jsp"%>
<%@ include file="AllBar.jsp"%>
<div id="listTop">
	<h2>어드민 로그</h2>
	<div id="logbox">
		<!-- //1성공 2실패 3로그아웃 4글쓰기 5글수정 6글삭제 7댓글 8댓글수정 9댓글삭제 -->
		
		<button onclick="location.href='log.do'">초기화</button>
		<table id="admCommList">
			<tr>
				<td id="comment">번호</td>
				<td >
					<select name="id" id="id" onchange="select()">
							<option value="0">ID를 선택하세요</option>
						<c:forEach items="${idList }" var="id">
							<c:if test="${name eq id.login_id}">
								<option value="${id.login_id }" selected="selected">${id.login_id } - ${id.count }</option>
							</c:if>
							<c:if test="${name ne id.login_id}">
								<option value="${id.login_id }">${id.login_id } - ${id.count }</option>
							</c:if>
						</c:forEach>
					</select>
				</td>
				<td>
					<select name="ip" id="ip" onchange="select()">
							<option value="0">IP를 선택하세요</option>
						<c:forEach items="${ipList }" var="ip1">
							<c:if test="${ip ne ip1.log_ip }">
								<option value="${ip1.log_ip }">${ip1.log_ip } - ${ip1.count }</option>
							</c:if>
							<c:if test="${ip eq ip1.log_ip }">
								<option value="${ip1.log_ip }" selected="selected">${ip1.log_ip } - ${ip1.count }</option>
							</c:if>							
						</c:forEach>
					</select>
				</td>
				<td>
					<select name="log_do" id="log_do" onchange="select()">
						<option value="0">선택하세요</option>
						<c:if test="${log_do eq 1 }"><option value="1" selected="selected">로그인성공</option></c:if>
						<c:if test="${log_do ne 1 }"><option value="1">로그인성공</option></c:if>
						<c:if test="${log_do eq 2 }"><option value="2" selected="selected">로그인실패</option></c:if>
						<c:if test="${log_do ne 2 }"><option value="2">로그인실패</option></c:if>
						<c:if test="${log_do eq 3 }"><option value="3" selected="selected">로그아웃</option></c:if>
						<c:if test="${log_do ne 3 }"><option value="3">로그아웃</option></c:if>
						<c:if test="${log_do eq 4 }"><option value="4" selected="selected">글쓰기</option></c:if>
						<c:if test="${log_do ne 4 }"><option value="4">글쓰기</option></c:if>
						<c:if test="${log_do eq 5 }"><option value="5" selected="selected">글수정</option></c:if>
						<c:if test="${log_do ne 5 }"><option value="5">글수정</option></c:if>
						<c:if test="${log_do eq 6 }"><option value="6" selected="selected">글삭제</option></c:if>
						<c:if test="${log_do ne 6 }"><option value="6">글삭제</option></c:if>
						<c:if test="${log_do eq 7 }"><option value="7" selected="selected">댓글작성</option></c:if>
						<c:if test="${log_do ne 7 }"><option value="7">댓글작성</option></c:if>
						<c:if test="${log_do eq 8 }"><option value="8" selected="selected">댓글수정</option></c:if>
						<c:if test="${log_do ne 8 }"><option value="8">댓글수정</option></c:if>
						<c:if test="${log_do eq 9 }"><option value="9" selected="selected">댓글삭제</option></c:if>
						<c:if test="${log_do ne 9 }"><option value="9">댓글삭제</option></c:if>
					</select>
				</td>
				<td id="date">날짜</td>
				<td id="name">비고</td>
			</tr>
			<c:forEach items="${list }" var="i">
			<tr>
				<td id="comment">${i.log_no }</td>
				<td><a href="log.do?name=${i.login_id }">${i.login_id }</a></td>
				<td><a href="log.do?ip=${i.log_ip }">${i.log_ip }</a></td>
				<td>
				
					<c:if test="${i.log_do eq 1}">로그인성공</c:if> 
					<c:if test="${i.log_do eq 2}">로그인 실패</c:if> 
					<c:if test="${i.log_do eq 3}">로그아웃</c:if> 
					<c:if test="${i.log_do eq 4}">글쓰기</c:if> 
					<c:if test="${i.log_do eq 5}">글수정</c:if> 
					<c:if test="${i.log_do eq 6}">글삭제</c:if> 
					<c:if test="${i.log_do eq 7}">댓글쓰기</c:if> 
					<c:if test="${i.log_do eq 8}">댓글수정</c:if> 
					<c:if test="${i.log_do eq 9}">댓글삭제</c:if> 
				
				</td>
				<td id="date">${i.log_date }</td>
				<td style="text-align: left;">${i.log_etc }</td>
			</tr>			
			</c:forEach>
		</table>
	</div>
	
		<!-- 페이징 추가해야함 -->
		<div id="page">
		</div>
		
	</div>
</div>
		
</body>

</html>