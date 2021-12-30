<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.boong.shop.model.vo.*" %>
<%@ include file="/views/common/header.jsp" %>
<%
	List<OrderProduct> opList=(List)request.getAttribute("opList");
%>

<div id="blank" style="width:100%; height: 63px; background-color: #288ad8;"></div>

<style>

#section{
	padding: 100px 20px 100px 220px;
	height: 100%;
	background-color: #dcdcde;
}
.mypage-container{
	width: 80%;
	height: 600px;
	background-color: white;
	border: none;
	border-radius: 10px;
	padding: 30px 60px;
	margin-left: 100px;
	margin-top: 70px;
	margin-bottom:70px;
	display: block;
	box-shadow: 5px 5px 5px 5px lightgray;
}
h2{color:#6868ac;}

.box{
	width: 300px; height: 40px; 
	padding: 10px; border-radius: 8px; 
	border: solid #288ad8 1px; 
	background-color: #dee2e6;
	margin-bottom: 20px;
}


/* 테이블 style */
.styled-table {
    border-collapse: collapse;
    margin: 25px 0;
    font-size: 0.9em;
    font-family: sans-serif;
    min-width: 100%;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
}
.styled-table thead tr {
    background-color: #288ad8;
    color: #ffffff;
    text-align: left;
}
.styled-table th,
.styled-table td {
    padding: 12px 15px;
}
.styled-table tbody tr {
    border-bottom: 1px solid #288ad8;
}

.styled-table tbody tr:nth-of-type(even) {
    background-color: #f3f3f3;
}

.styled-table tbody tr:last-of-type {
    border-bottom: 2px solid #288ad8;
}
.styled-table tbody tr.active-row {
    font-weight: bold;
    color: #009879;
}
div#pageBar{ text-align:center;}
#pageBar>a,#pageBar>span {padding-right : 20px;}
#btn{
	width:70px; height:35px;
	border:none;
	border-radius: 10px;
	cursor:pointer; 
	background:coral; color:white;
	font-size:13px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
}

</style>

<body>
<%@ include file="/views/member/membersidenav.jsp"%>

<div class="section">
	<div class="mypage-container">
		<h2 style="color:#288ad8;">내 주문내역</h2>
		<hr>
        
		<div><br>
			<table class="styled-table">
				
				<thead>
				<tr style="text-aglin:center;">
					<th>주문번호</th>
					<th>상품</th>
					<th>수량</th>
					<th>주문 상태</th>
					<th>상세보기</th>
				</tr>
				</thead>
				<tbody>
				<%if(opList.isEmpty()) {%>
	            	<tr >
	            		<td colspan="6" style="text-aglin:center;">주문 내역이 없습니다.</td>
	            	</tr>
	            <%}else{ %>
		       	    <%for(OrderProduct op: opList) {%>
		       	    <%
			    		String status = "";
		    			switch(op.getOrderProductStatus()) {
				    		case 0 : status = "주문완료"; break;
				    		case 1 : status = "배송완료"; break;
			    		}
			    	%>
		       	    	<tr>
			       	    	<td><%=op.getOrderId() %></td>
			       	    	<td><%=op.getShopProductId() %></td>
			       	    	<td><%=op.getOrderProductNumber() %></td>
			       	    	<td><%=status %></td>
			       	    	<td><input type="button" value="상세보기"></td>
		       	    	</tr>
		       	    <%}
		       	   } %>
				</tbody>
			</table>
		</div>
		<div id="pageBar">
        	<%=request.getAttribute("pageBar") %>
        </div>
	</div>
</div>	
	
</section>
<script>
	$("#fourth-menu").addClass("active");
	
	</script>
	<%@ include file="/views/common/footer.jsp"%>