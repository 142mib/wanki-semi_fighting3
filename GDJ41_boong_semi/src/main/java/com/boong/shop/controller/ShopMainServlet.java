package com.boong.shop.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boong.shop.model.service.ShopService;
import com.boong.shop.model.vo.Product;

/**
 * Servlet implementation class ShopMainServlet
 */
@WebServlet("/shop/main.do")
public class ShopMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopMainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cPage;
		int numPerpage;
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		try {
			numPerpage=Integer.parseInt(request.getParameter("numPerpage"));
		}catch(NumberFormatException e) {
			numPerpage=15;
		}
		
		List<Product> list=new ShopService().selectProductList(cPage,numPerpage);
		int totalData=new ShopService().selectProductListCount();
		int totalPage=(int)Math.ceil((double)totalData/numPerpage);
		
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		String pageBar="";
		
		if(pageNo==1) {
			pageBar="<span>[이전]</span>";
		}else {
			pageBar+="<a href='"+request.getRequestURL()
			+"?cPage="+(pageNo-1)+"'>[이전]</a>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar+="<span>"+pageNo+"</span>";
			}else {
				pageBar+="<a href='"+request.getRequestURL()
				+"?cPage="+(pageNo)+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<span>[다음]</span>";
		}else {
			pageBar+="<a href='"+request.getRequestURL()
			+"?cPage="+(pageNo)+"'>[다음]</a>";
		}
		
		request.setAttribute("productList", list);
		request.setAttribute("pageBar", pageBar);
		
		request.getRequestDispatcher("/views/shop/shopMain.jsp")
		.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

