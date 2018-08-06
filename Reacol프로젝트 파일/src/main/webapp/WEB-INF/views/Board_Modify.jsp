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
<script type="text/javascript">
	
	//컨트롤러에서 보낸 메세지가 있는지 확인하는 기능
	var outcome ='${Msg}';
	var url = '${url}';
	
	if(outcome!=""){
		alert(outcome);
		document.location.href = url; 
	} else{
	}
</script>
	<header id="header">
	<form action="home" method="post" style="margin-top: 10px;">
		<input type="image" src="images/Reacol.PNG" />
	</form>
	</header>
	<form action="modifyProcess" method="post">
	<section>
	<h1>게시판</h1>

	<div class="tbl-header">
		<table cellpadding="0" cellspacing="0" border="0">
			<thead>
				<tr>
					<th>제목 : <input type="text" name="title" value="${list.title}"/></th>
				</tr>
			</thead>
		</table>
	</div>
	<div class="tbl-content">
		<table cellpadding="0" cellspacing="0" border="0">
			<tbody>
				<tr>
					<td>내용 : <input type="text" name="context" value="${list.context}" /></td>
				</tr>
			</tbody>
		</table>
	</div>
	<div style="float:right">
		<input type="hidden" name="no" value="${list.no }"/>
		<input type="submit" value="확인" />
	</div>
	</section>
	</form>

	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src="js/Table.js"></script>




</body>

</html>