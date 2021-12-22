package com.boong.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.boong.board.model.service.BoardService;
import com.boong.board.model.vo.Board;
import com.boong.common.BoardFileRenamed;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class BoardUpdateEndServlet
 */
@WebServlet("/board/boardUpdateEnd.do")
public class BoardUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 사용자가 입력한 수정값을 받아 디비에 수정값으로 update하는 기능
		// 게시글 데이터 중에 board_no가 같은애를 찾아서 update
		
		// 파일 업로드처리
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "잘못된 요청입니다.");
			request.setAttribute("loc", "/board/boardWrite.do");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}
		
		String path = getServletContext().getRealPath("/upload/board");
		MultipartRequest mr = new MultipartRequest(request, path, (1024 * 1024 * 10), "utf-8", new BoardFileRenamed());
		
		Board b = Board.builder()
				.boardNo(Integer.parseInt(mr.getParameter("boardNo")))
				.boardCategory(Integer.parseInt(mr.getParameter("category")))
				.boardTitle(mr.getParameter("boardTitle"))
				.boardContent(mr.getParameter("boardContent"))
				.build();
		
		int result = new BoardService().updateBoard(b);
		
		String msg = "";
		String loc = "";
		if(result > 0) {
			msg = "게시글 수정 완료";
			loc = "/board/boardView.do";
		}else {
			msg = "게시물 수정 실패";
			loc = "/board/boardUpdate.do";
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
