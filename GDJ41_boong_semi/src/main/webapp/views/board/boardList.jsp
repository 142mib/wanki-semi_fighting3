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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@500&display=swap" rel="stylesheet">

<style>
	section *{
		font-family: 'IBM Plex Sans KR', sans-serif;
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
	#board-category-btn-container{
		width: 1000px;
		margin: 0 auto;
		text-align: left;
	}
	
	.row{
		width: 1000px;
		/* border: 1px solid black; */
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
	
	a{
		text-decoration: none;
	}
	
	a:hover{
		text-decoration: underline;
	}
	
	.thead{
		border-top: 1px solid #ccc; 
		border-bottom:1px solid #bbb; 
		box-shadow: inset 0 -1px 0 #fff; 
		color: #555;
	}
	
	.con{
		 text-indent: initial; 
		 border-spacing: 2px; 
		 border-collapse: collapse;
	}
	
	
	
	

</style>

<header>
		<div id="blank" style="width:100%;height: 70px;background-color: brown; vertical-align: middle;"></div>
</header>
		
	<section>
			  <div id="board-head" class="col-lg-1">
			  	<i class="fas fa-car-side">&nbsp;게시판</i>
			  </div>
			  <br>
			  <div id="board-category-btn-container" class="col-lg-5" role="group" aria-label="Basic example" style="border: 1px solid #ddd; border-radius: 5px; background: #fff; box-shadow: 0 1px 1px #aaa;">
			    <button id="category-all" class="btn btn-primary" value="0">전체 게시글</button>
			    <button id="category-qa" class="btn btn-danger" value="1">질문/답변</button>
			    <button id="category-tip" class="btn btn-success" value="2">정보/팁</button>
			    <button id="category-buysell" class="btn btn-warning" value="3">사요/팔아요</button>
			    <button id="category-free" class="btn btn-info" value="4">자유</button>
		      </div>
		      <br>
				<div id="boardList-head" class="row" style="border-color: inherit; vertical-align: middle; background: linear-gradient(to bottom, #fff 0, #f9f9f9 100%);">
					<div class="col-sm-2 thead">카테고리</div>
					<div class="col-sm-5 thead">제목</div>
					<div class="col-sm-1 thead">글쓴이</div>
					<div class="col-sm-2 thead">날짜</div>
					<div class="col-sm-1 thead">조회수</div>
					<div class="col-sm-1 thead">추천</div>
				</div>
				<%if(list.isEmpty()) { %>	
					<div class="row">
				        <div class="col-sm-12">등록된 게시글이 없습니다.</div>
			        </div>
				 <%}else %>
				 	<%for(Board b : list) { %>
			    	<%
			    		String tab = "";
			    		String color = "";
		    			switch(b.getBoardCategory()) {
				    		case 1 : tab = "질문/답변"; color = "red"; break;
				    		case 2 : tab = "정보/팁"; color = "green"; break;
				    		case 3 : tab = "사요/팔아요"; color = "gold"; break;
				    		case 4 : tab = "자유"; color = "skyblue"; break;
			    		}
			    	%>
			    	<div id="wrap">
					    <div id="boardList-body-container" class="row">
					        <div class="col-sm-2 margin con">
					        	<span style="padding: 8px; color: <%=color %>; white-space: nowrap;"><%=tab %></span>
					        </div>
					        <div class="col-sm-5 margin">
					        	<a href="<%=request.getContextPath()%>/board/boardView.do?boardNo=<%=b.getBoardNo()%>" style="cursor: pointer; color: #222; transition: border-color .4s,box-shadow .4s,background .4s,color .4s,opacity .4s; "><%=b.getBoardTitle() %></a>
					        </div>
					        <div class="col-sm-1 margin con">
					        	<span style="padding: 8px; color: #666; white-space: nowrap;"><%=b.getBoardWriter()%></span>
					        </div>
					        <div class="col-sm-2 margin con">
					        	<span style="padding: 8px; color: #666; white-space: nowrap;"><%=b.getBoardDate() %></span>
				        	</div>
					        <div class="col-sm-1 margin con">
					        	<span style="padding: 8px; color: #666; white-space: nowrap;"><%=b.getBoardViewCount()%></span>
				        	</div>
					        <div class="col-sm-1 margin con">
					        	<span style="padding: 8px; color: #666; white-space: nowrap;"><%=b.getBoardLike()%></span>
					        </div>
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