<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<head>
<title>Reacol</title>
<meta charset="utf-8" />
<link rel='stylesheet prefetch'
	href='https://fonts.googleapis.com/css?family=Open+Sans:600'>

<link rel="stylesheet" href="css/style.css">

</head>
<body>
	<script type="text/javascript">
	
	//컨트롤러에서 보낸 메세지가 있는지 확인하는 기능
	var outcome ='${outcome}';
	var url = '${url}';
	
	if(outcome!=""){
		alert(outcome);
		document.location.href = url; 
	} else{
	}
</script>
	<!-- Header -->
	<header id="header">
	<form action="home" method="post">
		<input type="image" src="images/Reacol.PNG" />
	</form>
	</header>

	<div class="login-wrap">
		<div class="login-html">
			<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label
				for="tab-1" class="tab">로그인</label> <input id="tab-2" type="radio"
				name="tab" class="sign-up"><label for="tab-2" class="tab">회원가입</label>
			<div class="login-form">
				<div class="sign-in-htm">


					<div class="group">
						<label for="user" class="label">아이디</label> <input id="logid"
							type="text" class="input">
					</div>
					<div class="group">
						<label for="pass" class="label">비밀번호</label> <input id="logpass"
							type="password" class="input">
					</div>
					<div class="group">
						<button id="login" class="button">로그인</button>
					</div>
					<div class="hr"></div>
					<div class="foot-lnk">
						<!-- <a href="#forgot">비밀번호를 잊어버리셨나요?</a> -->
					</div>

				</div>
				<div class="sign-up-htm">

					<div class="group">
						<label for="user" class="label">아이디</label> <input id="id"
							type="text" class="input">
					</div>
					<div class="group">
						<label for="user" class="label">이름</label> <input id="name"
							type="text" class="input">
					</div>
					<div class="group">
						<label for="pass" class="label">비밀번호</label> <input id="pass"
							type="password" class="input">
					</div>
					<div class="group">
						<label for="pass" class="label">비밀번호 확인</label> <input
							id="passcheck" type="password" class="input">
					</div>
					<div class="group">
						<label for="pass" class="label">이메일</label> <input id="email"
							type="text" class="input">
					</div>
					<div class="group">
						<button class="button" id="join">회원가입</button>
					</div>
					<div class="hr"></div>
					<div class="foot-lnk">
						<!-- <label for="tab-1">이미 회원이신가요?</a> -->
					</div>



				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
document.getElementById("join").addEventListener("click", function(){
	var id = document.getElementById("id").value;
	var name = document.getElementById("name").value;
	var password1 = document.getElementById("pass").value;
	var password2 = document.getElementById("passcheck").value;
	var email = document.getElementById("email").value;
	var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	
	if(id==""||name==""||password1==""||password2==""||email=="") {
		alert("모든 내용을 입력하세요");
	} else{
		if(exptext.test(email)==false){
			//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐 경우
			alert("이메일 형식이 올바르지 않습니다.");

			} else{
				if(password1==password2) {
					document.location.href = "joinprocess?id="+id+"&name="+name+"&pass="+password1+"&email="+email;
				}else{
					alert("비밀번호가 일치하지 않습니다");
				}
			}
	}
	
});

document.getElementById("login").addEventListener("click", function(){
	var id = document.getElementById("logid").value;
	var password = document.getElementById("logpass").value;
	
	if(id==""||password==""){
		alert("모든 내용을 입력하세요");
	} else{
		document.location.href = "loginprocess?id="+id+"&password="+password;
	}
});
</script>


</body>

</html>