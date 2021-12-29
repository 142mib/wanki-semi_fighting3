<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<div id="blank"
	style="width: 100%; height: 70px; background-color: steelblue;"></div>
<style>
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

.box {
	width: 300px;
	height: 40px;
	padding: 10px;
	border-radius: 5px;
	border: lightgray 1px solid;
	border-shadow: 3px 3px 3px 3px gray;
	margin-bottom: 20px;
}


</style>
<body>
<%@ include file="/views/member/membersidenav.jsp"%>

		<div class="section">
			<div class="mypage-container">
				<h3>회원 탈퇴</h3>
				<p><%=loginMember.getMemberName()%>
					님 탈퇴하시겠습니까?
				</p>
				<hr>
				<form id="deleteMemberForm" action="<%=request.getContextPath()%>/member/deleteend.do"
					method="post" onsubmit="return delConfirm();">
					<%-- <div>
				<img class="carimg" src="<%=request.getContextPath() %>/assets/img/member/sadcar.png"">
			</div> --%>
					<div>
						<span>아이디</span><br><input type="text" class="box" name="memberId" value="<%=loginMember.getMemberId()%>" readonly>
					</div>
					<div>
						<span>비밀번호 확인</span><br> <input type="password" class="box" name="memberPw" autofocus required>
					</div>
					<div>
						<input type="submit" value="회원 탈퇴">
							
					</div>
						
				</form>
			</div>
		</div>
	</div>
	
	<script>
		function delConfirm(){
			if(confirm("정말 탈퇴하시겠습니까? 회원 탈퇴 시 회원님의 모든 정보는 삭제되고 복구할 수 없습니다.")==true){
				return true;
			}else{
				return false;
			}
		}
		
		$("#fifth-menu").addClass("active");
		
	</script>


	<%@ include file="/views/common/footer.jsp"%>