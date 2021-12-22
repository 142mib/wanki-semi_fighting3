<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<div id="blank" style="width:100%; height: 70px; background-color: darkcyan;"></div>
<style>
nav#side-bar{
	width: 260px;
	background-color: #dcdcde;
	border-right: 1px solid #ddd;
	position: absolute;
	height: 100%;
	padding-top: 60px;
	padding-left:100px;
	
}
h1{
	font-size: 30px;
	padding-top: 20px;
	padding-bottom: 40px;
}
.side-bar-menu{
	display: block;
	height: 50px;
	padding-bottom: 10px;
	
}
.side-bar-menu:hover{
	backgound-color: yellow;
}
#side-bar>div a{
	padding: 10px 0;
	font-size: 16px;
	color: white;
	text-decoration: none;
}
/* #side-bar>div a:hover{
	backgound-color: yellow;
	color: navy;
} */

section{
	padding: 100px 20px 100px 220px;
	height: 100%;
	background-color: #dcdcde;
}
.mypage-container{
	width: 80%;
	height: 600px;
	background-color: white;
	border: none;
	border-radius: 10px;
	padding: 30px 60px;
	margin-left: 100px;
	margin-top: 20px;
	display: block;
	box-shadow: 5px 5px 5px 5px lightgray;
}
h2{padding: 0 60px; margin-left:45px;}
ul{list-style:none; margin-top: 30px;}

.menuicon{
	width: 30px; height: 30px; margin-right:10px;

</style>


	<nav id="side-bar">
		<h1>관리자</h1>
		<div class="side-bar-menu"><a href="#내정보"><img class="menuicon" src="<%=request.getContextPath() %>/assets/img/member/avatar.png">회원 정보</a></div>
		<div class="side-bar-menu"><a href="#비밀번호 변경"><img class="menuicon" src="<%=request.getContextPath() %>/assets/img/member/avatar.png">게시판 관리??</a></div>
		<div class="side-bar-menu"><a href="#주문내역"><img class="menuicon" src="<%=request.getContextPath() %>/assets/img/member/shopping-cart.png">주문 관리??</a></div>
		<div class="side-bar-menu"><a href="#회원탈퇴"><img class="menuicon" src="<%=request.getContextPath() %>/assets/img/member/delete.png">등등등</a></div>
	</nav>
<section>
	<div class="mypage-container">
		<h3>관리 페이지</h3>
		<p>안녕하세요, <%=loginMember.getMemberName() %> 님!</p>
		<hr>
		<div id="mypage-content1">
		<table>
			
			
			
		</table>
	</div>
</section>



<%@ include file="/views/common/footer.jsp"%>