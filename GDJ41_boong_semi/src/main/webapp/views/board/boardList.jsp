<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.List, com.boong.board.model.vo.Board, com.boong.member.model.vo.Member" %>
    
<%
	List<Board> list = (List)request.getAttribute("boardList");
	Member m = (Member)session.getAttribute("loginMember");
	List<Board> cbl = (List)request.getAttribute("categoryboardList");
	
	List<Board> bsc = (List)request.getAttribute("boardSearchList");
	String searchType=request.getParameter("searchType");
	String keyword=request.getParameter("searchKeyword");
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
		<div id="blank" style="width:100%;height: 63px; background-color: #288ad8; vertical-align: middle;"></div>
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
			  		<br>
				<!-- 게시글 검색 -->
				<div class="row">
			        <div id="search-container">
			        	<select id="searchType">
			        		<option value="userId" <%=searchType!=null&&searchType.equals("userId")?"selected":"" %>>아이디</option>
			        		<option value="userName" <%=searchType!=null&&searchType.equals("userName")?"selected":"" %>>제목</option>
			        		<option value="gender" <%=searchType!=null&&searchType.equals("gender")?"selected":"" %>>내용</option>
			        	</select>
			        	<div id="search-userId">
			        		<form action="<%=request.getContextPath()%>/board/searchBoardList.do">
			        			<input type="hidden" name="searchType" value="board_Writer" >
			        			<input type="text" name="searchKeyword" size="25" value="<%=searchType!=null&&searchType.equals("board_Writer")?keyword:"" %>"
			        			placeholder="검색할 아이디를 입력하세요" >
			        			<button type="submit">검색</button>
			        		</form>
			        	</div>
			        	<div id="search-userName">
			        		<form action="<%=request.getContextPath()%>/board/searchBoardList.do">
			        			<input type="hidden" name="searchType" value="board_Title">
			        			<input type="text" name="searchKeyword" size="25" value="<%=searchType!=null&&searchType.equals("board_Title")?keyword:"" %>"
			        			placeholder="검색할 제목을 입력하세요">
			        			<button type="submit">검색</button>
			        		</form>
			        	</div>
			        	<div id="search-gender">
			        		<form action="<%=request.getContextPath()%>/board/searchBoardList.do">
			        			<input type="hidden" name="searchType" value="board_Content">
			        			<input type="text" name="searchKeyword" size="25" value="<%=searchType!=null&&searchType.equals("board_Content")?keyword:"" %>"
			        			placeholder="검색할 내용을 입력하세요">
			        			<button type="submit">검색</button>
			        		</form>
			        	</div>
			        </div>
		        </div>
			
				<!-- pageBar -->
				<div class="row" id="pageBar">
					<div class="col-sm-12"><%=request.getAttribute("pageBar") %></div>
				</div>
	</section>

<%@ include file="/views/common/footer.jsp" %>

<script>

	// 카테고리 별 글 불러오기
	$("#board-category-btn-container button").click(e=>{
		var tabNo = $(e.target).val();
		$.ajax({
			url: "<%=request.getContextPath()%>/board/boardListAjax.do",
			type: "post",
			data: {"tabNo":tabNo},
			success:function(data){
				console.log(data);
				$("div").remove("#boardList-body-container");
				let containerDiv = $("<div id='boardList-body-container' class='row'>");
				let fontColor = "";
				for(let i = 0; i < data.length; i++){
					let tapDiv = $("<div class='col-sm-2 margin con'>");
					let tapSpan = $("<span>");
					switch(data[i]["boardCategory"]){
			    		case 1 : tapSpan.text("질문/답변"); fontColor = "red"; break;
			    		case 2 : tapSpan.text("정보/팁"); fontColor = "green"; break;
			    		case 3 : tapSpan.text("사요/팔아요"); fontColor = "gold"; break;
			    		case 4 : tapSpan.text("자유"); fontColor = "skyblue"; break;
					};
					tapSpan.attr({
						'style': 'padding: 8px; color:' + fontColor + '; white-space: nowrap;'
					});
					tapDiv.append(tapSpan);
					let titleDiv = $("<div class='col-sm-5 margin'>");
					let a = $("<a style='cursor: pointer; color: #222; transition: border-color .4s,box-shadow .4s,background .4s,color .4s,opacity .4s;'>").attr({
						'href': '<%=request.getContextPath()%>/board/boardView.do?boardNo=' + data[i]["boardNo"]
					});
					a.text(data[i]["boardTitle"]);
					titleDiv.append(a);
					let writerDiv = $("<div class='col-sm-1 margin con'>");
					let writerSpan = $("<span style='padding: 8px; color: #666; white-space: nowrap;'>").text(data[i]["boardWriter"]);
					writerDiv.append(writerSpan);
					let dateDiv = $("<div class='col-sm-2 margin con'>")
					let dateSpan = $("<span style='padding: 8px; color: #666; white-space: nowrap;'>").text(data[i]["boardDate"]);
					dateDiv.append(dateSpan);
					let countDiv = $("<div class='col-sm-1 margin con'>");
					let countSpan = $("<span style='padding: 8px; color: #666; white-space: nowrap;'>").text(data[i]["boardViewCount"]);
					countDiv.append(countSpan);
					let likeDiv = $("<div class='col-sm-1 margin con'>");
					let likeSpan = $("<span style='padding: 8px; color: #666; white-space: nowrap;'>").text(data[i]["boardLike"]);
					likeDiv.append(likeSpan);
					a.append().html(data[i]["boardTitle"]);
					
					containerDiv.append(tapDiv).append(titleDiv).append(writerDiv).append(dateDiv).append(countDiv).append(likeDiv);
				}
				$("#wrap").append(containerDiv);
			}
		})
	});
	
	// 검색 게시글 불러오기
    	$(()=>{
    			
    		$("#searchType").change(e=>{
    			const value=$(e.target).val();
    			//console.log(value);
    			//console.log($("#search-container>div[id^=search]"));
    			$("#search-container>div[id^=search]").css("display","none");
    			
    			/* const userId=$("#search-userId");
    			const userName=$("#search-userName");
    			const gender=$("#search-gender");
    			userId.css("display","none");
    			userName.css("display","none");
    			gender.css("display","none"); */
    			
    			
    			$("div#search-"+value).css("display","inline-block");
    		});
    		
    	})
    	$(()=>{
    		$("#searchType").change();//페이지로드 후 바로 select태그에 change이벤트발생시킴!
    	})
</script>


























