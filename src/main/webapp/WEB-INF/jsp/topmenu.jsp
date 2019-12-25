<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://fonts.googleapis.com/css?family=Gamja+Flower|Nanum+Gothic+Coding&display=swap&subset=korean" rel="stylesheet">
<style type="text/css">

#topmenu{
	margin: 0px auto;
/* 	position: static; */
	height: 70px;
    width: 1250px;
	padding-top: 5px;
}
#topmenu ul, #topmenu li {
	margin: 0px;
	padding: 0px;
}

#topmenu li {
	display: inline-block;
	padding: 10px 10px;
}
#sitename{
	font-weight: bold; 
	font-family: "Gamja Flower", cursive;
}
#sitename a{
	font-size: 34pt;
	text-decoration: none;
	vertical-align: middle;
	
}
#this{
	background: linear-gradient(to right, #FF856B 50%, #FFBD6B 50%);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
	white-space: nowrap;
}
#that{
	background: linear-gradient(to right, #5797C1 50%, #57D084 50%);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
	white-space: nowrap;
}

</style>
	<div id="topmenu">
		<ul>
			<li id="sitename"><a href="./main.jsp"><span id="this">이펜</span><span id="that">저펜</span></a></li>
			<li style="float: right;"><input type="text" placeholder="전체 검색"> <button>검색</button></li> 
		</ul>
			
	</div>