<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp" %>

<script src="https://kit.fontawesome.com/f88ebc8ec2.js" crossorigin="anonymous"></script>


<style>
	#boardWirte-head{
		margin: 0 auto;
		text-align: center;
	}

	#boardWrite-tbl{
		margin: 0 auto;
	}
	
	#board-content{
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
		<div id="blank" style="width:100%;height: 70px;background-color: brown;">
	</section>
</header>
<div id="boardWirte-head">
	<i class="fas fa-pen">&nbsp;게시글 작성</i>	
</div>


<form action="">
	<section>
		<div id="boardWrite-container">
			<table id="boardWrite-tbl">
				<tbody>
					<tr>
						<td>
							<select name="category" id="category">
								<option>카테고리 선택</option>
							</select>
						</td>
						<td>
							<input type="text" name="boardTitle" id="boardTitle" placeholder="제목"/>
						</td>
					</tr>
				</tbody>
			</table>
			<div id="boardContent-container">
				<textarea id="board-content" cols="100" rows="20" placeholder="글 내용을 작성하세요."></textarea>
			</div>
		</div>
		<div id="file-container">
			<input type="file" id="upload-file" value="파일첨부" />
		</div>
	</section>
</form>




<%@ include file="/views/common/footer.jsp" %>