package com.boong.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boong.board.model.service.BoardService;

/**
 * Servlet implementation class BoardCommentDeleteAjaxServlet
 */
@WebServlet("/board/boardCommentDelete.do")
public class BoardCommentDeleteAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardCommentDeleteAjaxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 게시글에 대한 댓글 삭제
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		int boardCommentNo = Integer.parseInt(request.getParameter("boardCommentNo"));
		
		int result = new BoardService().deleteComment(boardCommentNo);
		
		String msg = "";
		String loc = "";
		if(result > 0) {
			msg = "댓글 삭제 완료";
			loc = "/board/boardView.do?boardNo=" + boardNo;
		}else {
			msg = "댓글 삭제 실패";
			loc = "/board/boardView.do?boardNo=" + boardNo;
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
