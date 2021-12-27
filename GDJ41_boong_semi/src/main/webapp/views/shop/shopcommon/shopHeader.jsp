<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.boong.member.model.vo.Member"%>
<%
	Member loginMember=(Member)session.getAttribute("loginMember");
%>

    <!DOCTYPE html>
	<html lang="ko">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>BOONG~</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="<%=request.getContextPath()%>/assets/electric-car.png" />
        <!-- Bootstrap Icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Google fonts-->
        <link rel="preconnect" href="https://fonts.googleapis.com">
 		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  		<link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic" rel="stylesheet" type="text/css" />
        <!-- SimpleLightbox plugin CSS-->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="<%=request.getContextPath()%>/css/main/styles.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    	<script src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
    </head>
   
   		<!-- category menu  -->
    	<div class="w3-overlay" onclick="w3_close()" style="cursor:pointer" id="myOverlay"></div>  
    
    	<div class="w3-sidebar w3-bar-block w3-card w3-animate-left" style="display:none;margin-top:63px;z-index:5" id="mySidebar">
		
		  <button class="w3-bar-item w3-button w3-large"
		  id="sideBar" onclick="w3_close()">메뉴 닫기</button>
		  <a href="#" class="w3-bar-item w3-button">준비중입니다...</a>
		  
		</div>
    
    	
    	
        <body id="page-top">
        
        
        
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="mainNav">
            <div class="container px-4 px-lg-5">
                <button id="openNav" class="  w3-xlarge" onclick="w3_open()" style="margin-top:-4px; padding: 0.25rem 0.75rem; color:rgba(0, 0, 0, 0.55) ;line-height: 1;border-radius: 0.25rem;background-color:transparent; border:1px solid transparent ;" >&#9776;</button>
                <a class="navbar-brand" href="<%=request.getContextPath()%>/index.jsp">BOONG</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto my-2 my-lg-0">
                    	<%if(loginMember!=null&&loginMember.getMemberId().equals("admin")) {%>
                        <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/shop/productManage.do">Product Manage</a></li>
                        <%} %>
                        <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/map/mapview.do">Charge Map</a></li>
                        <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/carInfo/main.do">Car Info</a></li>
                        <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/shop/main.do">Shop</a></li>
                        <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/board/boardList.do">Community</a></li>
                     
                    </ul>
                    <!-- 여기 div추가 바꿈+스타일-->
                    
                    <div>
                    	<%if(loginMember==null) {%>
                    	<div>
                   			<button id="login-btn" onclick="window.open('<%=request.getContextPath()%>/member/login.do');">Log In</button>
                   		</div>
                   		<%}else{ %>
           				<div class="dropdown">
						 <a class="dropbtn"><img id="mypage-icon" src="<%=request.getContextPath()%>/assets/usericon.png"></a>
                   			<p id="after-login" class="text-white-75 mb-4 "><%=loginMember.getMemberName() %> 님 ▼</p>
						  <div class="dropdown-content">
							<a class="dropdown-item" href="#">My Page </a>  
							<a class="dropdown-item" onclick="location.replace('<%=request.getContextPath()%>/member/logout.do');">Logout </a>
						  </div>
						</div>
                   		<%} %>
                	</div>
                </div>
            </div>
        </nav>
        <div id="main">
        