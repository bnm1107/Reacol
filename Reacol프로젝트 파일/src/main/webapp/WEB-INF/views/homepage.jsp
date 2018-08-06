<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<title>Reacol</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="css/main.css" />
		<noscript><link rel="stylesheet" href="css/noscript.css" /></noscript>
		
		<script type="text/javascript">
			function logoutPro(){
				location.href="logout";
			}
			function Modify(){
				location.href="Member_Modify";
			}
			
		
		</script>
	</head>
	<body class="is-preload">

		<!-- Sidebar -->
			<section id="sidebar">
				<div class="inner">
					<nav>
						<ul>
							<li><a href="#intro">홈</a></li>
							<li><a href="#one">게시판</a></li>
							<!--<li><a href="#two">What we do</a></li>-->
						</ul>
					</nav>
					<div class="logincheck">
				<%
				if(session.getAttribute("loginProcess")==null) {
					%>
					<h5>로그인 정보가 없습니다.</h5>
					<%
				} else{
				%> <h4><%=(String)session.getAttribute("id") %>님 환영합니다.</h4>
					<input type="button" value="로그아웃" onclick="logoutPro()"/>
					<input type="button" value="회원 정보 수정" onclick="Modify()" style="margin-top:10px;">
				<%}%>
				</div>
				</div>		
			</section>

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Intro -->
					<section id="intro" class="wrapper style1 fullscreen fade-up">
						<div class="inner">
							<h1>Reacol</h1>
							<p>환영합니당 
								<br>로그인을 하려면 아래버튼을 눌러주세요</p>
							<ul class="actions">
							<form action="Login" method="post">
								<li><input type="submit" value="click"/></li>
							</form>
							</ul>
						</div>
					</section>

				<!-- One -->
					<section id="one" class="wrapper style2 spotlights">
						<section>
							<a class="image"><img src="images/pic01.jpg" alt="" data-position="center center" /></a>
							<div class="content">
								<div class="inner">
									<h2>게시판</h2>
									<p>게시판으로 가려면 아래를 클릭</p>
									<form action="Board" method=post>
									<ul class="actions">
										<li><input type="submit" value="click"></li>
									</ul>
									</form>
								</div>
							</div>
						</section>
					</section>

		<!-- Footer -->
			<footer id="footer" class="wrapper style1-alt">
				<div class="inner">
					<ul class="menu">
					</ul>
				</div>
			</footer>

		<!-- Scripts -->
			<script src="js/jquery.min.js"></script>
			<script src="js/jquery.scrollex.min.js"></script>
			<script src="js/jquery.scrolly.min.js"></script>
			<script src="js/browser.min.js"></script>
			<script src="js/breakpoints.min.js"></script>
			<script src="js/util.js"></script>
			<script src="js/main.js"></script>

	</body>
</html>