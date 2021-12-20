<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String saveId=null;
	Cookie[] cookies=request.getCookies();
	if(cookies!=null){
		for(Cookie c : cookies){
			if(c.getName().equals("saveId")){
				saveId=c.getValue();
				break;
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOONG 로그인</title>
</head>
<style>
body{
	background-color: lightgray;
	display:flex;
	justify-content: center;
	align-items: center;
	min-height:100vh;
	}
div.login-container{
	width:550px;
	height: 600px;
	border: 1px solid #288ad8;
	border-radius: 20px;
	border-shadow: 5px 5px 5px 5px gray;
	background-color: white;
	display:flex;
	justify-content: center;
	align-items: center;
	
	
}
tr{
	height: 40px;
}
td.login-input>input{
	width: 446px;
	height: 45px;
	border-radius: 8px;
	border: solid #288ad8 1px;
	background-color: #dee2e6;
}
.login-button{
	width: 450px;
	height: 45px;
	border-radius: 8px;
	border: none;
	background-color: #288ad8;
	color: white;
	cursor:pointer;
}
.signUp-button{
	width: 450px;
	height: 45px;
	border-radius: 8px;
	border: none;
	background-color: black;
	color: white;
	cursor:pointer;
}
.login{
	text-align:center;
	font-size: 30px;
	color:#288ad8;
}
img{
	width: 32px;
	height: 32px;
}
#x-btn{
	display:flex;
	position: relative;
	top: -43%;
	right: -85%;
	cursor: pointer;
}
table, h2{
	position: relative;
	left: -3%;
}
.text1{font-size:14px; color:gray;}
.text2{font-size:14px; font-style:bold; vertical-align:bottom;}
</style>
<body>
		<div class="login-container">
			<a id="x-btn" onclick="closeTab();"><img src="<%=request.getContextPath() %>/assets/img/member/icon_close.png"></a>
			<form id="loginForm" action="<%=request.getContextPath() %>/member/loginend.do" method="post">
				
			<h2 class="login">BOONG</h2>
			<table>
				<tr>     
					<td class="login-input">
						<input type="text" name="memberId" value="<%=saveId!=null?saveId:"" %>" placeholder="아이디">
					</td>
				</tr>
				<tr>
					<td class="login-input">
						<input type="password" name="memberPw" value="" placeholder="비밀번호">
					</td>
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="saveId" id="saveId" <%=saveId!=null?"checked":"" %>>
						<label for="saveId" class="text1">아이디 저장하기</label>&nbsp&nbsp&nbsp
					<td>
				</tr>
				<tr>
					<td>
						<input class="login-button" type="submit" value="로그인">
					</td>
				</tr>
				<tr>
					<td class="text2">아직 회원이 아니라면?<td>
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
		
<script>
	function closeTab(){
		window.close();
	}
</script>
		
		
</body>
</html>