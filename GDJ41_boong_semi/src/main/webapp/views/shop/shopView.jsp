<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ page import="com.boong.shop.model.vo.*" %>
<% Product p=(Product)request.getAttribute("product");  %>

    
<%@ include file="/views/common/header.jsp"%>
<div style="height: 63px; background-color: rgba(1,138,216,1)"></div>

<style>
	#sv-container{width:80%; height:80%; text-align: center; margin: 0 10% 0 10%; display: flex;}	
	#sv-container>.img-container{width:50%; height:50%; text-align: center; border: 1px solid red;}
	#sv-container>.content-container{width:50%; height:50%; text-align: center; border: 1px solid red;}
	
	
</style>

<section id="sv-container">
	<div class="img-container">
		<img src="<%= request.getContextPath() %>/upload/shop/<%= p.getShopProductImageRename() %>">
		<h2>img container</h2>
	
	</div>
	<div class="content-container">
		<h2>content container</h2>
	</div>
	












</section>
<%@ include file="/views/shop/shopcommon/shopFooter.jsp"%>