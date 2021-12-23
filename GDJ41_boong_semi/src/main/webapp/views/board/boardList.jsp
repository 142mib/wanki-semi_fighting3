<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.List, com.boong.board.model.vo.Board, com.boong.member.vo.Member" %>
    
<%
	List<Board> list = (List)request.getAttribute("boardList");
	Member m = (Member)session.getAttribute("loginMember");
	List<Board> cbl = (List)request.getAttribute("categoryboardList");
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
		width: 1000px;
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
	
	#pageBar{
		text-align: center;
	}
	
	#board-head{
		width: 1000px;
		margin: 0 auto;
		text-align: left;
		font-size: 35px;
		margin-top: 20px;
	}
	#board-category-btn{
		width: 1000px;
		margin: 0 auto;
		text-align: left;
	}
	
	.col-sm-2{
		border: 1px solid black;
	}
	
	#boardList-head{
		width: 1000px;
		text-align: center;
		margin: 0 auto;
	}
</style>

<header>
	<section>
		<div id="blank" style="width:100%;height: 70px;background-color: brown;">
		
		</div>
		
			  <div id="board-head" class="col-lg-1">
			    <i class="fas fa-car-side">&nbsp;게시판</i>
			  </div>
			  <br>
			  <div id="board-category-btn" class="col-lg-5">
			    <button id="category-all" value="0"><i class="fas fa-home">&nbsp;전체 게시글</i></button>
			    <button id="category-qa" value="1">질문/답변</button>
			    <button id="category-tip" value="2">정보/공유</button>
			    <button id="category-buysell" value="3">구매/판매</button>
			    <button id="category-free" value="4">자유</button>
		      </div>
		      <br>
				<div id="boardList-head" class="row">
					<div class="col-sm-2">카테고리</div>
					<div class="col-sm-2">제목</div>
					<div class="col-sm-2">글쓴이</div>
					<div class="col-sm-2">날짜</div>
					<div class="col-sm-2">조회수</div>
					<div class="col-sm-2">추천</div>
				</div>
		     
		<table id="boardList-tbl">
			 <tbody id="boardList-body">
			  <%if(list.isEmpty()) { %>
			  	<tr style="text-align: center;">
			  		<td colspan="6">등록된 게시글이 없습니다.</td>
			  	</tr>
			  <%}else %>
			  	<%for(Board b : list) { %>
				  <tr id="trtr" style="text-align: center;">
			    	<%
			    		String tab = "";
		    			switch(b.getBoardCategory()) {
				    		case 1 : tab = "질문/답변"; break;
				    		case 2 : tab = "정보/팁"; break;
				    		case 3 : tab = "사요/팔아요"; break;
				    		case 4 : tab = "자유"; break;
			    		}
			    	%>
				    <td><%=tab %></td>
				    <td id="board-list">
				    	<a href="<%=request.getContextPath()%>/board/boardView.do?boardNo=<%=b.getBoardNo()%>"><%=b.getBoardTitle() %></a>
				    </td>
				    <td><%=b.getBoardWriter()%></td>
				    <td><%=b.getBoardDate()%></td>
				    <td><%=b.getBoardViewCount()%></td>
				    <td><%=b.getBoardLike()%></td>
				  </tr>
			  	<%} %>
			</tbody>
			
			<tfoot>
			  <tr style="text-align: right;">
			  	<td colspan="6">
			  		<%if(m != null) { %>
			  		<button id="write" onclick="location.assign('<%=request.getContextPath()%>/board/boardWrite.do')"><i class="fas fa-pen"></i>&nbsp;쓰기</button>
			  		<%}else { %>
			  			
			  		<%} %>
		  		</td>
			  </tr>
			  <!-- pageBar -->
			  <tr id="pageBar">
			  	<td colspan="6"><%=request.getAttribute("pageBar") %></td>
			  </tr>
		  	</tfoot>
		</table>
	</section>
</header>

<%@ include file="/views/common/footer.jsp" %>

<script>
	$("#board-category-btn button").click(e=>{
		var tabNo = $(e.target).val();
		$.ajax({
			url: "<%=request.getContextPath()%>/board/boardListAjax.do",
			type: "post",
			data: {"tabNo":tabNo},
			success:function(data){
				$("tbody").empty();
				let tbody = $("<tbody>");
				for(let i = 0; i < data.length; i++){
					let tr = $("<tr>");
					let tab = $("<td>");
					switch(data[i]["boardCategory"]){
			    		case 1 : tab.html("질문/답변"); break;
			    		case 2 : tab.html("정보/팁"); break;
			    		case 3 : tab.html("사요/팔아요"); break;
			    		case 4 : tab.html("자유"); break;
					}
					let a = $("<a>").attr({
						'href': '<%=request.getContextPath()%>/board/boardView.do?boardNo=' + data[i]["boardNo"]
					});
					let title = $("<td>").html(data[i]["boardTitle"]);
					a.append(title);
					let writer = $("<td>").html(data[i]["boardWriter"]);
					let date = $("<td>").html(data[i]["boardDate"]);
					let viewCount = $("<td>").html(data[i]["boardViewCount"]);
					let like = $("<td>").html(data[i]["boardLike"]);
					tbody.append(tr).append(tab).append(a).append(writer).append(date).append(viewCount).append(like);
				}
				$("#boardList-head").after().html(tbody);
			}
		})
	})
</script>