<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.boong.member.model.vo.Member" %>
<%
	Member m=(Member)request.getAttribute("member");
	String memberId=(String)request.getAttribute("memberId");
%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정</title>
</head>
<style>
.btn{
	width:110px; height:40px;
	border:none;
	border-radius: 10px;
	cursor:pointer; 
	background:#7f47e9; color:white;
	font-size:15px;
}
div{
margin-bottom: 10px;
text-align:center;
}
</style>
<script src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<body>

	<form id="pwChangeForm"
		action=""
		method="post" onsubmit="return changePwValidate();">
		<div>
			<h2 style="color: #7f47e9;">비밀번호 재설정</h2>
			<span style="color: #7f47e9;">정보를 확인하였습니다. 비밀번호를 재설정해 주세요.</span>
		</div>
		<hr>
		<div>
			<span>새로운 비밀번호</span><br> <input style="height:32px; width:200px; border-radius:5px; border:solid 1px lightgray;" type="password" class="box"
				id="newPw" name="newMemberPw" required><br>
		</div>
		<div>
			<span>비밀번호 확인</span><br> <input style="height:32px; width:200px; border-radius:5px; border:solid 1px lightgray;" type="password" class="box"
				id="newPwCheck" required><br> 
				<span id="pwresult"></span>
		</div>
			<div id="resetPwResult"></div>
		<div>
			<input class="btn" type="submit" value="변경" id="reset-btn">
		</div>
		<input type="hidden" name="memberId" value="<%=memberId%>"> 
	</form>
</body>

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
	
	//안돼ㅠㅠ
	$("#reset-btn").click(e=>{
		$.ajax({
			url:"<%=request.getContextPath()%>/member/resetpwend.do",
			type: "post",
			data: {("newMemberPw":newMemberPw),("memberId":memberId)},
			dataType: "json",
			success: function(result){
				if(result>0){
					$("#resetPwResult").text("비밀번호가 재설정되었습니다.").css({"color":"red"});
				}else{
					$("#resetPwResult").text("비밀번호 변경 실패. 다시 정보를 확인하세요.").css({"color":"green"});
				}
			},
			error : function(){
				alert("서버요청 실패");
			}
			
		})
	})
	
	
	
	</script>

</html>