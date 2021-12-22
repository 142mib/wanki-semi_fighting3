<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp" %>

<%@ page import="com.boong.member.vo.Member" %>

<%
	Member m = (Member)session.getAttribute("loginMember");
%>

<script src="https://kit.fontawesome.com/f88ebc8ec2.js" crossorigin="anonymous"></script>

<script src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/board/summernote-lite.css">
<script src="<%=request.getContextPath()%>/js/board/summernote-lite.js"></script>
<script src="<%=request.getContextPath()%>/js/board/lang/summernote-ko-KR.js"></script>


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

<header>
	<section>
		<div id="blank" style="width:100%;height: 70px;background-color: brown"></div>
	</section>
</header>

<form action="<%=request.getContextPath() %>/board/boardWriteEnd.do" method="post" enctype="multipart/form-data" accept-charset="utf-8">
	<section>
		<div id="boardWrite-container">
			<table id="boardWrite-tbl">
				<thead>
					<tr>
						<th colspan="2"><i class="fas fa-pen">&nbsp;게시글 작성</i></th>
					</tr>
				</thead>
				<tbody>
				 	<tr>
					<td>
						<select name="category" id="category">
								<option>카테고리 선택</option>
								<option value="1">질문/답변</option>
								<option value="2">정보/공유</option>
								<option value="3">구매/판매</option>
								<option value="4">자유</option>
						</select>
					</td>
					<td>
						<input type="text" name="boardTitle" id="boardTitle" placeholder="제목"/>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea name="boardContent" id="boardContent" cols="100"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="file" name="upfile" id="upload-file" value="파일 첨부" multiple />
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" id="board-upload" value="등록">
					</td>
				</tr>
				</tbody>
			</table>
			<div id="hidden">
				<input type="hidden" name="boardWriter" value="<%=m.getMemberId() %>" />
			</div>
			
		</div>
	</section>
</form>

<%@ include file="/views/common/footer.jsp" %>

<script>
	// 웹 에디터 불러오는 기능
	$(document).ready(function(){
		$('#boardContent').summernote({
			height: "500",
			lang: "ko-KR",
			placeholder: "글 내용을 작성하세요.",
			disableResizeEditor: true
		});
	});
</script>















