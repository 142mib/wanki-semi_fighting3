<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<body style="padding:0 20px; background:skyblue;">
	<form method="post" action="<%=request.getContextPath()%>/member/findpwdend.do">
		<div>
			<h2>비밀번호 찾기</h2>
			<span>가입 시 등록한 이름과 이메일을 입력해주세요.</span>
		</div>
		<hr>
	    <div>
	    	<span>이름</span><br>
	    	<input style="height:30px; width:200px" type="text" name="memberName" autofocus required>
	    </div>
	    <div>
	    	<span class="spantitle">이메일</span><br>
					<input style="height:30px; width:110px" type="text" placeholder="" name="email_id" id="email_id" autofocus required>
					<span>@</span>
					<input style="height:30px; width:130px" type="text" placeholder="선택하세요" name="email_domain" id="email_domain">
					<select style="height:36px; width:120px" id="select">
			            <option value="" disabled selected>E-Mail 선택</option>
			            <option value="naver.com" id="naver.com">naver.com</option>
			            <option value="hanmail.net" id="hanmail.net">hanmail.net</option>
			            <option value="gmail.com" id="gmail.com">gmail.com</option>
			            <option value="nate.com" id="nate.com">nate.com</option>
			            <option value="directly" id="textEmail">직접 입력하기</option>
			        </select>
	    </div>
	    <div style="text-align:center; margin-top:30px;">
	    	<input style="width:90px; height:30px; cursor:pointer;" type="submit" value="비밀번호 찾기">
	    	<input style="width:50px; height:30px; cursor:pointer;" type="button" value="닫기" onclick="window.close();">
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