<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<!-- include libraries(jQuery, bootstrap) -->
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<!-- include summernote css/js -->
<link href="./dist/summernote-lite.css" rel="stylesheet" />
<script src="./dist/summernote-lite.js"></script>

<script src="./dist/lang/summernote-ko-KR.js"></script>

<link href="./css/write.css" rel="stylesheet" />
<script>
	$(document).ready(function() {
		$('#summernote').summernote({
			lang : 'ko-KR',
			width : 850,
			height : 600,
			minHeight : null,
			maxHeight : null,
		});
		$('.dropdown-toggle').dropdown()
	});
</script>
</head>
<body>
	<c:import url="topmenu.jsp" />
	<form action="updateInsert.do" enctype="multipart/form-data" method="post">
	<div id="write">
		<c:import url="LsideB.jsp"/>		
		<c:import url="RsideB2.jsp"/>
		<div id="writetitle">
			<input type="hidden" name="b_no" value="${update.b_no }">
			<select name="b_cate1">
				<c:if test="${update.b_cate1 eq 'b1' }"><option value="b1">브랜드1</option></c:if>
				<c:if test="${update.b_cate1 eq 'b2' }"><option value="b2">브랜드2</option></c:if>
				<c:if test="${update.b_cate1 eq 'b3' }"><option value="b3">브랜드3</option></c:if>
				<c:if test="${update.b_cate1 eq 'no' }"><option value="no">공지사항</option></c:if>
				<c:if test="${update.b_cate1 eq 'nw' }"><option value="nw">새소식</option></c:if>
				<c:if test="${update.b_cate1 eq 'ad' }"><option value="ad">운영자</option></c:if>
				<c:if test="${update.b_cate1 eq 'q' }"><option value="q">질문게시판</option></c:if>
			</select>
			<c:if test="${update.b_cate1 ne 'no' && b_cate1 ne 'ad' }">
			<select name="b_cate2">
				<option value="연필">연필</option>
				<option value="샤프">샤프</option>
				<option value="볼펜">볼펜</option>
				<option value="만년필">만년필</option>
				<option value="형광펜">형광펜</option>
				<option value="기타">기타</option>
			</select>
			</c:if>
			<input type="text" name="b_title" value="${update.b_title }"><br>
			<textarea id="summernote" name="b_content">${update.b_content }</textarea>
			<input type="hidden" name="l_nick" value="${sessionScope.nick }"/>
			<input type="hidden" name="old_url2" value="${old_url2 }"/>
			<button id="writebutton" type="submit">수정하기</button>
		</div>
		</div>
	</form>
	<c:import url="bottonmenu.jsp" />
</body>
</html>