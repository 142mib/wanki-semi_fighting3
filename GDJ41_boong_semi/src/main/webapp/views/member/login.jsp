<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOONG 로그인</title>
</head>
<style>
body{
	background-color: lightgray;
	}
div.login-container{
	width: 400px;
	height: 500px;
	border: 1px solid #288ad8;
	border-radius: 20px;
	background-color: white;
	display: flex;
	margin: 0 auto;
	display:flex;
	justify-content: center;
	align-items: center;
	position: relative;
	transform: translate(0,20%);
}
tr{
	height: 40px;
}
td.login-input>input{
	width: 200px;
	height: 30px;
	border-radius: 8px;
	border: solid #288ad8 1px;
	background-color: #dee2e6;
}
.login-button{
	width: 205px;
	height: 35px;
	border-radius: 8px;
	border: none;
	background-color: #288ad8;
	color: white;
	cursor:pointer;
}
.signUp-button{
	width: 205px;
	height: 35px;
	border-radius: 8px;
	border: none;
	background-color: black;
	color: white;
	cursor:pointer;
	
}
.login{
	text-align:center;
	font-size: 30px;
}
img{
	width: 32px;
	height: 32px;
}
#x-btn{
	position: absolute;
	top:16px;
	right: 16px;
	
}

</style>
<body>
		<div class="login-container">
			<a id="x-btn" href="<%=request.getContextPath() %>"><img src="<%=request.getContextPath() %>/assets/img/member/icon_close.png"></a>
			<form id="loginForm" action="<%=request.getContextPath() %>/login.do" method="post">
				
			<h2 class="login">BOONG</h2>
			<table>
				<tr>     
					<td class="login-input">
						<input type="text" name="memberId" value="" placeholder="아이디">
					</td>
				</tr>
				<tr>
					<td class="login-input">
						<input type="password" name="memberPwd" value="" placeholder="비밀번호">
					</td>
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="saveId" id="saveId">
						<label for="saveId">아이디 저장하기</label>&nbsp&nbsp&nbsp
					<td>
				</tr>
				<tr>
					<td>
						<input class="login-button" type="submit" value="로그인">
					</td>
				</tr>
				<tr>
					<td>아직 회원이 아니라면?<td>
				</tr>
				<tr>
					<td>
						<input class="signUp-button" type="button" value="회원가입" 
							onclick="location.assign('<%=request.getContextPath() %>/member/signup.do');">
					</td>
				</tr>
			</table>
			</form>
		</div>
</body>
</html>