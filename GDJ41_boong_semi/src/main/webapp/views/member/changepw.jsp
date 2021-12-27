<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<div id="blank"
	style="width: 100%; height: 70px; background-color: steelblue;"></div>

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
<style>
/* @import url('https://fonts.googleapis.com/css2?family=Open+Sans&display=swap'); */
#section {
	padding: 100px 20px 100px 220px;
	background-color: #dcdcde;
	paddng-top: 70px;
}

.mypage-container {
	width: 80%;
	height: 600px;
	background-color: white;
	border: none;
	border-radius: 10px;
	padding: 30px 60px;
	margin-left: 100px;
	margin-top: 70px;
	margin-bottom:70px;
	display: block;
	box-shadow: 5px 5px 5px 5px lightgray;
}

.mypage-content {
	width: 100%
}

h2 {
	padding: 0 60px;
	margin-left: 45px;
}

ul {
	list-style: none;
	margin-top: 30px;
}

.box {
	width: 300px;
	height: 40px;
	padding: 10px;
	border-radius: 5px;
	border: lightgray 1px solid;
	border-shadow: 3px 3px 3px 3px gray;
	margin-bottom: 20px;
}

.menuicon {
	width: 30px;
	height: 30px;
	margin-right: 10px;
}

#mypage-content {
	max-width: 80%;
	display: inline-block;
}

table {
	max-width: 100%;
}

#edit-icon {
	width: 30px;
	height: 30px;
	margin-right: 10px;
	/* float:right; */
}

#edit-btn {
	width: 150px;
	height: 50px;
	border: none;
	background-color: navy;
	color: white;
	margin-left: 20px;
}

#save-btn {
	width: 150px;
	height: 50px;
	border: none;
	background-color: red;
	color: white;
	margin-left: 20px;
}

#back {
	width: 150px;
	height: 50px;
	border: none;
	background-color: black;
	color: white;
	margin-left: 20px;
}

#save {
	display: none;
}

</style>
<body>
<%@ include file="/views/member/membersidenav.jsp"%>

		<div class="section">
			<div class="mypage-container">
				<h3>비밀번호 변경</h3>
				<p><strong><%=loginMember.getMemberName() %></strong>
					님의 비밀번호를 변경합니다.
				</p>
				<hr>
				<form id="pwChangeForm" action="<%=request.getContextPath()%>/member/changepwend.do" 
					method="post" onsubmit="return changePwValidate();">
					<div>
						<span>현재 비밀번호</span><br>
						<input type="password" class="box" name="memberPw" required>
					</div>
					<div>
						<span>새로운 비밀번호</span><br> 
						<input type="password" class="box" id="newPw" name="newMemberPw" required><br>
					</div>
					<div>
						<span>비밀번호 확인</span><br> 
						<input type="password" class="box" id="newPwCheck"required><br>
						<span id="pwresult"></span>
					</div>
					<div>
						<input type="submit" value="변경">
					</div>
					<input type="hidden" name="memberId" value="<%=loginMember.getMemberId()%>">
				</form>
			</div>
		</div>
	</div>
	
	<script>
	$(()=>{
		$("#newPwCheck").keyup(e=>{
			if($(e.target).val().trim().length>5){
				if($(e.target).val()==$("#newPw").val()){
					$("#pwresult").text("비밀번호가 일치합니다.").css({"color":"green"});
				}else{
					$("#pwresult").text("비밀번호가 일치하기 않습니다.").css({"color":"tomato"});
				}
			}
		});
	});
		
	const changePwValidate=()=>{
		const newPw=$("#newPw").val().trim();
		if(newPw.length<6){
			alert("비밀번호는 6글자 이상 입력하세요!");
			$("#newPw").focus();
			return false;
		}
	}
	
	$("#second-menu").addClass("active");
	
	</script>





	<%@ include file="/views/common/footer.jsp"%>