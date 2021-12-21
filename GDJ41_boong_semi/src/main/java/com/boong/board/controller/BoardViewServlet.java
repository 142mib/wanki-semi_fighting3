package com.boong.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
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
		
		// 게시글 번호 받아오고
		int boardNo = Integer.parseInt(request.getParameter("boardNo")); 
		
		// 1. 게시글 번호가 같은 글의 데이터들을 불러와야함
		Board b = new BoardService().selectBoard(boardNo);
		
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
