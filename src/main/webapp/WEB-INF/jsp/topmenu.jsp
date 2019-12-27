<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://fonts.googleapis.com/css?family=Gamja+Flower|Nanum+Gothic+Coding&display=swap&subset=korean" rel="stylesheet">
<link href="./css/topmenu.css" rel="stylesheet" />
	<div id="topmenu">
		<ul>
			<li id="sitename"><a href="./main.do"><span id="this">이펜</span><span id="that">저펜</span></a></li>
			<li style="float: right;">
			<form action="ohSearch.do" method="GET">
				<div id="topsearch">
					<input name="searchCont" placeholder="검색어 입력"> <input
						type="hidden" name="b_cate1" value="${b_cate1 }"> <input
						type="hidden" name="url" value="${pageContext.request.requestURI}">
					<button type="submit">
						<img alt="검색" src="./img/search.png">
					</button>
				</div>
			</form> 
		</ul>
			
	</div>
