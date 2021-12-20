<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.List, com.boong.board.model.vo.Board" %>
    
<%
	List<Board> list = (List)request.getAttribute("boardList");
%>

<%@ include file="/views/common/header.jsp" %>

<script src="https://kit.fontawesome.com/f88ebc8ec2.js" crossorigin="anonymous"></script>

<style>
	#boardList-tbl{
		margin: 0 auto;
	}
	
	table td{
		border: 1px solid black;
	}
	
	#boardList-tbl{
		margin: 0 auto;
	}
	
	#boardList-title{
		font-size: 30px;
	}
	
	#boardList-category{
		text-align: center;
	}
	
	#boardList-head{
		text-align: center;
	}
</style>

<header>
	<section>
		<div id="blank" style="width:100%;height: 70px;background-color: brown;">
		
		</div>
		
		<table id="boardList-tbl">
			<thead>
			  <tr>
			    <th colspan="6" id="boardList-title"><i class="fas fa-car-side">&nbsp;게시판</i></th>
			  </tr>
			</thead>
			<tbody>
			  <tr id="boardList-category">
			    <td><i class="fas fa-home">&nbsp;전체 게시글</i></td>
			    <td>질문/답변</td>
			    <td>정보/공유</td>
			    <td>구매/판매</td>
			    <td colspan="2">자유</td>
			  </tr>
			  <tr id="boardList-head">
			    <th>카테고리</th>
			    <th>제목</th>
			    <th>글쓴이</th>
			    <th>날짜</th>
			    <th>조회</th>
			    <th>추천</th>
			  </tr>
			  <%if(list.isEmpty()) { %>
			  	<tr>
			  		<td colspan="6">등록된 게시글이 없습니다.</td>
			  	</tr>
			  <%}else %>
			  	<%for(Board b : list) { %>
				  <tr>
				    <td><%=b.getBoardCategory() %></td>
				    <td><%=b.getBoardTitle() %></td>
				    <td><%=b.getBoardWriter() %></td>
				    <td><%=b.getBoardDate() %></td>
				    <td><%=b.getBoardViewCount() %></td>
				    <td><%=b.getBoardLike() %></td>
				  </tr>
			  	<%} %>
			  <tr style="text-align: right;">
			  	<td colspan="6">
			  		<button id="write" onclick="location.assign('<%=request.getContextPath()%>/board/boardWrite.do')"><i class="fas fa-pen"></i>&nbsp;쓰기</button>
		  		</td>
			  </tr>
			  <!-- pageBar -->
			  <tr id="pageBar">
			  	<td colspan="6"><%=request.getAttribute("pageBar") %></td>
			  </tr>
			</tbody>
		</table>
	</section>
</header>

<%@ include file="/views/common/footer.jsp" %>