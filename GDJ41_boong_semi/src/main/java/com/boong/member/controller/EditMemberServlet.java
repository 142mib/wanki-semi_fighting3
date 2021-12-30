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
 * Servlet implementation class EditMemberServlet
 */
@WebServlet("/member/editmember.do")
public class EditMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member m=Member.builder()
				.memberId(request.getParameter("memberId"))
				.memberName(request.getParameter("memberName"))
				.gender(request.getParameter("gender"))
				.email(request.getParameter("email"))
				.phone(request.getParameter("phone"))
				.address(request.getParameter("address"))
				.car(request.getParameter("car"))
				.build();
		System.out.println(m);
		int result=new MemberService().editMember(m);
		String msg="";
		String loc="";
		if(result>0) {
			msg="회원정보 수정 완료!";
			loc="/member/mypageview.do";		
		}else {
			msg="회원정보 수정 실패";
			loc="/member/mypageview.do";
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
