<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %> 

	<div id="blank" style="width:100%;height: 70px;background-color: brown;">
	</div>
	
	<div id="container">
		<div id="search_wrap">
			<div id="search_car">
				<div class="search_title">
					<h4>전기친환경차</h4>
					<span class="refresh" id="refresh">선택 초기화</span><img id="re_img" src="<%=request.getContextPath()%>/img/carInfo/refresh.png" width="15px" height="15px">
				</div>
				<div class="search_group">
					<fieldset>
						<legend>검색 조건 선택</legend>
						<div class="search_category">
							<h5 class="slideopen">
								<a id="category">차종
								<span class="arrow" id="arrow"><img id="arr_img" src="<%=request.getContextPath()%>/img/carInfo/arrow2.png" width="15px" height="10px"></span>
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
										<li class="stline"><label><input type="checkbox">&nbsp;SUV</label></li>
										<li><label><input type="checkbox">&nbsp;RV</label></li>
										<li class="stline"><label><input type="checkbox">&nbsp;경승합차</label></li>
										<li><label><input type="checkbox">&nbsp;승합차</label></li>
										<li><label><input type="checkbox">&nbsp;화물차</label></li>
										<li><label><input type="checkbox">&nbsp;기타</label></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="model_step_evpost">
							<h5 class="slideopen"><a>제조사/모델/등급</a></h5>
						</div>
					</fieldset>
				</div>
			</div>
		</div>
	</div>
<style>
#container {
	height:100%;
	position:relative;
}
#search_wrap {
	width:1200px; position:absolute; left: 50px; top: 100px;
	border: 1px solid #e1e2e6;
}
#search_car {
	width:239px; height:1040px;
	border: 1px solid #e5e5e5;
	border-top:none;
	border-left:none;
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
    color: #ff3333;
    font-weight:bold;
}
.search_category h5 {
	width:238px;
	height:41px;
	border-bottom:1px solid #e5e5e5;
	border-right:none;
	border-top:none;
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


</style>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$("#re_img").click(e=>{
		$("input[type='checkbox']").prop('checked',false);
	});
	$(".refresh").click(e=>{
		$("input[type='checkbox']").prop('checked',false);
	});
	
	
	$(()=>{
		$("#category").click(e=>{
			if($(".deparea_category").is(":visible")){
				$(".deparea_category").slideUp();	
				$("#arr_img").attr("src","<%=request.getContextPath()%>/img/carInfo/arrow2.png");
			}else{
				$(".deparea_category").slideDown();
				$("#arr_img").attr("src","<%=request.getContextPath()%>/img/carInfo/arrow1.png");
			}
		});
	});
	
	
	
	
</script>
<%@ include file="/views/common/footer.jsp"%>