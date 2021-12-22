<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.boong.member.vo.Member" %>
<%
	Member m=(Member)request.getAttribute("member");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 확인</title>
</head>
<body>
	<header>
		<h3>아이디 중복 확인</h3>
		<hr>
	</header>
	<section>
		<div id="checkId-container">
	<%if(m==null){ %>
			<span><strong><%=request.getParameter("memberId") %></strong></span>는 사용가능합니다.	
			<br><br>
			<button type="button" id="btn">사용하기</button>
	<%}else{ %>
			<span id="duplicated"><strong><%=m.getMemberId() %></strong></span>는 사용중입니다.
			<br><br>
			<!-- 아이디 재입력창 구성 -->
			<form action="<%=request.getContextPath() %>/member/idDuplicate.do" method="post">
				<input type="text" name="memberId" id="memberId">
				<input type="submit" value="중복검사">
			</form>
	<%} %>
	</div>
	</section>
	
	<script>
		const el=document.querySelector("#btn").addEventListener("click",e=>{
			const memberId='<%=request.getParameter("memberId")%>';
			opener.signUpForm.memberId.value=memberId;
			opener.signUpForm.memberPw.focus();
			close();
		});
	</script>
</body>

<style>
header{
	height: 50px;
	color:#288ad8;
}
section{
	margin-top: 30px;
	text-align:center;
}
span{color:blue; text-style:bold;}
</style>

</html>