package com.boong.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boong.board.model.service.BoardService;
import com.boong.board.model.vo.BoardComment;

/**
 * Servlet implementation class BoardCommentWriteServlet
 */
@WebServlet("/board/boardCommentWrite.do")
public class BoardCommentWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardCommentWriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 댓글 등록버튼을 눌렀을때 댓글을 등록하는 기능
		BoardComment bc = BoardComment.builder()
				.boardRef(Integer.parseInt(request.getParameter("boardRef")))
				.boardCommentWriter(request.getParameter("boardCommentWriter"))
				.boardCommentContent(request.getParameter("boardCommentContent"))
				.boardCommentLevel(Integer.parseInt(request.getParameter("boardCommentLevel")))
				.boardCommentRef(Integer.parseInt(request.getParameter("boardCommentRef")))
				.build();
//		System.out.println(request.getParameter("boardRef"));
		int result = new BoardService().insertBoardComment(bc);
		
		String msg = "";
		String loc = "";
		if(result > 0) {
			msg = "댓글 등록 완료";
			loc = "/board/boardView.do?boardNo=" + bc.getBoardRef();
		}else {
			msg = "댓글 등록 실패";
			loc = "/board/boardView.do?boardNo=" + bc.getBoardRef();
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
