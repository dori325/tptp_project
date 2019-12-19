<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
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
			<ul id="detail">
				<li id="categoryBottom"><a href="brand.do?b_cate1=${b_cate1 }">모나미</a></li>
				<li id="categoryBottom"><a href="brand.do?b_cate1=${b_cate1 }">동아</a></li>
				<li id="categoryBottom"><a href="brand.do?b_cate1=${b_cate1 }">모닝글로리</a></li>
			</ul>
		</li>
		<li id="categoryTop"><a href="QnAlist.do">펜 질문<img id="index"  alt="이 공지" src="./img/색4.png"/></a></li>
		<li id="categoryTop"><a>관리자<img id="open" alt="▽" src="./img/openmenu.png"/><img id="index"  alt="이 공지" src="./img/색6.png"/></a>
			<ul id="detail">
				<li id="categoryBottom"><a href="#">회원 관리</a></li>
				<li id="categoryBottom"><a href="#">로그 관리</a></li>
				<li id="categoryBottom"><a href="admCommList.do">운영자 게시판</a></li>
			</ul>
		</li>
	</ul>
</div>
</body>
</html>