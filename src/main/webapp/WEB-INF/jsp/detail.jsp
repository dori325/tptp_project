<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>디테일</title>
<link rel="stylesheet" href="./css/main.css">
<style type="text/css">
#aa{
	margin: 0 auto;
	width: 850px;
	height: auto;
}
#detail{
	border: 1px solid;
	
}
#detail tr{
	margin: 0;
}
#detail tr, td{
	border: 1px solid;
}





</style>
<c:import url="topmenu.jsp"/>
</head>
<body>
<h1>디테일</h1>
<h2><a href="./index.do">공지사항</a> | <a href="./board.do">브랜드</a> | <a href="./write.do">글쓰기</a></h2>
	<form action="detail.do">
	<div id="aa">
		<div id="detail">
			<table>
				<tr style="border-bottom: solid;">
					<td>카테고리</td>
					<td>제목</td>
					<td><a>수정</a> / <a>삭제</a></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td>192.168.0.1</td>
					<td>date</td>
					<td><img alt="" src="">321</td>
				</tr>
				<tr>
					<td style="height: 500px">내용내용</td>
				</tr>
				<tr>
					<td><a>목록으로</a></td>
					<td><a>이전글</a> / <a>다음글</a></td>
				</tr>
				<tr>
					<td><img alt="" src="">추천그림</td>
				</tr>
			</table>
		</div>
		
		<div id="commentbox">
			<table>
				<tr>
					<td>작성자</td>
					<td><a>수정</a> / <a>삭제</a></td>
					<td>17:05:02</td>
					<td><img alt="" src="">323</td>
				</tr>
				<tr>
					<td>으어어어어</td>
				</tr>
			</table>
		</div>
		
		<div id="commentinput">
			<table>
				<tr>
					<td><textarea></textarea> </td>
					<td><button>댓글쓰기</button></td>
				</tr>
			</table>
		</div>
	</div>
	</form>
	<c:import url="bottonmenu.jsp"/>
</body>
</html>