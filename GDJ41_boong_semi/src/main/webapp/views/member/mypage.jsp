<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<div id="blank"
	style="width: 100%; height: 70px; background-color: steelblue;" ></div>
	
<script src="https://kit.fontawesome.com/f88ebc8ec2.js" crossorigin="anonymous"></script>
<style>
/* @import url('https://fonts.googleapis.com/css2?family=Open+Sans&display=swap'); */

#section {
	padding: 100px 20px 100px 220px;
	background-color: #dcdcde;
	paddng-top:70px;
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
.mypage-content{
	width:100%
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
	width: 320px;
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
	max-width:80%;
	display: inline-block;
}

table {
	min-width: 100%;
}

#edit-icon {
	width: 30px; height: 30px;
	margin-right: 10px;
	/* float:right; */
}

#edit-btn {
	width: 100px; height: 40px;
	border: none; border-radius:30px;
	background: linear-gradient(65deg, #25aae1, #2bb673);
	color: white;
}
#save-btn {
	width: 100px; height: 40px;
	border: none; border-radius:30px;
	background: linear-gradient(135deg, #855edd 0%, #63afd3 100%);
	color: white;
	margin-left:20px;
}
#back-btn{width:100px; height:40px; 
	border:none; border-radius:30px; 
	background: -webkit-linear-gradient(360deg,#383836 10%,#4a4a4a 360%); color:white; 
	margin-left:10px;}

#save {display: none;}


</style>
	<body>
<%@ include file="/views/member/membersidenav.jsp"%>
<style></style>  
    
    
        <div class="section">
            <div class="mypage-container">
                <h3>내정보 보기</h3>
                <p>안녕하세요, <%=loginMember.getMemberName()%> 님!</p>
                <hr>
            
            <form action="<%=request.getContextPath()%>/member/editmember.do?memberId=<%=loginMember.getMemberId() %>" method="post">
            <div class="mypage-content">
            
                <table>
                    <tr>
                    <td>
                        <fieldset>아이디</fieldset>
                        <input type="text" class="box oriInfo" name="memberId" id="memberId_" value="<%=loginMember.getMemberId()%>" disabled>
                    </td>
                    <td><td>
                    <td>        	
                        <fieldset>성별</fieldset>
                            <%if(loginMember.getGender().equals("M")){ %>
	                            <select class="box editInfo" id="gender" name="gender">
			  					<option value="M" selected>남자</option>
			  					<option value="F">여자</option>
								</select>
							<%}else{ %>
								<select class="box editInfo" id="gender" name="gender">
			  					<option value="M">남자</option>
			  					<option value="F" selected>여자</option>
								</select>
							<%} %>
                    </td>
                    </tr>
                    <tr>
                        <td>
                        	<fieldset>이름</fieldset>
                       		<input type="text" class="box editInfo" name="memberName" id="memberName" value="<%=loginMember.getMemberName()%>">
                        </td>
                        <td><td>
                        <td>
                            <fieldset>가입일</fieldset>
                            <input type="text" class="box oriInfo" name="enrollDate" id="enrollDate" value="<%=loginMember.getEnrollDate()%>" disabled>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <fieldset>이메일</fieldset>
                            <input type="email" class="box editInfo" placeholder="abc@xyz.com" name="email" id="email" value="<%=loginMember.getEmail()%>">
                        </td>
                        <td><td>
                        <td>
                            <fieldset>휴대폰 번호</fieldset>
                            <input type="tel" class="box editInfo" placeholder="(-없이)01012345678" name="phone" id="phone" value="<%=loginMember.getPhone()%>">			
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <fieldset>주소</fieldset>
                            <input type="text" class="box editInfo" placeholder="" name="address" id="address" value="<%=loginMember.getAddress()%>">
                        </td>
                        <td colspan="3">
                            <fieldset>보유 차종</fieldset>
                        <input type="text" class="box editInfo" name="car" id="car" value="<%=loginMember.getCar()%>">
                        </td>
                    </tr>
        
            </table>	
            	<div style="float:right;">
            		<input type="button" id="edit-btn" value="내정보 수정">
                    <button type="submit" id="save-btn">수정완료</button>
                    <input type="button" id="back-btn" value="취소">
                </div>
            </div>
         </form>   
            </div>
             
        </div>
        
    </div>
	

<script>

    $(document).ready(function(){
    	$(".editInfo").prop("disabled",true);
    	$("#save-btn").hide();
    	$("#back-btn").hide();
    	
    });
    
    $("#edit-btn").on("click", function(e){
    	$(this).hide();
    	$(".editInfo").prop("disabled",false);
    	$(".editInfo").css("background-color","#fcf9e8");
    	$(".oriInfo").css("background-color","#9ec2e6");
    	$("#save-btn").show();
    	$("#back-btn").show();
    })
    $("#back-btn").on("click", function(e){
    	$(this).hide();
    	$(".editInfo").prop("disabled",true);
    	$(".box").css("background-color","white");
    	$("#save-btn").hide();
    	$("#edit-btn").show();
    })

    $("#first-menu").addClass("active");
    
    
</script>


<%@ include file="/views/common/footer.jsp"%>