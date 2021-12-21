<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.boong.member.vo.Member"%>
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
        <script src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
    </head>
        <body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light fixed-top " id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="<%=request.getContextPath()%>/index.jsp">BOONG</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto my-2 my-lg-0">
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
                   			<p id="after-login" class="text-white-75 mb-4"><%=loginMember.getMemberName() %> 님 ▼</p>
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
        
        
        
        
    <style>
      
      /* 드롭다운버튼 */
	.dropbtn {
	  background-color: rgba( 255, 255, 255, 0 );
	  color: white;
	  font-size: 16px;
	  border: none;
	}
	.dropdown {position: relative; display: inline-block;}
	.dropdown-content {
	  display: none;
	  position: absolute;
	  background-color: #f1f1f1;
	  min-width: 120px;
	  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	  z-index: 1;
	  margin-left:40px;
	}
	.dropdown-content a {
	  color: black;
	  font-size: 14px;
	  padding: 12px 16px;
	  text-decoration: none;
	  display: block;
	  cursor:pointer;
	}
	.dropdown-content a:hover {background-color: #ddd;}	
	.dropdown:hover .dropdown-content {display: block;}     
    div#after-login-box {display:inline; margin-left:30px;}
    #mypage-icon{width:36px; margin-left:30px; cursor:pointer; display:inline; margin-bottom:5px;}
    #after-login{font-size:14px; display:inline; cursor:pointer;}
    #login-btn{
        background-color:#288ad8; 
       	border:none; border-radius: 10px; 
       	font-family:"Merriweather Sans", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
       	color:white;
       	width: 80px;
       	height: 32px;
       	margin-left: 30px;
    }
    #login-btn:hover{
       	background-color:white;
       	opacity: 0.6;
       	color: #288ad8;
    }
    #logout-btn{
       	background-color:#288ad8; 
       	border:none; border-radius: 10px; 
       	font-family:"Merriweather Sans", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
       	color:white;
       	width: 80px;
       	height: 32px;
       	margin-left: 30px;
    }

   </style>
       