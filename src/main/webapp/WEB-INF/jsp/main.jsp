<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<link href="./css/board.css" rel="stylesheet" />
</head>

<body>
<div id="logo">
<a>이펜저펜</a>
</div>
	<div id="listboard">
		<%@ include file="AllBar.jsp"%>
		<div id="totalSearch">
			<table>
				<tr>
					<td>
						<form action="totalSearch.do" method="post">
							<input name="b_content" placeholder="검색하세요">
							<button
								onclick='"location.href="+totalSearch.do?b_title="+b_content+"&b_content="+b_content; "'>
								<img style="size: 50px;" alt="검색" src="./img/search.png" />
							</button>
						</form>
					<td>
				</tr>
			</table>
		</div>

		<div id="mainboard">
		    <!-- 상단 -->
			<div id="totalboard">
				<table>
					<tr>
						<th><a href="#" style="text-decoration: none;">[공지사항]</a></th>
					</tr>
					<c:forEach items="${list }" var="l">
						<tr>
							<td align="left" style="font-size: 15px;"><a
								href="detail.do">${l.b_title }</a></td>
						</tr>
					</c:forEach>
				</table>
			</div>

			<div id="totalboard">
				<table>
					<tr>
						<th><a href="#" style="text-decoration: none;">[이달의추천]</a></th>
					</tr>
					<c:forEach items="${k_list }" var="k">
						<tr>
							<td align="left" style="font-size: 15px;"><a
								href="detail.do">${k.b_title }</a></td>
						</tr>
					</c:forEach>
				</table>
			</div>

			<div id="totalboard">
				<table>
					<tr>
						<th><a href="./news.do" style="text-decoration: none;">[이달의새소식]</a></th>
					</tr>
					<c:forEach items="${n_list }" var="n">
						<tr>
							<td align="left" style="font-size: 15px;"><a
								href="detail.do">${n.b_title }</a></td>
						</tr>
					</c:forEach>
				</table>
			</div>
			
			<!-- 하단 -->
		    <div id="totalboard">
				<table>
					<tr>
						<th><a href="brand1.do?b_cate1=b1" style="text-decoration: none;">[브랜드1]</a></th>
					</tr>
					<c:forEach items="${b1_list }" var="b1">
						<tr>
							<td align="left" style="font-size: 15px;"><a
								href="detail.do?b_cate1=b1">${b1.b_title }</a></td>
						</tr>
					</c:forEach>
				</table>
			</div>

			<div id="totalboard">
				<table>
					<tr>
						<th><a href="brand2.do?b_cate1=b2" style="text-decoration: none;">[브랜드2]</a></th>
					</tr>
					<c:forEach items="${b2_list }" var="b2">
						<tr>
							<td align="left" style="font-size: 15px;"><a
								href="detail.do?b_cate1=b2">${b2.b_title }</a></td>
						</tr>
					</c:forEach>
				</table>
			</div>

			<div id="totalboard">
				<table>
					<tr>
						<th><a href="brand3.do?b_cate1=b3" style="text-decoration: none;">[브랜드3]</a></th>
					</tr>
					<c:forEach items="${b3_list }" var="b3">
						<tr>
							<td align="left" style="font-size: 15px;"><a
								href="detail.do?b_cate1=b3">${b3.b_title }</a></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>

		<%@ include file="bottonmenu.jsp"%>
	</div>
</body>

</html>
