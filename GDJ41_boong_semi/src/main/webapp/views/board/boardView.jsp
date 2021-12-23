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
</style>

<header>
	<section>
		<div id="blank" style="width:100%;height: 70px;background-color: brown"></div>
	</section>
</header>

 
<section>
<form action="<%=request.getContextPath()%>/board/boardUpdate.do" method="post">
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
    	<input type="hidden" name="board-No" value="<%=b.getBoardNo()%>"/>
        <div class="col-lg-10" style="background-color: lightgray;"><%=b.getBoardTitle()%></div>
        <input type="hidden" name="board-title" value="<%=b.getBoardTitle()%>">
        <div class="col-lg-2" style="text-align: right; background-color: lightgray;"><%=b.getBoardDate()%></div>
    </div>
    <div class="row">
        <div class="col-lg-8"><%=b.getBoardWriter() %></div>
       	<input type="hidden" name="board-writer" value="<%=b.getBoardWriter() %>"/>
        <div class="col-lg-2" style="text-align: right;">추천 수&nbsp;<%=b.getBoardLike() %></div>
        <div class="col-lg-2" style="text-align: right;">조회 수&nbsp;<%=b.getBoardViewCount() %></div>
    </div>
    <div class="row">
        <div class="col-xs-12" style="min-height: 500px;">
        	<%=b.getBoardContent() %>
        	<input type="hidden" name="board-content" value="<%=b.getBoardContent() %>"/>
       	</div>
    </div>
    <div class="row">
		<div class="col-xs-12" style="text-align: center;">
			<button type="button" onclick="boardLike();">추천하기</button>
		</div>
    </div>
    <!-- 로그인한 아이디와 작성자 아이디가 같을 경우에만 수정/삭제 버튼 출력 -->
    <%if(m.getMemberId().equals(b.getBoardWriter())) {%>
	    <div class="row">
	        <div class="col-lg-11" style="text-align: right;">
	        	<input type="submit" value="수정"/>
	        </div>
	        <div class="col-lg-1" style="text-align: left;" >
	        	<button type="button" onclick="deleteConfirm();">삭제</button>
	        </div>
	    </div>
	<%} %>
</div>
</form>

	<!-- 댓글 부분 -->		
		<div class="container">
		    <div class="row">
		        <div class="col-sm-12"></div>
		        <div class="col-sm-12"></div>
		        <div class="col-sm-12"></div>
		    </div>
		</div>

</section>

<%@ include file="/views/common/footer.jsp" %>

<script>
	const deleteConfirm=()=>{
		if(confirm("정말로 삭제 하시겠습니까?")){
			location.assign("<%=request.getContextPath()%>/board/boardDelete.do?boardNo=<%=b.getBoardNo()%>");
		}else{
			location.reload();
		}
	}
	
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
	}
</script>


