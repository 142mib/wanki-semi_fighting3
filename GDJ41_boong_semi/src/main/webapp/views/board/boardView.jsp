<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.boong.board.model.vo.Board" %>

<%
	Board b = (Board)request.getAttribute("selectBoard");
	Member m = (Member)session.getAttribute("loginMember");
%>

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
<div class="container" style="margin-top: 30px;">
    <div class="row">
        <div class="col-lg-2"><i class="far fa-clipboard">게시판</i></div>
        <div class="col-lg-2">
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
        <div name="board-title" class="col-lg-10" style="background-color: lightgray;"><%=b.getBoardTitle()%></div>
        <div name="board-date" class="col-lg-2" style="text-align: right; background-color: lightgray;"><%=b.getBoardDate()%></div>
    </div>
    <div class="row">
        <div class="col-lg-8"><%=b.getBoardWriter() %></div>
        <div class="col-lg-2" style="text-align: right;">추천 수&nbsp;<%=b.getBoardViewCount() %></div>
        <div class="col-lg-2" style="text-align: right;">조회 수&nbsp;<%=b.getBoardLike() %></div>
    </div>
    <div class="row">
        <div name="board-content" class="col-xs-12" style="min-height: 500px;">
        	<%=b.getBoardContent() %>
       	</div>
    </div>
    <div class="row">
		<div class="col-xs-12" style="text-align: center;">
			<button>추천!</button>
		</div>
    </div>
    <!-- 로그인한 아이디와 작성자 아이디가 같을 경우에만 수정 / 삭제 버튼 출력 -->> 
    <%if(m.getMemberId().equals(b.getBoardWriter())) {%>
	    <div class="row">
	        <div class="col-xs-12" style="text-align: right;">
	        	<input type="submit" value="수정"/>
	        	<button>삭제</button>
	        </div>
	    </div>
	<%} %>
</div>
</section>

    
<%@ include file="/views/common/footer.jsp" %>