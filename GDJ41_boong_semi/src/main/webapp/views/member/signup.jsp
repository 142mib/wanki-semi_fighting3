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
	border: none;
	background: linear-gradient(#80FFDB, #5390D9);
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
.box2{width: 160px; height: 50px; 
	padding: 10px; border-radius: 8px; 
	border: solid #288ad8 1px; 
	background-color: #dee2e6;}
.box3{width: 130px; height: 50px; 
	padding: 10px; border-radius: 8px; 
	border: solid #288ad8 1px; 
	background-color: #dee2e6;}
.box4{width: 315px; height: 50px; 
	padding: 10px; border-radius: 8px; 
	border: solid #288ad8 1px; 
	background-color: #dee2e6;}
.spantitle{font-weight:bold;}
.id_check_success{width:50px;}

input[type="checkbox"]{
	width:18px; height:18px;
	top:3px; left:0;
	cursor:pointer;
	border: solid 1px #288ad8;
}
input[type="checkbox"] + label{ 
	margin-left:5px; cursor:pointer; 
}
td{width:91px;}

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
	        		<input type="text" placeholder="네 글자 이상 입력" name="memberId" id="memberId_" autofocus required>
					<input type="button" value="중복확인" id="idDuplicateBtn">
					<img src="<%=request.getContextPath()%>/assets/img/member/check.png" style="display:none; width:40px; height:40px;"><br>
					<span id=idresult></span>
				</li>
				<li>
					<span class="spantitle">비밀번호<span class="star">*</span></span><br>
					<input type="password" class="box" name="memberPw" id="memberPw_" placeholder="6글자 이상 입력하세요"><br>
					<span id="pwresult_"></span>
				</li>
				
				<li>
					<span class="spantitle">비밀번호 확인<span class="star">*</span></span><br>
					<input type="password" class="box" id="memberPw_2" placeholder="다시 한번 입력하세요"><br>
					<span id="pwresult"></span>
				</li>
				
				<li>
					<span class="spantitle">이름<span class="star">*</span></span><br>
					<input type="text" class="box" name="memberName" id="memberName" placeholder="이름을 입력하세요" maxlength="20"><br>
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
					<input type="text" class="box2" placeholder="" name="email_id" id="email_id">
					<span>@</span>
					<input type="text" class="box3" placeholder="" name="email_domain" id="email_domain">
					<select class="box3" id="select" style="font-size:13px;">
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
					<select class="box3" id="address" name="address1">
			            <option value="" disabled selected>시/도 선택</option>
			            <option value="서울특별시">서울특별시</option>
			            <option value="인천광역시">인천광역시</option>
			            <option value="대전광역시">대전광역시</option>
			            <option value="광주광역시">광주광역시</option>
			            <option value="대구광역시">대구광역시</option>
			            <option value="울산광역시">울산광역시</option>
			            <option value="부산광역시">부산광역시</option>
			            <option value="경기도">경기도</option>
			            <option value="강원도">강원도</option>
			            <option value="충청북도">충청북도</option>
			            <option value="충청남도">충청남도</option>
			            <option value="전라북도">전라북도</option>
			            <option value="전라남도">전라남도</option>
			            <option value="경상북도">경상북도</option>
			            <option value="경상남도">경상남도</option>
			            <option value="제주도">제주도</option>
			        </select>
					<input type="text" class="box4" placeholder="나머지 주소를 입력하세요" name="address2" id="address"><br>
				</li>
				<li>
					<span class="spantitle">관심 브랜드</span><br>
						<table>
							<tr>
								<td><input type="checkbox" name="car" id="car0" value="현대"><label for="car0">현대</label></td>
								<td><input type="checkbox" name="car" id="car1" value="제네시스"><label for="car1">제네시스</label></td>
								<td><input type="checkbox" name="car" id="car2" value="기아"><label for="car2">기아</label></td>
								<td><input type="checkbox" name="car" id="car3" value="쉐보레"><label for="car3">쉐보레</label></td>
								<td><input type="checkbox" name="car" id="car4" value="르노삼성"><label for="car4">르노삼성</label><br></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="car" id="car5" value="BMW"><label for="car5">BMW</label></td>
								<td><input type="checkbox" name="car" id="car6" value="닛산"><label for="car6">닛산</label></td>
								<td><input type="checkbox" name="car" id="car7" value="벤츠"><label for="car7">벤츠</label></td>
								<td><input type="checkbox" name="car" id="car8" value="볼보"><label for="car8">볼보</label></td>
								<td><input type="checkbox" name="car" id="car9" value="아우디"><label for="car9">아우디</label><br></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="car" id="car10" value="테슬라"><label for="car10">테슬라</label></td>
								<td><input type="checkbox" name="car" id="car11" value="포르쉐"><label for="car11">포르쉐</label></td>
								<td><input type="checkbox" name="car" id="car12" value="null"><label for="car12">없음</label></td>
							</tr>
						</table>
						
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
    			if($(e.target).val().trim().length>5){
    				if($(e.target).val()==$("#memberPw_").val()){
    					$("#pwresult").text("비밀번호가 일치합니다.").css({"color":"green"});
    				}else{
    					$("#pwresult").text("비밀번호가 일치하지 않습니다.").css({"color":"tomato"});
    				}
    			}
    		});
    		
    		$("#memberPw_").blur(e=>{
    			if($(e.target).val().trim().length<5){
    				$("#pwresult_").text("비밀번호는 6자 이상 입력하세요.").css({"color":"tomato"});
    			}else{
    				$("#pwresult_").remove();
    			}
    		});
    	});
    	
    	
    
    	//제출전확인
    	const memberSignupValidate=()=>{
    		const memberId=$("#memberId_").val().trim();
    		if(memberId.length<4){
    			alert("아이디는 4글자 이상입력하세요!");
    			$("#memberId_").focus();
    			return false;
    		}else if(memberId.search(/₩s/)!=-1){
    			alert("아이디는 공백없이 입력하세요!");
    			$("#memberId_").focus();
    			return false;
    		}
    		
    		const memberPw=$("#memberPw_").val().trim();
    		if(memberPw.length<6){
    			alert("비밀번호는 6글자 이상 입력하세요!");
    			$("#memberPw_").focus();
    			return false;
    		}
    		//버튼이 안눌렸으면 알람창.......
    		/* if(!$("#idresult").clicked){
    			alert("아이디 중복 확인을 해주세요.");
    			return false;
    		} */
    		
    		//이메일유효성체크
/*      		const emailId=$("#email_id").val().trim();
    		const emailDomain=$("#email_domain").val().trim();
    		var idReg=/^[a-z0-9]$/g;	//영문소문자, 숫자
    		if(idReg.test(emailId)==false || idReg.test(emailDomain)==false){
    			alert("올바른 이메일 형식이 아닙니다.");
    			$("#email_id").focus();
    			return false;
    		} */
    		
    	}
    	
    	//중복확인버튼
    	$("#idDuplicateBtn").click(e=>{
    		var idReg=/^[a-z0-9]{3,19}$/g;	//4-20자의 영문소문자, 숫자
    		let memberId=$("#memberId_").val().trim();
    		
    		if(idReg.test(memberId)==true){
	    		$.ajax({
	    			url:"<%=request.getContextPath()%>/member/idDuplicate.do",
	    			type: "post",
	    			data: {"memberId" : memberId},
	    			dataType: "json",
	    			success: function(result){
	    				if(result==0){
	    					$("#idresult").text("이미 존재하는 아이디입니다.").css({"color":"red"});
	    				}else{
	    					$("#idresult").text("사용할 수 있는 아이디입니다.").css({"color":"green"});
	    				}
	    			},
	    			error : function(){
	    				alert("서버요청 실패");
	    			}
	    			
	    		})
    		}else{
    			alert("아이디는 4-20자의 영문 소문자, 숫자만 사용 가능합니다.");
    			$("#memberId_").focus();
    			return false;
    		}
    		
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
