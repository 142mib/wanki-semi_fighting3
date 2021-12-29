<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.boong.shop.model.vo.*" %>
<%
List<Product> list=(List)request.getAttribute("productList");
%>    
    
    <%@ include file="/views/common/header.jsp"%>


<style>
	section#pm-container{width:900px; margin:0 auto;padding-top:10px; text-align:center;}
	section#pm-container h2{margin:10px 0;}
	section#pm-container .enroll-btn{margin:5px; }
	section#pm-container .enroll-btn-container{width:100%; text-align: right;}
	table#tbl-pm{width:100%; margin:0 auto; /* border:1px solid black; */ border-collapse:collapse; clear:both; }
	table#tbl-pm th, table#tbl-pm td {border-top:2px solid #ddd;  padding: 5px 0; text-align:center;} 
	/*글쓰기버튼*/
	input#btn-add{float:right; margin: 0 0 15px;}
	/*페이지바*/
	div#pageBar{margin-top:10px; text-align:center; background-color:rgba(1,138,216,1);}
	div#pageBar span{color: white;}
</style>
	<div style="height: 63px; background-color: rgba(1,138,216,1)"></div>
	
	<%
		if(loginMember!=null&& loginMember.getMemberId().equals("admin"))  {
		%>
	<section id="pm-container">
		<h2>상품관리</h2>
		
			
		
		<div class="enroll-btn-container">
			<button class="enroll-btn" onclick="location.assign('<%=request.getContextPath()%>/shop/productEnroll.do')">상품등록</button>
		</div>
		
		<table id="tbl-pm">
			<tr>
				<th>상품번호</th>
				<th>상품명</th>
				<th>가격</th>
				<th>재고</th>
				<th>판매수</th>
				<th>등록일</th>
				<th>수정</th>
				<th>삭제</th>
				
			</tr>
			<%
			if(list.isEmpty()){
			%>
				<tr>
					<td colspan="8">조회된 상품이 없습니다</td>
				</tr>
			<%
			}else{ 
					for(Product p : list){
			%>
				<tr>
					<td><%=p.getShopProductId() %></td>
					<td>
						<a href="<%=request.getContextPath()%>/shop/shopView.do?shopProductId=<%=p.getShopProductId()%>">
							<%=p.getShopProductName() %>
						</a>
					</td>
					<td><%=p.getShopProductPrice() %></td>
					<td><%=p.getShopProductStock() %></td>
					<td><%=p.getShopProductSales() %></td>
					<td><%=p.getShopProductDate()  %></td>
					<td>
						<button onclick="location.assign('<%=request.getContextPath()%>/shop/productUpdate.do?shopProductId=<%=p.getShopProductId()%>')">수정</button>					
					</td>
					<td>
						<button onclick="location.assign('<%=request.getContextPath()%>/shop/productDelete.do?shopProductId=<%=p.getShopProductId()%>')">삭제</button>					
					</td>
					
				</tr>
			<%	}
			}%>
		</table>

		<div id="pageBar">
			<%=request.getAttribute("pageBar") %>
		</div>
	</section>
	<%
		}else{
		%>
		
		
		
	<%} %>

<%@ include file="/views/shop/shopcommon/shopFooter.jsp"%>