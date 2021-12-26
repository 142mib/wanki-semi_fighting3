package com.boong.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boong.board.model.vo.Board;

/**
 * Servlet implementation class BoardUpdateServlet
 */
@WebServlet("/board/boardUpdate.do")
public class BoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 게시글 수정 버튼을 눌렀을 때 게시글 수정 페이지로 넘겨주는 Servlet
		Board b = Board.builder()
				.boardNo(Integer.parseInt(request.getParameter("board-No")))
				.boardCategory(Integer.parseInt(request.getParameter("board-category")))
				.boardTitle(request.getParameter("board-title"))
				.boardWriter(request.getParameter("board-writer"))
				.boardContent(request.getParameter("board-content"))
				.build();
		
		request.setAttribute("updateBoard", b);
		request.getRequestDispatcher("/views/board/boardUpdate.jsp").forward(request, response);
						
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
