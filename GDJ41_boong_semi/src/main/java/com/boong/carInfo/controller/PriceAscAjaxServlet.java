package com.boong.carInfo.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boong.carInfo.model.service.CarInfoService;
import com.boong.carInfo.model.vo.CarInfo;
import com.google.gson.Gson;

/**
 * Servlet implementation class PriceAscAjaxServlet
 */
@WebServlet("/price/priceAsc.do")
public class PriceAscAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PriceAscAjaxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("application/json;charset=utf-8");
		int cPage;
		int numPerpage;
		
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		try {
			numPerpage=Integer.parseInt(request.getParameter("numPerpage"));
		}catch(NumberFormatException e) {
			numPerpage=15;
		}
		
		List<CarInfo> result=new CarInfoService().priceAsc(cPage,numPerpage);
		int totalData=new CarInfoService().totalListCount();
		int totalPage=(int)Math.ceil((double)totalData/numPerpage);
		
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		String pageBar="";
		
		if(pageNo==1) {
			pageBar="<span class='paging'><</span>";
		}else {
			pageBar+="<a onclick='pages(event);'"+"'><</a>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar+="<span id='currentPage' class='paging'>"+pageNo+"</span>";
			}else {
				pageBar+="<a id='searchPaging' onclick='pages(event);'>"+pageNo+"</a>";
			}
			pageNo++;                    
		}
		
		if(pageNo>totalPage) {
			pageBar+="<span class='paging'>></span>";
		}else {
			pageBar+="<a onclick='pages(event);'>></a>";
		}
		List list = new ArrayList();
		list.add(result);
		list.add(pageBar);
		
		
		response.setContentType("application/json;charset=utf-8");
		new Gson().toJson(list,response.getWriter());
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
