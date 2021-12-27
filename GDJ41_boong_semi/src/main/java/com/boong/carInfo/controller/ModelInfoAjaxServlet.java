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
 * Servlet implementation class ModelInfoAjaxServlet
 */
@WebServlet("/model/modelList.do")
public class ModelInfoAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModelInfoAjaxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String value=request.getParameter("value");
		List<CarInfo> list= new CarInfoService().classList(value);
		response.setContentType("application/json;charset=utf-8");
		new Gson().toJson(list,response.getWriter());
		if(!list.isEmpty()) {
			System.out.println(list);
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
