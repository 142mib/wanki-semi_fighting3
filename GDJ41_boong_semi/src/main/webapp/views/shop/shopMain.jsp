<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/shop/shopcommon/shopHeader.jsp" %>    
<%@ page import="java.util.List,com.boong.shop.model.vo.*" %>
<%
List<Product> list=(List)request.getAttribute("productList");
%>     
<!-- <script >
  $(document).on("pageload",function(){
window.location.reload(true);
});  


</script> -->


<style>
	div#pageBar{margin-top:10px; text-align:center; background-color:rgba(1,138,216,1);}
	div#pageBar span{color: white;}

</style>
    
<!-- Portfolio-->
	<section>
		<div style="height: 63px; background-color: rgb(1,138,216);">
		
		</div>
        <div id="portfolio">
            <div class="container-fluid p-0">
                <div class="row g-0">
                    
                    <% for(Product p : list){ %>
                    
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box2" style="cursor: pointer;" onclick="location.assign('<%=request.getContextPath()%>/shop/shopView.do?shopProductId=<%=p.getShopProductId()%>');" title="자세히보기"  >
                            <img class="img-fluid" src="<%=request.getContextPath()%>/upload/shop/<%=p.getShopProductImageRename() %>" alt="..." />
                            <div class="portfolio-box-caption">
                                <div class="project-name"><%=p.getShopProductName() %></div>
                                <div class="project-category text-white-50"><%=p.getShopProductPrice()%>원</div>
                                
                            </div>
                        </a>
                    </div>
                    
                    <% } %>
                    
                    
                </div>
            </div>
        </div>
        <div id="pageBar">
			<%=request.getAttribute("pageBar") %>
		</div>
	</section>










<%@ include file="/views/shop/shopcommon/shopFooter.jsp" %>