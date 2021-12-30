<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.boong.board.model.vo.Board" %>
<%@ include file="/views/common/header.jsp" %>
<%
	List<Board> bList=(List)request.getAttribute("bList");	
	String searchType=request.getParameter("searchType");
	String keyword=request.getParameter("searchKeyword");
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
		<h2 style="color:#288ad8;">내가 쓴 게시글</h2>
		<hr>
        
		<div><br>
			<table class="styled-table">
				
				<thead>
				<tr style="text-aglin:center;">
					<th>카테고리</th>
					<th>제목</th>
					<th>날짜</th>
					<th>조회수</th>
					<th>추천</th>
				</tr>
				</thead>
				<tbody>
				<%if(bList.isEmpty()) {%>
	            	<tr >
	            		<td colspan="6" style="text-aglin:center;">내가 쓴 게시글이 없습니다.</td>
	            	</tr>
	            <%}else{ %>
		       	    <%for(Board b: bList) {%>
		       	    <%
			    		String tab = "";
		    			switch(b.getBoardCategory()) {
				    		case 1 : tab = "질문/답변"; break;
				    		case 2 : tab = "정보/팁"; break;
				    		case 3 : tab = "사요/팔아요"; break;
				    		case 4 : tab = "자유"; break;
			    		}
			    	%>
		       	    	<tr>
			       	    	<td><%=tab %></td>
			       	    	<td>
			       	    	<a href="<%=request.getContextPath()%>/board/boardView.do?boardNo=<%=b.getBoardNo()%>"><%=b.getBoardTitle() %></a>
			       	    	</td>
			       	    	<td><%=b.getBoardDate() %></td>
			       	    	<td><%=b.getBoardViewCount()%></td>
			       	    	<td><%=b.getBoardLike()%></td>
			       	    		
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
	
	<!-- 댓글 불러오기 -->
	<%-- <div class="mypage-container">
		<h2 style="color:steelblue;">내가 쓴 댓글</h2>
		<hr>
        
		<div><br>
			<table class="styled-table">
				
				<thead>
				<tr style="text-aglin:center;">
					<th>게시글 번호</th>
					<th>댓글 내용</th>
					<th>댓글 작성일</th>
				</tr>
				</thead>
				<tbody>
				<%if(bList.isEmpty()) {%>
	            	<tr >
	            		<td colspan="3" style="text-aglin:center;">아직 작성한 댓글이 없습니다.</td>
	            	</tr>
	            <%}else{ %>
		       	    <%for(Board b: bList) {%>
		       	    <%
			    		String tab = "";
		    			switch(b.getBoardCategory()) {
				    		case 1 : tab = "질문/답변"; break;
				    		case 2 : tab = "정보/팁"; break;
				    		case 3 : tab = "사요/팔아요"; break;
				    		case 4 : tab = "자유"; break;
			    		}
			    	%>
		       	    	<tr>
			       	    	<td><%=tab %></td>
			       	    	<td><%=b.getBoardTitle() %></td>
			       	    	<td><%=b.getBoardDate() %></td>
			       	    	<td><%=b.getBoardViewCount()%></td>
			       	    	<td><%=b.getBoardLike()%></td>
			       	    		
		       	    	</tr>
		       	    <%}
		       	   } %>
				</tbody>
			</table>
		</div>
		<div id="pageBar">
        	<%=request.getAttribute("pageBar") %>
        </div>
	</div> --%>
	<script>
	$("#third-menu").addClass("active");
	
	</script>
	
</section>

	<%@ include file="/views/common/footer.jsp"%>