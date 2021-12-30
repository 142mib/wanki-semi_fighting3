<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.boong.member.model.vo.Member"%>
<%
	Member m=(Member)request.getAttribute("member");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 회원관리</title>

<style>
.btn{
	width:70px; height:35px;
	border:none;
	border-radius: 10px;
	cursor:pointer; 
	background:coral; color:white;
	font-size:13px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
}
.box {
	height: 35px;
	width: 250px;
	border-radius: 5px;
	border: solid 1px lightgray;
	font-size: 16px;
}
table{
	width:550px;
	height:350px;
}
</style>

</head>
<body style="padding:0 20px;">
	<h2 style="color:coral;">관리자 회원 관리<input style="float:right; background:purple;" class="btn" type="submit" value="원래대로" onclick="location.reload();"></h2>
	
	<hr>
	<table>
		<tr>
			<td><span>아이디</span><br> <input type="text"
				class="box oriInfo" name="memberId" id="memberId_"
				value="<%=m.getMemberId()%>" disabled></td>
			<td>
			<td>
			<td><span>성별</span><br> 
				<%if(m.getGender().equals("M")){ %> 
				<select style="width:256px; height:38px;" class="box editInfo" id="gender" name="gender">
					<option value="M" selected>남자</option>
					<option value="F">여자</option>
				</select> 
				<%}else{ %> 
				<select style="width:256px; height:38px;" class="box editInfo" id="gender" name="gender">
					<option value="M">남자</option>
					<option value="F" selected>여자</option>
			</select> <%} %></td>
		</tr>
		<tr>
			<td><span>이름</span><br> <input type="text"
				class="box editInfo" name="memberName" id="memberName"
				value="<%=m.getMemberName()%>"></td>
			<td>
			<td>
			<td><span>가입일</span><br> <input type="text"
				class="box oriInfo" name="enrollDate" id="enrollDate"
				value="<%=m.getEnrollDate()%>" disabled></td>
		</tr>
		<tr>
			<td><span>이메일</span><br> <input type="email"
				class="box editInfo" placeholder="abc@xyz.com" name="email"
				id="email" value="<%=m.getEmail()%>"></td>
			<td>
			<td>
			<td><span>전화번호</span><br> <input type="tel"
				class="box editInfo" placeholder="(-없이)01012345678" name="phone"
				id="phone" value="<%=m.getPhone()%>"></td>
		</tr>
		<tr>
			<td colspan="3"><span>주소</span><br> <input type="text"
				class="box editInfo" placeholder="" name="address" id="address"
				value="<%=m.getAddress()%>"></td>
			<td colspan="3"><span>관심브랜드</span><br> <input type="text"
				class="box editInfo" name="car" id="car" value="<%=m.getCar()%>">
			</td>
		</tr>

	</table>
		<div style="text-align:center; margin-top:30px;">
	    	<input class="btn" type="submit" value="변경 완료">
	    	<input class="btn" type="button" value="삭제" id="del-btn" onclick="location.replace('<%=request.getContextPath()%>/admin/deletemember.do?memberId=<%=m.getMemberId()%>');">
				    
	    </div>
</body>

<script>
		/* $("#del-btn").on("click",e=>{
			if(confirm("정말 회원을 삭제하시겠습니까? 삭제 시 모든 정보는 삭제되고 복구할 수 없습니다.")==true){
				return true;
			}else{
				return false;
			}
		}); */

<%-- 	$("#del-btn").click(e=>{
		let memberId=<%=m.getMemberId()%>;
			$.ajax({
	    		url:"<%=request.getContextPath()%>/admin/deletemember.do",
	    		type: "post",
	    		data: {"memberId" : memberId},
	    		dataType: "json",
	    		success: function(result){
	    			if(result>0){
	    				alert("회원을 성공적으로 삭제했습니다.");
	    				window.close();
	    			}else{
	    				alert("회원 삭제 실패")
	    			}
	    		},
	    		error : function(){
	    			alert("서버요청 실패");
	    		}
			})
	}); --%>
</script>
</html>