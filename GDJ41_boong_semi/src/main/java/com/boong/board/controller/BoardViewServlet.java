package com.boong.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boong.board.model.service.BoardService;
import com.boong.board.model.vo.Board;

/**
 * Servlet implementation class BoardViewServlet
 */
@WebServlet("/board/boardView.do")
public class BoardViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 게시판 목록에서 게시글 제목을 누르면 게시글 상세보기 화면으로 넘겨주는 Servlet
		
		// 스트링쿼리로 게시글 번호 받아오고
		int boardNo = Integer.parseInt(request.getParameter("boardNo")); 
		
		// 조회수 처리(cookie 사용)
		Cookie[] cookies=request.getCookies();
//		System.out.println(cookies);
		String boardRead="";//이전 게시글 번호들을 저장하는 변수
		boolean isRead=false;//읽었으면 true, 안읽었으면 false
		//게시물 읽은 것에 대해 cookie에 boardRead키값으로 읽은 게시물 번호를 저장!
		if(cookies!=null) {
			for(Cookie c : cookies) {
				String name=c.getName();
				String value=c.getValue();
//				System.out.println(name + value);
				if(name.equals("boardRead")) {
					boardRead=value;
					if(value.contains("|"+boardNo+"|")) {
						isRead=true;
						break;
					}
				}
						
			}
		}
		
		if(!isRead) {
			//이 게시글을 안 읽었다면
			Cookie c=new Cookie("boardRead",boardRead+"|"+boardNo+"|");
			c.setMaxAge(24*60*60);//1일동안 유지
			response.addCookie(c);					
		}
		
		// 1. 게시글 번호가 같은 글의 데이터들을 불러와야함
		Board b = new BoardService().selectBoard(boardNo, isRead);
		
		// 2. attribute 설정
		request.setAttribute("selectBoard", b);
		
		// 화면 전환
		request.getRequestDispatcher("/views/board/boardView.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
