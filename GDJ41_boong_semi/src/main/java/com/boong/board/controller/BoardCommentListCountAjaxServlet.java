package com.boong.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boong.board.model.service.BoardService;
import com.boong.board.model.vo.BoardComment;
import com.google.gson.Gson;

/**
 * Servlet implementation class BoardCommentListCountAjaxServlet
 */
@WebServlet("/board/boardCommentListCount.do")
public class BoardCommentListCountAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardCommentListCountAjaxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// boardNo를 받아옴
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
		BoardComment bc = BoardComment.builder()
				.boardRef(boardNo)
				.build();
		
		int total = new BoardService().countBoardComment(bc);
		
		response.setContentType("application/json;charset=utf-8");
		new Gson().toJson(total, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
