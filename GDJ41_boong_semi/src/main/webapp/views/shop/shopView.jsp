<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ page import="com.boong.shop.model.vo.*,java.util.List" %>
<% Product p=(Product)request.getAttribute("product");  
	List<ProductComment> list=(List)request.getAttribute("comments");
%>

    
<%@ include file="/views/common/header.jsp"%>
<div style="height: 63px; background-color: rgba(1,138,216,1)"></div>

<style>
	section>div{width:80%; text-align: center;margin: 0 10% 0 10%;}
	#sv-container{width:80%;  height:500px; text-align: center; margin: 0 10% 20px 10%; display: flex; }	
	#sv-container .img-container{width:50%;   text-align: center; border-right: 2px solid #ddd; padding-top:0px; display:flex; flex-direction: column; align-items: center;}
	#sv-container .img-container .img-magnifier-container{width:90%; height:auto; position: relative;  }
	#sv-container .img-container #myimage{ width:100%; height:auto;}
	#sv-container .content-container{width:50%; padding-left :4%;  align-items: flex-start; padding-top:30px; display:flex; flex-direction: column }
	#sv-container .content-container .content-table-container{  width:90%}
	.content-container2 { width:80%; text-align: center; margin: 0 10% 0 10%;}
	/*댓글테이블*/
	#reply-container{width:80%;  text-align: center; margin: 0 10% 0 10%; display: flex;}
    table#tbl-comment{width:100%;  margin:0 auto; border-collapse:collapse; clear:both; } 
    table#tbl-comment tr td{border-bottom:1px solid #ddd;; border-top:1px solid #ddd;; padding:5px; text-align:left;}
    table#tbl-comment tr td:first-of-type{padding: 5px 30px 5px 130px;}
    table#tbl-comment tr td:last-of-type {text-align:right; width: 200px;}
    #btn-insert{transform: translate(10%,-35%); width:60px;}
    table#tbl-comment button.btn-reply{display:none;}
    table#tbl-comment button.btn-delete{display:none;}
    table#tbl-comment tr:hover {background:lightgray;}
    table#tbl-comment tr:hover button.btn-reply{display:inline;}
    table#tbl-comment tr:hover button.btn-delete{display:inline;}
    table#tbl-comment tr.level2 {color:gray; font-size: 14px;}
    table#tbl-comment sub.comment-writer {color:navy; font-size:14px}
    table#tbl-comment sub.comment-date {color:tomato; font-size:10px}
    table#tbl-comment tr.level2 td:first-of-type{padding-left:150px;}
    table#tbl-comment tr.level2 sub.comment-writer {color:#8e8eff; font-size:14px}
    table#tbl-comment tr.level2 sub.comment-date {color:#ff9c8a; font-size:10px}
    /*답글관련*/
    table#tbl-comment textarea{margin: 4px 0 0 0;}
    table#tbl-comment button.btn-insert2{width:60px; height:26px;  position:relative; top:-5px; left:10px;}
	.btn{
	width:70px; height:35px;
	border:none;
	border-radius: 10px;
	cursor:pointer; 
	background:rgba(1,138,216,1); color:white;
	font-size:13px;
	
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
	}
	.btn:hover{
	color:lightgrey;
	}
	
	
	#comment-container{ width:80%; text-align: center;justify-content: center; display: flex;margin: 10px 10% 0 10%;}
	.sv-table-tdleft{text-align: left;}
	.sv-table-tdright{text-align: right;}
	.sv-table-tdcenter{text-align: center;}
	.comment-id{transform: translateX(-10px); display:flex; flex-direction: column;justify-content: space-evenly;}
	
	.onelinecomment,.content-container2{padding-left: 2%; text-align: left;border-bottom: 1px solid #ddd; style:padding-top:20px;}
		
	.img-magnifier-glass {
	  position: absolute;
	  border: 1px solid grey;
	  border-radius: 50%;
	  cursor: none;
	  /*Set the size of the magnifier glass:*/
	  width: 100px;
	  height: 100px;
	}
	table.shop-table {
	  border-collapse: collapse;
	  width: 100%;	  
	}
	table.shop-table th{
		
	}
	
	
	table.shop-table tbody {
	  /* border-bottom: 1px solid #ddd; */
	 
	}
	#reply-container{margin-bottom:50px;}
	
</style>


	<div style="width:100%;height: 40px; "></div>
<section >
	<div id="sv-container">
	<div class="img-container">
		<p style="font-weight: bold; color: grey;">이미지에 마우스를 가져가 보세요:</p>
		<div class="img-magnifier-container" >
		<img id="myimage" src="<%= request.getContextPath() %>/upload/shop/<%= p.getShopProductImageRename() %>">
		</div>
	
	</div>
	<div class="content-container">
		
		<div class="content-table-container">
			<form action="<%=request.getContextPath()%>/shop/basketEnroll.do" method="post">
			<table class="shop-table">
			  <tr>
			    <th class="sv-table-tdleft" rowspan="1" colspan="2"><h3 style="font-weight: bold;"><%=p.getShopProductName() %></h3></th>  			  	
			  </tr>
			  
			  <tr style="border-bottom: 1px solid #ddd;">
			    <td></td>
			    <td class="sv-table-tdright" style="padding:0px 0 5px 0;"  ><%=p.getShopProductPrice() %>원</td>			    
			  </tr>
			  <tr>
			    <td class="sv-table-tdleft" style="padding:10px 0 0px 0;" >택배배송</td>
			    <td class="sv-table-tdright" style="padding:10px 0 0px 0;">3000원</td>
			    
			  </tr>
			  
			  <tr style="border-bottom: 1px solid #ddd;">
			    <td class="sv-table-tdleft" style="padding:5px 0 10px 0;">수량</td>
			    <td class="sv-table-tdright" style="padding:5px 0 10px 0;">
			    <input onchange="incre();" name="orderNumber" type="number" value="1" min="1" style="width: 45px" >
			    <input type="hidden" name="productId" value="<%=p.getShopProductId() %>" >
			    <%if(loginMember!=null){ %>
			    <input type="hidden" name="memberId" value="<%=loginMember.getMemberId() %>" >
			    <%} %>
			    </td>			    
			  </tr>
			  <tr style="font-weight: bold; border-bottom: 1px solid #ddd; ">
			    <td class="sv-table-tdleft" style="padding:15px 0 5px 0;">총상품금액</td>
			    
			    <td class="sv-table-tdright" style="padding:15px 0 5px 0;"><span class="totalMoney"></span>원</td>			   
			  </tr>
			  <tr>
			  	<%if(loginMember!=null){ %>
			    <td class="sv-table-tdcenter" colspan="2" style="padding-top:20px; "><input type="submit" style="width: 90px;" class="btn" value="주문하기"> </td>			   			    
			    <%} %>			   			    
			  </tr>
			  <!-- <tr>
			    <td class="sv-table-tdcenter" colspan="2" style="padding-top:10px;"><button>바로 구매하기</button></td>			   		    
			  </tr> -->
			</table>
			</form>
				<%if(loginMember==null){ %>
				<span ><button style="margin-top: 20px;" onclick="alert('로그인후 사용 가능합니다.');">주문하기</button></span>
				<%} %>
		</div>
		</div>
		
	</div>
	
	<div class="content-container2" >
	<h4>상품 설명</h4>
	</div>
	<div class="content-container2">
	<p style="padding:10px 0 0px 0;"><%=p.getShopProductContent() %></p>
	</div>
	
	
	
	<!-- 댓글입력창 -->
	<div class="onelinecomment" style="padding-top:20px;">
	<h4>한줄 상품평</h4>
	</div>
	<div id="comment-container">		
		<%if(loginMember!=null){ %>
		<div class="comment-id" >
		<h5 style="color: grey;"><%=loginMember.getMemberId() %></h5>
		</div>
		<div class="comment-editor">			
			<form action="<%=request.getContextPath()%>/shop/insertProductComment.do" 
				method="post">
					<textarea name="content" cols="55" rows="3" style="border: 1px solid grey;"></textarea>
					<input type="hidden" name="level" value="1">
					<input type="hidden" name="writer" value="<%=loginMember!=null?loginMember.getMemberId():""%>">
					<input type="hidden" name="productRef" value="<%=p.getShopProductId()%>">
					<input type="hidden" name="productCommentRef" value="0">
					<button  type="submit" id="btn-insert" class="btn">등록</button>
			</form>
		</div>
		<%}else{ %>	
		<span>댓글기능은 로그인 후 사용가능합니다.</span>
		<%} %>
			
	</div>
		
	<div id="reply-container">	
		<table id="tbl-comment">
			<%for(ProductComment pc : list){ 
				if(pc==null)System.out.println("null");
				System.out.println(pc);
				if(pc.getShopCommentLevel()==1){
					
			%>
				<tr class="level1">
					<td>
						<sub class="comment-writer"><%=pc.getMemberId() %></sub>
						<sub class="comment-date"><%=pc.getShopCommentDate()%></sub>
						<br>
						<%=pc.getShopCommentContent() %>
					</td>
					<td>
						<%if(loginMember!=null){ %>
							<button class="btn-reply btn" value="<%=pc.getShopCommentId()%>">답글</button>
							<%if(loginMember.getMemberId().equals("admin")
									||loginMember.getMemberId().equals(pc.getMemberId()) ) {%>
							<button class="btn-delete btn">삭제</button>
							<%} %>
						<%} %>					
					</td>
				</tr>	
			<%}else{%>
				<tr class="level2">
					<td>
						<i class="fas fa-comments" ></i>
						<sub><%=pc.getMemberId() %></sub>
						<sub><%=pc.getShopCommentDate() %></sub>
						<%=pc.getShopCommentContent() %>
					</td>
					<td>
					</td>
				</tr>
			<%	}
			} %>
		</table>
	 </div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
<script>
let totalMoney=$("input[name=orderNumber]").val()*<%=p.getShopProductPrice() %>+3000;
$(".totalMoney").text(totalMoney);


	let incre=()=>{
		let totalMoney=$("input[name=orderNumber]").val()*<%=p.getShopProductPrice() %>+3000;
		$(".totalMoney").text(totalMoney);
	}

	

//onload
$(()=>{
	<%-- $(".comment-editor textarea[name=content]").focus(e=>{
		if(<%=loginMember==null%>){
			alert("로그인 후 이용이 가능합니다.");
			
		}
	}) --%>
	//$(".btn-reply").one("click",e=>{
	$(".btn-reply").click(e=>{
		const test=$("#tbl-comment").find("form");
		console.log(test);
		//$(test).parent().css({"display":"none"});
		$(test).parent().remove();
		//입력창을 버튼을 누른 tr밑에 작성을 해준다.
		const tr=$("<tr>");
		const form=$(".comment-editor>form").clone();
		console.log(form);
		form.find("textarea").attr({"rows":"1"});
		form.find("input[name=level]").val("2");
		form.find("input[name=productCommentRef]").val($(e.target).val());
		console.log($(e.target).val());
		form.find("button").removeAttr("id").addClass("btn-insert2");
		
		const td=$("<td>").attr({"colspan":"2"})
		td.append(form);
		tr.append(td);
		
		//$(e.target).parent().parent()
		$(e.target).parents("tr").after(tr);
		//이벤트제거
		//$(e.target).off("click");
	});	
	
});

//댓글 script종료




function magnify(imgID, zoom) {
	  var img, glass, w, h, bw;
	  img = document.getElementById(imgID);

	  /* Create magnifier glass: */
	  glass = document.createElement("DIV");
	  glass.setAttribute("class", "img-magnifier-glass");

	  /* Insert magnifier glass: */
	  img.parentElement.insertBefore(glass, img);

	  /* Set background properties for the magnifier glass: */
	  glass.style.backgroundImage = "url('" + img.src + "')";
	  glass.style.backgroundRepeat = "no-repeat";
	  glass.style.backgroundSize = (img.width * zoom) + "px " + (img.height * zoom) + "px";
	  bw = 3;
	  w = glass.offsetWidth / 2;
	  h = glass.offsetHeight / 2;

	  /* Execute a function when someone moves the magnifier glass over the image: */
	  glass.addEventListener("mousemove", moveMagnifier);
	  img.addEventListener("mousemove", moveMagnifier);

	  /*and also for touch screens:*/
	  glass.addEventListener("touchmove", moveMagnifier);
	  img.addEventListener("touchmove", moveMagnifier);
	  function moveMagnifier(e) {
	    var pos, x, y;
	    /* Prevent any other actions that may occur when moving over the image */
	    e.preventDefault();
	    /* Get the cursor's x and y positions: */
	    pos = getCursorPos(e);
	    x = pos.x;
	    y = pos.y;
	    /* Prevent the magnifier glass from being positioned outside the image: */
	    if (x > img.width - (w / zoom)) {x = img.width - (w / zoom);}
	    if (x < w / zoom) {x = w / zoom;}
	    if (y > img.height - (h / zoom)) {y = img.height - (h / zoom);}
	    if (y < h / zoom) {y = h / zoom;}
	    /* Set the position of the magnifier glass: */
	    glass.style.left = (x - w) + "px";
	    glass.style.top = (y - h) + "px";
	    /* Display what the magnifier glass "sees": */
	    glass.style.backgroundPosition = "-" + ((x * zoom) - w + bw) + "px -" + ((y * zoom) - h + bw) + "px";
	  }

	  function getCursorPos(e) {
	    var a, x = 0, y = 0;
	    e = e || window.event;
	    /* Get the x and y positions of the image: */
	    a = img.getBoundingClientRect();
	    /* Calculate the cursor's x and y coordinates, relative to the image: */
	    x = e.pageX - a.left;
	    y = e.pageY - a.top;
	    /* Consider any page scrolling: */
	    x = x - window.pageXOffset;
	    y = y - window.pageYOffset;
	    return {x : x, y : y};
	  }
	}
	

</script>
	
<script>
/* Initiate Magnify Function
with the id of the image, and the strength of the magnifier glass:*/
magnify("myimage", 1.8);
</script>











</section>
<%@ include file="/views/shop/shopcommon/shopFooter.jsp"%>