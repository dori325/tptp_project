<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<!-- include summernote css/js -->
<link href="./dist/summernote.css" rel="stylesheet" />
<script src="./dist/summernote.js"></script>

<script src="./dist/lang/summernote-ko-KR.js"></script>

<link href="./css/write.css" rel="stylesheet" />
</head>
<body>
	<c:import url="topmenu.jsp" />
	<form action="write.do">
		<div id="writetitle">
			<input type="text" name="title" placeholder="제목을 입력하세요"><br>
			<textarea id="summernote" name="content"></textarea>
			<script>
				$(document).ready(function() {
				$('#summernote').summernote({
					lang: 'ko-KR',
					width: 850,
					height: 600,
					minHeight: null,
					maxHeight: null,
					if ($('#summernote').summernote('isEmpty')) {
						  alert('editor content is empty');
					}
				});
				$('.dropdown-toggle').dropdown()
				});
			</script>
			<button type="submit">글쓰기</button>
		</div>
	</form>
	<c:import url="bottonmenu.jsp" />
</body>
</html>