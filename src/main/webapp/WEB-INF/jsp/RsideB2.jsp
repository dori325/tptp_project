<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
$(function(){
	  $("#detail").hide();
	  $("#categoryTop a").click(function(){
	    $(this).next().slideToggle(300);
	    $(this).next("#categoryTop").slideDown(300);
	  });
	});
</script>
</head>
<link href="./css/sideR.css" rel="stylesheet"/>
<body>
<div id="Rside">
	<ul id="all">
		<li id="categoryTop"><a href="notice.do">이 공지<img id="index"  alt="이 공지" src="./img/색1.png"/></a></li>
		<li id="categoryTop"><a href="news.do">펜 새소식<img id="index"  alt="이 공지" src="./img/색2.png"/></a></li>
		<li id="categoryTop"><a>저 브랜드<img id="open" alt="▽" src="./img/openmenu.png"/><img id="index" alt="이 공지" src="./img/색3.png"/></a>
			<ul id="menuBot">
				<li id="categoryBottom"><a href="brand1.do">모나미</a></li>
				<li id="categoryBottom"><a href="brand2.do">동아</a></li>
				<li id="categoryBottom"><a href="brand3.do">모닝글로리</a></li>
			</ul>
		</li>
		<li id="categoryTop"><a href="QnAlist.do">펜 질문<img id="index"  alt="이 공지" src="./img/색4.png"/></a></li>
	<c:if test="${sessionScope.auth eq '5'}">
		<li id="categoryTop"><a>관리자<img id="open" alt="▽" src="./img/openmenu.png"/><img id="index"  alt="이 공지" src="./img/색6.png"/></a>
			<ul id="menuBot">
				<li id="categoryBottom"><a href="userList.do">회원 관리</a></li>
				<li id="categoryBottom"><a href="log.do">로그 관리</a></li>
				<li id="categoryBottom"><a href="admCommList.do">운영자 게시판</a></li>
			</ul>
		</li>
	</c:if>
	</ul>
</div>
</body>
</html>