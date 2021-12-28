<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOONG 비밀번호 찾기</title>
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
}
</style>
<script src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>

<body>
<body style="padding:0 20px;">
	<form method="post" action="<%=request.getContextPath()%>/member/findpwend.do">
		<div>
			<h2 style="color:#7f47e9;">비밀번호 재설정</h2>
			<span style="color:#7f47e9;">가입 시 등록한 아이디, 이름, 이메일을 입력해주세요.</span>
		</div>
		<hr>
		<div>
	    	<span>아이디</span><br>
	    	<input style="height:32px; width:200px; border-radius:5px; border:solid 1px lightgray;" 
	    		type="text" name="memberId" autofocus required>
	    </div>
	    <div>
	    	<span>이름</span><br>
	    	<input style="height:32px; width:200px; border-radius:5px; border:solid 1px lightgray;" 
	    		type="text" name="memberName" required>
	    </div>
	    <div>
	    	<span class="spantitle">이메일</span><br>
					<input style="height:32px; width:112px; border-radius:5px; border:solid 1px lightgray;" 
						type="text" placeholder="" name="email_id" id="email_id" autofocus required>
					<span>@</span>
					<input style="height:32px; width:122px; border-radius:5px; border:solid 1px lightgray;" 
						type="text" placeholder="선택하세요" name="email_domain" id="email_domain">
					<select style="height:36px; width:122px; border-radius:5px; border:solid 1px lightgray;" id="select">
			            <option value="" disabled selected>E-Mail 선택</option>
			            <option value="naver.com" id="naver.com">naver.com</option>
			            <option value="hanmail.net" id="hanmail.net">hanmail.net</option>
			            <option value="gmail.com" id="gmail.com">gmail.com</option>
			            <option value="nate.com" id="nate.com">nate.com</option>
			            <option value="directly" id="textEmail">직접 입력하기</option>
			        </select>
	    </div>
	    <div>
						<span>새로운 비밀번호</span><br> 
						<input type="password" style="height:32px; width:200px; border-radius:5px; border:solid 1px lightgray; id="newPw" name="newMemberPw" required><br>
					</div>
					<div>
						<span>비밀번호 확인</span><br> 
						<input type="password" style="height:32px; width:200px; border-radius:5px; border:solid 1px lightgray; id="newPwCheck"required><br>
						<span id="pwresult"></span>
					</div>
					<div>
						<input type="submit" value="변경">
					</div>
					<%-- <input type="hidden" name="memberId" value="<%=m.getMemberId()%>"> --%>
	    <hr>
	    <div style="text-align:center; margin-top:30px;">
	    	<input class="btn" type="submit" value="비밀번호 재설정">
	    	<input class="btn" type="button" value="닫기" onclick="window.close();">
	    </div>
	    
    </form>
    
    
<script>
    $(function() {
        $('#select').change(function() {
            if ($('#select').val() == 'directly') {
                $('#email_domain').attr("disabled", false);
                $('#email_domain').val("");
                $('#email_domain').focus();
            } else {
                $('#email_domain').val($('#select').val());
            }
        })
    });
</script>
    
    
</body>
</html>