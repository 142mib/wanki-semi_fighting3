package com.boong.carInfo.controller;

import java.io.IOException;
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
 * Servlet implementation class SearchSrcrollListAjaxServlet
 */
@WebServlet("/scroll/scrollList.do")
public class SearchSrcrollListAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchSrcrollListAjaxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String select=request.getParameter("value");
		
		System.out.println(select);
		
		response.setContentType("application/json;charset=utf-8");
		if(select!=null) {
			List list= new CarInfoService().scrollList(select);
			System.out.println(list);
				if(!list.isEmpty()) {
					new Gson().toJson(list,response.getWriter());
				}
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
