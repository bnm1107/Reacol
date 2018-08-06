<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="UTF-8">
<title>Reacol</title>
<link href='https://fonts.googleapis.com/css?family=Roboto'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">

<link rel='stylesheet prefetch'
	href='http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css'>
<link rel='stylesheet prefetch'
	href='https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css'>
<link rel='stylesheet prefetch'
	href='https://fonts.googleapis.com/css?family=Open+Sans:600'>

<link rel="stylesheet" href="css/adstyle.css">


</head>
<body>
	<header id="header">
	<form action="home" method="post">
		<input type="image" src="images/Reacol.PNG" />
	</form>
	</header>

	<h2>관리자 테이블</h2>
	<div class="container">
		<div class="Btn">
			<button id="button" value="회원 관리"></button>
		</div>
		<div class="Btn">
			<button id="button1" value="게시물 관리"></button>
		</div>
	</div>

	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script
		src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js'></script>
	<script src="js/adindex.js"></script>
	<script type="text/javascript">
document.getElementById("button").addEventListener("click", function(){
	document.location.href = "AdminMember";
});
document.getElementById("button1").addEventListener("click", function(){
	document.location.href = "AdminBoard";
});
</script>




</body>
</html>