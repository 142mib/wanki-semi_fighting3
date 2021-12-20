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
										<li><label><input type="checkbox">&nbsp;경차</label></li>
										<li><label><input type="checkbox">&nbsp;소형차</label></li>
										<li><label><input type="checkbox">&nbsp;준중형차</label></li>
										<li><label><input type="checkbox">&nbsp;중형차</label></li>
										<li><label><input type="checkbox">&nbsp;대형차</label></li>
										<li><label><input type="checkbox">&nbsp;스포츠카</label></li>
										<li><label><input type="checkbox">&nbsp;SUV</label></li>
										<li><label><input type="checkbox">&nbsp;RV</label></li>
										<li><label><input type="checkbox">&nbsp;기타</label></li>
										<!-- <li class="stline"><label><input type="checkbox">&nbsp;경승합차</label></li>
										<li><label><input type="checkbox">&nbsp;승합차</label></li>
										<li><label><input type="checkbox">&nbsp;화물차</label></li>
										<li><label><input type="checkbox">&nbsp;기타</label></li> -->
									</ul>
								</div>
							</div>
						</div>
						<div class="model_step_evpost">
							<h5 class="slideopen"><a>제조사/모델/등급</a></h5>
						</div>
						<div id="scroll_group">
								<div id="stepManufact" class="deparea_marker">
									<dl class="deplist_sort_lista1">
										<dt class="word1">국산차</dt>
										<dd>현대</dd> <!-- for문으로 브랜드 조회 -->
										<dd>기아</dd>
										<dd>쉐보레(GM대우)</dd>
										<dd>르노삼성</dd>
										<dd>기타</dd>
									</dl>
									<dl class="deplist_sort_lista2">
										<dt class="word2">수입차 인기</dt>
										<dd>테슬라</dd> <!-- 차 정보조회 좋아요 개수 많은순으로 db 호출 -->
										<dd>벤츠</dd>
										<dd>포르쉐</dd>
										<dd>BMW</dd>
										<dd>아우디</dd>
										<dd>닛산</dd>
										<dd>재규어</dd>
									</dl>
									<dl class="deplist_sort_lista3">
										<dt class="word3">수입차 이름순</dt>
										<dd>BMW</dd> <!-- 이름순으로 호출 영어 -> 한글 ㄱ -->
										<dd>GMC</dd>
										<dd>닛산</dd>
										<dd>도요타</dd>
										<dd>랜드로버</dd>
										<dd>렉서스</dd>
										<dd>링컨</dd>
										<dd>벤츠</dd>
										<dd>볼보</dd>
										<dd>스마트</dd>
										<dd>아우디</dd>
										<dd>인피니티</dd>
										<dd>재규어</dd>
										<dd>캐딜락</dd>
										<dd>테슬라</dd>
										<dd>포드</dd>
										<dd>포르쉐</dd>
										<dd>혼다</dd>
									</dl>
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
						<a class="popular_sort">인기순</a>
						<a class="view_sort">조회순</a>
						<a class="price_sort">가격순</a>
					</div>
					<ul>
						<li>
							<a href="">
								<span><img src="<%=request.getContextPath()%>/assets/img/carInfo/taican.png"></span>
								<span class="model_name">포르쉐 타이칸 크로스 투리스모 <!-- 모델명 --></span>
								<span class="model_short_info">복합 2.8~2.9km/h  <!-- 모델명 --></span>
								<span class="model_short_info">출력 350~500kW</span>
								<span class="model_price">14,560~23,360만원<!-- 연비 --></span>
							</a>
						</li>
						<li>
							<a href="">
								<span><img src="<%=request.getContextPath()%>/assets/img/carInfo/taican.png"></span>
								<span class="model_name">테슬라 모델 x</span>
								<span class="model_short_info">복합 3.7~3.9km/h</span>
								<span class="model_short_info">출력 500~895kW</span>
								<span class="model_price">13,999~15,999만원</span>
							</a>
						</li>
						<li>
							<a href="">
								<span><img src="<%=request.getContextPath()%>/assets/img/carInfo/taican.png"></span>
								<span class="model_name">테슬라 모델 s</span>
								<span class="model_short_info">복합 4.3km/h </span>
								<span class="model_short_info">출력 500~895kW</span>
								<span class="model_price">12,999~16,999만원</span>
							</a>
						</li>
						<li>
							<a>
								<span><img src="<%=request.getContextPath()%>/assets/img/carInfo/taican.png"></span>
								<span class="model_name">테슬라 모델 y</span>
								<span class="model_short_info">복합 4.8~5.4km/h </span>
								<span class="model_short_info">출력 258~336kW</span>
								<span class="model_price">7,899~8,599만원</span>
							</a>
						</li>
						<li>
							<a>
								<span><img src="<%=request.getContextPath()%>/assets/img/carInfo/taican.png"></span>
								<span class="model_name">테슬라 모델 3</span>
								<span class="model_short_info">복합 5.1~6.1km/h</span>
								<span class="model_short_info">출력 211~340kW</span>
								<span class="model_price">6,059~7939만원</span>
							</a>
						</li>
						<li>
							<a>
								<span><img src="<%=request.getContextPath()%>/assets/img/carInfo/taican.png"></span>
								<span class="model_name">아우디 e-트론 스포트백</span>
								<span class="model_short_info">복합 3.1km/h </span>
								<span class="model_short_info">출력 340kW</span>
								<span class="model_price">12,106만원</span>
							</a>
						</li>
						<li>
							<a>
								<span><img src="<%=request.getContextPath()%>/assets/img/carInfo/taican.png"></span>
								<span class="model_name">2022 BMW iX</span>
								<span class="model_short_info">복합 3.6~3.9km/h </span>
								<span class="model_short_info">출력 243~340kW</span>
								<span class="model_price">12,260~14,630만원</span>
							</a>
						</li>
						<li>
							<a>
								<span><img src="<%=request.getContextPath()%>/assets/img/carInfo/taican.png"></span>
								<span class="model_name">2022 제네시스 GV60</span>
								<span class="model_short_info">복합 4.1~5.1km/h</span>
								<span class="model_short_info">출력 168~360kW</span>
								<span class="model_price">5,990~7,040만원</span>
							</a>
						</li>
					</ul>
				</div>
			</div>
			<div id="ad_nav_fixed">
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
#model_search_info>ul>li {
	position:relative;
	float:left;
	/* margin-top:10px;
	margin-left:5px; */
	width:185px;
	margin-left:15px;
	left:-9px;
	padding-bottom:15px;
}
#model_search_info>ul>li>a  {
	text-decoration:none;
}
#model_search_info>ul>li>a>span[class="model_short_info"]{
	font-size:11px;
	color:#333;
	display:flex;
	
}
#model_search_info>ul>li>a>span[class="model_name"]{
	position:relative;
	display:flex;
	align-items:left; 
	font-weight:bold;
	color:#333;
	font-size:13px;
}
#model_search_info>ul>li>a>span[class="model_price"]{
	display:flex;
	margin-top:10px;
	align-items:left; 
	font-weight:bold;
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
	font-size:13px;
	position:relative;
	color: #333;
    left:15px;
    top:-3px;
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


</style>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$("#re_img").click(e=>{
		$("input[type='checkbox']").prop('checked',false);
	});
	$(".refresh").click(e=>{
		$("input[type='checkbox']").prop('checked',false);
	});
	
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
	
	$("#start_price").change(e=>{
		const sSelect=Number($("#start_price option:selected").val());
		for(let i=0; i<=$("#end_price option").length; i++) {
			if(sSelect>=Number($("#end_price option:eq("+i+")").val())) {
				const value1=$("#end_price option:eq("+i+")").val();
				$("#end_price option[value="+value1+"]").prop('disabled',true);
			}
		}
	});
	
		
</script>
<%-- <%@ include file="/views/common/footer.jsp"%> --%>