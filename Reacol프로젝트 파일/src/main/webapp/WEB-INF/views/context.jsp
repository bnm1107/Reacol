<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="UTF-8">
<title>Reacol</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">


<link rel="stylesheet" href="css/TableStyle.1.css">


</head>
<body>
	<header id="header">
	<form action="home" method="post">
		<input type="image" src="images/Reacol.PNG" />
	</form>
	</header>
	<section>
	<h1>게시판</h1>

	<div class="tbl-header">
		<table cellpadding="0" cellspacing="0" border="0">
			<thead>
				<tr>
					<th>${list.title}</th>
				</tr>
			</thead>
		</table>
	</div>
	<div class="tbl-content">
		<table cellpadding="0" cellspacing="0" border="0">
			<tbody>
				<tr>
					<td>${list.context}</td>
				</tr>
			</tbody>
		</table>
	</div>
		<div class="contextBtn1" style="float:right">
		<form action="delete" method="post">
			<input type="hidden" name="no" value="${list.no }">
			<input type="hidden" name="id" value="${list.id }">
			<input type="submit" value="글 삭제" />
		</form>
		</div>
		<div class="contextBtn2" style="float:right; margin-right:10px">
		<form action="modify" method="post">
			<input type="hidden" name="no" value="${list.no }">
			<input type="hidden" name="id" value="${list.id }">
			<input type="submit" value="글 수정" />
		</form>
	</div>
	
	</section>


	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src="js/Table.js"></script>




</body>

</html>