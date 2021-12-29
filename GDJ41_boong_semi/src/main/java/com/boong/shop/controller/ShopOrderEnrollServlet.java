package com.boong.shop.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boong.member.model.service.MemberService;
import com.boong.member.model.vo.Member;
import com.boong.shop.model.service.ShopService;
import com.boong.shop.model.vo.Basket;
import com.boong.shop.model.vo.Order;

/**
 * Servlet implementation class ShopOrderEnrollServlet
 */
@WebServlet("/shop/orderEnroll.do")
public class ShopOrderEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopOrderEnrollServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//아이디값받아오고
		String memberId=request.getParameter("id");
		System.out.println(memberId+"hi");
		//멤버값 받아오고
		Member member=new MemberService().selectMember(memberId);
		//request.setAttribute("member", member);//이건 진짜 필요 x 
		//장바구니값 불러오고
		List<Basket> basketList=new ShopService().selectBasket(memberId);
		//주문값 있으면 불러오고(없거나 status값이 0이 아니면 안불러옴)
		
		Order order=new ShopService().selectOrder(memberId);
		//주문값 만들기 ( 없으면 추가 ) 그리고 다시 불러오기 - 
		
		int result=0;
		if(order==null) {
			result=new ShopService().insertOrder(member);
			System.out.println(result>0?"order새로등록성공":"order새로등록실패");
			order=new ShopService().selectOrder(memberId);
		}else {
			System.out.println("order있는거 사용");
		}
		int orderId=order.getOrderId();
//		request.setAttribute("order", order);//order값 넘김
		//orderProduct 추가 - 장바구니 주문id 넘김
		for(Basket b:basketList) {
			result=new ShopService().insertOrderProduct(orderId,b);
			System.out.println(result>0?"insert성공":"insert실패");
		}
		if(result>0) {
			int deleteResult=new ShopService().deleteBasket(memberId);
			System.out.println(deleteResult>0?"장바구니비움":"장바구니못비움");
		}
		
		
		request.getRequestDispatcher("/shop/orderList.do?id="+memberId)
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
