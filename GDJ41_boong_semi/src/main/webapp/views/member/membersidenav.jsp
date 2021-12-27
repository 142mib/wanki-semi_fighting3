<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
<style>

/* 내비바 */
* {
	list-style: none;
	text-decoration: none;
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Open Sans', sans-serif;
}

body {
	background: #f5f6fa;
}

.wrapper .sidebar {
	/* background: rgb(5, 68, 104); */
	background: steelblue;
	position: fixed;
	top: 0;
	left: 0;
	width: 225px;
	height: 100%;
	padding: 20px 0;
	transition: all 0.5s ease;
}

.wrapper .sidebar .profile {
	margin-bottom: 30px;
	text-align: center;
	padding-top: 120px;
}

.wrapper .sidebar .profile img {
	display: block;
	width: 100px;
	height: 100px;
	border-radius: 50%;
	margin: 0 auto;
}

.wrapper .sidebar .profile h3 {
	color: #ffffff;
	margin: 10px 0 5px;
}

.wrapper .sidebar .profile p {
	color: rgb(206, 240, 253);
	font-size: 14px;
}

.wrapper .sidebar ul li a {
	display: block;
	padding: 13px 30px;
	/* border-bottom: 1px solid #10558d; */
	color: rgb(241, 237, 237);
	font-size: 16px;
	position: relative;
	text-decoration: none;
}

.wrapper .sidebar ul li a .icon {
	color: #dee4ec;
	width: 30px;
	display: inline-block;
}

.wrapper .sidebar ul li a:hover, .wrapper .sidebar ul li a.active {
	color: #0c7db1;
	background: white;
	border-right: none /* 2px solid rgb(5, 68, 104) */;
	border-radius: 10px 0 0 10px;
}

.wrapper .sidebar ul li a:hover .icon, .wrapper .sidebar ul li a.active .icon
	{
	color: #0c7db1;
}

.wrapper .sidebar ul li a:hover:before, .wrapper .sidebar ul li a.active:before
	{
	display: block;
}

.wrapper .section {
	width: calc(100% - 225px);
	margin-left: 225px;
	transition: all 0.5s ease;
}

.wrapper .section .container {
	margin: 30px;
	background: #fff;
	padding: 50px;
	line-height: 28px;
}

body.active .wrapper .sidebar {
	left: -225px;
}

body.active .wrapper .section {
	margin-left: 0;
	width: 100%;
}
</style>
<body>

	<div class="wrapper">

		<div class="sidebar">
			<div class="profile">
				<img
					src="https://mblogthumb-phinf.pstatic.net/20140122_211/minarigirl_1390373052810NFmTp_PNG/Lisa_Simpson_-_256.png?type=w2"
					alt="profile_picture">
				<h3>여러분</h3>
				<p>환영합니다</p>
			</div>
			<ul>
				<li>
                    <a id="first-menu" href="<%=request.getContextPath()%>/member/mypageview.do">
                        <span class="icon"><i class="fas fa-user"></i></span>
                        <span class="item">내 프로필</span>
                    </a>
                </li>
                <li>
                    <a id="second-menu" href="<%=request.getContextPath()%>/member/changepw.do">
                        <span class="icon"><i class="fas fa-key"></i></span>
                        <span class="item">비밀번호 수정</span>
                    </a>
                </li>
                <li>
                    <a id="third-menu"href="#">
                        <span class="icon"><i class="fas fa-weight-hanging"></i></span>
                        <span class="item">주문내역</span>
                    </a>
                </li>
                <li>
                    <a id="fourth-menu" href="<%=request.getContextPath()%>/member/delete.do">
                        <span class="icon"><i class="fas fa-trash-alt"></i></span>
                        <span class="item">회원탈퇴</span>
                    </a>
                </li>

			</ul>
		</div>