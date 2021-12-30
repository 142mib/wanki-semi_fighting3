<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOONG 아이디 찾기</title>

<style>
.btn{
	width:110px; height:40px;
	border:none;
	border-radius: 10px;
	cursor:pointer; 
	background:seagreen; color:white;
	font-size:15px;
}
div{
margin-bottom: 10px;
}
</style>
<script src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>

</head>
<body style="padding:0 20px;">
	<form method="post" action="<%=request.getContextPath()%>/member/findidend.do">
		<div>
			<h2 style="color:seagreen;">아이디 찾기</h2>
			<span style="color:seagreen;">가입 시 등록한 이름과 이메일을 입력해주세요.</span>
		</div>
		<hr>
	    <div>
	    	<span>이름</span><br>
	    	<input style="height:32px; width:200px; border-radius:5px; border:solid 1px lightgray;" type="text" name="memberName" autofocus required>
	    </div>
	    <div>
	    	<span class="spantitle">이메일</span><br>
					<input style="height:32px; width:110px; border-radius:5px; border:solid 1px lightgray;" type="text" placeholder="" name="email_id" id="email_id" autofocus required>
					<span>@</span>
					<input style="height:32px; width:130px; border-radius:5px; border:solid 1px lightgray;" type="text" placeholder="선택하세요" name="email_domain" id="email_domain">
					<select style="height:36px; width:120px; border-radius:5px; border:solid 1px lightgray;" id="select">
			            <option value="" disabled selected>E-Mail 선택</option>
			            <option value="naver.com" id="naver.com">naver.com</option>
			            <option value="hanmail.net" id="hanmail.net">hanmail.net</option>
			            <option value="gmail.com" id="gmail.com">gmail.com</option>
			            <option value="nate.com" id="nate.com">nate.com</option>
			            <option value="directly" id="textEmail">직접 입력하기</option>
			        </select>
	    </div>
	    <div style="text-align:center; margin-top:30px;">
	    	<input class="btn" type="submit" value="아이디 찾기">
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