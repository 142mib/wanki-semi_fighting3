<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="com.boong.shop.model.vo.*" %>
<% Product p=(Product)request.getAttribute("product");  %>



<style>
	div#product-container
	{
		width:600px;
		margin:0 auto;
		text-align:center;
	}
	div#product-container h2
	{
		margin:10px 0;
	}
	table#tbl-product
	{
		
		margin:0 auto;
		border:1px solid black;
		border-collapse:collapse;
	}
	table#tbl-product th
	{
		width:125px;
		border:1px solid;
		padding:10px ;
		text-align:center;
	}
	table#tbl-product td
	{
		border:1px solid;
		padding:5px 5px 5px 10px;
		text-align:left;
	}

</style>
<script>
	내용입력여부 확인 후 전송
</script>

	<div style="height: 63px; background-color: rgba(1,138,216,1)"></div>
	<div style="height:10px;"></div>
	<div id='product-container'>
		<h2>상품 수정</h2>
		<form action='<%=request.getContextPath()%>/shop/productUpdateEnd.do'
		method="post" enctype="multipart/form-data" >
			<table id='tbl-product'>				
				<tr>
					<th>상품명</th>
					<td><input type="text" name="productName" value="<%=p.getShopProductName() %>" required></td>
				</tr>
				<tr>
					<th>가격</th>
					<td>
						<input type="number"  name="productPrice" step="100" min="0" value="<%=p.getShopProductPrice() %>" required>
					</td>
				</tr>				
				<tr>
					<th>설명</th>
					<td><textarea cols="50" rows="9" name="productContent" ><%=p.getShopProductContent() %></textarea></td>
				</tr>
				<tr>
					<th>재고</th>
					<td>
						<input type="number"  name="productStock" step="1" min="1" value="<%=p.getShopProductStock() %>" required>
					</td>
				</tr>			
				<tr>
					<th>이미지</th>
					<td><input type="file" name="upfile" ><span style="font-size:9pt"><%=p.getShopProductImageRename() %></span></td>
					<input type="hidden" name="orifile" value="<%=p.getShopProductImage()%>">
					<input type="hidden" name="orifileRename" value="<%=p.getShopProductImageRename()%>">
					
				</tr>
				
				<tr>
					<th colspan="2">
						<input type="submit" value="수정">
						<button onclick="location.assign('<%=request.getContextPath()%>/shop/productManage.do')">취소</button>
						<input type="reset" value="초기화">
						
					</th>
				</tr>
			</table>
			<input type="hidden" name="productId" value="<%=p.getShopProductId()%>">
		</form>
	</div>
	

<%@ include file="/views/common/footer.jsp"%>