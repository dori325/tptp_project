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
<h1>디테일</h1>
	<form action="detail.do">
		<div id="detail">
			<div id="detailTop">
				<div id="detailTitle">
					<table>
						<tr>
							<td>
								<div id="cate-wrap">
									<div id="cate-img"><img alt="" src="./img/category.png"></div>
									<div id="cate-text">
										<p>샤프</p>
									</div>
								</div>
							</td>
							<td id="title">제목</td>
							<td><a>수정</a> / <a>삭제</a></td>
						</tr>
					</table>
				</div>
				<div id="detailStatus">
					<table>
						<tr>
							<td id="id">작성자</td>
							<td id="ip">192.168.0.1</td>
							<td id="date">2019.12.16</td>
							<td id="count"><img alt="" src="">321</td>
					</table>
				</div>
			</div>
			<div id="detailMid">
				내용내용
				<p>ddd</p>
				<p>ddd</p>
				<p>ddd</p>
			</div>
			<div id="detailBot">
				<table>
					<tr>
						<td><a>목록으로</a></td>
						<td>
							<div id="like-wrap">
								<div id="like-img"><img alt="" src="./img/heart.png"></div>
								<div id="like-text">
									<p>3</p>
								</div>
							</div>
						</td>
						<td><a>이전글</a> / <a>다음글</a></td>
					</tr>
				</table>
			</div>
		</div>
	</form>
	<c:import url="bottonmenu.jsp"/>
</body>
</html>