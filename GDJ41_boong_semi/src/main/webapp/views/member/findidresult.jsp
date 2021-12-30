 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.boong.member.model.vo.Member" %>
<%
	Member m=(Member)request.getAttribute("member");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOONG 아이디 찾기</title>
</head>
<style>
.btn{
	width:110px; height:40px;
	border:none;
	border-radius: 10px;
	cursor:pointer; 
	background:seagreen; color:white;
	font-size:15px;
	margin-bottom: 30px;
}
div{
margin-bottom: 40px;
text-align:center;
}

</style>

<body style="padding:0 20px;">
	<div>
		<h2 style="color:seagreen;">아이디 찾기 결과</h2>
	<hr>
	</div>
	<div>
		<h3><%=m.getMemberName() %>님의 아이디는 <span style="color:seagreen; font-size:28px;"><%=m.getMemberId() %></span>입니다.</h3>
		<p>가입일은 <%=m.getEnrollDate() %>입니다.</p>
	</div>
	<div>
		<input class="btn" type="button" value="닫기" onclick="window.close();">
	</div>
</body>

</html>