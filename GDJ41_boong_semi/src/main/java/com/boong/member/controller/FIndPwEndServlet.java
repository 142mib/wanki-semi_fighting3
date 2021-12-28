package com.boong.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boong.member.model.service.MemberService;
import com.boong.member.model.vo.Member;

/**
 * Servlet implementation class FIndPwEndServlet
 */
@WebServlet("/member/findpwend.do")
public class FIndPwEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FIndPwEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId=request.getParameter("memberId");
		String memberName=request.getParameter("memberName");
		String email=request.getParameter("email_id")+"@"+request.getParameter("email_domain");
		System.out.println(memberId);
		System.out.println(memberName);
		System.out.println(email);
		
		Member m=new MemberService().findPw(memberId,memberName,email);
		System.out.println(m);
		String msg="";
		String loc="";
		
		if(m!=null) {
			request.setAttribute("member", m);
			msg="정보 확인 성공, 비밀번호를 재설정해 주세요.";
			loc="/views/member/findpwresult.jsp?member="+m;
		}else{
			msg="일치하는 회원이 없습니다. 정보를 다시 확인해 주세요.";
			loc="/views/member/findPw.jsp";
		}
		request.setAttribute("msg", msg);
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
