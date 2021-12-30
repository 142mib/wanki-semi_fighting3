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
import com.boong.carInfo.model.vo.ClassInfo;
import com.boong.carInfo.model.vo.Comment;
import com.google.gson.Gson;

/**
 * Servlet implementation class ModelInfoViewServlet
 */
@WebServlet("/model/modelInfo.do")
public class ModelInfoViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModelInfoViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String mClass=request.getParameter("mClass");
		response.setContentType("application/json;charset=utf-8");
		List<ClassInfo> result = new CarInfoService().modelInfoView(mClass);
		List<Comment> result2= new CarInfoService().commentList(mClass);
		List list=new ArrayList();
		list.add(result);
		list.add(result2);
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
