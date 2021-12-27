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
<body>
	<div>
		<h2>찾으시는 아이디는 <%=m.getMemberId() %>입니다.</h2>
		<p>가입일 <%=m.getEnrollDate() %></p>
	</div>
</body>
</html>