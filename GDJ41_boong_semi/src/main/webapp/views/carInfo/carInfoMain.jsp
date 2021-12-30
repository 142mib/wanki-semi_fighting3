<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.boong.member.model.vo.Member" %>
<% 
 Member m = (Member)session.getAttribute("loginMember"); 
%>
<%@ include file="/views/common/header.jsp" %>
<script src="https://kit.fontawesome.com/f88ebc8ec2.js" crossorigin="anonymous"></script>
		<div id="blank" style="width:100%;height: 63px;background-color: #288ad8;">
	</div>
	<div id="container"> 
	<span id='memberIdchk' style="display:none;"><%=m==null?"":m.getMemberId()%></span>
		<div id="search_wrap">
			<div id="search_car">
				<div class="search_title">
					<h4>전기친환경차 조회</h4>
					<span class="refresh" id="refresh">선택 초기화</span><img id="re_img" src="<%=request.getContextPath()%>/assets/img/carInfo/refresh.png" width="15px" height="15px">
				</div>
				<div class="search_group">
					<fieldset>
						<legend>검색 조건 선택</legend>
						<div class="search_mdl_name">
							<a>모델명 검색</a>
							<input type="text" name="mdl_ipt_name" id="mdel_ipt_name">
							<input type="submit" name="mdl_submit" id="mdl_submit" value="검색">
						</div>
						<div class="search_category">
							<h5 class="slideopen">
								<a id="category">차종
								<span class="arrow" id="arrow"><img id="arr_img" src="<%=request.getContextPath()%>/assets/img/carInfo/arrow2.png" width="15px" height="10px"></span>
								</a>
							</h5>
							<div id="schCategory" class="depth" style="display:block;">
								<div class="deparea_category">
									<ul class="deplist">
										<li class="list"><label><input name="box" type="checkbox" value="경차" onclick="NoMultiChk(this)">&nbsp;경차</label></li>
										<li class="list"><label><input name="box" type="checkbox" value="소형" onclick="NoMultiChk(this)">&nbsp;소형차</label></li>
										<li class="list"><label><input name="box" type="checkbox" value="준중형" onclick="NoMultiChk(this)">&nbsp;준중형차</label></li>
										<li class="list"><label><input name="box" type="checkbox" value="중형" onclick="NoMultiChk(this)">&nbsp;중형차</label></li>
										<li class="list"><label><input name="box" type="checkbox" value="준대형" onclick="NoMultiChk(this)">&nbsp;준대형차</label></li>
										<li class="list"><label><input name="box" type="checkbox" value="대형" onclick="NoMultiChk(this)">&nbsp;대형</label></li>
										<li class="list"><label><input name="box" type="checkbox" value="SUV" onclick="NoMultiChk(this)">&nbsp;SUV</label></li>
										<li class="list"><label><input name="box" type="checkbox" value="RV" onclick="NoMultiChk(this)">&nbsp;RV</label></li>
										<li class="list"><label><input name="box" type="checkbox" value="기타" onclick="NoMultiChk(this)">&nbsp;기타</label></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="model_step_evpost">
							<h5 class="slideopen"><a>제조사/모델/등급</a></h5>
						</div>
						<div id="scroll_group">
								<div id="stepManufact" class="deparea_marker">
									<form>
										<input type="hidden" name="kind" id="kind">
									</form>
									<div class="deplist_sort_lista1">
										<span class="word1">국산차</span>
										<nav class="korea_model" id="현대">현대</nav>
										<nav class="korea_model" id="제네시스">제네시스</nav>
										<nav class="korea_model" id="기아">기아</nav>
										<nav class="korea_model" id="쉐보레">쉐보레</nav>
										<nav class="korea_model" id="르노삼성">르노삼성</nav>
										<nav class="korea_model" id="기타">기타제조사</nav>
									</div>
									<div class="deplist_sort_lista2">
										<span class="word2">수입차</span>
										<nav class="korea_model" id="BMW">BMW</nav>
										<nav class="korea_model" id="닛산">닛산</nav>
										<nav class="korea_model" id="벤츠">벤츠</nav>
										<nav class="korea_model" id="볼보">볼보</nav>
										<nav class="korea_model" id="아우디">아우디</nav>
										<nav class="korea_model" id="테슬라">테슬라</nav>
										<nav class="korea_model" id="포르쉐">포르쉐</nav>
									</div>
									<!-- <div class="deplist_sort_lista3">
										<span class="word3">수입차 이름순</span>
										
									</div>  -->
								</div>
							</div>
							<div id="search_price" class="search_price">
								<a>가격</a>
								<!-- <form action="" class="start_price_form">
									<select name="start_price" id="start_price"> 벨류로 파싱해야됨
										<option value="1">1000만원</option>
										<option value="2">2000만원</option>
										<option value="3">3000만원</option>
										<option value="4">4000만원</option>
										<option value="5">5000만원</option>
										<option value="6">6000만원</option>
										<option value="7">7000만원</option>
										<option value="8">8000만원</option>
										<option value="9">9000만원</option>
										<option value="10">10000만원</option>
									</select><a>부터</a>
								</form>
								<form action="" class="end_price_form">
									<select name="end_price" id="end_price">
										<option value="1">1000만원</option>
										<option value="2">2000만원</option>
										<option value="3">3000만원</option>
										<option value="4">4000만원</option>
										<option value="5">5000만원</option>
										<option value="6">6000만원</option>
										<option value="7">7000만원</option>
										<option value="8">8000만원</option>
										<option value="9">9000만원</option>
										<option value="10">10000만원</option>
									</select><a>까지</a>
								</form> -->
								<div id="enter_price">
									<input type="text" name="start_enter_price" pattern="[0-9]+" placeholder="숫자만 입력">&nbsp;만원
									<input type="text" name="end_enter_price" pattern="[0-9]+" placeholder="숫자만 입력">&nbsp;만원
									<input type="submit" onclick='parsePrice();' value="검색">
								</div>
								<!-- <div id="enter_price_check">
									<input type="checkbox" id="price_check">&nbsp;직접입력
								</div> -->
							</div>
					</fieldset>
				</div>
			</div>
			<div id="model_info">
				<div id="model_search_info"> <!-- for문으로 구현할곳 -->
					<div id="sort_list">
						<h5 class="sort_title">BOONG 검색엔진 결과</h5>
						<a class="allRollback" onclick='rollback();'>전체차량조회</a>
						<a class="popular_sort" onclick='likeDesc();'>인기순</a>
						<a class="price_sort" onclick='priceAsc();'>가격낮은순</a>
						<a class="price_sort2" onclick='priceDesc();'>가격높은순</a>
					</div>
					<div id="model_list">
				
					</div>
				</div>
				<div id="model_comment">
					
				</div>	
			</div>
		</div>
	</div>
<style>
#container {
	height:1400px;
	width:100%;
	
}
#search_wrap {               /* html화면 줄여도 네비게이션에 고정 */
	/* width:1500px; 
	position:absolute; 
	left: 50px; top: 100px;
	border: 1px solid #e1e2e6;
	left:150px; */
	border-left: 1px solid #e1e2e6;
	border-top: 1px solid #e1e2e6;
	border-right: 1px solid #e1e2e6;
	border-bottom:none;
	width:1300px;
	height:1100px;
	/* left:17%; */
	position:relative;
	/* top:100px;  */
	margin:0 auto;
	top:70px;
	align-items:center;
	
}
#search_car {
	width:239px; height:1100px;
	border: 1px solid #e5e5e5;
	border-top:none;
	border-left:none;
/* 	border-bottom:none; */
	display:inline-block;	
	
}
#model_info{
	display:inline-block;
	float:right;
	position:relative;
	width:1055px;
	height:auto;
	border-bottom:1px solid #e5e5e5;
}
#ad_nav_fixed{
	float:right;
	position:relative;
	width:239px;
	height:500px;
	background-color:black;
	

}
#model_search_info>ul {
	/* position:relative; */
	
}
#model_list>ul>li {
	position:relative;
	float:left;
	/* margin-top:10px;
	margin-left:5px; */
	width:185px;
	margin-left:15px;
	left:-9px;
	padding-bottom:15px;
}
#model_list>ul>li>a  {
	text-decoration:none;
}
#model_list>ul>li>a>span[class="model_short_info"]{
	font-size:11px;
	color:#333;
	display:flex;
	
	
}
#model_list>ul>li>a>span[class="model_name"]{
	position:relative;
	display:flex;
	align-items:center; 
	font-weight:bolder;
	color:#333;
	font-size:13px;
}
#model_list>ul>li>a>span[class="model_price"]{
	display:flex;
	margin-top:5px;
	align-items:center; 
	color:#333;
	font-size:13px;
}
#enter_price{
	position:relative;
	font-size:13px;
	color: #333;
	margin-top:15px;
	margin-bottom:-15px;
}
#enter_price>input[type="text"][name="start_enter_price"]{
	postion:absolute;
	margin-left:15px;
	width:94px;
	height:22px;
}
#enter_price>input[type="text"][name="end_enter_price"] {
	postion:absolute;
	margin-left:15px;
	width:94px;
	height:22px;
}
#enter_price>input[type="submit"][value="검색"] {
	position:relative;
	width:60px;
	height:60px;
	top:-20px;
	left:5px;
	background-color:#288ad8;
	color:white;
	border:none;
	border-radius:5px;
	font-weight:bold;

}
.search_title {
	width:238px; height:99px;
	border-bottom:1px solid #e5e5e5;
	border-right:none;
}
.search_title h4{
	position:absolute;
	top:22px;
	left:15px;
    font-size: 18px;
    color: #288ad8;
    font-weight:bold;
}
.search_mdl_name{
	width:238px; height:85px;
}
.search_mdl_name a{
	position:relative;
	font-size:13px;
	font-weight:bold;
	color: #333;
	top:5px;
    left:15px;
}
.search_category h5 {
	width:238px;
	height:41px;
	border-bottom:1px solid #e5e5e5;
	border-right:none;
	border-top:1px solid #e5e5e5;
	border-left:none;
	margin:0;
	
}
.search_category>h5>a{
	position:relative;
	text-decoration: none;
	font-size:13px;
	font-weight:bold;
	color: #333;
    cursor: pointer;
    top:5px;
    left:15px;
	
}
.model_step_evpost {
	position:relative;
	width:238px;
	height:41px;
	border:1px solid #e5e5e5;
	border-right:none;
	border-top:none;
	border-left:none;
	margin:0;
}
.model_step_evpost>h5>a{
	position:relative;
	text-decoration: none;
	font-size:13px;
	font-weight:bold;
	color: #333;
    cursor: pointer;
    top:5px;
    left:15px;
}
#search_price {
	width:238px;
	height:150px;
	border-bottom:1px solid #e5e5e5;
}
#search_price>a {
	position:relative;
	font-size:13px;
	font-weight:bold;
	color: #333;
	top:5px;
    left:15px;
}
.start_price_form {
	margin-top:20px;
}
.end_price_form {
	margin-top:10px;
}
.start_price_form,.end_price_form {
	margin-left:15px;
}
.start_price_form>a,.end_price_form>a{
	margin-left:5px;
	font-size:13px;
	color: #333;
}
select {
	font-size:13px;
	color: #333;
}
#enter_price_check {
	display:inline-block;
	font-size:11px;
	color: #333;
	margin-top:10px;
	margin-left:15px;
}

legend {
	display:none;
	font-size:0;
	height:0;
	left:-10000px;
	overflow:hidden;
	position:absolute;
	visibility:hidden;
	width:0;
}
.arrow{
	position:absolute;
	cursor:pointer;
	left:185px;
	top:3px;
}
.refresh{
	position:absolute;
	cursor:pointer;
	font-size:11px;
	color:#333;
	font-weight:bold;
	left:30px;
	top:60px;
}
#re_img{
	position:absolute;
	cursor:pointer;
	top:61px;
	left:15px;
}
.deparea_category{
display:none;
border-bottom:1px solid #e5e5e5;
margin:0;

}
li{
position:relative;
list-style-type: none;
font-size:13px;
color: #333;
right:20px;
padding-top:5px;
}
.stline{
border-top: 1px dotted #c7c7c7;
margin:5px;
}
label{
border: 1px dotted transparent;
} 
input[type="checkbox"] {
	position:relative;
	top:2px;
	cursor: pointer;
    outline: none !important;
    border: 1px solid #eeeeee;
    border-radius: 2px;
    background: #fbfbfb;
}
.word1,.word2,.word3 {
	font-size:14px;
	position:relative;
	color:#288ad8;
    left:15px;
    top:-3px;
    font-weight:bold;
}
dd{
	position:relative;
	font-size:13px;
	color: #333;
	left:31px;
	top:2px;
	margin:3px;
	cursor: pointer;
}
#scroll_group{
	width:238px;
	height:262px;
}
#stepManufact{
	width:238px;
	height:262px;
	overflow-y:scroll;
	overflow-x:hidden;
	border-bottom:1px solid #e5e5e5;
	
}
#stepManufact::-webkit-scrollbar {
	width:5px;	
	
}
#stepManufact::-webkit-scrollbar-thumb {
	background-color:gray;
	border-radius:10px;	
	
}
#stepManufact::-webkit-scrollbar-thumb:hover {
 	background: #333; 
} 
#stepManufact::-webkit-scrollbar-track {
	background-color:white;
}
.deplist_sort_lista1,.deplist_sort_lista2,.deplist_sort_lista3{
	position:relative;
	top:22px;
}
#mdel_ipt_name{
	display:inline-block;
	position:relative;
	width:154px;
	height:28px;
	border:1px solid #e5e5e5;
	top:40px;
	right:57px;
	line-height:28px;
}
#mdl_submit{
	position:relative;
	height:28px;
	width:50px;
	left:169px;
	top:11.6px;
	background-color:#288ad8;
	font-weight:bold;
	color:white;
	border:none;
	font-size:13px;
	border-radius:0 3px 3px 0;
}
.price_sort,.popular_sort,.view_sort,.price_sort2 {
	position:relative;
	text-decoration: none;
	font-size:12px;
	font-weight:bold;
	color:#333; 
	cursor: pointer;
	margin-left:4px;
}
#sort_list{
	border-bottom:1px solid #e5e5e5;
	height:50px;
	text-align:center;
  	justify-content: center;
 	align-items: center;
}
.sort_title{
	text-decoration: none;
	font-size:14px;
	font-weight:bold;
	color:#288ad8;
	margin-top:10px;
}
.list_style{
	left:10px;
	top:-5px;
	cursor:pointer;
	font-weight:bold;
}
#brand {
	top:-8px;
	left:10px;
}
.korea_model,.abroad_model{
	position:relative;
	left:30px;
	cursor:pointer;
	font-size:13px;
	font-weight:bold;
	padding-bottom:3px;
}
.deplist_sort_lista1 a {
	top:5px;
	position:relative;
	font-size:13px;
	color:#333; 
}
.model_list1{
	position:relative;
	margin-bottom:-12px;
}
.model_list2{
	margin-bottom:12px;
}
.list_style2{
	left:10px;
	top:-5px;
	cursor:pointer;
}
#mdl_info {
	display:inline-block;
	text-align:center;
}
#pagingul{
	position:absolute;
	bottom:500px;
	left:560px;
}
#insert_car{
	position:absolute;
	bottom:320px;
	left:950px;
	
}
.allRollback{
	font-weight:bold;
	font-size:14px;
	cursor:pointer;
	text-decoration:none;
	color:#333;
} 
#searchPaging {
	font-size:13px;
	cursor:pointer;
	margin:10px;
}
#pagingul{
	top:33px;
	left:700px;
}
#currentPage {
	font-size:13px;
	cursor:pointer;
	color:#288ad8;
	margin:10px;
	
}
#listTable {
	align-items:center;
	margin:20px;
}
#listTable tr{
	border:1px solid  #e5e5e5;
}
#listTable td{
	border:1px solid  #e5e5e5;
	text-align:center;
	padding:20px;
	font-size:14px; 
}
#listTable th{
	border:1px solid  #e5e5e5;
	text-align:center;
	background-color:#e5e5e5;
	
}
#model_list{
	text-align:center;
}
#otherGrade{
	font-weight:bold;
	font-size:14px;
	
}
#carimg{
	width:500px;
	height:300px;
	margin:20px;
	border:4px solid #e5e5e5;
}
#model_comment{
	/* text-align:center; */
}
#comment_list{
	border:1px solid #e5e5e5;
	
}

textarea {
   	
    width: 700px;
    height:160px;
    border: 1px solid #333;
    resize: none;
    font-size:14px;
}
#comment_submit{
	
	width:200px;
	height:160px;
	font-weight:bold;
	color:white;
	background-color:#288ad8;
	border:none;
	
}
#textDiv{
	float:middle;
	display:flex;
	margin-left:75px;
	margin-bottom:30px;
}
#Idform{
	display:flex;
}
#commentWriter {
	position:relative;
	padding-left:10px;
	padding-right:10px;
	top:20px;
	font-weight:bold;
	color:#288ad8;
}
.modelContent {
	position:relative;
	padding:50px; 
}
pre{
	white-space: pre-wrap;
}
#date{
	position:relative;
	top:20px;
	font-size:12px;
	color:gray;
}
#deleteDiv{
	
	padding-left:155px;
	margin-top:-4px;
}
.del{
	font-size:14px;
	text-decoration:none;
	cursor:pointer;
}
#updateCarInfo{
	background-color:#288ad8;
	border:none;
	width:80px;
	color:white;
	font-weight:bold;
	border-radius:5px;
}
#readCount{
	position:relative;
	bottom:530px; 
	right:490px;
	font-size:13px;
}
#imgview{
	width:170px;
	height:85px;
}

</style>
<script>
		
		function NoMultiChk(chk) {
		var obj=document.getElementsByName("box");
		for(var i=0; i<obj.length; i++) {
			if(obj[i]!=chk) {
				obj[i].checked=false;
			}
		}
	}

	
	//전체 선택 해제 로직
	$("#re_img").click(e=>{
		$("input[type='checkbox']").prop('checked',false);
		$("#testContainer").hide();
		$(".model_list1").hide();
		rollback();
	});
	$(".refresh").click(e=>{
		$("input[type='checkbox']").prop('checked',false);
		$("#testContainer").hide();
		$(".model_list1").hide();
		rollback();
		
	});
	
	//가격 직접입력으로 전환하는 로직
	$("#price_check").click(e=>{
		if($(e.target).is(":checked")) {
			$(".start_price_form").hide();
			$(".end_price_form").hide();
			$("#enter_price").show();
		}else{
			$(".start_price_form").show();
			$(".end_price_form").show();
			$("#enter_price").hide();
		}
	});
	//차종 슬라이드 업 다운 로직
	$(()=>{
		$("#category").click(e=>{
			if($(".deparea_category").is(":visible")){
				$(".deparea_category").slideUp();	
				$("#arr_img").attr("src","<%=request.getContextPath()%>/assets/img/carInfo/arrow2.png");
			}else{
				$(".deparea_category").slideDown();
				$("#arr_img").attr("src","<%=request.getContextPath()%>/assets/img/carInfo/arrow1.png");
			}
		});
	});
	//이거 질문해야하는데..능지가 딸려서 생각이 잘 안남 ㅋㅋ..
	
	/* $("#start_price").change(e=>{
		const sSelect=Number($("#start_price option:selected").val());
		let count=0;
		$("#end_price>option").css('display','block');
		$("#end_price>option").each((i,v)=>{
			if($(v).val()<=sSelect){
				$(v).css('display','none');
				count++;
			}
		});
		$($("#end_price>option")[count]).attr("selected",true);
		
	}); */
	//onload시 total 데이터 페이징바 처리
		let cPage;
		let numPerpage;	
			
		$(()=>{
			$.ajax({
				url:"<%=request.getContextPath()%>/total/totalList.do",
				data:{"cPage":cPage, "numPerpage":numPerpage},
				success:data=>{
					$("#insertComment").remove();
					$("#comment").remove();
					$("#pagingul").remove();
					$("#comment_submit").remove();
					const div=$("<div id='pagingul'>");
					const ul=$("<ul>");
					for(let i=0; i<data[0].length; i++) {
						 let li=$("<li>");
						 let a=$("<a>")
						 let img=$("<img id='imgview' src=/GDJ41_boong_semi/assets/img/carInfo/"+data[0][i]["fileName"]+">");
						 let modelClass=$("<span onclick='searchClass(event);'>").addClass("model_name").html(data[0][i]["modelClass"]);
						 let mile=$("<span>").addClass("model_short_info").html("Brand: "+data[0][i]["modelBrand"]);
						 let output=$("<span>").addClass("model_short_info").html("Info: "+data[0][i]["modelInfo"]);
						/*  let price=$("<span>").addClass("model_price").html(data[0][i]["modelName"]); */
						 a.append(img).append(modelClass).append(mile).append(output)/* .append(price) */;
						 li.append(a);
						 ul.append(li);	
					}	
				   		$("#model_list").html(ul);
				   		div.html(data[1]);
				   		$("#sort_list").after(div);
				}
			}); 	
		})
			
		
	const rollback=()=>{
			$.ajax({
				url:"<%=request.getContextPath()%>/total/totalList.do",
				data:{"cPage":cPage, "numPerpage":numPerpage},
				success:data=>{
					$("#insertComment").remove();
					$("#comment").remove();
					$("#pagingul").remove();
					$("#comment_submit").remove();
					const div=$("<div id='pagingul'>");
					const ul=$("<ul>");
					for(let i=0; i<data[0].length; i++) {
						 let li=$("<li>");
						 let a=$("<a>")
						 let img=$("<img id='imgview' src=/GDJ41_boong_semi/assets/img/carInfo/"+data[0][i]["fileName"]+">");
						 let modelClass=$("<span onclick='searchClass(event);'>").addClass("model_name").html(data[0][i]["modelClass"]);
						 let mile=$("<span>").addClass("model_short_info").html("Brand: "+data[0][i]["modelBrand"]);
						 let output=$("<span>").addClass("model_short_info").html("Info: "+data[0][i]["modelInfo"]);
						 /* let price=$("<span>").addClass("model_price").html(data[0][i]["modelName"]); */
						 a.append(img).append(modelClass).append(mile).append(output)/* .append(price) */;
						 li.append(a);
						 ul.append(li);	
					}	
				   		$("#model_list").html(ul);
				   		div.html(data[1]);
				   		$("#sort_list").append(div);
				}
			}); 	
			
		}				
			
		const paging=(e)=>{
			let cPage=$(e.target).text();
			let numPerpage;
			console.log(cPage);
			$.ajax({
				url:"<%=request.getContextPath()%>/total/totalList.do",
				data:{"cPage":cPage, "numPerpage":numPerpage},
				success:data=>{
					$("#insertComment").remove();
					$("#comment").remove();
					$("#comment_submit").remove();
					const ul=$("<ul>");
					for(let i=0; i<data[0].length; i++) {
						 let li=$("<li>");
						 let a=$("<a>")
						 let img=$("<img id='imgview' src=/GDJ41_boong_semi/assets/img/carInfo/"+data[0][i]["fileName"]+">");
						 let modelClass=$("<span onclick='searchClass(event);'>").addClass("model_name").html(data[0][i]["modelClass"]);
						 let mile=$("<span>").addClass("model_short_info").html("Brand: "+data[0][i]["modelBrand"]);
						 let output=$("<span>").addClass("model_short_info").html("Info: "+data[0][i]["modelInfo"]);
						/*  let price=$("<span>").addClass("model_price").html(data[0][i]["modelName"]); */
						 a.append(img).append(modelClass).append(mile).append(output)/* .append(price) */;
						 li.append(a);
						 ul.append(li);	
					}	
				   		$("#model_list").html(ul);
				   		$("#pagingul").html(data[1]);
				}
			}); 	
		}	

	//차종 클릭시 modelInfo div에 비동기식 화면전환 처리
	$("input[name='box']").click(e=>{
		console.log($(e.target).val());
		$.ajax({
			url:"<%=request.getContextPath()%>/model/modelList.do",
			data:{"value":$(e.target).val()},
			success:data=>{
				$("#insertComment").remove();
				$("#comment").remove();
				$("#pagingul").remove();
				$("#comment_submit").remove();
				const ul=$("<ul>");
				for(let i=0; i<data.length; i++) {
				 	let li=$("<li>");
				 	let a=$("<a>");
				 	let img=$("<img id='imgview' src=/GDJ41_boong_semi/assets/img/carInfo/"+data[i]["fileName"]+">");
					let modelName=$("<span onclick='searchClass(event);'>").addClass("model_name").html(data[i]["modelClass"]);
					let mile=$("<span>").addClass("model_short_info").html("Brand: "+data[i]["modelBrand"]);
					let output=$("<span>").addClass("model_short_info").html("Info: "+data[i]["modelInfo"]);
				 	/* let price=$("<span>").addClass("model_price").html(data[i]["modelName"]); */
					a.append(img).append(modelName).append(mile).append(output)/* .append(price) */;
					li.append(a);
					ul.append(li);
				}
				$("#model_list").html(ul);
			}
		});
	});


	//제조사/모델/등급 브랜드명으로 클릭 -> 차량 모델 조회
	$(".korea_model").on("click",e=>{
		var value=$(e.target).text();
		$("input[type='checkbox']").prop('checked',false);
		$.ajax({
			url:"<%=request.getContextPath()%>/scroll/scrollList.do",
			data:{"value":value},
			success:data=>{
				$("#insertComment").remove();
				$("#comment").remove();
				$(".model_list1").remove(); 
				/* $(".model_list2").remove(); */
				$("#comment_submit").remove();
				$("#mdl_info").remove();
				$("#mdl_img").remove();
				const div=$("<div>").addClass("model_list1");
				const ul=$("<ul>");
				const ulparam=$("<ul>")
				for(let i=0; i<data.length; i++) {
					console.log(data);
					let li=$("<li name="+data[i]+" onclick='clickMethod(event);'>").addClass("list_style").html(data[i]);
				 	ul.append(li);
				 	div.append(ul);
				}
				$(e.target).after(div);
			}
		});
		$(".model_list1").show();
	});
	//제조사/모델/등급 차량 연식 조회
	const clickMethod=(e)=>{
		var val=$(e.target).attr("name");
		$.ajax({
			url:"<%=request.getContextPath()%>/model/scrollList.do",
			data:{"val":val},
			success:data=>{
				$("#insertComment").remove();
				$("#comment").remove();
				$("#pagingul").remove();
				$(".model_list2").remove();
				$("#comment_submit").remove();
				const div1=$("<div>").addClass("model_list2");
				const ul1=$("<ul>");
				const ulparam=$("<ul>")
				for(let i=0; i<data.length; i++) {
				 let li=$("<li onclick='searchClass(event);'>").addClass("list_style2").html(data[i]["modelClass"]);
				 ul1.append(li);
				 div1.append(ul1);
					let liparam=$("<li>");
				 	let a=$("<a>");
				 	let img=$("<img id='imgview' src=/GDJ41_boong_semi/assets/img/carInfo/"+data[i]["fileName"]+">");
					let modelName=$("<span onclick='searchClass(event);'>").addClass("model_name").html(data[i]["modelClass"]);
					let mile=$("<span>").addClass("model_short_info").html("Brand: "+data[i]["modelBrand"]);
					let output=$("<span>").addClass("model_short_info").html("Info: "+data[i]["modelInfo"]);
				 	/* let price=$("<span onclick='searchClass(event)'>").addClass("model_price").html(data[i]["modelName"]); */
				 	a.append(img).append(modelName).append(mile).append(output)/* .append(price) */;
					liparam.append(a);
					ulparam.append(liparam);
				}
				$(e.target).after(div1);
				$("#model_list").html(ulparam);
			}
		});
		$(".model_list2").show();
	}	
	
	//제조사/모델/등급 선택시 차 상세 정보 출력
	//다른 등급 클릭시 그 해당하는 차량의 정보도 출력해주는 기능 구현해주자.
	const searchClass=(e)=>{
		var mClass=$(e.target).text();
		$.ajax({
			url:"<%=request.getContextPath()%>/model/modelInfo.do",
			data:{"mClass":mClass},
			success:data=>{
				$("#insertComment").remove();
				$("#textDiv").remove();
				$("#comment").remove();
				$("#mdl_info").remove();
				$("#pagingul").remove();
				$("#mdl_img").remove();
				$("#comment_submit").remove();
				const div=$("<div id='mdl_img'>");
				const div2=$("<div id='mdl_info'>");
				const div3=$("<div id='mdl_comment'>");
				const table=$("<table id='listTable'>");
				const header="<tr><th>모델명</th><th>브랜드</th><th>등급</th><th>가격</th><th>최고속도</th><th>주행</th><th>연비</th><th>출력</th><th>구동</th>";
				const viewCount=$("<div class='likeCountDiv'>");
				const thumbs=$("<img src='https://media.istockphoto.com/vectors/thumbs-up-and-like-icon-vector-design-on-white-background-vector-id1204236090?b=1&k=20&m=1204236090&s=612x612&w=0&h=w2Pt1zTPg5OhEW1Ad6RXnq_r0z9-lcTQ-z8AxfuJPEs=' style='widht:60px; height:60px;' onclick='likeUp()'>");
				viewCount.append(thumbs);
				table.append(header);
					for(let i=0; i<data[0].length; i++) {
						if(data[0][i]["modelGrade"]=="STANDARD") {
							let likeCount=$("<p class='likeCount'>").html(data[0][i]["likeCount"]);
							let path=data[0][i]["fileName"];
						/* let img=$("<img src=/GDJ41_boong_semi/assets/img/carInfo/"+data[i]["fileName"]+">"); */
							<%-- $("<img src='<%=request.getContextPath()%>/assets/img/carInfo/data[i]["fileName"]+">"); --%>
							let tr=$("<tr>");
							let mclass=$("<td class='tdclass'>").html(data[0][i]["modelClass"]);
							let brand=$("<td class='tdbrand'>").html(data[0][i]["modelBrand"]);
							let grade=$("<td class='tdgrade'>").html(data[0][i]["modelGrade"]);
							let price=$("<td class='tdprice'>").html(data[0][i]["price"]+"만원");
							let speed=$("<td class='tdspeed'>").html(data[0][i]["speed"]);
							let perkm=$("<td class='tdperkm'>").html(data[0][i]["perKm"]);
							let mile=$("<td class='tdmile'>").html(data[0][i]["mile"]);
							let output=$("<td class='tdoutput'>").html(data[0][i]["output"]);
							let drive=$("<td class='tddrive'>").html(data[0][i]["drive"]);
							tr.append(mclass).append(brand).append(grade).append(price).append(speed).append(perkm).append(mile).append(output).append(drive);
							table.append(tr);
							viewCount.append(likeCount);
						}else{
						let paramalert=$("<span id='otherGrade' name="+data[0][i]["modelGrade"]+" onclick='otherClass();'>").html("이 차량의 다른등급보기");
						/* let paramgrade=$("<span class='tdotherGrade'>").html(data[i]["modelGrade"]); */
						div2.append(paramalert);
						}
					}
					const textDiv=$("<div id='textDiv'>");
					const form=$("<form id='Idform' method='get'>");
					const span=$("<span id='hiddenClass' style='display:none'>").html(mClass);
					const insertComment=$("<textarea id='insertComment' placeholder='이 차량에 대한 평가를 남겨주세요'>");
					const submit=$("<input id='comment_submit' type='button' onclick='loginchk();' value='등록'>");
					const commentDiv=$("<div id='comment'>");
					//댓글구현
					for(let i=0; i<data[1].length; i++) {
						let div4=$("<div id='comment_list'>");
						let deleteDiv=$("<div id='deleteDiv'>");
						let num=$("<span id='commentWriter'>").html(data[1][i]["memberId"]);
						let date=$("<span id='date'>").html(data[1][i]["commentDate"]);
						let content=$("<pre class='modelContent'>").html(data[1][i]["content"]);
						let del=$("<a class='del' name='"+data[1][i]["commentNo"]+"' onclick='commentDelete(event);'>");
						if(data[1][i]["memberId"]==$("#memberIdchk").text()){
							del.html("삭제");
							
						}
						deleteDiv.append(del);
						div4.append(num).append(date).append(deleteDiv).append(content);
						commentDiv.append(div4);
					}
					form.append(span).append(insertComment).append(submit);
					textDiv.append(form);
					$("#model_comment").append(textDiv).append(commentDiv);
					let img=$("<img id='carimg' src=/GDJ41_boong_semi/assets/img/carInfo/"+data[0][0]["fileName"]+">");
					div.html(img);
					div2.append(table).append(viewCount);
					$("#model_list").html(div).append(div2);
				/* $("#model_list").html(div2); */
				/* $("#model_list").html(div2); */
			
			}
		});		
		
	}
	const otherClass=()=>{
		var mClass=$(".tdclass").text();
		$.ajax({
			url:"<%=request.getContextPath()%>/model/modelInfo.do",
			data:{"mClass":mClass},
			success:data=>{
				$("#mdl_info").remove();
				$("#pagingul").remove();
				$("#mdl_img").remove();
				const div=$("<div id='mdl_img'>");
				const div2=$("<div id='mdl_info'>");
				const div3=$("<div id='mdl_comment'>");
				const table=$("<table id='listTable'>");
				const header="<tr><th>모델명</th><th>브랜드</th><th>등급</th><th>가격</th><th>최고속도</th><th>주행</th><th>연비</th><th>출력</th><th>구동</th>";
				const viewCount=$("<div class='likeCountDiv'>");
				const thumbs=$("<img src='https://media.istockphoto.com/vectors/thumbs-up-and-like-icon-vector-design-on-white-background-vector-id1204236090?b=1&k=20&m=1204236090&s=612x612&w=0&h=w2Pt1zTPg5OhEW1Ad6RXnq_r0z9-lcTQ-z8AxfuJPEs=' style='widht:60px; height:60px;' onclick='likeUp()'>");
				viewCount.append(thumbs);
				table.append(header);
				for(let i=0; i<data[0].length; i++) {
					if(data[0][i]["modelGrade"]!="STANDARD") {
						let path=data[i]["fileName"];
						let likeCount=$("<p class='likeCount'>").html(data[0][i]["likeCount"]);
						/* let img=$("<img src=/GDJ41_boong_semi/assets/img/carInfo/"+data[i]["fileName"]+">"); */
							<%-- $("<img src='<%=request.getContextPath()%>/assets/img/carInfo/data[i]["fileName"]+">"); --%>
						let tr=$("<tr>");
						let mclass=$("<td class='tdclass'>").html(data[0][i]["modelClass"]);
						let brand=$("<td class='tdbrand'>").html(data[0][i]["modelBrand"]);
						let grade=$("<td class='tdgrade'>").html(data[0][i]["modelGrade"]);
						let price=$("<td class='tdprice'>").html(data[0][i]["price"]+"만원");
						let speed=$("<td class='tdspeed'>").html(data[0][i]["speed"]);
						let perkm=$("<td class='tdperkm'>").html(data[0][i]["perKm"]);
						let mile=$("<td class='tdmile'>").html(data[0][i]["mile"]);
						let output=$("<td class='tdoutput'>").html(data[0][i]["output"]);
						let drive=$("<td class='tddrive'>").html(data[0][i]["drive"]);	
						tr.append(mclass).append(brand).append(grade).append(price).append(speed).append(perkm).append(mile).append(output).append(drive);
						viewCount.append(likeCount);
						table.append(tr);
					}else{
						let paramalert=$("<span id='otherGrade' name="+data[0][i]["modelGrade"]+" onclick='theotherClass()'>").html("이 차량의 다른등급보기");
						/* let paramgrade=$("<span class='tdotherGrade'>").html(data[i]["modelGrade"]); */
						div2.append(paramalert);
					}
				}
				let img=$("<img id='carimg' src=/GDJ41_boong_semi/assets/img/carInfo/"+data[0][0]["fileName"]+">");
				div.html(img);
				div2.append(table).append(viewCount);;
				
				$("#model_list").html(div).append(div2);
				/* $("#model_list").html(div2); */
				/* $("#model_list").html(div2); */
			}
			
		});
	}
	const theotherClass=()=>{
		var mClass=$(".tdclass").text();
		$.ajax({
			url:"<%=request.getContextPath()%>/model/modelInfo.do",
			data:{"mClass":mClass},
			success:data=>{
				$("#mdl_info").remove();
				$("#pagingul").remove();
				$("#mdl_img").remove();
				const div=$("<div id='mdl_img'>");
				const div2=$("<div id='mdl_info'>");
				const div3=$("<div id='mdl_comment'>");
				const table=$("<table id='listTable'>");
				const header="<tr><th>모델명</th><th>브랜드</th><th>등급</th><th>가격</th><th>최고속도</th><th>주행</th><th>연비</th><th>출력</th><th>구동</th>";
				const viewCount=$("<div class='likeCountDiv'>");
				const thumbs=$("<img src='https://media.istockphoto.com/vectors/thumbs-up-and-like-icon-vector-design-on-white-background-vector-id1204236090?b=1&k=20&m=1204236090&s=612x612&w=0&h=w2Pt1zTPg5OhEW1Ad6RXnq_r0z9-lcTQ-z8AxfuJPEs=' style='widht:60px; height:60px;' onclick='likeUp()'>");
				viewCount.append(thumbs);
				table.append(header);
				for(let i=0; i<data[0].length; i++) {
					if(data[0][i]["modelGrade"]=="STANDARD") {
						let likeCount=$("<p class='likeCount'>").html(data[0][i]["likeCount"]);
						let path=data[i]["fileName"];
						/* let img=$("<img src=/GDJ41_boong_semi/assets/img/carInfo/"+data[i]["fileName"]+">"); */
							<%-- $("<img src='<%=request.getContextPath()%>/assets/img/carInfo/data[i]["fileName"]+">"); --%>
						let tr=$("<tr>");
						let mclass=$("<td class='tdclass'>").html(data[0][i]["modelClass"]);
						let brand=$("<td class='tdbrand'>").html(data[0][i]["modelBrand"]);
						let grade=$("<td class='tdgrade'>").html(data[0][i]["modelGrade"]);
						let price=$("<td class='tdprice'>").html(data[0][i]["price"]+"만원");
						let speed=$("<td class='tdspeed'>").html(data[0][i]["speed"]);
						let perkm=$("<td class='tdperkm'>").html(data[0][i]["perKm"]);
						let mile=$("<td class='tdmile'>").html(data[0][i]["mile"]);
						let output=$("<td class='tdoutput'>").html(data[0][i]["output"]);
						let drive=$("<td class='tddrive'>").html(data[0][i]["drive"]);	
						tr.append(mclass).append(brand).append(grade).append(price).append(speed).append(perkm).append(mile).append(output).append(drive);
						table.append(tr);
						viewCount.append(likeCount);
					}else{
						let paramalert=$("<span id='otherGrade' name="+data[0][i]["modelGrade"]+" onclick='otherClass()'>").html("이 차량의 다른등급보기");
						/* let paramgrade=$("<span class='tdotherGrade'>").html(data[i]["modelGrade"]); */
						div2.append(paramalert);
					}
				}
				let img=$("<img id='carimg' src=/GDJ41_boong_semi/assets/img/carInfo/"+data[0][0]["fileName"]+">");
				div.html(img);
				div2.append(table).append(viewCount);;
				
				$("#model_list").html(div).append(div2);
				/* $("#model_list").html(div2); */
				/* $("#model_list").html(div2); */
			}
			
		});
	}
	
	$("#model_comment").on('keyup',e=>{
		if(<%=m==null%>) {
			alert("댓글작성은 회원만 이용가능합니다.");
			location.assign("<%=request.getContextPath()%>/member/login.do");
		}	 
	})
	const loginchk=()=>{
		if(<%=m==null%>) {
			alert("댓글작성은 회원만 이용가능합니다.");
			location.assign("<%=request.getContextPath()%>/member/login.do");
		}else if($("#insertComment").val().trim().length==0){
			alert("내용을 입력해주세요");
			$("#insertComment").val("");
			return false;
		}
		var mClass=$("#hiddenClass").text();
		var content=$("#insertComment").val();
		var memberId=$("#memberIdchk").text();
		/* console.log($("#insertComment").val());
		console.log($("#hiddenClass").text()); */
		$.ajax({
			url:"<%=request.getContextPath()%>/update/updateComment.do",
			data:{"mClass":mClass,"memberId":memberId,"content":content},
			success:data=>{
				$("#insertComment").remove();
				$("#textDiv").remove();
				$("#comment").remove();
				$("#comment_submit").remove();
				alert("댓글 등록 성공!");
				const textDiv=$("<div id='textDiv'>");
				const form=$("<form id='Idform' method='get'>");
				const span=$("<span id='hiddenClass' style='display:none'>").html(mClass);
				const insertComment=$("<textarea id='insertComment' placeholder='이 차량에 대한 평가를 남겨주세요'>");
				const submit=$("<input id='comment_submit' type='button' onclick='loginchk();' value='등록'>");
				const commentDiv=$("<div id='comment'>");
				//댓글구현
				for(let i=0; i<data.length; i++) {
					let div4=$("<div id='comment_list'>")
					let deleteDiv=$("<div id='deleteDiv'>");
					let num=$("<span id='commentWriter'>").html(data[i]["memberId"]);
					let date=$("<span id='date'>").html(data[i]["commentDate"]);
					let content=$("<pre class='modelContent'>").html(data[i]["content"]);
					let del=$("<a class='del' name='"+data[i]["commentNo"]+"' onclick='commentDelete(event);'>");
					if(data[i]["memberId"]==$("#memberIdchk").text()){
						del.html("삭제");
						
					}
					deleteDiv.append(del);
					div4.append(num).append(date).append(deleteDiv).append(content);
					commentDiv.append(div4);
				}
				form.append(span).append(insertComment).append(submit);
				textDiv.append(form);
				$("#model_comment").append(textDiv).append(commentDiv);
				
			}
		});
	}
	
	//댓글 삭제
	const commentDelete=(e)=>{
	 	var result=confirm("정말로 댓글을 삭제하시겠습니까?");
		let val=$(e.target).attr("name");
	 	let mClass=$("#hiddenClass").text();
	 	if(result==true) {
	 		$.ajax({
		 		url:"<%=request.getContextPath()%>/comment/commentDel.do",
		 		data:{"val":val,"mClass":mClass},
		 		success:data=>{
		 		 	alert("댓글 삭제 완료");
		 		 	$("#insertComment").remove();
					$("#textDiv").remove();
					$("#comment").remove();
					$("#comment_submit").remove();
					const textDiv=$("<div id='textDiv'>");
					const form=$("<form id='Idform' method='get'>");
					const span=$("<span id='hiddenClass' style='display:none'>").html(mClass);
					const insertComment=$("<textarea id='insertComment' placeholder='이 차량에 대한 평가를 남겨주세요'>");
					const submit=$("<input id='comment_submit' type='button' onclick='loginchk();' value='등록'>");
					const commentDiv=$("<div id='comment'>");
					//댓글구현
					for(let i=0; i<data.length; i++) {
						let div4=$("<div id='comment_list'>")
						let deleteDiv=$("<div id='deleteDiv'>");
						let num=$("<span id='commentWriter'>").html(data[i]["memberId"]);
						let date=$("<span id='date'>").html(data[i]["commentDate"]);
						let content=$("<pre class='modelContent'>").html(data[i]["content"]);
						let del=$("<a class='del' name='"+data[i]["commentNo"]+"' onclick='commentDelete(event);'>");
						if(data[i]["memberId"]==$("#memberIdchk").text()){
							del.html("삭제");
						}
						deleteDiv.append(del);
						div4.append(num).append(date).append(deleteDiv).append(content);
						commentDiv.append(div4);
					}
					form.append(span).append(insertComment).append(submit);
					textDiv.append(form);
					$("#model_comment").append(textDiv).append(commentDiv);
					table.append(tr);
		 		}
		 	});
	 	}

	}
	//가격 오름차순 조회
	const priceAsc=()=>{
		$.ajax({
			url:"<%=request.getContextPath()%>/price/priceAsc.do",
			data:{"cPage":cPage, "numPerpage":numPerpage},
			success:data=>{
				$("#insertComment").remove();
				$("#comment").remove();
				$("#pagingul").remove();
				$("#comment_submit").remove();
				const div=$("<div id='pagingul'>");
				const ul=$("<ul>");
				for(let i=0; i<data[0].length; i++) {
					 let li=$("<li>");
					 let a=$("<a>")
					 let img=$("<img id='imgview' src=/GDJ41_boong_semi/assets/img/carInfo/"+data[0][i]["fileName"]+">");
					 let modelClass=$("<span onclick='searchClass(event);'>").addClass("model_name").html(data[0][i]["modelClass"]);
					 let mile=$("<span>").addClass("model_short_info").html("Brand: "+data[0][i]["modelBrand"]);
					 let output=$("<span>").addClass("model_short_info").html("Info: "+data[0][i]["modelInfo"]);
					 /* let price=$("<span>").addClass("model_price").html(data[0][i]["modelName"]); */
					 a.append(img).append(modelClass).append(mile).append(output)/* .append(price) */;
					 li.append(a);
					 ul.append(li);	
				}	
			   		$("#model_list").html(ul);
			   		div.html(data[1]);
			   		$("#sort_list").append(div);
			}
		}); 	
	}
	
	//오름차순 조회 페이징 처리
	const pages=(e)=>{
		let cPage=$(e.target).text();
		let numPerpage;
		console.log(cPage);
		$.ajax({
			url:"<%=request.getContextPath()%>/price/priceAsc.do",
			data:{"cPage":cPage, "numPerpage":numPerpage},
			success:data=>{
				$("#insertComment").remove();
				$("#comment").remove();
				$("#comment_submit").remove();
				const ul=$("<ul>");
				for(let i=0; i<data[0].length; i++) {
					 let li=$("<li>");
					 let a=$("<a>")
					 let img=$("<img id='imgview' src=/GDJ41_boong_semi/assets/img/carInfo/"+data[0][i]["fileName"]+">");
					 let modelClass=$("<span onclick='searchClass(event);'>").addClass("model_name").html(data[0][i]["modelClass"]);
					 let mile=$("<span>").addClass("model_short_info").html("Brand: "+data[0][i]["modelBrand"]);
					 let output=$("<span>").addClass("model_short_info").html("Info: "+data[0][i]["modelInfo"]);
					/*  let price=$("<span>").addClass("model_price").html(data[0][i]["modelName"]); */
					 a.append(img).append(modelClass).append(mile).append(output)/* .append(price) */;
					 li.append(a);
					 ul.append(li);	
				}	
			   		$("#model_list").html(ul);
			   		$("#pagingul").html(data[1]);
			}
		}); 	
	}	
	
	//가격 내림차순 조회
	const priceDesc=()=>{
		$.ajax({
			url:"<%=request.getContextPath()%>/price/priceDesc.do",
			data:{"cPage":cPage, "numPerpage":numPerpage},
			success:data=>{
				$("#insertComment").remove();
				$("#comment").remove();
				$("#pagingul").remove();
				$("#comment_submit").remove();
				const div=$("<div id='pagingul'>");
				const ul=$("<ul>");
				for(let i=0; i<data[0].length; i++) {
					 let li=$("<li>");
					 let a=$("<a>")
					 let img=$("<img id='imgview' src=/GDJ41_boong_semi/assets/img/carInfo/"+data[0][i]["fileName"]+">");
					 let modelClass=$("<span onclick='searchClass(event);'>").addClass("model_name").html(data[0][i]["modelClass"]);
					 let mile=$("<span>").addClass("model_short_info").html("Brand: "+data[0][i]["modelBrand"]);
					 let output=$("<span>").addClass("model_short_info").html("Info: "+data[0][i]["modelInfo"]);
					 /* let price=$("<span>").addClass("model_price").html(data[0][i]["modelName"]); */
					 a.append(img).append(modelClass).append(mile).append(output)/* .append(price) */;
					 li.append(a);
					 ul.append(li);	
				}	
			   		$("#model_list").html(ul);
			   		div.html(data[1]);
			   		$("#sort_list").append(div);
			}
		}); 	
	}
	//내림차순 조회 페이징처리
	const pagedesc=(e)=>{
		let cPage=$(e.target).text();
		let numPerpage;
		console.log(cPage);
		$.ajax({
			url:"<%=request.getContextPath()%>/price/priceDesc.do",
			data:{"cPage":cPage, "numPerpage":numPerpage},
			success:data=>{
				$("#insertComment").remove();
				$("#comment").remove();
				$("#comment_submit").remove();
				const ul=$("<ul>");
				for(let i=0; i<data[0].length; i++) {
					 let li=$("<li>");
					 let a=$("<a>")
					 let img=$("<img id='imgview' src=/GDJ41_boong_semi/assets/img/carInfo/"+data[0][i]["fileName"]+">");
					 let modelClass=$("<span onclick='searchClass(event);'>").addClass("model_name").html(data[0][i]["modelClass"]);
					 let mile=$("<span>").addClass("model_short_info").html("Brand: "+data[0][i]["modelBrand"]);
					 let output=$("<span>").addClass("model_short_info").html("Info: "+data[0][i]["modelInfo"]);
					/*  let price=$("<span>").addClass("model_price").html(data[0][i]["modelName"]); */
					 a.append(img).append(modelClass).append(mile).append(output)/* .append(price) */;
					 li.append(a);
					 ul.append(li);	
				}	
			   		$("#model_list").html(ul);
			   		$("#pagingul").html(data[1]);
			}
		}); 	
	}	
	
	const likeUp=()=>{
		let userId=$("#memberIdchk").text();
		let mClass=$("#hiddenClass").text();
		console.log(mClass);
		if(userId=="") {
			alert("추천은 로그인한 회원만 가능합니다");
		}else{
			$.ajax({
				url:"<%=request.getContextPath()%>/like/likeUp.do",
				data:{"memberId":userId,"mClass":mClass},
				success:data=>{	
					$(".likeCount").remove();
					const p=$("<p class='likeCount'>");
					for(let i=0; i<data[0].length; i++) {
						p.html(data[0][i]["likeCount"]);
					}
					$(".likeCountDiv").append(p);
					alert(""+data[1]);
					
				}
			});
		}			
	}
	
	
	const likeDesc=()=>{
		$.ajax({
			url:"<%=request.getContextPath()%>/like/likeDesc.do",
			data:{"cPage":cPage, "numPerpage":numPerpage},
			success:data=>{
				$("#insertComment").remove();
				$("#comment").remove();
				$("#pagingul").remove();
				$("#comment_submit").remove();
				const div=$("<div id='pagingul'>");
				const ul=$("<ul>");
				for(let i=0; i<data[0].length; i++) {
					 let li=$("<li>");
					 let a=$("<a>")
					 let img=$("<img id='imgview' src=/GDJ41_boong_semi/assets/img/carInfo/"+data[0][i]["fileName"]+">");
					 let modelClass=$("<span onclick='searchClass(event);'>").addClass("model_name").html(data[0][i]["modelClass"]);
					 let mile=$("<span>").addClass("model_short_info").html("Brand: "+data[0][i]["modelBrand"]);
					 let output=$("<span>").addClass("model_short_info").html("Info: "+data[0][i]["modelInfo"]);
					 /* let price=$("<span>").addClass("model_price").html(data[0][i]["modelName"]); */
					 a.append(img).append(modelClass).append(mile).append(output)/* .append(price) */;
					 li.append(a);
					 ul.append(li);	
				}	
			   		$("#model_list").html(ul);
			   		div.html(data[1]);
			   		$("#sort_list").append(div);
			}
		}); 	
	}
	
	const pagelikedesc=(e)=>{
		let cPage=$(e.target).text();
		let numPerpage;
		console.log(cPage);
		$.ajax({
			url:"<%=request.getContextPath()%>/like/likeDesc.do",
			data:{"cPage":cPage, "numPerpage":numPerpage},
			success:data=>{
				$("#insertComment").remove();
				$("#comment").remove();
				$("#comment_submit").remove();
				const ul=$("<ul>");
				for(let i=0; i<data[0].length; i++) {
					 let li=$("<li>");
					 let a=$("<a>")
					 let img=$("<img id='imgview' src=/GDJ41_boong_semi/assets/img/carInfo/"+data[0][i]["fileName"]+">");
					 let modelClass=$("<span onclick='searchClass(event);'>").addClass("model_name").html(data[0][i]["modelClass"]);
					 let mile=$("<span>").addClass("model_short_info").html("Brand: "+data[0][i]["modelBrand"]);
					 let output=$("<span>").addClass("model_short_info").html("Info: "+data[0][i]["modelInfo"]);
					/*  let price=$("<span>").addClass("model_price").html(data[0][i]["modelName"]); */
					 a.append(img).append(modelClass).append(mile).append(output)/* .append(price) */;
					 li.append(a);
					 ul.append(li);	
				}	
			   		$("#model_list").html(ul);
			   		$("#pagingul").html(data[1]);
			}
		}); 	
	}	
	
	
	//가격 검색 받아서 넣는 기능...
	const parsePrice=()=>{
		let val=Math.abs($("input[name='start_enter_price']").val());
		let value=Math.abs($("input[name='end_enter_price']").val());
		console.log(val);
		if(isNaN(val)==true||isNaN(value)==true) {
			alert("숫자만 입력하세요");
		}else if(val.toString().length>5||value.toString().length>5){
			alert("5자리 이하의 숫자를 입력해주세요");
		}else if(val>=value) {
			alert("시작보다 큰 숫자로 입력해주세요");
		}else{
			$.ajax({
				url:"<%=request.getContextPath()%>/parse/parsePrice.do",
				data:{"val":val, "value":value , "cPage":cPage, "numPerpage":numPerpage},
				success:data=>{
					$("#insertComment").remove();
					$("#comment").remove();
					$("#pagingul").remove();
					$("#comment_submit").remove();
					const div=$("<div id='pagingul'>");
					const ul=$("<ul>");
					for(let i=0; i<data[0].length; i++) {
						 let li=$("<li>");
						 let a=$("<a>")
						 let img=$("<img id='imgview' src=/GDJ41_boong_semi/assets/img/carInfo/"+data[0][i]["fileName"]+">");
						 let modelClass=$("<span onclick='searchClass(event);'>").addClass("model_name").html(data[0][i]["modelClass"]);
						 let mile=$("<span>").addClass("model_short_info").html("Brand: "+data[0][i]["modelBrand"]);
						 let output=$("<span>").addClass("model_short_info").html("Info: "+data[0][i]["modelInfo"]);
						/*  let price=$("<span>").addClass("model_price").html(data[0][i]["modelName"]); */
						 a.append(img).append(modelClass).append(mile).append(output)/* .append(price) */;
						 li.append(a);
						 ul.append(li);	
					}	
				   		$("#model_list").html(ul);
				   		div.html(data[1]);
				   		$("#sort_list").after(div);
				}
			});
		}
	}
	
	
	
	
	
		
</script>
<%-- <%@ include file="/views/common/footer.jsp"%> --%>