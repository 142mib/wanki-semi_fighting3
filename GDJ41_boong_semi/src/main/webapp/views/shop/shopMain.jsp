<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/shop/shopcommon/shopHeader.jsp" %>    
<%@ page import="java.util.List,com.boong.shop.model.vo.*" %>
<%
List<Product> list=(List)request.getAttribute("productList");
%>     
    
    
<!-- Portfolio-->
	<section>
		
		
		</div>
        <div id="portfolio">
            <div class="container-fluid p-0">
                <div class="row g-0">
                    
                    
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="<%=request.getContextPath()%>/assets/img/portfolio/fullsize/1.jpg" title="Project Name">
                            <img class="img-fluid" src="<%=request.getContextPath()%>/assets/img/portfolio/thumbnails/1.jpg" alt="..." />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50">Category</div>
                                <div class="project-name">Project Name</div>
                            </div>
                        </a>
                    </div>
                    
                    
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="<%=request.getContextPath()%>/assets/img/portfolio/fullsize/2.jpg" title="Project Name">
                            <img class="img-fluid" src="<%=request.getContextPath()%>/assets/img/portfolio/thumbnails/2.jpg" alt="..." />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50">Category</div>
                                <div class="project-name">Project Name</div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="<%=request.getContextPath()%>/assets/img/portfolio/fullsize/3.jpg" title="Project Name">
                            <img class="img-fluid" src="<%=request.getContextPath()%>/assets/img/portfolio/thumbnails/3.jpg" alt="..." />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50">Category</div>
                                <div class="project-name">Project Name</div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="<%=request.getContextPath()%>/assets/img/portfolio/fullsize/4.jpg" title="Project Name">
                            <img class="img-fluid" src="<%=request.getContextPath()%>/assets/img/portfolio/thumbnails/4.jpg" alt="..." />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50">Category</div>
                                <div class="project-name">Project Name</div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="<%=request.getContextPath()%>/assets/img/portfolio/fullsize/5.jpg" title="Project Name">
                            <img class="img-fluid" src="<%=request.getContextPath()%>/assets/img/portfolio/thumbnails/5.jpg" alt="..." />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50">Category</div>
                                <div class="project-name">Project Name</div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="<%=request.getContextPath()%>/assets/img/portfolio/fullsize/6.jpg" title="Project Name">
                            <img class="img-fluid" src="<%=request.getContextPath()%>/assets/img/portfolio/thumbnails/6.jpg" alt="..." />
                            <div class="portfolio-box-caption p-3">
                                <div class="project-category text-white-50">Category</div>
                                <div class="project-name">Project Name</div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="<%=request.getContextPath()%>/assets/img/portfolio/fullsize/1.jpg" title="Project Name">
                            <img class="img-fluid" src="<%=request.getContextPath()%>/assets/img/portfolio/thumbnails/1.jpg" alt="..." />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50">Category</div>
                                <div class="project-name">Project Name</div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="<%=request.getContextPath()%>/assets/img/portfolio/fullsize/1.jpg" title="Project Name">
                            <img class="img-fluid" src="<%=request.getContextPath()%>/assets/img/portfolio/thumbnails/1.jpg" alt="..." />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50">Category</div>
                                <div class="project-name">Project Name</div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="<%=request.getContextPath()%>/assets/img/portfolio/fullsize/1.jpg" title="Project Name">
                            <img class="img-fluid" src="<%=request.getContextPath()%>/assets/img/portfolio/thumbnails/1.jpg" alt="..." />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50">Category</div>
                                <div class="project-name">Project Name</div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="<%=request.getContextPath()%>/assets/img/portfolio/fullsize/1.jpg" title="Project Name">
                            <img class="img-fluid" src="<%=request.getContextPath()%>/assets/img/portfolio/thumbnails/1.jpg" alt="..." />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50">Category</div>
                                <div class="project-name">Project Name</div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="<%=request.getContextPath()%>/assets/img/portfolio/fullsize/1.jpg" title="Project Name">
                            <img class="img-fluid" src="<%=request.getContextPath()%>/assets/img/portfolio/thumbnails/1.jpg" alt="..." />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50">Category</div>
                                <div class="project-name">Project Name</div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="<%=request.getContextPath()%>/assets/img/portfolio/fullsize/1.jpg" title="Project Name">
                            <img class="img-fluid" src="<%=request.getContextPath()%>/assets/img/portfolio/thumbnails/1.jpg" alt="..." />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50">Category</div>
                                <div class="project-name">Project Name</div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="<%=request.getContextPath()%>/assets/img/portfolio/fullsize/1.jpg" title="Project Name">
                            <img class="img-fluid" src="<%=request.getContextPath()%>/assets/img/portfolio/thumbnails/1.jpg" alt="..." />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50">Category</div>
                                <div class="project-name">Project Name</div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="<%=request.getContextPath()%>/assets/img/portfolio/fullsize/1.jpg" title="Project Name">
                            <img class="img-fluid" src="<%=request.getContextPath()%>/assets/img/portfolio/thumbnails/1.jpg" alt="..." />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50">Category</div>
                                <div class="project-name">Project Name</div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="<%=request.getContextPath()%>/assets/img/portfolio/fullsize/1.jpg" title="Project Name">
                            <img class="img-fluid" src="<%=request.getContextPath()%>/assets/img/portfolio/thumbnails/1.jpg" alt="..." />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50">Category</div>
                                <div class="project-name">Project Name</div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
	</section>










<%@ include file="/views/shop/shopcommon/shopFooter.jsp" %>