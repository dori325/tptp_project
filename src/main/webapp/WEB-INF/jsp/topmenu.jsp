<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">

#topmenu{
	margin: 0px auto;
/* 	position: static; */
	height: 70px;
    width: 1250px;
	padding-top: 5px;
	background-color: #c0c0c0;
}
#topmenu ul, #topmenu li {
	margin: 0px;
	padding: 0px;
}

#topmenu li {
	display: inline-block;
	padding: 0px 10px;
}

</style>
	<div id="topmenu">
		<ul>
			<li><a style="font-size: 30pt; font: " href="./main.jsp">이펜저펜</a></li>
			<li style="float: right;"><input type="text" placeholder="전체 검색"> <button>검색</button></li> 
		</ul>
			
	</div>