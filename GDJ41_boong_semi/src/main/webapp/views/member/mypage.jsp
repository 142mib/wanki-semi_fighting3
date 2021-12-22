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
	padding: 10px; 
	border-radius: 5px; 
	border: lightgray 1px solid;
	border-shadow: 3px 3px 3px 3px gray;
	
	margin-bottom: 20px;
}
.menuicon{
	width: 30px; height: 30px; margin-right:10px;
}
#mypage-content1{
	display: inline-block;
}
table{width:100%;}
td{
	/* border: 1px solid black; */
	min-width: 60px;
}
#edit-icon{
	width: 30px; height:30px; margin-right:10px;
	/* float:right; */
}
#edit-btn{
	width:160px; height: 50px;
	border:none;
	background-color: navy;
	color:white;
}
</style>


	<nav id="side-bar">
		<h1>마이페이지</h1>
		<div class="side-bar-menu"><a href="#내정보"><img class="menuicon" src="<%=request.getContextPath() %>/assets/img/member/avatar.png">내정보</a></div>
		<div class="side-bar-menu"><a href="#비밀번호 변경"><img class="menuicon" src="<%=request.getContextPath() %>/assets/img/member/avatar.png">비밀번호 변경</a></div>
		<div class="side-bar-menu"><a href="#주문내역"><img class="menuicon" src="<%=request.getContextPath() %>/assets/img/member/shopping-cart.png">주문 내역</a></div>
		<div class="side-bar-menu"><a href="#회원탈퇴"><img class="menuicon" src="<%=request.getContextPath() %>/assets/img/member/delete.png">회원 탈퇴</a></div>
	</nav>
<section>
	<div class="mypage-container">
		<h3>내정보 보기</h3>
		<p>안녕하세요, <%=loginMember.getMemberName() %> 님!</p>
		<hr>
		<div id="mypage-content1">
		<table>
			<tr>
			<td>
				<fieldset>아이디</fieldset>
        		<input type="text" class="box" name="memberId" id="memberId_" value="<%=loginMember.getMemberId() %>" readonly>
        	</td>
        	<td><td>
			<td>        	
				<fieldset>이름</fieldset>
				<input type="text" class="box" name="memberName" id="memberName" value="<%=loginMember.getMemberName() %>" readonly>
			</td>
			</tr>
			<tr>
				<td>
					<fieldset>성별</fieldset>
					<input type="text" class="box" name="memberGender" id="gender" value="<%=loginMember.getGender() %>" readonly>
					
				</td>
				<td><td>
				<td>
					<fieldset>가입일</fieldset>
					<input type="text" class="box" name="memberGender" id="memberName" value="<%=loginMember.getEnrollDate() %>" readonly>
				</td>
			</tr>
			<tr>
				<td>
					<fieldset>이메일</fieldset>
					<input type="email" class="box" placeholder="abc@xyz.com" name="email" id="email" value="<%=loginMember.getEmail() %>" readonly>
				</td>
				<td><td>
				<td>
					<fieldset>휴대폰 번호</fieldset>
					<input type="tel" class="box" placeholder="(-없이)01012345678" name="phone" id="phone" value="<%=loginMember.getPhone() %>" readonly>			
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<fieldset>주소</fieldset>
					<input type="text" class="box" placeholder="" name="address" id="address" value="<%=loginMember.getAddress() %>" readonly>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<fieldset>보유 차종</fieldset>
				<input type="text" class="box" name="brand" id="brand10" value="Volvo">
				</td>
				<td>
					<button id="edit-btn"><img id="edit-icon" src="<%=request.getContextPath() %>/assets/img/member/edit-icon.png">내정보 수정</button>
				</td>
			</tr>
			
			
	</table>
	</div>
</section>



<%@ include file="/views/common/footer.jsp"%>