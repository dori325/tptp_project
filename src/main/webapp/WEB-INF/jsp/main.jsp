<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
function checkID(){
	alert("눌렸습니다.");
	var id = $('#b_content').val();
		if($('#b_content').val() == ''){
			alert("검색어를 입력하세요.");
			$('#b_content').focus();
			return false;
		}
	return false;
}
	
function check() {
	var b_content = document.getElementById("b_content").value;
	if(document.frm.b_content.value==""){
	//if (document.frm.getElementById("b_content").value == "") {
		alert("검색어를 입력해주세요.");
		document.frm.b_content.focus();
		return false;
	}
	location.href = "totalSearch.do?b_content=" + b_content + "&page=" + page;
}
</script>
<link href="./css/board.css" rel="stylesheet" />
</head>

<body>
	<div id="logo">
		<a>이펜저펜</a>
	</div>
	<div id="listboard">
		<%@ include file="AllBar.jsp"%>
		
		<form action="totalSearch.do" method="get" name="frm">
			<div id="totalSearch">
				<table>
					<tr>
						<td><input name="b_content" placeholder="검색어를 입력하세요">
							<button id="checkit" onchange="return checkID();">
								<!-- <button
								onclick='"location.href="+totalSearch.do?b_title="+b_content+"&b_content="+b_content; "'
								id="checkit" onclick="return check();">-->
								<img style="size: 50px;" alt="검색" src="./img/search.png" />
							</button>
						<td>
					</tr>
				</table>
			</div>
		</form>

		<div id="mainboard">
			<!-- 상단 -->
			<div id="totalboard">
				<table>
					<tr>
						<th><a href="./notice.do" style="text-decoration: none;">[공지사항]</a></th>
					</tr>
					<c:forEach items="${list }" var="l">
						<tr>
							<td align="left" style="font-size: 15px;"><a
								href="detail.do?b_no=${l.b_no }">${l.b_title }</a></td>
						</tr>
					</c:forEach>
				</table>
			</div>

			<div id="totalboard2">
				<table>
					<tr>
						<th><a href="./notice.do" style="text-decoration: none;">[이달의추천]</a></th>
					</tr>
					<c:forEach items="${k_list }" var="k">
						<tr>
							<td align="left" style="font-size: 15px;"><a
								href="detail.do?b_no=${k.b_no }">${k.b_title }</a></td>
						</tr>
					</c:forEach>
				</table>
			</div>

			<div id="totalboard3">
				<table>
					<tr>
						<th><a href="./news.do" style="text-decoration: none;">[이달의새소식]</a></th>
					</tr>
					<c:forEach items="${n_list }" var="n">
						<tr>
							<td align="left" style="font-size: 15px;"><a
								href="detail.do?b_no=${n.b_no }">${n.b_title }</a></td>
						</tr>
					</c:forEach>
				</table>
			</div>

			<!-- 하단 -->
			<div id="totalboard4">
				<table>
					<tr>
						<th><a href="brand1.do?b_cate1=b1"
							style="text-decoration: none;">[브랜드1]</a></th>
					</tr>
					<c:forEach items="${b1_list }" var="b1">
						<tr>
							<td align="left" style="font-size: 15px;"><a
								href="detail.do?&b_no=${b1.b_no }">${b1.b_title }</a></td>
						</tr>
					</c:forEach>
				</table>
			</div>

			<div id="totalboard5">
				<table>
					<tr>
						<th><a href="brand2.do?b_cate1=b2"
							style="text-decoration: none;">[브랜드2]</a></th>
					</tr>
					<c:forEach items="${b2_list }" var="b2">
						<tr>
							<td align="left" style="font-size: 15px;"><a
								href="detail.do?b_no=${b2.b_no }">${b2.b_title }</a></td>
						</tr>
					</c:forEach>
				</table>
			</div>

			<div id="totalboard6">
				<table>
					<tr>
						<th><a href="brand3.do?b_cate1=b3"
							style="text-decoration: none;">[브랜드3]</a></th>
					</tr>
					<c:forEach items="${b3_list }" var="b3">
						<tr>
							<td align="left" style="font-size: 15px;"><a
								href="detail.do?b_no=${b3.b_no }">${b3.b_title }</a></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>

		<%@ include file="bottonmenu.jsp"%>
	</div>
</body>

</html>
