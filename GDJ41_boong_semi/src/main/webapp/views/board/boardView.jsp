<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.boong.board.model.vo.Board, com.boong.member.model.vo.Member" %>

<%
	Board b = (Board)request.getAttribute("selectBoard");
	Member m = (Member)session.getAttribute("loginMember");
%>

<script src="https://kit.fontawesome.com/f88ebc8ec2.js" crossorigin="anonymous"></script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@500&display=swap" rel="stylesheet">

<%@ include file="/views/common/header.jsp" %>

<style>
	section *{
		font-family: 'IBM Plex Sans KR', sans-serif;
	}
/*      div{
		border: 1px solid black;
	} */
	
</style>

<header>
	<section>
		<div id="blank" style="width:100%;height: 63px;background-color: #288ad8"></div>
	</section>
</header>

 
<section>

<div class="container" style="margin-top: 30px;">
    <div class="row" style="color: #444;">
        <div class="col-lg-2" style="font-size: 30px; border-right: 1px solid black; vertical-align: middle; text-align: center;"><span style="">Community</span></div>
        <div class="col-lg-2" style="margin-top: 15px; margin-left: 15px;">
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
        	<span><%=category %></span>
       	</div>
    </div>
    
    <div class="row" style="margin-top: 10px; border-top: 1px solid #ccc; border-bottom: 1px solid #ccc;">
        <div class="col-lg-10" style="font-size: 25px; padding-top: 10px; padding-bottom: 10px;"><span><%=b.getBoardTitle()%></span></div>
        <div class="col-lg-2" style="display: inline-block;  padding-left: 120px; padding-right: 0 "><span style="font-size: 12px; display:table-cell; padding-top: 30px;"><%=b.getBoardDate()%></span></div>
    </div>
    <div class="row" style="margin-top: 10px; border-bottom: 1px solid #eee; ">
        <div class="col-lg-8"><%=b.getBoardWriter() %></div>
        <div class="col-lg-2" style="text-align: right;"></div>
        <div class="col-lg-2" style="text-align: right; font-size: 12px;">추천 수&nbsp;<%=b.getBoardLike() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 조회 수&nbsp;<%=b.getBoardViewCount() %></div>
    </div>
    <br>
    <div class="row">
        <div class="col-xs-12" style="min-height: 500px;">
        	<%=b.getBoardContent() %>
       	</div>
    </div>
    <br>
	    <!-- <div class="row">
			<div class="col-xs-12" style="text-align: center;">
				<button id="" type="button" onclick="boardLike();">추천하기</button>
			</div>
			<div class="row" style="border-bottom: 1px solid #ddd; padding-top: 20px; padding-bottom: 20px;"></div>
	    </div> -->
    
    <!-- 로그인한 아이디와 작성자 아이디가 같을 경우에만 수정/삭제 버튼 출력 -->
    <!-- 로그인도 했고 내가 글 작성자면 -->
    <%if(m != null && m.getMemberId().equals(b.getBoardWriter())) { %>
    	<div class="row">
			<div class="col-xs-12" style="text-align: center;">
				<button id="" type="button" onclick="boardLike();">추천하기</button>
			</div>
			<div class="row" style="border-bottom: 1px solid #ddd; padding-top: 20px; padding-bottom: 20px;"></div>
	    </div>
    	<form action="<%=request.getContextPath()%>/board/boardUpdate.do" method="post">
	    	<div class="row">
		        <div class="col-lg-12" style="text-align: right;">
		        	<input type="hidden" name="board-No" value="<%=b.getBoardNo()%>"/>
		        	<input type="hidden" name="board-category" value="<%=b.getBoardCategory()%>"/>
		        	<input type="hidden" name="board-title" value="<%=b.getBoardTitle()%>">
		        	<input type="hidden" name="board-writer" value="<%=b.getBoardWriter() %>"/>
		        	<input type="hidden" name="board-content" value="<%=b.getBoardContent() %>"/>	
		        	<input type="submit" value="수정"/>
		        	<button type="button" onclick="deleteConfirm();">삭제</button>
		        	<div class="row" style="border-bottom: 1px solid #ddd; padding-top: 20px; padding-bottom: 20px;"></div>
		        </div>
	        </div>
       </form>
		        <!-- <div class="col-lg-1" style="text-align: left; display: flex;" >
		        	<button type="button" onclick="deleteConfirm();">삭제</button>
		        </div> -->
</div>
		<div class="commentWrap" style="margin: 0 auto; width: 1320px;">
			<div class="row board-comment-container" style="widows: 1000px; margin: 0 auto;">
				<div id="commentCount" class="board-comment-count col-sm-12"></div>
				<div id="board-comment" class="comment-container col-sm-12" style="widows: 1000px; margin: 0 auto; padding-top: 10px;"></div>
				<div class="board-write col-sm-12" style="widows: 1000px; margin: 0 auto; padding-top: 10px;">
					<form action="<%=request.getContextPath()%>/board/boardCommentWrite.do" method="post">
						<span style="padding-top: 20px;">댓글 쓰기</span><br>
						<input type="hidden" name="boardRef" value="<%=b.getBoardNo()%>"/>
						<input type="hidden" name="boardCommentWriter" value="<%=m.getMemberId()%>"/>
						<input type="hidden" name="boardCommentRef" value="0"/>
						<input type="hidden" name="boardCommentLevel" value="1"/>
						<div style="display: inline-block; vertical-align: middle;">
							<textarea id="boardCommentContent" name="boardCommentContent" rows="2" cols="134" placeholder="댓글을 입력하세요"></textarea>
						</div>
						<div style="display: inline-block; vertical-align: middle;">
							<button type="submit" name="insert-btn" style="width: 100px; height: 55;">등록</button>
						</div>
					</form>
				</div>
			</div>
		</div>
    <%}else if(m != null && !m.getMemberId().equals(b.getBoardWriter())) { %>
    	<div class="row">
			<div class="col-xs-12" style="text-align: center;">
				<button id="" type="button" onclick="boardLike();">추천하기</button>
			</div>
			<div class="row" style="border-bottom: 1px solid #ddd; padding-top: 20px; padding-bottom: 20px;"></div>
	    </div>
		<div></div>
		<div class="commentWrap">
			<div class="row board-comment-container">
				<div id="commentCount" class="board-comment-count col-sm-12"></div>
				<div id="board-comment" class="comment-container col-sm-12"></div>
				<div class="board-write col-sm-12" style="widows: 1000px; margin: 0 auto; padding-top: 10px;">
					<form action="<%=request.getContextPath()%>/board/boardCommentWrite.do" method="post">
						<span style="padding-top: 20px;">댓글 쓰기</span><br>
						<input type="hidden" name="boardRef" value="<%=b.getBoardNo()%>"/>
						<input type="hidden" name="boardCommentWriter" value="<%=m.getMemberId()%>"/>
						<input type="hidden" name="boardCommentRef" value="0"/>
						<input type="hidden" name="boardCommentLevel" value="1"/>
						<div style="border: 1px solid green; display: inline-block; vertical-align: middle;">
							<textarea id="boardCommentContent" name="boardCommentContent" rows="2" cols="134" placeholder="댓글을 입력하세요"></textarea>
						</div>
						<div style="display: inline-block; vertical-align: middle;">
							<button type="submit" name="insert-btn" style="width: 100px; height: 50;">등록</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	<!--  로그인 안했으면 -->
    <%}else if(m == null){ %>
    	 <div class="row">
			<div class="col-xs-12" style="text-align: center;">
				<button id="boardLike" type="button" onclick="boardLike();">추천하기</button>
			</div>
			<div class="row" style="border-bottom: 1px solid #ddd; padding-top: 20px; padding-bottom: 20px;"></div>
	    </div>
    	<div></div>
		<div class="commentWrap" style="margin: 0 auto; width: 1320px;">
			<div class="row board-comment-container" style="widows: 1000px; margin: 0 auto;">
				<div id="commentCount" class="board-comment-count col-sm-12"></div>
				<div id="board-comment" class="comment-container col-sm-12" style="widows: 1000px; margin: 0 auto; padding-top: 10px;"></div>
				<div class="board-write col-sm-12" style="widows: 1000px; margin: 0 auto; padding-top: 10px;">
					<span style="padding-top: 20px;">댓글 쓰기</span><br>
					<input type="hidden" name="boardRef" value="<%=b.getBoardNo()%>"/>
					<div style="display: inline-block; vertical-align: middle;">
						<textarea id="boardCommentContent" name="boardCommentContent" rows="2" cols="134" placeholder="댓글을 입력하세요"></textarea>
					 </div>
					 <div style="display: inline-block; vertical-align: middle;">
						<button type="submit" name="insert-btn" style="width: 100px; height: 55;">등록</button>
					 </div>
				</div>
			</div>
		</div>
    <%}; %>
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
<%-- 	const boardLike=()=>{
		 if(<%=m%> == null){
			alert("로그인을 해야 게시글을 추천 할 수 있습니다.");
		}else if(<%=m.getMemberId()%> != null && <%=m.getMemberId()%>.equals(b.getBoardWriter())){
			alert("자신의 게시글은 추천 할 수 없습니다.");
			location.reload();
		}else if(<%=m.getMemberId()%> != null && !<%=m.getMemberId()%>.equals(b.getBoardWriter())){
			if(confirm("해당 게시글을 추천하시겠습니까?")){
				location.assign("<%=request.getContextPath()%>/board/boardLike.do?boardNo=<%=b.getBoardNo()%>&boardWriter=<%=b.getBoardWriter()%>");
			}else{
				location.assign("<%=request.getContextPath()%>/board/boardView.do");
			}
		};
	}; --%>
	
	$(document).ready(()=>{
		commentList();
		commentListCount();
	});
	
	let input = 0;
	// 게시글 댓글을 불러오는 함수
 	function commentList(){
		$.ajax({
			url: "<%=request.getContextPath()%>/board/boardCommentListAjax.do",
			type: "post",
			data: {"boardNo":<%=b.getBoardNo()%>},
			success: function(data){
				if(data.length == 0){
					let rowDiv = $("<div>").attr({class: 'row'});
					let msg = $("<div>").html('댓글이 없습니다.');
					rowDiv.append(msg);
					$("#board-comment").append(rowDiv);
				}else if(data.length > 0) {
						let rowDiv = $("<div>").attr({class: 'row'});
						for(let i = 0; i < data.length; i++){
							let idDiv = $("<div class='col-sm-1' style='font-size: 17px; padding-top: 5px; font-weight: bolder'>").text(data[i]["boardCommentWriter"]);
							let dateDiv = $("<div class='col-sm-2' style='font-size: 12px; color: darkgray; padding-top: 10px;'>").text(data[i]["boardCommentDate"]);
							let btnDiv = $("<div class='col-sm-9' style='text-align: right;'>");
							let replyBtn = $("<button style='font-size: 10px;' onclick='deleteComment();'>").text("댓글삭제");
							if('<%=m.getMemberId()%>' == data[i]["boardCommentWriter"]) {
								btnDiv.append(replyBtn);
							};
							let contentDiv = $("<div class='col-sm-12' style='font-size: 17px; padding-top: 10px;'>").html(data[i]["boardCommentContent"]);
							input = $("<input id='hiddenNo' type='hidden'>").val(data[i]['boardCommentNo']);
							let lineDiv = $("<div class='row' style='border-top: 1px solid #ddd; padding-top: 20px; padding-top: 1px;'>");
							rowDiv.append(idDiv).append(dateDiv).append(btnDiv).append(contentDiv).append(input).append(lineDiv);					
							console.log(data[i]['boardCommentNo'])
							console.log(input.val());
						}
						$("#board-comment").append(rowDiv);
					}
				}
			});
		};
	
	// 삭제 번튼을 눌렀을 경우 댓글 삭제하는 함수
	const deleteComment=()=>{
		if(confirm("댓글을 삭제하시겠습니까?")){
			location.assign("<%=request.getContextPath()%>/board/boardCommentDelete.do?boardNo=<%=b.getBoardNo()%>&boardCommentNo=" + $("#hiddenNo").val());
			commentList();
		}
	}
	
	// 게시글의 댓글이 몇개인지 불러오는 함수
 	function commentListCount(){
		$.ajax({
			url: "<%=request.getContextPath()%>/board/boardCommentListCount.do",
			type: "post",
			data: {"boardNo":<%=b.getBoardNo()%>},
			success: function(data){
				$("#commentCount").text('댓글' + data + '개');
			}
		})
	};
	
	

	
</script>


