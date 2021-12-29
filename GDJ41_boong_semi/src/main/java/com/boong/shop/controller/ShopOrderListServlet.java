package com.boong.shop.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boong.shop.model.service.ShopService;
import com.boong.shop.model.vo.Order;
import com.boong.shop.model.vo.OrderProduct;

/**
 * Servlet implementation class ShopOrderListServlet
 */
@WebServlet("/shop/orderList.do")
public class ShopOrderListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopOrderListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId=request.getParameter("id");
		System.out.println(memberId+" servlet id 받아욤");
		Order order=new ShopService().selectOrder(memberId);
		List<OrderProduct> list=new ShopService().selectOrderProduct(order.getOrderId());
		
		request.setAttribute("order", order);
		request.setAttribute("orderProductList", list);
		
		request.getRequestDispatcher("/views/shop/shopOrderList.jsp").forward(request, response);		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
