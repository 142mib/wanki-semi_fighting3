<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %> 

	<div id="blank" style="width:100%;height: 70px;background-color: brown;">
	</div>
	
	<div id="container">
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
								<form action="" class="start_price_form">
									<select name="start_price" id="start_price"> <!-- 벨류로 파싱해야됨 -->
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
								</form>
								<div id="enter_price">
									<input type="text" name="start_enter_price" placeholder="숫자만 입력">&nbsp;만원
									<input type="text" name="end_enter_price" placeholder="숫자만 입력">&nbsp;만원
									<input type="submit" value="검색">
								</div>
								<div id="enter_price_check">
									<input type="checkbox" id="price_check">&nbsp;직접입력
								</div>
							</div>
					</fieldset>
				</div>
			</div>
			<div id="model_info">
				<div id="model_search_info"> <!-- for문으로 구현할곳 -->
					<div id="sort_list">
						<h5 class="sort_title">BOONG 검색엔진 결과</h5>
						<span onclick='rollback();'>전체차량보기</span>
						<a class="popular_sort">인기순</a>
						<a class="view_sort">조회순</a>
						<a class="price_sort">가격순</a>
					</div>
					<div id="model_list">
				
					</div>
				</div>
			</div>
			<<!-- div id="ad_nav_fixed">
			</div> -->
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
	border: 1px solid #e1e2e6;
	width:1100px;
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
	border-bottom:none;
	display:inline-block;	
	
}
#model_info{
	display:inline-block;
	float:right;
	position:relative;
	width:859px;
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
	position:relative;
	
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
	align-items:left; 
	font-weight:bolder;
	color:#333;
	font-size:13px;
}
#model_list>ul>li>a>span[class="model_price"]{
	display:flex;
	margin-top:5px;
	align-items:left; 
	color:#333;
	font-size:13px;
}
#enter_price{
	position:relative;
	display:none;
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
.price_sort,.popular_sort,.view_sort {
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
	position:relative;
	float:right;
}
#pagingul{
	position:absolute;
	bottom:500px;
	left:560px;
}
</style>
<script>

	//체크박사 중복 불가 로직
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
	});
	$(".refresh").click(e=>{
		$("input[type='checkbox']").prop('checked',false);
		$("#testContainer").hide();
		$(".model_list1").hide();
		
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
	$("#start_price").change(e=>{
		const sSelect=Number($("#start_price option:selected").val());
		for(let i=0; i<=$("#end_price option").length; i++) {
			if(sSelect>=Number($("#end_price option:eq("+i+")").val())) {
				const value1=$("#end_price option:eq("+i+")").val();
				$("#end_price option[value="+value1+"]").prop('disabled',true);
			}
		}
	});
	//로그인 멤버의 관심 브랜드를 받아 ajax로 초기화면 보내주기 뭐 m.get 써서 해야겟찌?
		let cPage;
		let numPerpage;	
			$.ajax({
				url:"<%=request.getContextPath()%>/total/totalList.do",
				data:{"cPage":cPage, "numPerpage":numPerpage},
				success:data=>{
					$("#pagingul").remove();
					const div=$("<div id='pagingul'>");
					const ul=$("<ul>");
					for(let i=0; i<data[0].length; i++) {
						 let li=$("<li>");
						 let a=$("<a href=''>")
						 let modelClass=$("<span>").addClass("model_name").html(data[0][i]["modelName"]);
						 let mile=$("<span>").addClass("model_short_info").html(data[0][i]["modelBrand"]);
						 let output=$("<span>").addClass("model_short_info").html(data[0][i]["modelInfo"]);
						 let price=$("<span>").addClass("model_price").html(data[0][i]["modelClass"]);
						 a.append(modelClass).append(mile).append(output).append(price);
						 li.append(a);
						 ul.append(li);	
					}	
				   		$("#model_list").html(ul);
				   		div.html(data[1]);
				   		$("#model_info").after(div);
				}
			}); 	
		const rollback=()=>{
			$.ajax({
				url:"<%=request.getContextPath()%>/total/totalList.do",
				data:{"cPage":cPage, "numPerpage":numPerpage},
				success:data=>{
					const div=$("<div id='pagingul'>");
					const ul=$("<ul>");
					for(let i=0; i<data[0].length; i++) {
						 let li=$("<li>");
						 let a=$("<a href=''>")
						 let modelClass=$("<span>").addClass("model_name").html(data[0][i]["modelName"]);
						 let mile=$("<span>").addClass("model_short_info").html(data[0][i]["modelBrand"]);
						 let output=$("<span>").addClass("model_short_info").html(data[0][i]["modelInfo"]);
						 let price=$("<span>").addClass("model_price").html(data[0][i]["modelClass"]);
						 a.append(modelClass).append(mile).append(output).append(price);
						 li.append(a);
						 ul.append(li);	
					}	
				   		$("#model_list").html(ul);
				   		div.html(data[1]);
				   		$("#model_info").after(div);
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
					const ul=$("<ul>");
					for(let i=0; i<data[0].length; i++) {
						 let li=$("<li>");
						 let a=$("<a href=''>")
						 let modelClass=$("<span>").addClass("model_name").html(data[0][i]["modelName"]);
						 let mile=$("<span>").addClass("model_short_info").html(data[0][i]["modelBrand"]);
						 let output=$("<span>").addClass("model_short_info").html(data[0][i]["modelInfo"]);
						 let price=$("<span>").addClass("model_price").html(data[0][i]["modelClass"]);
						 a.append(modelClass).append(mile).append(output).append(price);
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
		$.ajax({
			url:"<%=request.getContextPath()%>/model/modelList.do",
			data:{"value":$(e.target).val()},
			success:data=>{
				$("#pagingul").remove();
				const ul=$("<ul>");
				for(let i=0; i<data.length; i++) {
				 	let li=$("<li>");
				 	let a=$("<a href=''>")
					let modelName=$("<span>").addClass("model_name").html(data[i]["modelName"]);
					let mile=$("<span>").addClass("model_short_info").html(data[i]["modelBrand"]);
					let output=$("<span>").addClass("model_short_info").html(data[i]["modelInfo"]);
				 	let price=$("<span>").addClass("model_price").html(data[i]["modelClass"]);
					a.append(modelName).append(mile).append(output).append(price);
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
				$(".model_list1").remove();
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
				$("#pagingul").remove();
				$(".model_list2").remove();
				const div1=$("<div>").addClass("model_list2");
				const ul1=$("<ul>");
				const ulparam=$("<ul>")
				for(let i=0; i<data.length; i++) {
				 let li=$("<li onclick='searchClass(event);'>").addClass("list_style2").html(data[i]["modelClass"]);
				 ul1.append(li);
				 div1.append(ul1);
					let liparam=$("<li>");
				 	let a=$("<a>");
					let modelName=$("<span>").addClass("model_name").html(data[i]["modelName"]);
					let mile=$("<span>").addClass("model_short_info").html(data[i]["modelBrand"]);
					let output=$("<span>").addClass("model_short_info").html(data[i]["modelInfo"]);
				 	let price=$("<span onclick='searchClass(event)'>").addClass("model_price").html(data[i]["modelClass"]);
				 	a.append(modelName).append(mile).append(output).append(price);
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
		console.log(mClass);
		$.ajax({
			url:"<%=request.getContextPath()%>/model/modelInfo.do",
			data:{"mClass":mClass},
			success:data=>{
				$("#pagingul").remove();
				const div=$("<div id='mdl_img'>");
				const div2=$("<div id='mdl_info'>");
				const div3=$("<div id='mdl_comment'>");
				const table=$("<table>")
				const tr=$("<tr>");
				const tr2=$("<tr>");
				const tr3=$("<tr>");
				const tr4=$("<tr>");
				const tr5=$("<tr>");
				const tr6=$("<tr>");
				const tr7=$("<tr>");
				const tr8=$("<tr>");
				const tr9=$("<tr>");
				let infoclass=$("<td>").html("모델명");
				let infobrand=$("<td>").html("브랜드");
				let infograde=$("<td>").html("등급");
				let infoprice=$("<td>").html("가격");
				let infospeed=$("<td>").html("최고속도");
				let infoperkm=$("<td>").html("주행");
				let infomile=$("<td>").html("연비");
				let infooutput=$("<td>").html("출력");
				let infodrive=$("<td>").html("구동");
				for(let i=0; i<data.length; i++) {
					if(data[i]["modelGrade"]=="STANDARD") {
						let mclass=$("<td class='tdclass'>").html(data[i]["modelClass"]);
						let brand=$("<td class='tdbrand'>").html(data[i]["modelBrand"]);
						let grade=$("<td class='tdgrade'>").html(data[i]["modelGrade"]);
						let price=$("<td class='tdprice'>").html(data[i]["price"]);
						let speed=$("<td class='tdspeed'>").html(data[i]["speed"]);
						let perkm=$("<td class='tdperkm'>").html(data[i]["perKm"]);
						let mile=$("<td class='tdmile'>").html(data[i]["mile"]);
						let output=$("<td class='tdoutput'>").html(data[i]["output"]);
						let drive=$("<td class='tddrive'>").html(data[i]["drive"]);		
						tr.append(infoclass).append(mclass)
						tr2.append(infobrand).append(brand)
						tr3.append(infograde).append(grade)
						tr4.append(infoprice).append(price)
						tr5.append(infospeed).append(speed);
						tr6.append(infoperkm).append(perkm);
						tr7.append(infomile).append(mile);
						tr8.append(infooutput).append(output);
						tr9.append(infodrive).append(drive);
						table.append(tr).append(tr2).append(tr3).append(tr4).append(tr5).append(tr6).append(tr7).append(tr8).append(tr9);
					}else{
						let paramgrade=$("<td class='tdotherGrade'>").html(data[i]["modelGrade"]);
						div2.append(paramgrade);
					}
				}
				
			<%-- 	let img=$("<img src="<%=request.getContextPath()%>/assets/img/carInfo/data[0]["fileName"]+">");
				div.append(img); --%>
				div2.append(table);
				$("#model_list").html(div2);
			}
			
		});
	}

	
	
	
		
</script>
<%-- <%@ include file="/views/common/footer.jsp"%> --%>