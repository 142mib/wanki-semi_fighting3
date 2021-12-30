<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.boong.member.model.vo.Member" %>
<%@ include file="/views/common/header.jsp" %>
<%
	List<Member> mList=(List)request.getAttribute("mList");	
	String searchType=request.getParameter("searchType");
	String keyword=request.getParameter("searchKeyword");
%>

<div id="blank" style="width:100%; height: 63px; background-color: #6868ac;"></div>

<style>
/* 검색창에 대한 스타일 */
#searchType{width:100px; height:40px; border:solid #6868ac 2px; border-radius:10px;font-size:14px;}
div#search-container {margin:0 0 20px 0; padding:3px; float:right;}
div#search-memberId{display:inline-block;}
div#search-memberName{display:none;}
div#search-gender{display:none;}
div#numPerpage-container{float:right;}
form#numperPageFrm{display:inline;}
.search-box{width:200px; height:40px; border:solid #6868ac 2px; border-radius:10px; font-size:14px; padding-left:10px;}
.search-btn{width:35px; height:35px; color:white; background:#6868ac; border-radius:50px; border:none;}

section{
	padding: 100px 20px 100px 220px;
	height: 100%;
	background-color: #dcdcde;
}
.mypage-container{
	width: 75%;
	height: 100%;
	background-color: white;
	border: none;
	border-radius: 10px;
	padding: 30px 60px;
	margin-left: 280px;
	margin-top: 50px;
	margin-bottom:70px;
	display: block;
	box-shadow: 5px 5px 5px 5px lightgray;
}
h2{color:#6868ac;}

.box{
	width: 300px; height: 40px; 
	padding: 10px; border-radius: 8px; 
	border: solid #288ad8 1px; 
	background-color: #dee2e6;
	margin-bottom: 20px;
}


/* 테이블 style */
.styled-table {
    border-collapse: collapse;
    margin: 25px 0;
    font-size: 0.9em;
    font-family: sans-serif;
    min-width: 100%;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
}
.styled-table thead tr {
    background-color: #6868ac;
    color: #ffffff;
    text-align: left;
}
.styled-table th,
.styled-table td {
    padding: 12px 15px;
}
.styled-table tbody tr {
    border-bottom: 1px solid #6868ac;
}

.styled-table tbody tr:nth-of-type(even) {
    background-color: #f3f3f3;
}

.styled-table tbody tr:last-of-type {
    border-bottom: 2px solid #6868ac;
}
.styled-table tbody tr.active-row {
    font-weight: bold;
    color: #009879;
}
div#pageBar{ text-align:center;}
#pageBar>a,#pageBar>span {padding-right : 20px;}
#btn{
	width:70px; height:35px;
	border:none;
	border-radius: 10px;
	cursor:pointer; 
	background:coral; color:white;
	font-size:13px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
}

</style>

<body>
<%@ include file="/views/admin/adminsidenav.jsp"%>
	
	<div class="mypage-container">
		<h2>회원 관리</h2>
		<hr>
		<div id="search-container">
        	<select id="searchType">
        		<option value="memberId" <%=searchType!=null && searchType.equals("memberId")?"selected":"" %>>아이디</option>
        		<option value="memberName" <%=searchType!=null && searchType.equals("memberName")?"selected":"" %>>회원이름</option>
        		<option value="gender" <%=searchType!=null && searchType.equals("gender")?"selected":"" %>>성별</option>
        	</select>
        	<div id="search-memberId">
        		<form action="<%=request.getContextPath()%>/admin/searchmember.do">
        			<input type="hidden" name="searchType" value="member_Id" >
        			<input type="text" name="searchKeyword" size="25" 
        			placeholder="검색할 아이디를 입력하세요" class="search-box"
        			value="<%=searchType!=null && searchType.equals("memberId")?keyword:"" %>"> 
        					<!-- 검색창에 검색한게 남아있게 value -->
        			<button type="submit" class="search-btn"><i class="fas fa-search"></i></button>
        		</form>
        	</div>
        	<div id="search-memberName">
        		<form action="<%=request.getContextPath()%>/admin/searchmember.do">
        			<input type="hidden" name="searchType" value="member_Name">
        			<input type="text" name="searchKeyword" size="25" 
        			placeholder="검색할 이름을 입력하세요" class="search-box"
        			value="<%=searchType!=null && searchType.equals("memberName")?keyword:"" %>">
        			<button type="submit" class="search-btn"><i class="fas fa-search"></i></button>
        		</form>
        	</div>
        	<div id="search-gender">
        		<form action="<%=request.getContextPath()%>/admin/searchmember.do">
        			<input type="hidden" name="searchType" value="gender">
        			<label style="margin-right:15px;"><input style="margin-right:5px;"type="radio" name="searchKeyword" value="M"
        					<%=searchType!=null && searchType.equals("gender") && keyword.equals("M")?"checked":"" %>>남</label>
        			<label style="margin-right:15px;"><input style="margin-right:5px;" type="radio" name="searchKeyword" value="F"
        					<%=searchType!=null && searchType.equals("gender") && keyword.equals("F")?"checked":"" %>>여</label>
        			<button type="submit" class="search-btn"><i class="fas fa-search"></i></button>
        		</form>
        	</div>
        </div>
        
		<div><br>
			<table class="styled-table">
				
				<thead>
					<tr style="text-aglin:center;">
					<th>아이디</th>
					<th>이름</th>
					<th>성별</th>
					<th>이메일</th>
					<th>휴대폰 번호</th>
					<th>주소</th>
					<th>보유 차량</th>
					<th>등록일</th>
					<th>회원 관리</th>
				</tr>
				</thead>
				<tbody>
				<%if(mList.isEmpty()) {%>
	            	<tr>
	            		<td colspan="9">조회된 데이터가 없습니다.</td>
	            	</tr>
	            <%}else{ %>
		       	    <%for(Member m: mList) {%>
		       	    	<tr>
			       	    	<td><strong><%=m.getMemberId() %></strong></td>
			       	    	<td><%=m.getMemberName() %></td>
			       	    	<td><%=m.getGender() %></td>
			       	    	<td><%=m.getEmail()%></td>
			       	    	<td><%=m.getPhone() %></td>
			       	    	<td><%=m.getAddress() %></td>
			       	    	<td><%=m.getCar() %></td>
			       	    	<td><%=m.getEnrollDate() %></td>
			       	    	<td><input id="btn" type="button" value="회원 관리" 
			       	    		onclick="window.open('<%=request.getContextPath()%>/admin/managemember.do?memberId=<%=m.getMemberId()%>','BOONG 회원관리','width=600, height=530');"></td>
		       	    	</tr>
		       	    <%}
		       	   } %>
				</tbody>
			</table>
		</div>
		<div id="pageBar">
        	<%=request.getAttribute("pageBar") %>
        </div>
	</div>
</section>
	
	<script>
	
	$(()=>{
		$("#searchType").change(e=>{
			const value=$(e.target).val();

			const memberId=$("#search-memberId");
			const memberName=$("#search-memberName");
			const gender=$("#search-gender");
			memberId.css("display","none");
			memberName.css("display","none");
			gender.css("display","none");
			
			
			$("div#search-"+value).css("display","inline-block");
			
		})
	})
	
	//onload됐을 때
	$(()=>{
		$("#searchType").change(); //페이지 로드 후 바로 select태그에 Change이벤트 발생시킴
	})
	
	$("#first-menu").addClass("active");
	
	</script>


<%@ include file="/views/common/footer.jsp"%>