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
 * Servlet implementation class ShopOrderUpdateServlet
 */
@WebServlet("/shop/orderUpdate.do")
public class ShopOrderUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopOrderUpdateServlet() {
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
				.orderProductNumber(Integer.parseInt(request.getParameter("orderNum")))
				.build();
		System.out.println(op);
		int result=new ShopService().updateOrder(op);
		String msg="";
		String loc="/shop/orderList.do?id="+memberId;
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
