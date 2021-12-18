<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!DOCTYPE html>
	<html lang="ko">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>BOONG~</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="<%=request.getContextPath()%>/assets/favicon.ico" />
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
    </head>
    
    <script>
    	
    	
    	function w3_open() {
    	  
    	  document.getElementById("main").style.marginLeft = "0%";
    	  document.getElementById("mySidebar").style.width = "20%";
    	  document.getElementById("mySidebar").style.display = "block";
    	  document.getElementById("mySidebar").style.backgroundColor = "rgba(255,255,255,0.7)";
    	  document.getElementById("openNav").style.display = 'inline-block';    	  
    	  document.getElementById("openNav").style.color = 'transparent';    	  
    	  document.getElementById("myOverlay").style.display = "block";
    	  
    	 
    	}
    	
    	
    	  
    	function w3_close() {
    	  document.getElementById("main").style.marginLeft = "0%";
    	  document.getElementById("mySidebar").style.display = "none";
    	  document.getElementById("openNav").style.display = "inline-block";
    	  document.getElementById("myOverlay").style.display = "none";
    	  document.getElementById("openNav").style.color = 'rgba(0, 0, 0, 0.55)'; 
    	 
    	}
    
    </script>
    
    	<div class="w3-overlay" onclick="w3_close()" style="cursor:pointer" id="myOverlay"></div>  
    
    	<div class="w3-sidebar w3-bar-block w3-card w3-animate-left" style="display:none;margin-top:63px;z-index:5" id="mySidebar">
		
		  <button class="w3-bar-item w3-button w3-large"
		  id="sideBar" onclick="w3_close()">메뉴 닫기</button>
		  <a href="#" class="w3-bar-item w3-button">Link 1</a>
		  <a href="#" class="w3-bar-item w3-button">Link 2</a>
		  <a href="#" class="w3-bar-item w3-button">Link 3</a>
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
                        <li class="nav-item"><a class="nav-link" href="">Product Manage</a></li>
                        <li class="nav-item"><a class="nav-link" href="">Charge Map</a></li>
                        <li class="nav-item"><a class="nav-link" href="">Car Info</a></li>
                        <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/shop/main.do">Shop</a></li>
                        <li class="nav-item"><a class="nav-link" href="">Community</a></li>
                        <li class="nav-item"><a class="nav-link" href="">Login</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <div id="main">
        