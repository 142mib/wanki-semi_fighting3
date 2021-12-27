<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.boong.board.model.vo.Board" %>

<%
	Board b = (Board)request.getAttribute("selectBoard");
	Member m = (Member)session.getAttribute("loginMember");
%>

<script src="https://kit.fontawesome.com/f88ebc8ec2.js" crossorigin="anonymous"></script>

<%@ include file="/views/common/header.jsp" %>

<style>
	div{
		border: 1px solid black;
	}
	
	.commentWrap{
		widows: 1000px;
		margin: 0 auto;
	}
	
	.board-comment-count{
		widows: 1000px;
		margin: 0 auto;
	}
	
	.comment-container{
		widows: 1000px;
		margin: 0 auto;
	}
	
	#boardCommentContent{
		widows: 1000px;
		margin: 0 auto;
		text-align: center;
	}
</style>

<header>
	<section>
		<div id="blank" style="width:100%;height: 70px;background-color: brown"></div>
	</section>
</header>

 
<section>

<div class="container" style="margin-top: 30px;">
    <div class="row">
        <div class="col-lg-2"><i class="far fa-comment-alt">&nbsp;게시판</i></div>
        <div class="col-lg-2">
        	<input type="hidden" name="board-category" value="<%=b.getBoardCategory()%>"/>
        	<%
        		String category = "";
        		switch(b.getBoardCategory()) {
        			case 1 : category = "질문/답변"; break;         		
        			case 2 : category = "정보/팁"; break;       		
        			case 3 : category = "사요/팔아요"; break;
        			case 4 : category = "자유"; break;       		
        		}
        	%>
        	<%=category %>
       	</div>
    </div>
    <div class="row">
        <div class="col-lg-10" style="background-color: lightgray;"><%=b.getBoardTitle()%></div>
        <div class="col-lg-2" style="text-align: right; background-color: lightgray;"><%=b.getBoardDate()%></div>
    </div>
    <div class="row">
        <div class="col-lg-8"><%=b.getBoardWriter() %></div>
       	
        <div class="col-lg-2" style="text-align: right;">추천 수&nbsp;<%=b.getBoardLike() %></div>
        <div class="col-lg-2" style="text-align: right;">조회 수&nbsp;<%=b.getBoardViewCount() %></div>
    </div>
    <div class="row">
        <div class="col-xs-12" style="min-height: 500px;">
        	<%=b.getBoardContent() %>
       	</div>
    </div>
    <div class="row">
		<div class="col-xs-12" style="text-align: center;">
			<button type="button" onclick="boardLike();">추천하기</button>
		</div>
    </div>
    
    <!-- 로그인한 아이디와 작성자 아이디가 같을 경우에만 수정/삭제 버튼 출력 -->
    <!-- 로그인도 했고 내가 글 작성자면 -->
    <%if(m != null && m.getMemberId().equals(b.getBoardWriter())) { %>
    	<form action="<%=request.getContextPath()%>/board/boardUpdate.do" method="post">
	    	<div class="row">
		        <div class="col-lg-11" style="text-align: right;">
		        	<input type="hidden" name="board-No" value="<%=b.getBoardNo()%>"/>
		        	<input type="hidden" name="board-category" value="<%=b.getBoardCategory()%>"/>
		        	<input type="hidden" name="board-title" value="<%=b.getBoardTitle()%>">
		        	<input type="hidden" name="board-writer" value="<%=b.getBoardWriter() %>"/>
		        	<input type="hidden" name="board-content" value="<%=b.getBoardContent() %>"/>	
		        	<input type="submit" value="수정"/>
		        </div>
	        </div>
       </form>
		        <div class="col-lg-1" style="text-align: left;" >
		        	<button type="button" onclick="deleteConfirm();">삭제</button>
		        </div>
		    </div>
		
		<div class="commentWrap">
			<div class="row board-comment-container">
				<div class="board-comment-count col-sm-12">댓글 몇개~</div>
				<div id="board-comment" class="comment-container col-sm-12"></div>
				<div class="board-write col-sm-12" style="border: 1px solid black;">
					<form action="<%=request.getContextPath()%>/board/boardCommentWrite.do" method="post">
						댓글쓰기<br>
						<input type="hidden" name="boardRef" value="<%=b.getBoardNo()%>"/>
						<input type="hidden" name="boardCommentWriter" value="<%=m.getMemberId()%>"/>
						<input type="hidden" name="boardCommentRef" value="0"/>
						<input type="hidden" name="boardCommentLevel" value="1"/>
						<textarea id="boardCommentContent" name="boardCommentContent" rows="3" cols="60"></textarea>
						<button type="submit" name="insert-btn">등록</button>
					</form>
				</div>
			</div>
		</div>
    <%}else if(m != null && !m.getMemberId().equals(b.getBoardWriter())) { %>
		<div></div>
		<div class="commentWrap">
			<div class="row board-comment-container">
				<div class="board-comment-count col-sm-12">댓글 몇개~</div>
				<div id="board-comment" class="comment-container col-sm-12"></div>
				<div class="board-write col-sm-12" style="border: 1px solid black;">
					<form action="<%=request.getContextPath()%>/board/boardCommentWrite.do" method="post">
						댓글쓰기<br>
						<input type="hidden" name="boardRef" value="<%=b.getBoardNo()%>"/>
						<input type="hidden" name="boardCommentWriter" value="<%=m.getMemberId()%>"/>
						<input type="hidden" name="boardCommentRef" value="0"/>
						<input type="hidden" name="boardCommentLevel" value="1"/>
						<textarea id="boardCommentContent" name="boardCommentContent" rows="3" cols="60"></textarea>
						<button type="submit" name="insert-btn">등록</button>
					</form>
				</div>
			</div>
		</div>
    <%} %>
    
    <!-- 로그인을 안했으면 -->
	<%if(m == null) { %>
		<div></div>
		<div class="commentWrap">
			<div class="row board-comment-container">
				<div class="board-comment-count col-sm-12">댓글 몇개~</div>
				<div id="board-comment" class="comment-container col-sm-12"></div>
				<div class="board-write col-sm-12" style="border: 1px solid black;">
						댓글쓰기<br>
						<textarea id="disabled-comment" name="" rows="3" cols="60" placeholder="로그인 후 사용하실 수 있습니다." disabled></textarea>
						<button type="submit" name="disabled">등록</button>
				</div>
			</div>
		</div>
	<%} %>

</section>

<%@ include file="/views/common/footer.jsp" %>

<script>
	// 게시글 삭제 하는 함수
	const deleteConfirm=()=>{
		if(confirm("정말로 삭제 하시겠습니까?")){
			location.assign("<%=request.getContextPath()%>/board/boardDelete.do?boardNo=<%=b.getBoardNo()%>");
		}else{
			location.reload();
		}
	};
	
	// 게시글 추천 함수
	const boardLike=()=>{
		if(<%=m.getMemberId().equals(b.getBoardWriter())%>){
			alert("자신의 게시글은 추천 할 수 없습니다.");
			location.reload();
		}else{
			if(confirm("해당 게시글을 추천하시겠습니까?")){
				location.assign("<%=request.getContextPath()%>/board/boardLike.do?boardNo=<%=b.getBoardNo()%>&boardWriter=<%=b.getBoardWriter()%>");
			}else{
				location.assign("<%=request.getContextPath()%>/board/boardView.do");
			}
		}
	};
	
	$(document).ready(()=>{
		commentList();
		commentListCount();
/* 		console.log(commentList); */
	});
	
	// 게시글 댓글 불러와서 전역변수에 저장
<%-- 	var commentList = [];
	$.ajax({
		url: "<%=request.getContextPath()%>/board/boardCommentListAjax.do",
		type: "post",
		async: false,
		data: {"boardNo":<%=b.getBoardNo()%>},
		success: function(data){
			commentList = data;
		}
	}); --%>
	
	// 게시글 댓글을 불러오는 함수
	function commentList(){
		$.ajax({
			url: "<%=request.getContextPath()%>/board/boardCommentListAjax.do",
			type: "post",
			data: {"boardNo":<%=b.getBoardNo()%>},
			success: function(data){
				console.log(data);
				if(data == null){
					let rowDiv = $("<div>").attr({class: 'row'});
					let msg = $("<p>").html('댓글이 없습니다.');
					rowDiv.appen(msg);
					$("#board-comment").append(rowDiv);
				}else{
					if(<%=b.getBoardWriter().equals(m.getMemberId())%>){
						let rowDiv = $("<div>").attr({class: 'row'});
						for(let i = 0; i < data.length; i++){
							let idDiv = $("<div>").attr({class: 'col-sm-2'}).html(data[i]["boardCommentWriter"]);
							let dateDiv = $("<div>").attr({class: 'col-sm-2'}).html(data[i]["boardCommentDate"]);
							let btnDiv = $("<div>").attr({class: 'col-sm-7'});
							let replyBtn = $("<button>").attr({
								onclick: 'deleteComment();'
							});
							btnDiv.append(replyBtn);
							let contentDiv = $("<div>").attr({class: 'col-sm-12'}).html(data[i]["boardCommentContent"]);
							let noDiv = $("<div>").attr({}).hmtl(data[i]["boardCommentNo"]);
							rowDiv.append(idDiv).append(dateDiv).append(btnDiv).append(contentDiv).append(noDiv);					
						}
						$("#board-comment").append(rowDiv);
					}else{
						let rowDiv = $("<div>").attr({class: 'row'});
						for(let i = 0; i < data.length; i++){
							let idDiv = $("<div>").attr({class: 'col-sm-2'}).html(data[i]["boardCommentWriter"]);
							let dateDiv = $("<div>").attr({class: 'col-sm-2'}).html(data[i]["boardCommentDate"]);
							let btnDiv = $("<div>").attr({class: 'col-sm-7'});
							/* let replyBtn = $("<button>").attr({
								value: '삭제',
								onclick: 'deleteComment();'
							});
							btnDiv.append(replyBtn); */
							let contentDiv = $("<div>").attr({class: 'col-sm-12'}).html(data[i]["boardCommentContent"]);
							rowDiv.append(idDiv).append(dateDiv).append(btnDiv).append(contentDiv);					
						}
						$("#board-comment").append(rowDiv);
					}
				}
			}
		})
	};
	
	// 삭제 번튼을 눌렀을 경우 댓글 삭제하는 함수
<%-- 	function deleteComment(){
		if(confirm("댓글을 삭제하시겠습니까?")){
			$.ajax({
				url: "<%=request.getContextPath()%>/board/boardCommenDeleteAjax.do",
				type: "post",
				data: {"commentList":},
				success: function(data)
			})
		}
	} --%>
	
	// 게시글의 댓글이 몇개인지 불러오는 함수
	function commentListCount(){
		$.ajax({
			url: "<%=request.getContextPath()%>/board/boardCommentListAjax.do",
			type: "post",
			data: {"boardNo":<%=b.getBoardNo()%>},
			success: function(data){
				/* console.log(data); */
				let rowDiv = $("<div>").attr({class: 'row'});
				for(let i = 0; i < data.length; i++){
					/* let iconDiv = $("<div>").attr({class: 'col-sm-1'}); */
					let idDiv = $("<div>").attr({class: 'col-sm-2'}).html(data[i]["boardCommentWriter"]);
					let dateDiv = $("<div>").attr({class: 'col-sm-2'}).html(data[i]["boardCommentDate"]);
					let btnDiv = $("<div>").attr({class: 'col-sm-7'});
					let deleteBtn = $("<button>");
					btnDiv.append(deleteBtn);
					let contentDiv = $("<div>").attr({class: 'col-sm-12'}).html(data[i]["boardCommentContent"]);
					rowDiv.append(idDiv).append(dateDiv).append(btnDiv).append(contentDiv);					
				}
				$("#board-comment").append(rowDiv);
			}
		})
	};
	
	

	
</script>


