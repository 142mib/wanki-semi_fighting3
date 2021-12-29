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
<link rel="icon" type="image/x-icon" href="<%=request.getContextPath()%>/assets/electric-car.png" />
<link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
</head>
<style>
body{
	/* background: linear-gradient(#80FFDB, #5390D9); */
	background: linear-gradient(45deg, #80FFDB, #5390D9);
	display:flex;
	justify-content: center; align-items: center;
	min-height:100vh;
}
div.login-container{
	width:500px; height: 600px;
	border-radius: 20px;
	border-shadow: 5px 5px 5px 5px gray;
	background-color: white;
	justify-content: center;
	align-items: center;
} 
#loginForm{
	display:flex;
	justify-content: center;
	align-items: center;
}
tr{
	height: 55px;
}
td.login-input>input{
	width: 385px; height: 45px;
	border-radius: 8px;
	border: solid #288ad8 1px;
	background-color: #dee2e6;
} 

.login-button{
	width: 390px; height: 45px;
	border-radius: 8px; border: none;
	background: linear-gradient(135deg, #855edd 0%, #63afd3 100%);
	color: white;
	cursor:pointer;
	font-size: 16px; font-weight:bold;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
}
.login-button:hover{
	background: linear-gradient(75deg, #855edd 30%, #63afd3 100%);
}
.signUp-button{
	width: 390px; height: 45px;
	border-radius: 8px; border: none;
	background: linear-gradient(65deg, #25aae1, #2bb673);
	color: white;
	cursor:pointer;
	font-size: 16px; font-weight:bold;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
}
.signUp-button:hover{
	background: linear-gradient(225deg, #25aae1 40%, #2bb673 90%);
}
.login{
	text-align:center;
	font-size: 36px; color:#288ad8; font-family: 'Gugi', cursive;
	margin-bottom:50px;
}
.login-inputbox{font-size: 14px;}
img{width: 25px; height: 25px;}
#x-btn{position:relative; margin-bottom: 50px; float:right; cursor: pointer; right:4%;}
.text1{font-size:14px; color:gray;}
.text2{font-size:14px; font-weight:bold; vertical-align:bottom; color:teal;}
.text3{float:right; font-size:14px; font-weight:bolder; color:#6868ac;}
</style>

<body>
		<div class="login-container">
			<div>
			<br>
				<a id="x-btn" onclick="location.assign('<%=request.getContextPath()%>')"><img src="<%=request.getContextPath() %>/assets/img/member/x.png"></a>
			</div>
			<br><br><br>
			<h2 class="login">BOONG</h2>
			<form id="loginForm" action="<%=request.getContextPath() %>/member/loginend.do" method="post">
				
			<table>
				<tr>     
					<td class="login-input">
						<input type="text" class="login-inputbox" name="memberId" value="<%=saveId!=null?saveId:"" %>" placeholder="&nbsp&nbsp아이디를 입력하세요" required autofocus>
					</td>
				</tr>
				<tr>
					<td class="login-input">
						<input type="password" class="login-inputbox" name="memberPw" value="" placeholder="&nbsp&nbsp비밀번호를 입력하세요" required>
					</td>
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="saveId" id="saveId" <%=saveId!=null?"checked":"" %>>
						<label for="saveId" class="text1">아이디 기억하기</label>&nbsp&nbsp&nbsp
						<a id="findPw" class="text3" style="cursor:pointer;" onclick="resetPwPopUp();">비밀번호 재설정</a> 
						<span class="text3"> &nbsp|&nbsp </span> 
						<a id="findId" class="text3" style="cursor:pointer;" onclick="findIdPopUp();">아이디 찾기</a>
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
		
		//아이디 찾기 기능
		function findIdPopUp(){
			const url="<%=request.getContextPath()%>/member/findid.do";
			const title="findId";
			const style="width=460, height=330";
			window.open(url,title,style);		
		};
		
		function resetPwPopUp(){
			const url="<%=request.getContextPath()%>/member/resetpw.do";
			const title="findPw";
			const style="width=460, height=420";
			window.open(url,title,style);
		};
		</script>
		
</body>
</html>