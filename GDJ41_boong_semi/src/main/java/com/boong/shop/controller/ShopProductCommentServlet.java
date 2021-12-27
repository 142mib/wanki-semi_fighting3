package com.boong.shop.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boong.shop.model.service.ShopService;
import com.boong.shop.model.vo.ProductComment;

/**
 * Servlet implementation class ShopProductCommentServlet
 */
@WebServlet("/shop/insertProductComment.do")
public class ShopProductCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopProductCommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductComment pc=ProductComment.builder()
				.shopCommentContent(request.getParameter("content"))
				.memberId(request.getParameter("writer"))
				.shopProductId(Integer.parseInt(request.getParameter("productRef")))
				.shopCommentRef(Integer.parseInt(request.getParameter("productCommentRef")))
				.shopCommentLevel(Integer.parseInt(request.getParameter("level")))
				.build();
		
		int result=new ShopService().insertBoardComment(pc);
		String msg="";
		String loc="/shop/shopView.do?shopProductId="+pc.getShopProductId();
		if(result>0) {
			msg="댓글등록성공";
		}else {
			msg="댓글등록 실패";
		}
		request.setAttribute("msg",msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/common/msg.jsp")
		.forward(request,response);
		
	
	
	
	
	
	
	
	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
