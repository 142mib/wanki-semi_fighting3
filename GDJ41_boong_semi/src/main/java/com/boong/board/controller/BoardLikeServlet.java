package com.boong.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boong.board.model.service.BoardService;
import com.boong.board.model.vo.Board;
import com.boong.board.model.vo.BoardLike;

/**
 * Servlet implementation class BoardLikeServlet
 */
@WebServlet("/board/boardLike.do")
public class BoardLikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardLikeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 게시글 추천하면 추천수 올려주기
		
		Board b = Board.builder()
				.boardNo(Integer.parseInt(request.getParameter("boardNo")))
				.build();
		
		BoardLike bl = BoardLike.builder()
				.boardLikeRef(Integer.parseInt(request.getParameter("boardNo")))
				.boardLikeMember(request.getParameter("boardWriter"))
				.build();
		
		
		// BOARD 테이블에서 like컬럼 증가시켜주기
		int resultBoard = new BoardService().updateBoardLike(b);
		// BOARD_LIKE테이블에 추천 누른사람 값 넣기
		int resultMember = new BoardService().insertBoardLikeMember(bl);
		
		String msg = "";
		String loc = "";
		if(resultBoard > 0 && resultMember > 0) {
			msg = "해당 게시글을 추천하였습니다.";
			loc = "/board/boardView.do?boardNo=" + request.getParameter("boardNo");
		}else if(resultMember < 0){
			msg = "한 게시글에는 한번의 추천만 가능합니다.";
			loc = "/board/boardView.do?boardNo=" + request.getParameter("boardNo");
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
