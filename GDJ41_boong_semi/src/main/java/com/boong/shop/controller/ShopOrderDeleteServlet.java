package com.boong.shop.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boong.shop.model.service.ShopService;
import com.boong.shop.model.vo.OrderProduct;

/**
 * Servlet implementation class ShopOrderDeleteServlet
 */
@WebServlet("/shop/orderDelete.do")
public class ShopOrderDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopOrderDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId=request.getParameter("memberId");
		OrderProduct op=OrderProduct.builder()
				.orderId(Integer.parseInt(request.getParameter("orderId")))
				.productId(Integer.parseInt(request.getParameter("productId")))
				.build();
		int result=new ShopService().deleteOrder(op);
		String msg="";
		String loc="/shop/orderList.do?id="+memberId;
		if(result>0) {
			msg="삭제성공";
			
		}else {
			msg="삭제실패";
			
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
