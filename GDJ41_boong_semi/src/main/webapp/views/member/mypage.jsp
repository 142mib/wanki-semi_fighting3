<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp" %>
<div id="blank" style="width:100%; height: 70px; background-color: darkcyan;">
	</div>
<style>
nav#side-bar{
	width: 260px;
	background-color: #288ad8;
	border-right: 1px sold #ddd;
	position: absolute;
	height: 100%;
	padding-top: 70px;
	padding-left:100px;
	
}
h1{
	font-size: 30px;
	padding: 30px 0;
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
	font-size: 20px;
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
}
.mypage-container{
	width: 80%;
	height: 500px;
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
li{float:left;margin-left:10px;}

.box{
	width: 200px; height: 40px; 
	padding: 10px; border-radius: 8px; 
	border: solid #288ad8 1px; 
	background-color: #dee2e6;
}
.menuicon{
width: 30px; height: 30px; margin-right:10px;
}
</style>


	<nav id="side-bar">
		<h1>마이페이지</h1>
		<div class="side-bar-menu"><span><%=loginMember.getMemberName() %> 님</span></div>
		<div class="side-bar-menu"><a href="#내정보"><img class="menuicon" src="<%=request.getContextPath() %>/assets/img/member/avatar.png">내정보</a></div>
		<div class="side-bar-menu"><a href="#주문내역"><img class="menuicon" src="<%=request.getContextPath() %>/assets/img/member/shopping-cart.png">주문 내역</a></div>
		<div class="side-bar-menu"><a href="#회원탈퇴"><img class="menuicon" src="<%=request.getContextPath() %>/assets/img/member/delete.png">회원 탈퇴</a></div>
	</nav>
<section>
	<div class="mypage-container">
		<h3>내정보 보기</h3>
		<p>정보를 확인하고 변경하세요.</p>
 		<ul>
        	<li>
        	<span>아이디</span><br>
        		<input type="text" class="box" name="memberId" id="memberId_" >
			</li>
			<li>
				<span>비밀번호</span><br>
				<input type="password" class="box" name="memberPw" id="memberPw_" ><br>
			</li>
			
			<li>
				<span>비밀번호 확인</span><br>
				<input type="password" class="box" id="memberPw_2" ><br>
				<span id="pwresult"></span>
			</li>
			
			<li>
				<span>이름</span><br>
				<input type="text" class="box" name="memberName" id="memberName" ><br>
			</li>
			<li>
				<span>성별</span><br>
				<input type="radio" name="gender" id="gender0" value="M" >
				<label for="gender0">남</label>
				<input type="radio" name="gender" id="gender1" value="F">
				<label for="gender1">여</label>
			</li>	
			<li>
				<span>이메일</span><br>
				<input type="email" class="box" placeholder="abc@xyz.com" name="email" id="email"><br>
			</li>
			
			<li>
				<span>휴대폰 번호</span><br>
				<input type="tel" class="box" placeholder="(-없이)01012345678" name="phone" id="phone" maxlength="11" required><br>
			</li>
			<li>
				<span>주소</span><br>
				<input type="text" class="box" placeholder="" name="address" id="address"><br>
			</li>
			<li>
				<span>관심 전기차 브랜드</span><br>
					<input type="text" name="brand" id="brand10" value="Volvo"><label for="brand10">볼보</label>
		</ul>
	</div>
</section>



<%@ include file="/views/common/footer.jsp"%>