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
 * Servlet implementation class DeleteEndServlet
 */
@WebServlet("/member/deleteend.do")
public class DeleteEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String memberId=request.getParameter("memberId");
		String memberPw=request.getParameter("memberPw");
		System.out.println(memberId);
		System.out.println(memberPw);
		
		Member m=new MemberService().login(memberId, memberPw);
		String msg="";
		String loc="";
		if(m!=null) {
			int result=new MemberService().deleteMember(memberId);
			
			if(result>0) {
				msg="그동안 BOONG을 이용해 주셔서 감사합니다!";
				loc="/";
			}else {
				msg="회원탈퇴 실패, 다시 시도하세요";
				loc="/member/delete.do";
			}
			
		}else {
			msg="비밀번호가 일치하지 않습니다.";
			loc="/member/delete.do";
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
