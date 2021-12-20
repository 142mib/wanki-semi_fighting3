<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp" %>

<style>

div#signUp{
	margin-top:140px; margin-left: 30%; margin-bottom: 100px;
}
ul,li{list-style: none;}
li{margin-bottom: 20px; text-align: left;}
.box{
	width: 450px; height: 50px; 
	padding: 10px; border-radius: 8px; 
	border: solid #288ad8 1px; 
	background-color: #dee2e6;
}
#idbox{
	width: 376px; height: 50px; 
	padding: 10px; border-radius: 8px; 
	border: solid #288ad8 1px; 
	background-color: #dee2e6;
}
}
input[type=checkbox]+label{
	margin-left:10px;
}
#signup-btn{
	width: 200px;
	height: 35px;
	border-radius: 8px;
	border: none;
	background-color: #288ad8;
	color: white;
	cursor:pointer;
	margin-left: 20px;
}
#cancle-btn{
	width: 200px;
	height: 35px;
	border-radius: 8px;
	border: #288ad8 solid 1px;
	background-color: white;
	color: black;
	cursor:pointer;
	margin-left: 10px;
}
h3{margin-left:170px; margin-bottom: 60px;}
#logo{color:#288ad8; font-size: 40px;}
#idDuplicateBtn{width: 70px; height: 50px; 
	padding: 10px; border-radius: 8px; 
	border: solid 1px coral; 
	background-color: coral;
	pointer:cursor;}
#idDuplicateBtn:hover{
	background-color: pink;
	border: solid 1px pink;
}
</style>
<div id="blank" style="width:100%;height: 70px; background-color: darkcyan;">
	</div>
<section id=signup-container>
        <title>BOONG 회원가입</title>
        <form name="signUpForm" action="<%=request.getContextPath() %>/member/signupEnd.do" 
        	method="post" onsubmit="return memberSignupValidate();" >
        <div id="signUp">
        	<h3><span id="logo">BOONG</span> 회원 가입</h3>
        <ul>
        	<li>
        	<span>아이디</span><br>
        		<input type="text" id="idbox" placeholder="네 글자 이상 입력" name="memberId" id="memberId_" >
				<input type="button" value="중복확인" id="idDuplicateBtn">
			</li>
			<li>
				<span>비밀번호</span><br>
				<input type="password" class="box" name="memberPw" id="memberPw_" ><br>
			</li>
			
			<li>
				<span>비밀번호 확인</span><br>
				<input type="password" class="box" id="memberPw_2" ><br>
				<span id="pwresult"></span>
			</li>
			
			<li>
				<span>이름</span><br>
				<input type="text" class="box" name="memberName" id="memberName" ><br>
			</li>
			<li>
				<span>성별</span><br>
				<input type="radio" name="gender" id="gender0" value="M" >
				<label for="gender0">남</label>
				<input type="radio" name="gender" id="gender1" value="F">
				<label for="gender1">여</label>
			</li>	
			<li>
				<span>이메일</span><br>
				<input type="email" class="box" placeholder="abc@xyz.com" name="email" id="email"><br>
			</li>
			
			<li>
				<span>휴대폰 번호</span><br>
				<input type="tel" class="box" placeholder="(-없이)01012345678" name="phone" id="phone" maxlength="11" required><br>
			</li>
			<li>
				<span>주소</span><br>
				<input type="text" class="box" placeholder="" name="address" id="address"><br>
			</li>
			<li>
				<span>관심 전기차 브랜드</span><br>
					<input type="checkbox" name="brand" id="brand0" value="Audi"><label for="brand0">아우디</label>
					<input type="checkbox" name="brand" id="brand1" value="BMW"><label for="brand1">BMW</label>
					<input type="checkbox" name="brand" id="brand2" value="Citroen"><label for="brand2">시트로엥</label><br>
					<input type="checkbox" name="brand" id="brand3" value="Ford"><label for="brand3">포드</label>
					<input type="checkbox" name="brand" id="brand4" value="Hyundai"><label for="brand4">현대</label>
					<input type="checkbox" name="brand" id="brand5" value="벤츠"><label for="brand5">벤츠</label><br>
					<input type="checkbox" name="brand" id="brand6" value="닛산"><label for="brand6">닛산</label>
					<input type="checkbox" name="brand" id="brand7" value="Porsche"><label for="brand7">포르쉐</label>
					<input type="checkbox" name="brand" id="brand8" value="Tesla"><label for="brand8">테슬라</label><br>
					<input type="checkbox" name="brand" id="brand9" value="Volkswagen"><label for="brand9">폭스바겐</label>
					<input type="checkbox" name="brand" id="brand10" value="Volvo"><label for="brand10">볼보</label>
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
    		$("#password_2").keyup(e=>{
    			if($(e.target).val().trim().length>3){
    				if($(e.target).val()==$("#password_").val()){
    					$("#pwresult").text("비밀번호가 일치합니다.").css({"color":"green"});
    				}else{
    					$("#pwresult").text("비밀번호가 불일치합니다.").css({"color":"red"});
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
    		if(password.length<4){
    			alert("패스워드는 4글자 이상 입력하세요!");
    			$("#password_").focus();
    			return false;
    		}
    		
    	}
    
    	$(()=>{
    		$("#idDuplicateBtn").click(e=>{
    			const memberId=$("#memberId_").val().trim();
    			if(memberId.length>=4){
    				const url="<%=request.getContextPath()%>/member/idDuplicate.do";
    				const title="idDuplcate";
    				const style="width=300,height=200";
    				open("",title,style);
	   				console.log(idDuplicateFrm);//form태그
	   				console.log(idDuplicateFrm.memberId);//form내부 input
	   				//form태그 자식 input태그의 value값 설정
	   				idDuplicateFrm.memberId.value=memberId;
	   				idDuplicateFrm.action=url;
	   				idDuplicateFrm.method="post";
	   				//생성한 윈도우에서 form을 실행하려면 form target속성을 이용
	   				idDuplicateFrm.target=title;
	   				
	   				idDuplicateFrm.submit();//form전송
	   				
	   				
    				
    			}else{
    				alert("아이디는 4글자 이상 작성해야합니다.");
    				$("#memberId_").focus();
    			}
    		});
    	});
    	
    	
    	
    </script>
    

<%@ include file="/views/common/footer.jsp"%>
