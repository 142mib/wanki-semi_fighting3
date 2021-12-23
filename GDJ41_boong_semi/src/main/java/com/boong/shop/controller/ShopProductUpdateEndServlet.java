package com.boong.shop.controller;

import java.io.File;
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
 * Servlet implementation class ShopProductUpdateEndServlet
 */
@WebServlet("/shop/productUpdateEnd.do")
public class ShopProductUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopProductUpdateEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "시스템 에러 [form:enctype] 관리자에게 문의하세요 :(");
			request.setAttribute("loc", "/shop/productManage.do");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}
		
		String path=getServletContext().getRealPath("/upload/shop/");
		int maxSize=1024*1024*10;
		MultipartRequest mr=new MultipartRequest(request,path,maxSize,
				"UTF-8",new DefaultFileRenamePolicy());
		Product p=Product.builder()
				.shopProductId(Integer.parseInt(mr.getParameter("productId")))
				.shopProductName(mr.getParameter("productName"))
				.shopProductContent(mr.getParameter("productContent"))
				.shopProductPrice(Integer.parseInt(mr.getParameter("productPrice")))
				.shopProductStock(Integer.parseInt(mr.getParameter("productStock")))
				.build();
		
		//파일이 전송됐는지 확인하고 전송이 됐으면 이전파일을 삭제
		//전송되지않았으면 이전파일을 넣어야함.
		File f=mr.getFile("upfile");
		if(f!=null&&f.length()>0) {
			//클라이언트가 데이터를 넘김
			//이전파일삭제
			File deleteFile=new File(path+mr.getParameter("orifileRename"));
			deleteFile.delete();
			p.setShopProductImage(mr.getOriginalFileName("upfile"));
			p.setShopProductImageRename(mr.getFilesystemName("upfile"));
		}else {
			//업로드파일이 없음
			p.setShopProductImage(mr.getParameter("orifile"));
			p.setShopProductImageRename(mr.getParameter("orifileRename"));
		}
		
		int result=new ShopService().updateProduct(p);
		String msg="";
		String loc="";
		if(result>0) {
			msg="상품수정완료";
			loc="/shop/productManage.do";
		}else {
			msg="상품수정실패";
			loc="/shop/productUpdate.do?shopProductId="+p.getShopProductId();
		}
		
		request.setAttribute("msg",msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
