<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이펜저펜</title>
<script	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<c:import url="topmenu.jsp"/>
<script type="text/javascript">
	
</script>
</head>
<link href="./css/detail.css" rel="stylesheet" />
<body>
		<div id="detailbody">	
			<%@ include file="AllBar.jsp" %>
			<div id="detailTop">
			<h2>디테일</h2>
				<div id="detailTitle">
					<table>
						<tr>
							<td>
								<c:if test="${detail.b_cate1 ne 'no' }">
									<div id="cate-wrap">
										<div id="cate-img"><img alt="" src="./img/category.png"></div>
										<div id="cate-text">
											<p>${detail.b_cate2 }</p>
										</div>
									</div>
								</c:if>
							</td>
							<td id="title">${detail.b_title }</td>
							<td>
								<c:if test="${detail.l_nick eq sessionScope.nick }">
								<form action="update.do">									
									<input type="hidden" name="b_no" value="${detail.b_no }">
									<button type="submit">수정</button>
								</form>

								<form action="delete.do">
									<input type="hidden" name="b_no" value="${detail.b_no }">
									<input type="hidden" name="old_url2" value="${old_url2 }"/>
									<button type="submit">삭제</button>
								</form>
								</c:if>
							</td>
						</tr>
					</table>
				</div>
				<div id="detailStatus">
					<table>
						<tr>
							<td id="id" colspan="1"> ${detail.l_nick }</td>
							<td id="ip">192.168.0.1</td>
							<td id="modidate">
							<c:if test="${detail.b_date ne detail.b_modidate }">
								마지막 수정 ${detail.b_modidate }
							</c:if>
							</td>
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
							<a href="${old_url2 }">목록으로</a>
						</td>
						<td id="like">
							<div id="like-wrap">
								<div id="like-img"><img alt="" src="./img/heart2.png"></div>
								<div id="like-text" onclick="location.href='brand2.do'">
									<p>${detail.b_like }</p>
								</div>
							</div>
						</td>
						<td></td>
					</tr>
				</table>
			</div>

		</div>
	<%@ include file="commInsert3.jsp" %>
	<c:import url="bottonmenu.jsp"/>
</body>
</html> 