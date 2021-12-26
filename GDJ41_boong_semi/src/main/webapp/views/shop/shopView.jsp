<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ page import="com.boong.shop.model.vo.*,java.util.List" %>
<% Product p=(Product)request.getAttribute("product");  
	List<ProductComment> list=(List)request.getAttribute("comments");
%>

    
<%@ include file="/views/common/header.jsp"%>
<div style="height: 63px; background-color: rgba(1,138,216,1)"></div>

<style>
	section>div{width:80%; text-align: center;border: 1px solid red;margin: 0 10% 0 10%;}
	#sv-container{width:80%;  height:400px; text-align: center; margin: 0 10% 0 10%; display: flex; }	
	#sv-container .img-container{width:50%;  text-align: center; border-right: 2px solid rgba(70, 70, 70,0.5); padding-top:0px; display:flex; flex-direction: column; align-items: center;}
	#sv-container .img-container .img-magnifier-container{width:90%; height:auto; position: relative;  }
	#sv-container .img-container #myimage{ width:100%; height:auto;}
	#sv-container .content-container{width:50%; padding-left :4%;  align-items: flex-start; padding-top:30px; display:flex; flex-direction: column }
	#sv-container .content-container .content-table-container{ border:1px solid red; width:90%}
	.content-container2 { width:80%; text-align: center; border: 1px solid red;margin: 0 10% 0 10%;}
	/*댓글테이블*/
	#reply-container{width:80%;  text-align: center; margin: 0 10% 0 10%; display: flex;border: 1px solid red; }
    table#tbl-comment{width:100%;  margin:0 auto; border-collapse:collapse; clear:both; border:1px solid red;} 
    table#tbl-comment tr td{border-bottom:1px solid; border-top:1px solid; padding:5px; text-align:left;}
    table#tbl-comment tr td:first-of-type{padding: 5px 5px 5px 50px;}
    table#tbl-comment tr td:last-of-type {text-align:right; width: 100px;}
    table#tbl-comment button.btn-reply{display:none;}
    table#tbl-comment button.btn-delete{display:none;}
    table#tbl-comment tr:hover {background:lightgray;}
    table#tbl-comment tr:hover button.btn-reply{display:inline;}
    table#tbl-comment tr:hover button.btn-delete{display:inline;}
    table#tbl-comment tr.level2 {color:gray; font-size: 14px;}
    table#tbl-comment sub.comment-writer {color:navy; font-size:14px}
    table#tbl-comment sub.comment-date {color:tomato; font-size:10px}
    table#tbl-comment tr.level2 td:first-of-type{padding-left:100px;}
    table#tbl-comment tr.level2 sub.comment-writer {color:#8e8eff; font-size:14px}
    table#tbl-comment tr.level2 sub.comment-date {color:#ff9c8a; font-size:10px}
    /*답글관련*/
    table#tbl-comment textarea{margin: 4px 0 0 0;}
    table#tbl-comment button.btn-insert2{width:60px; height:23px; color:white; background:#3300ff; position:relative; top:-5px; left:10px;}
	
	#comment-container{ width:80%; text-align: center;display: flex; border: 1px solid red;margin: 0 10% 0 10%;justify-content: center;}
	.sv-table-tdleft{text-align: left;}
	.sv-table-tdright{text-align: right;}
	.sv-table-tdcenter{text-align: center;}
	
	
		
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
	
	table.shop-table tr {
	  border-bottom: 1px solid #ddd;
	}
	
</style>


	<div style="width:100%;height: 40px; "></div>
<section >
	<div id="sv-container">
	<div class="img-container">
		<p>이미지에 마우스를 가져가보세요:</p>
		<div class="img-magnifier-container">
		<img id="myimage" src="<%= request.getContextPath() %>/upload/shop/<%= p.getShopProductImageRename() %>">
		</div>
	
	</div>
	<div class="content-container">
		
		<div class="content-table-container">
			<table class="shop-table">
			  <tr>
			    <th class="sv-table-tdleft" rowspan="2" colspan="2"><h2>상품명</h2></th>  			  	
			  </tr>
			  <tr>
			  </tr>
			  <tr>
			    <td class="sv-table-tdleft"></td>
			    <td class="sv-table-tdright">가격</td>			    
			  </tr>
			  <tr>
			    <td class="sv-table-tdleft">택배배송</td>
			    <td class="sv-table-tdright">택배비</td>
			    
			  </tr>
			  <tr>
			    <td class="sv-table-tdleft">갯수</td>
			    <td class="sv-table-tdright">input</td>			    
			  </tr>
			  <tr>
			    <td class="sv-table-tdleft">총상품금액</td>
			    <td class="sv-table-tdright">~원</td>			   
			  </tr>
			  <tr>
			    <td class="sv-table-tdcenter" colspan="2" >장바구니추가</td>			   			    
			  </tr>
			  <tr>
			    <td class="sv-table-tdcenter" colspan="2">구매하기</td>			   		    
			  </tr>
			</table>
		
		</div>
		</div>
		
	</div>
	
	<div class="content-container2">
	<h2>상품 설명</h2>
	</div>
	
	
	
	<!-- 댓글입력창 -->
	<div>
	<h2>상품평</h2>
	</div>
	<div id="comment-container">		
		<%if(loginMember!=null){ %>
		<div class="comment-editor">			
			<form action="<%=request.getContextPath()%>/shop/insertProductComment.do" 
				method="post">
					<textarea name="content" cols="55" rows="3"></textarea>
					<input type="hidden" name="level" value="1">
					<input type="hidden" name="writer" value="<%=loginMember!=null?loginMember.getMemberId():""%>">
					<input type="hidden" name="productRef" value="<%=p.getShopProductId()%>">
					<input type="hidden" name="productCommentRef" value="0">
					<button type="submit" id="btn-insert">등록</button>
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
							<button class="btn-reply" value="<%=pc.getShopCommentId()%>">답글</button>
							<%if(loginMember.getMemberId().equals("admin")
									||loginMember.getMemberId().equals(pc.getMemberId()) ) {%>
							<button class="btn-delete">삭제</button>
							<%} %>
						<%} %>					
					</td>
				</tr>	
			<%}else{%>
				<tr class="level2">
					<td>
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
//onload
$(()=>{
	$(".comment-editor textarea[name=content]").focus(e=>{
		if(<%=loginMember==null%>){
			alert("로그인 후 이용이 가능합니다.");
			
		}
	})
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