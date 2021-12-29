<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ page import="com.boong.shop.model.vo.*,java.util.List" %>
<%   
	List<Basket> list=(List)request.getAttribute("basket");
%>

    
<%@ include file="/views/common/header.jsp"%>

<style>
	section>div{width:80%; text-align: center;margin: 0 10% 0 10%;}
	section#pm-container{width:900px; margin:0 auto;padding-top:20px; text-align:center;}
	section#pm-container h2{margin:10px 0;}
	section#pm-container .enroll-btn{margin:5px; }
	section#pm-container .enroll-btn-container{width:100%; text-align: right;}
	table#tbl-pm{width:100%; margin:0 auto; margin-bottom:50px; /* border:1px solid black; */ border-collapse:collapse; clear:both; }
	table#tbl-pm th, table#tbl-pm td {border-top:2px solid #ddd;  padding: 5px 0; text-align:center;} 
	/*글쓰기버튼*/
	input#btn-add{float:right; margin: 0 0 15px;}
	/*페이지바*/
	div#pageBar{margin-top:10px; text-align:center; background-color:rgba(1,138,216,1);}
	div#pageBar span{color: white;}	
	#tbl-pm td>input{width:50px;}
	
</style>



	<div style="height: 63px; background-color: rgba(1,138,216,1)"></div>

	<section id="pm-container">
		<h2>장바구니</h2>
		
			
		
		<div class="enroll-btn-container">
			<form action="<%=request.getContextPath()%>/shop/orderEnroll.do" method="post">
			<input type="hidden" name="id" value="<%=loginMember.getMemberId()%>">
			<input class="enroll-btn" type="submit" value="주문하기" >		
			</form>
		</div>
		
		<table id="tbl-pm">
			<tr>
				<th colspan="2">상품명</th>
									
				<th>가격</th>
				<th>수량</th>
				<th>수정</th>
				<th>삭제</th>				
			</tr>
			<%
			if(list.isEmpty()){
			%>
				<tr>
					<td colspan="6">조회된 상품이 없습니다</td>
				</tr>
			<%
			}else{ 
					for(Basket b : list){
			%>
				<tr>
					<td width="200px" height="100px" style="background-size:cover ;background-image:url('<%=request.getContextPath()%>/upload/shop/<%=b.getShopProductImageRename()%>');" ></td>
					<td>
						<a href="<%=request.getContextPath()%>/shop/shopView.do?shopProductId=<%=b.getProductId()%>">
							<%=b.getShopProductName() %>
						</a>
					</td>					
					<td><%=(b.getShopProductPrice())*(b.getBasketNumber()) %></td>
					<form action="<%=request.getContextPath()%>/shop/basketUpdate.do" method="post">
					<input type="hidden" name="memberId" value="<%=b.getMemberId()%>">
					<input type="hidden" name="productId" value="<%=b.getProductId()%>">
					
					<td><input  type="number" name="basketNum" value="<%=b.getBasketNumber()%>" min="0" max="<%=b.getShopProductStock()%>"></td>
					<%System.out.println(loginMember.getMemberId()); %>
					<td>
						<input type="submit" value="수정" >				
					</td>
					</form>
					<form action="<%=request.getContextPath()%>/shop/basketDelete.do" method="post">
					<td>
						<input type="submit" value="삭제">
						<input type="hidden" name="memberId" value="<%=b.getMemberId()%>">			
						<input type="hidden" name="productId" value="<%=b.getProductId()%>">			
					</td>
					</form>
				</tr>
			<%	}
			}%>
		</table>

		
	</section>


















<%@ include file="/views/common/footer.jsp"%>



