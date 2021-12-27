package com.boong.shop.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.boong.shop.model.service.ShopService;
import com.boong.shop.model.vo.Product;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class ShopProductEnrollEndServlet
 */
@WebServlet("/shop/productEnrollEnd.do")
public class ShopProductEnrollEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopProductEnrollEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "잘못된 요청입니다 관리자에게 문의하세요 XD");
			request.setAttribute("loc","/shop/productEnroll.do");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}
		
		String path=getServletContext().getRealPath("/upload/shop/");
		MultipartRequest mr=new MultipartRequest(request,path,(1024*1024*10),
				"UTF-8",new DefaultFileRenamePolicy());
		//파일명에 대한 리네임을 커스터마이징하기!
		
		Product p=Product.builder()
				.shopProductName(mr.getParameter("productName"))
				.shopProductPrice(Integer.parseInt(mr.getParameter("productPrice")))
				.shopProductContent(mr.getParameter("productContent"))
				.shopProductStock(Integer.parseInt(mr.getParameter("productStock")))
				.shopProductImage(mr.getOriginalFileName("upfile"))
				.shopProductImageRename(mr.getFilesystemName("upfile"))
				.build();
		
		int result=new ShopService().insertProduct(p);
		String msg="";
		String loc="";
		if(result>0) {
			msg="상품등록성공";
			loc="/shop/productManage.do";
		}else {
			msg="상품등록실패";
			loc="/shop/productEnroll.do";
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
