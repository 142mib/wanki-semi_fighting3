package com.boong.shop.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boong.shop.model.service.ShopService;
import com.boong.shop.model.vo.Product;

/**
 * Servlet implementation class ShopProductUpdate
 */
@WebServlet("/shop/productUpdate.do")
public class ShopProductUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopProductUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int shopProductId=Integer.parseInt(request.getParameter( "shopProductId" )) ;
		Product p=new ShopService().selectProduct(shopProductId);
		
		request.setAttribute("product", p);
		
		request.getRequestDispatcher("/views/shop/productUpdate.jsp")
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
