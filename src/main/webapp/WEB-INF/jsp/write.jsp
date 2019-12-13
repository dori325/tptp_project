<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<link rel="stylesheet" href="./css/main.css">

<style type="text/css">
#writebox{
	margin: 0 auto;
	width: 850px;
	height: auto;
}
#writebox input, #writebox textarea, #writebox button{
	width: 850px;
	height: 25px;
	margin: 5px;
	
}
#writebox textarea{
	height: 600px;
}

</style>
</head>
<body>
<c:import url="topmenu.jsp"/>
<h1>디테일</h1>
<h2><a href="./index.do">공지사항</a> | <a href="./board.do">브랜드</a> | <a href="./detail.do">디테일</a></h2>
	<form action="detail.do">
		<div id="writebox">

			<input type="text" name="title" placeholder="제목을 입력하세요"><br>
			<input type="file" name="file" accept="image/*"><br>
			<textarea></textarea><br>
			<button type="submit">글쓰기</button>
			<script>
				CKEDITOR.replace('editor');
			</script>

		</div>
	</form>
	<c:import url="bottonmenu.jsp"/>
</body>
</html>