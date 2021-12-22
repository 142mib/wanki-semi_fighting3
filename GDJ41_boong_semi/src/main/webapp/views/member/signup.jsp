<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp" %>

<style>

div#signUp{margin-top:80px; margin-left: 30%; margin-bottom: 100px;}
ul,li{list-style: none;}
ul#signup-ul li{margin-bottom: 20px; text-align: left;}
.box{
	width: 450px; height: 50px; 
	padding: 10px; border-radius: 8px; 
	border: solid #288ad8 1px; 
	background-color: #dee2e6;
}
#memberId_{
	width: 376px; height: 50px; 
	padding: 10px; border-radius: 8px; 
	border: solid #288ad8 1px; 
	background-color: #dee2e6;
}
#signup-btn{
	width: 200px;
	height: 40px;
	border-radius: 8px;
	border: none;
	background-color: #288ad8;
	color: white;
	cursor:pointer;
	margin-left: 20px;
}
#cancle-btn{
	width: 200px;
	height: 40px;
	border-radius: 8px;
	border: #288ad8 solid 1px;
	background-color: white;
	color: black;
	cursor:pointer;
	margin-left: 10px;
}
h3{margin-left:160px; margin-bottom: 60px;}
#logo{color:#288ad8; font-size: 40px;}
#idDuplicateBtn{width: 70px; height: 50px; 
	padding: 10px; border-radius: 8px; 
	border: 1px solid pink;
	background-color: pink;
	pointer:cursor;
	font-size: 13px;}
#idDuplicateBtn:hover{
	background-color: lime; border: solid 1px lime;
}
::placeholder{
	font-size: 14px; font-style: italic;
}
#op-default{
	color: gray; font-size: 14px; font-style: italic;
}
.star{color:tomato;}
.box2{width: 150px; height: 50px; 
	padding: 10px; border-radius: 8px; 
	border: solid #288ad8 1px; 
	background-color: #dee2e6;}
.spantitle{font-weight:bold;}
</style>

<div id="blank" style="width:100%;height: 70px; background-color: darkcyan;"></div>
<section id=signup-container>
        <title>BOONG 회원가입</title>
        <form name="signUpForm" action="<%=request.getContextPath() %>/member/signupEnd.do" 
        	method="post" onsubmit="return memberSignupValidate();" >
        <div id="signUp">
        	<h3><span id="logo">BOONG</span> 회원 가입</h3>
	        <ul id="signup-ul">
	        	<li>
	        	<span class="spantitle">아이디<span class="star">*</span></span><br>
	        		<input type="text" placeholder="네 글자 이상 입력" name="memberId" id="memberId_" >
					<input type="button" value="중복확인" id="idDuplicateBtn">
				</li>
				<li>
					<span class="spantitle">비밀번호<span class="star">*</span></span><br>
					<input type="password" class="box" name="memberPw" id="memberPw_" placeholder="6글자 이상 입력하세요"><br>
				</li>
				
				<li>
					<span class="spantitle">비밀번호 확인<span class="star">*</span></span><br>
					<input type="password" class="box" id="memberPw_2" placeholder="다시 한번 입력하세요"><br>
					<span id="pwresult"></span>
				</li>
				
				<li>
					<span class="spantitle">이름<span class="star">*</span></span><br>
					<input type="text" class="box" name="memberName" id="memberName" placeholder="이름을 입력하세요"><br>
				</li>
				<li>
					<span class="spantitle">성별<span class="star">*</span></span><br>
					<select class="box" name="gender" placeholder="성별을 선택하세요">
						<option value="" selected disabled class="box"><span id="op-default">성별을 선택하세요</span></option>
		  				<option value="M">남자</option>
		  				<option value="F">여자</option>
					</select>
	
				</li>	
				<li>
					<span class="spantitle">이메일<span class="star">*</span></span><br>
					<input type="email" class="box2" placeholder="" name="email_id" id="email_id">
					<span>@</span>
					<input type="email" class="box2" placeholder="선택하세요" name="email_domain" id="email_domain">
					<select class="box2" id="select">
			            <option value="" disabled selected>E-Mail 선택</option>
			            <option value="naver.com" id="naver.com">naver.com</option>
			            <option value="hanmail.net" id="hanmail.net">hanmail.net</option>
			            <option value="gmail.com" id="gmail.com">gmail.com</option>
			            <option value="nate.com" id="nate.com">nate.com</option>
			            <option value="directly" id="textEmail">직접 입력하기</option>
			        </select>
				</li>
				
				<li>
					<span class="spantitle">휴대폰 번호<span class="star">*</span></span><br>
					<input type="tel" class="box" placeholder="(-없이)01012345678" name="phone" id="phone" maxlength="11" required><br>
				</li>
				<li>
					<span class="spantitle">주소<span class="star">*</span></span><br>
					<input type="text" class="box" placeholder="주소를 입력하세요" name="address" id="address"><br>
				</li>
				<li>
					<span class="spantitle">보유 전기차</span><br>
						<input type="text" class="box" placeholder="차종을 입력하세요(선택)" name="car" id="car"><br>
				<li>
					<input id="signup-btn" type="submit" value="회원가입" >
					<input id="cancle-btn" type="reset" value="취소" >
				</li>
			</ul>
		</div>
		
        </form>
        
        <form name="idDuplicateForm">
        	<input type="hidden" name="memberId">
        </form>
        
    </section>
    <script>
    	$(()=>{
    		$("#memberPw_2").keyup(e=>{
    			if($(e.target).val().trim().length>3){
    				if($(e.target).val()==$("#memberPw_").val()){
    					$("#pwresult").text("비밀번호가 일치합니다.").css({"color":"green"});
    				}else{
    					$("#pwresult").text("비밀번호가 일치하지 않습니다.").css({"color":"tomato"});
    				}
    			}
    		});
    	});
    
    
    	const memberSignupValidate=()=>{
    		const memberId=$("#memberId_").val().trim();
    		if(memberId.length<4){
    			alert("아이디는 4글자 이상입력하세요!");
    			$("#memberId_").focus();
    			return false;
    		}
    		const password=$("#password_").val().trim();
    		if(password.length<6){
    			alert("패스워드는 6글자 이상 입력하세요!");
    			$("#memberPw_").focus();
    			return false;
    		}
    		
    	}
    
    	$(()=>{
    		$("#idDuplicateBtn").click(e=>{
    			const memberId=$("#memberId_").val().trim();
    			if(memberId.length>=4){
    				const url="<%=request.getContextPath()%>/member/idDuplicate.do";
    				const title="idDuplcate";
    				const style="width=300,height=300";
    				open("",title,style);
	   				console.log(idDuplicateForm);//form태그
	   				console.log(idDuplicateForm.memberId);//form내부 input
	   				//form태그 자식 input태그의 value값 설정
	   				idDuplicateForm.memberId.value=memberId;
	   				idDuplicateForm.action=url;
	   				idDuplicateForm.method="post";
	   				//생성한 윈도우에서 form을 실행하려면 form target속성을 이용
	   				idDuplicateForm.target=title;
	   				
	   				idDuplicateForm.submit();//form전송
	   				
	   				
    				
    			}else{
    				alert("아이디는 4글자 이상 작성해야합니다.");
    				$("#memberId_").focus();
    			}
    		});
    	});
    	
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
    

<%@ include file="/views/common/footer.jsp"%>
