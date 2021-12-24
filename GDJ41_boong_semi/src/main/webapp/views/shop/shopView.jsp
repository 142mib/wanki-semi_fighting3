<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ page import="com.boong.shop.model.vo.*" %>
<% Product p=(Product)request.getAttribute("product");  %>

    
<%@ include file="/views/common/header.jsp"%>
<div style="height: 63px; background-color: rgba(1,138,216,1)"></div>

<style>
	#sv-container{width:80%;  height:500px; text-align: center; margin: 0 10% 0 10%; display: flex;border: 1px solid red;}	
	#sv-container .img-container{width:50%;  text-align: center; border-right: 1px solid; padding-top:50px; display:flex; flex-direction: column; align-items: center;}
	#sv-container .img-container .img-magnifier-container{width:90%; height:auto; position: relative;  }
	#sv-container .img-container #myimage{ width:100%; height:auto;}
	#sv-container .content-container{width:50%; padding-left :8%;  text-align: center; padding-top:30px; display:flex; }
	#sv-container .content-container .content-table-container{ border:1px solid red; width:90%}
		
	.img-magnifier-glass {
	  position: absolute;
	  border: 1px solid grey;
	  border-radius: 50%;
	  cursor: none;
	  /*Set the size of the magnifier glass:*/
	  width: 100px;
	  height: 100px;
	}
	
</style>


	<div style="width:100%;height: 20px; "></div>
<section id="sv-container">
	
	<div class="img-container">
		<p>Mouse over the image:</p>
		<div class="img-magnifier-container">
		<img id="myimage" src="<%= request.getContextPath() %>/upload/shop/<%= p.getShopProductImageRename() %>">
		</div>
	
	</div>
	<div class="content-container">
		<div class="content-table-container">
		
		<h2>content container</h2>
		</div>
		
	</div>
<script>




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
magnify("myimage", 1.5);
</script>











</section>
<%@ include file="/views/shop/shopcommon/shopFooter.jsp"%>