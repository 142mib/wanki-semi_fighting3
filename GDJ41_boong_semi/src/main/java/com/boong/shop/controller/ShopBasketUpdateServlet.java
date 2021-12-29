package com.boong.shop.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boong.shop.model.service.ShopService;
import com.boong.shop.model.vo.Basket;

/**
 * Servlet implementation class ShopBasketUpdateServlet
 */
@WebServlet("/shop/basketUpdate.do")
public class ShopBasketUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopBasketUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Basket b=Basket.builder()
				.memberId(request.getParameter("memberId"))
				.productId(Integer.parseInt(request.getParameter("productId")))
				.basketNumber(Integer.parseInt(request.getParameter("basketNum")))
				.build();
		System.out.println(b);
		int result=new ShopService().updateBasket(b);
		String msg="";
		String loc="/shop/basketList.do?id="+b.getMemberId();
		if(result>0) {
			msg="수정성공";
			
		}else {
			msg="수정실패";
			
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/common/msg.jsp")
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
