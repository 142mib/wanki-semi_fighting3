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
import com.boong.shop.model.vo.ProductComment;

/**
 * Servlet implementation class ShopViewServlet
 */
@WebServlet("/shop/shopView.do")
public class ShopViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int shopProductId=Integer.parseInt(request.getParameter( "shopProductId" )) ;
		Product p=new ShopService().selectProduct(shopProductId);
		List<ProductComment> list=new ShopService().selectProductCommentList(shopProductId);
		request.setAttribute("product", p);
		request.setAttribute("comments", list);
		
		String view="";
		if(p==null) {
			view="/views/common/msg.jsp";
			request.setAttribute("msg","이 게시물이 존재하지 않습니다.");
			request.setAttribute("loc", "/shop/shopView.do?shopProductId="+shopProductId);
		}
		else {
			view="/views/shop/shopView.jsp";
			
			
		}
		request.getRequestDispatcher(view)
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
