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

.box{
	width: 300px; height: 40px; 
	padding: 10px; border-radius: 8px; 
	border: solid #288ad8 1px; 
	background-color: #dee2e6;
	margin-bottom: 20px;
}
.menuicon{
width: 30px; height: 30px; margin-right:10px;
}
#mypage-content1{
	display: inline-block;
}

/* 테이블 style */
.styled-table {
    border-collapse: collapse;
    margin: 25px 0;
    font-size: 0.9em;
    font-family: sans-serif;
    min-width: 400px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
}
.styled-table thead tr {
    background-color: darkcyan;
    color: #ffffff;
    text-align: left;
}
.styled-table th,
.styled-table td {
    padding: 12px 15px;
}
.styled-table tbody tr {
    border-bottom: 1px solid #dddddd;
}

.styled-table tbody tr:nth-of-type(even) {
    background-color: #f3f3f3;
}

.styled-table tbody tr:last-of-type {
    border-bottom: 2px solid #009879;
}
.styled-table tbody tr.active-row {
    font-weight: bold;
    color: #009879;
}
</style>


	<nav id="side-bar">
		<h1>관리자</h1>
		<div class="side-bar-menu"><a href="#회원정보"><img class="menuicon" src="<%=request.getContextPath() %>/assets/img/member/avatar.png">내정보</a></div>
		<div class="side-bar-menu"><a href="#주문내역"><img class="menuicon" src="<%=request.getContextPath() %>/assets/img/member/shopping-cart.png">주문 내역</a></div>
		<div class="side-bar-menu"><a href="#회원탈퇴"><img class="menuicon" src="<%=request.getContextPath() %>/assets/img/member/delete.png">회원 탈퇴</a></div>
	</nav>
<section>
	<div class="mypage-container">
		<table class="styled-table">
			
			<thead>
				<tr>
				<th>No.</th>
				<th>아이디</th>
				<th>이름</th>
				<th>성별</th>
				<th>이메일</th>
				<th>휴대폰 번호</th>
				<th>주소</th>
				<th>보유 차량</th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			</tbody>
		
		</table>
	</div>
</section>



<%@ include file="/views/common/footer.jsp"%>