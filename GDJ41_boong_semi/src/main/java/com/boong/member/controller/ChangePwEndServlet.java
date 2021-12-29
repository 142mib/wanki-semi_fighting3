package com.boong.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.boong.member.model.service.MemberService;
import com.boong.member.model.vo.Member;

/**
 * Servlet implementation class ChangePwEndServlet
 */
@WebServlet("/member/changepwend.do")
public class ChangePwEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePwEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String memberId=request.getParameter("memberId");
		String memberPw=request.getParameter("memberPw");
		
		Member m=new MemberService().login(memberId,memberPw);
		
		String msg="";
		String loc="";
		if(m!=null) {
			String newMemberPw=request.getParameter("newMemberPw");
			int result=new MemberService().changePassword(memberId,newMemberPw);
			
			if(result>0) {
				msg="비밀번호 변경 완료! 재로그인을 위해 메인으로 돌아갑니다.";
				HttpSession session=request.getSession(false);
				if(session!=null) session.invalidate();
			}else {
				msg="비밀번호 변경 실패, 다시 시도해주세요";
				loc="/member/resetpwing.do";
			}
			
		}else {
			msg="비밀번호가 일치하지 않습니다.";
			loc="/member/changepw.do";
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
