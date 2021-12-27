<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp" %>

<%@ page import="com.boong.member.model.vo.Member " %>

<%
	Member m = (Member)session.getAttribute("loginMember");
%>

<script src="https://kit.fontawesome.com/f88ebc8ec2.js" crossorigin="anonymous"></script>

<script src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>

<!-- smartEditor -->
<script type="text/javascript" src="<%=request.getContextPath() %>/editor/board/js/service/HuskyEZCreator.js" charset="utf-8"></script>


<style>

	#boardWrite-container{
		margin-top: 30px;
	}

	.a{
		margin: 0 auto;
		width: 1000px;
	}
	#boardWirte-head{
		margin: 0 auto;
		text-align: center;
	}

	#boardWrite-tbl{
		margin: 0 auto;
	}
	
	#content{
		width: 1020px;
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
	
	#file-container{
		margin: 0 auto;
	}
	
	.fa-pen{
	}
	
	#boardWrite-wrap{
		background-color: #f3f3f3;
	}
</style>

<header>
	<section>
		<div id="blank" style="width:100%;height: 70px;background-color: brown"></div>
	</section>
</header>

<form id="frm" action="<%=request.getContextPath() %>/board/boardWriteEnd.do" method="post" enctype="multipart/form-data" accept-charset="utf-8">
	<section>
		<div id="boardWrite-container">
			<div class="a" style="font-size: 30px;"><i class="fas fa-pen">&nbsp;게시글 작성</i></div>
			<div id="boardWrite-wrap" >
				<table id="boardWrite-tbl" style="margin-top:30px">
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
				</table>
				<br>
				<div id="content">
					<textarea name="boardContent" id="boardContent" cols="100" rows="25" placeholder="회원간 따듯한 글, 댓글 활동을 부탁드립니다." style="resize: none;"></textarea>
				</div>
				<div style="margin:0 auto; width:1030px; text-align: right;">
					<!-- <input type="file" name="upfile" id="upload-file" value="파일 첨부" multiple /> -->
					<input type="submit" id="board-upload" value="등록">
				</div>
			</div>
			
			<div id="hidden">
				<!-- 로그인한 계정의 아이디를 작성자로 넣음 -->
				<input type="hidden" name="boardWriter" value="<%=m.getMemberId() %>" />
			</div>
			
		</div>
	</section>
</form>

<%@ include file="/views/common/footer.jsp" %>

<script>

</script>















