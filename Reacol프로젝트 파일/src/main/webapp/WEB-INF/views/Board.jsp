<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="UTF-8">
<title>Reacol</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">


<link rel="stylesheet" href="css/TableStyle.css">


</head>

<body>
	<header id="header">
	<form action="home" method="post">
		<input type="image" src="images/Reacol.PNG"/>
	</form>
	</header>
	<section> <!--for demo wrap-->
	<h1>게시판</h1>
	<div class="tbl-header">
		<table cellpadding="0" cellspacing="0" border="0">
			<thead>
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성시간</th>
					<th>조회수</th>
				</tr>
			</thead>
		</table>
	</div>
	<div class="tbl-content">
		<table cellpadding="0" cellspacing="0" border="0">
			<tbody>
				<c:forEach items="${list}" var="vo">
					<tr>
						<td>${vo.no}</td>
						<td><a href="context?no=${vo.no}" style="color: white">${vo.title}</a></td>
						<td>${vo.id}</td>
						<td>
						<fmt:formatDate value="${vo.time}" pattern="yyyy.MM.dd"/>
						</td>
						<td>${vo.hits}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div style="float:right">
		<form action="boardMake" method="post">
		<input type="submit" value="글 작성" />
		</form>
	</div>
	</section>

	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src="js/Table.js"></script>




</body>

</html>