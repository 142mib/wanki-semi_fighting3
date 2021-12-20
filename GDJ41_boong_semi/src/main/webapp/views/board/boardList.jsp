<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp" %>

<script src="https://kit.fontawesome.com/f88ebc8ec2.js" crossorigin="anonymous"></script>

<style>
	#boardList-tbl{
		margin: 0 auto;
	}
</style>

<header>
	<section>
		<div id="blank" style="width:100%;height: 70px;background-color: brown;">
		
		</div>
		<p>게시판</p>
		<table id="boardList-tbl" style="border: 1px solid black">
			<th>카테고리</th><th>제목</th><th>글쓴이</th><th>날짜</th><th>조회</th><th>추천</th>
			<tr>
				<td>질문/답변</td>
				<td>제목테스트</td>
				<td>admin</td>
				<td>2021-12-20</td>
				<td>10</td>
			</tr>	
		</table>
		<button id="write" onclick="location.assign('<%=request.getContextPath()%>/board/boardWrite.do')"><i class="fas fa-pen"></i>&nbsp;쓰기</button>
	</section>
</header>

<%@ include file="/views/common/footer.jsp" %>