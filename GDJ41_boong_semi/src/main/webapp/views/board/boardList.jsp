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
		
		<table>
		<thead>
		  <tr>
		    <th colspan="6"><i class="fas fa-car-side">&nbsp;게시판</i></th>
		  </tr>
		</thead>
		<tbody>
		  <tr>
		    <td colspan="6">카테고리 || 자유&nbsp;&nbsp;&nbsp;&nbsp;질문/답변&nbsp;&nbsp;&nbsp;&nbsp;정보/공유 </td>
		  </tr>
		  <tr>
		    <td colspan="6"></td>
		  </tr>
		  <tr>
		    <th>카테고리</th>
		    <th>제목</th>
		    <th>글쓴이</th>
		    <th>날짜</th>
		    <th>조회</th>
		    <th>추천</th>
		  </tr>
		  <tr>
		    <td></td>
		    <td></td>
		    <td></td>
		    <td></td>
		    <td></td>
		    <td></td>
		  </tr>
		</tbody>
		</table>
	</section>
</header>

		<button id="write" onclick="location.assign('<%=request.getContextPath()%>/board/boardWrite.do')"><i class="fas fa-pen"></i>&nbsp;쓰기</button>
<%@ include file="/views/common/footer.jsp" %>