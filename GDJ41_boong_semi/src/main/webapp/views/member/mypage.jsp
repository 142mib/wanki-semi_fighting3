<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp" %>

<style>
nav{
	width: 240px;
	background-color: #288ad8;
	border-right: 1px sold #ddd;
	position: fixed;
	height: 100%;
	padding-top: 40px;
}
h1{
	font-size: 30px;
	padding: 20px 30px;
}
.side-bar-menu{
	display: block;
	height: 30px;
	padding-bottom: 10px;
}
.side-bar-menu:hover{
	backgound-color: yellow;
}
#side-bar>div a{
	padding: 8px 30px;
	font-size: 20px;
	color: white;
	text-decoration: none;
}
/* #side-bar>div a:hover{
	backgound-color: yellow;
	color: navy;
} */

section{
	padding: 70px 20px 20px 220px;
	min-height: 800px;
}
#mypage-container{
	border: 1px solid black;
	padding: 0 60px;
	margin-left: 100px;
	margin-right: 50px;
	margin-top: 100px;
	display: block;
	text-align: center; 
}
h2{padding: 0 60px; margin-left:45px;}

/* 테이블페이지 */
body {
  background-color: #eefbfb;
  font-family: sans-serif;
  font-size: 16px;
}

.mypage-table {
  color: grey;
  text-align: center;
  padding-left: 80px;
}

.headings, .table {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-pack: justify;
  -ms-flex-pack: justify;
  justify-content: space-between;
  margin-bottom: 1em;
  padding: 1em;
}

.heading {
  flex-basis: 33.333%;
  font-weight: bold;
}

.table {
  border-radius: 2em;
  background-color: white;
  margin-bottom: 20px;
  -moz-box-shadow: 0 0 3px grey;
  -webkit-box-shadow: 0 0 3px grey;
  box-shadow: 0 0 5px grey;

}

span {
  flex-basis: 33.333%;
}

a {
  text-decoration: none;
  color: #4c4c4c;
}


</style>


	<nav id="side-bar">
		<h1>마이페이지</h1>
		<div class="side-bar-menu"><span>회원이름</span><button>로그아웃</button></div>
		<div class="side-bar-menu"><a href="#내정보">내정보 수정</a></div>
		<div class="side-bar-menu"><a href="#주문내역">주문 내역</a></div>
		<div class="side-bar-menu"><a href="#회원탈퇴">회원 탈퇴</a></div>
	</nav>
<section>
	<div class="mypage-container">
  <div class="mypage-table">
    <div class="headings">
      <span class="heading">아이디</span>
      <span class="heading">이름</span>
      <span class="heading">성별</span>
      <span class="heading">전화번호</span>
      <span class="heading">주소</span>
      <span class="heading">보유차종</span>
      <span class="heading">관심차종</span>
      <span class="heading">가입일</span>
    </div>

    <div class="table">
      <span>회원이</span>
      <span>DD MM YY</span>
      <span>DD MM YY</span>
      <span>DD MM YY</span>
      <span>DD MM YY</span>
      <span>DD MM YY</span>
      <span>DD MM YY</span>
      <span>DD MM YY</span>
    </div>

    <div class="table">
      <span>Name</span>
      <span>DD MM YY</span>
      <span>DD MM YY</span>
      <span>DD MM YY</span>
      <span>DD MM YY</span>
      <span>DD MM YY</span>
      <span>DD MM YY</span>
      <span>DD MM YY</span>
      <span>DD MM YY</span>

    </div>
  </div>
</div>

</section>



<%@ include file="/views/common/footer.jsp"%>