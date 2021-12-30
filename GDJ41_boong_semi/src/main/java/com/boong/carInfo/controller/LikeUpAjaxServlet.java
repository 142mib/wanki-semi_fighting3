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
import com.boong.carInfo.model.vo.ModelLike;
import com.google.gson.Gson;

/**
 * Servlet implementation class LikeUpAjaxServlet
 */
@WebServlet("/like/likeUp.do")
public class LikeUpAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LikeUpAjaxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		response.setContentType("application/json;charset=utf-8");
		String mClass=request.getParameter("mClass");
		String memberId=request.getParameter("memberId");
		
		System.out.println(mClass);
		System.out.println(memberId);
		
		ClassInfo ci=ClassInfo.builder()
				.modelClass(mClass)
				.build();
		
		ModelLike m = ModelLike.builder()
				.modelClass(mClass)
				.memberId(memberId)
				.build();
		List<ClassInfo> result=new ArrayList();
		int resultMember=new CarInfoService().insertLikeMember(m);
		String msg="";
		if(resultMember>0) {
			int resultClass=new CarInfoService().updateClassLike(ci);
			msg="추천성공";
		}else{
			msg="추천은 한번만 가능합니다";
		}
		List list=new ArrayList();
		
		result=new CarInfoService().modelInfoView(mClass);
	
		list.add(result);
		list.add(msg);
		
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
