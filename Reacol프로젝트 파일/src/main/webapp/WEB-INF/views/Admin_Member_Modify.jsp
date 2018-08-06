<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
  <meta charset="UTF-8">
  <title>Reacol</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
  	<link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Roboto:100,500,300,700,400'>
	<link rel="stylesheet" href="css/MemModify.css">
</head>
<body>
    <header id="header">
        <form action="home" method="post">
        <input type="image" src="images/Reacol.PNG"/>
        </form>
      </header>
  <div class="aa_htmlTable">
      
  <h2 class="aa_h2">회원정보 수정</h2>
  <table>
    <thead>
      <tr>
        <th>이름</th>
        <th><input type="text" value="${list.name}" id="name"/></th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>비밀번호</td>
        <td><input type="password" id="password1"/></td>
      </tr>
      <tr>
        <td>비밀번호확인</td>
        <td><input type="password"/ id="password2"></td>
      </tr>
    </tbody>
    <tfoot>
      <tr>
        <td>이메일</td>
        <td><input type="text" value="${list.email}" id="email"/></td>
      </tr>
    </tfoot>
  </table>
  <input type="hidden" value="${list.id}" id="id"/>
  <button id="accept">확인</button>
</div> 

<script type="text/javascript">
document.getElementById("accept").addEventListener("click", function(){
	var id = document.getElementById("id").value;
	var name = document.getElementById("name").value;
	var password1 = document.getElementById("password1").value;
	var password2 = document.getElementById("password2").value;
	var email = document.getElementById("email").value;
	
	if(name==""||password1==""||password2==""||email=="") {
		alert("내용을 모두다 입력하세요");
	} else {
		if(password1==password2) {
			document.location.href = "memberModifyProcess?id="+id+"&name="+name+"&password="+password1+"&email="+email;
		}else{
			alert("비밀번호가 일치하지 않습니다");
		}
	}
	
	
});
</script>
</body>

</html>