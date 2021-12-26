<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    


<script src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>

<%@ page import="com.boong.board.model.vo.Board" %>

<%
	Board updateBoard = (Board)request.getAttribute("updateBoard");
%>

<style>
	#boardWirte-head{
		margin: 0 auto;
		text-align: center;
	}

	#boardWrite-tbl{
		margin: 0 auto;
	}
	
	#summernote{
		display: block;
		margin: 0 auto;
		resize: none;
		border-radius: 5px;
	}
	
	#upload-file{
		margin: 0 auto;
	}
	
	#category{
		width: 150px;
		height: 30px;
		text-align: center;
		border-radius: 5px;
	}
	
	#boardTitle{
		width: 870px;
		height: 30px;
		border-radius: 5px;
	}
	
	#car-icon{
		margin-left: 450px;
		margin-top: 50px;
		margin-bottom: 50px;
		font-size: 30px;
	}
	
	#file-container{
		margin: 0 auto;
	}
	
	.fa-pen{
	}
</style>

<%@ include file="/views/common/header.jsp" %>
<header>
	<section>
		<div id="blank" style="width:100%;height: 70px;background-color: brown"></div>
	</section>
</header>


<form action="<%=request.getContextPath() %>/board/boardUpdateEnd.do" method="post" enctype="multipart/form-data">
	<section>
		<div id="boardWrite-container">
			<table id="boardWrite-tbl">
				<thead>
					<tr>
						<th colspan="2"><i class="fas fa-pen">&nbsp;게시글 수정</i></th>
					</tr>
				</thead>
				<tbody>
				 	<tr>
					<td>
						<select name="category" id="category">
								<option>카테고리 선택</option>
								<option value="1" <%=updateBoard.getBoardCategory() == 1 ? "selected" : ""%>>질문/답변</option>
								<option value="2" <%=updateBoard.getBoardCategory() == 2 ? "selected" : ""%>>정보/공유</option>
								<option value="3" <%=updateBoard.getBoardCategory() == 3 ? "selected" : ""%>>구매/판매</option>
								<option value="4" <%=updateBoard.getBoardCategory() == 4 ? "selected" : ""%>>자유</option>
						</select>
					</td>
					<td>
						<input type="text" name="boardTitle" id="boardTitle" value="<%=updateBoard.getBoardTitle()%>"/>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea name="boardContent" id="boardContent" cols="100">
							<%=updateBoard.getBoardContent() %>
						</textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="file" name="upfile" id="upload-file" value="파일 첨부" multiple/>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" id="board-upload" value="수정">
					</td>
				</tr>
				</tbody>
			</table>
			<div id="hidden">
				<input name="boardNo" type="hidden" value="<%=updateBoard.getBoardNo()%>"/>
			</div>
			
		</div>
	</section>
</form>

<%@ include file="/views/common/footer.jsp" %>

<script>
</script>