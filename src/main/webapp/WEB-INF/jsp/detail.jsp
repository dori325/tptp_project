<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>디테일</title>
<c:import url="topmenu.jsp"/>
</head>
<link href="./css/detail.css" rel="stylesheet" />
<body>
	<form action="detail.do">
		<div id="detail">
<h1>디테일</h1>
			<div id="detailTop">
				<div id="detailTitle">
					<table>
						<tr>
							<td>
								<div id="cate-wrap">
									<div id="cate-img"><img alt="" src="./img/category.png"></div>
									<div id="cate-text">
										<p>${detail.b_cate2 }</p>
									</div>
								</div>
							</td>
							<td id="title">${detail.b_title }</td>
							<td><a href="update.do?b_no=${detail.b_no }&b_cate1=${detail.b_cate1 }">수정</a>
							 / <a href="delete.do?b_no=${detail.b_no }">삭제</a></td>
						</tr>
					</table>
				</div>
				<div id="detailStatus">
					<table>
						<tr>
							<td id="id" colspan="1"> ${detail.l_nick }</td>
							<td id="ip">192.168.0.1</td>
							<td id="date">${detail.b_date }</td>
							<td id="count"><img alt="" src="./img/eye2.png">${detail.b_count }</td>
						</tr>
					</table>
				</div>
			</div>
			<div id="detailMid">
				${detail.b_content }
			</div>
			<div id="detailBot">
				<table>
					<tr>
						<td id="list">
							<a href="brand1.do">목록으로</a>
						</td>
						<td>
							<div id="like-wrap">
								<div id="like-img"><img alt="" src="./img/heart2.png"></div>
								<div id="like-text">
									<p>${detail.b_like }</p>
								</div>
							</div>
						</td>
						<td id="next"><a href="./detail.do?b_no=${detail.b_no - 1}">이전글</a> / <a href="./detail.do?b_no=${detail.b_no + 1}">다음글</a></td>
					</tr>
				</table>
			</div>
		</div>
	</form>
	<c:import url="bottonmenu.jsp"/>
</body>
</html>