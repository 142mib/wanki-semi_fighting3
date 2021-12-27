<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.List, com.boong.board.model.vo.Board, com.boong.member.model.vo.Member" %>
    
<%
	List<Board> list = (List)request.getAttribute("boardList");
	Member m = (Member)session.getAttribute("loginMember");
	List<Board> cbl = (List)request.getAttribute("categoryboardList");
%>

<%@ include file="/views/common/header.jsp" %>

<script src="https://kit.fontawesome.com/f88ebc8ec2.js" crossorigin="anonymous"></script>

<style>
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
	#board-category-btn-container{
		width: 1000px;
		margin: 0 auto;
		text-align: left;
	}
	
	.row{
		width: 1000px;
		border: 1px solid black;
		margin: 0 auto;
		text-align: center;
	}
	
	#boardList-head{
		width: 1000px;
		text-align: center;
		margin: 0 auto;
	}
	
	#footer-write{
		text-align: rigth;
	}
	
	.margin{
		margin-top: 5px;
		margin-bottom: 5px;
	}
</style>

<header>
		<div id="blank" style="width:100%;height: 70px;background-color: brown;"></div>
</header>
		
	<section>
			  <div id="board-head" class="col-lg-1">
			  	<i class="fas fa-car-side">&nbsp;게시판</i>
			  </div>
			  <br>
			  <div id="board-category-btn-container" class="col-lg-5">
			    <button id="category-all" value="0">전체 게시글</button>
			    <button id="category-qa" value="1">질문/답변</button>
			    <button id="category-tip" value="2">정보/공유</button>
			    <button id="category-buysell" value="3">구매/판매</button>
			    <button id="category-free" value="4">자유</button>
		      </div>
		      <br>
				<div id="boardList-head" class="row">
					<div class="col-sm-2">카테고리</div>
					<div class="col-sm-5">제목</div>
					<div class="col-sm-1">글쓴이</div>
					<div class="col-sm-2">날짜</div>
					<div class="col-sm-1">조회수</div>
					<div class="col-sm-1">추천</div>
				</div>
				<%if(list.isEmpty()) { %>	
					<div class="row">
				        <div class="col-sm-12">등록된 게시글이 없습니다.</div>
			        </div>
				 <%}else %>
				 	<%for(Board b : list) { %>
			    	<%
			    		String tab = "";
		    			switch(b.getBoardCategory()) {
				    		case 1 : tab = "질문/답변"; break;
				    		case 2 : tab = "정보/팁"; break;
				    		case 3 : tab = "사요/팔아요"; break;
				    		case 4 : tab = "자유"; break;
			    		}
			    	%>
			    	<div id="wrap">
					    <div id="boardList-body-container" class="row">
					        <div class="col-sm-2 margin"><%=tab %></div>
					        <div class="col-sm-5 margin">
					        	<a href="<%=request.getContextPath()%>/board/boardView.do?boardNo=<%=b.getBoardNo()%>"><%=b.getBoardTitle() %></a>
					        </div>
					        <div class="col-sm-1 margin"><%=b.getBoardWriter()%></div>
					        <div class="col-sm-2 margin"><%=b.getBoardDate() %></div>
					        <div class="col-sm-1 margin"><%=b.getBoardViewCount()%></div>
					        <div class="col-sm-1 margin"><%=b.getBoardLike()%></div>
					    </div>
					</div>
				    <%} %>		     
					
					<div id="footer-container" class="row">
						<div id="footer-write">
					  		<%if(m != null) { %>
					  		<button id="write" onclick="location.assign('<%=request.getContextPath()%>/board/boardWrite.do')"><i class="fas fa-pen"></i>&nbsp;쓰기</button>
					  		<%}else { %>
					  			<div></div>
					  		<%} %>
				  		</div>
			  		</div>
				  		
			  <!-- pageBar -->
			  <div class="row" id="pageBar">
			  	<div class="col-sm-12"><%=request.getAttribute("pageBar") %></div>
			  </div>
	</section>

<%@ include file="/views/common/footer.jsp" %>

<script>
	$("#board-category-btn-container button").click(e=>{
		var tabNo = $(e.target).val();
		$.ajax({
			url: "<%=request.getContextPath()%>/board/boardListAjax.do",
			type: "post",
			data: {"tabNo":tabNo},
			success:function(data){
				$("div").remove("#boardList-body-container");
				let containerDiv = $("<div>").attr({
					'id': 'boardList-body-container', 
					'class': 'row'
				});
				for(let i = 0; i < data.length; i++){
					let categoryDiv = $("<div>").attr({
						'class': 'col-sm-2 margin'
					})
					switch(data[i]["boardCategory"]){
			    		case 1 : categoryDiv.html("질문/답변"); break;
			    		case 2 : categoryDiv.html("정보/팁"); break;
			    		case 3 : categoryDiv.html("사요/팔아요"); break;
			    		case 4 : categoryDiv.html("자유"); break;
					}
					let a = $("<a>").attr({
						'href': '<%=request.getContextPath()%>/board/boardView.do?boardNo=' + data[i]["boardNo"]
					});
					a.append().html(data[i]["boardTitle"])
					let titleDiv = $("<div>").append(a).attr({
						'class': 'col-sm-5 margin'
					});
					let writerDiv = $("<div>").html(data[i]["boardWriter"]).attr({
						'class': 'col-sm-1 margin'
					});
					let dateDiv = $("<div>").html(data[i]["boardDate"]).attr({
						'class': 'col-sm-2 margin'
					});
					let viewDiv = $("<div>").html(data[i]["boardViewCount"]).attr({
						'class': 'col-sm-1 margin'
					});
					let likeDiv = $("<div>").html(data[i]["boardLike"]).attr({
						'class': 'col-sm-1 margin'
					});
					containerDiv.append(categoryDiv).append(titleDiv).append(writerDiv).append(dateDiv).append(viewDiv).append(likeDiv);
				}
				$("#wrap").append().html(containerDiv);
			}
		})
	})
</script>