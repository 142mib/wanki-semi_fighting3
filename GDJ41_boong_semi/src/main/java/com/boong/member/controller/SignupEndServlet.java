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
 * Servlet implementation class SignupEndServlet
 */
@WebServlet("/member/signupEnd.do")
public class SignupEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignupEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId=request.getParameter("memberId").trim();
		String memberPw=request.getParameter("memberPw");
		String memberName=request.getParameter("memberName").trim();
		String gender=request.getParameter("gender");
		String phone=request.getParameter("phone");
		String email=request.getParameter("email_id")+"@"+request.getParameter("email_domain");
		String address=request.getParameter("address1")+" "+request.getParameter("address2");
		
		String car=String.join(",", request.getParameterValues("car"));
		System.out.println(car);
		
		Member m=Member.builder()
				.memberId(memberId)
				.memberPw(memberPw)
				.memberName(memberName)
				.gender(gender)
				.email(email)
				.phone(phone)
				.address(address)
				.car(car)
				.build();
		
		int result= new MemberService().insertMember(m);
		String msg="";
		String loc="";
		if(result>0) {
			msg="회원가입 성공! 로그인 해 주세요.";
			loc="/";
		}else {
			msg="회원가입 실패, 다시 시도하세요.";
			loc="/member/signup.do";
		}
		//request에 데이터 세팅하기
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
