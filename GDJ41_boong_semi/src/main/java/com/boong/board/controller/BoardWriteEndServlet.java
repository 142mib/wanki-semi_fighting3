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
 * Servlet implementation class BoardInsertServlet
 */
@WebServlet("/board/boardWriteEnd.do")
public class BoardWriteEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardWriteEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 파일 업로드처리
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "잘못된 요청입니다.");
			request.setAttribute("loc", "/board/boardWrite.do");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}
		
		String path = getServletContext().getRealPath("/assets/img/board/upload");
//		System.out.println(path);
		MultipartRequest mr = new MultipartRequest(request, path, (1024 * 1024 * 10), "utf-8", new BoardFileRenamed());
		
		// 사용자가 입력한 내용 받아서 Board 객체를 만듦
		Board b = Board.builder()
				.boardTitle(mr.getParameter("boardTitle"))
				.boardContent(mr.getParameter("boardContent"))
				.boardWriter(mr.getParameter("boardWriter"))
				.boardCategory(Integer.parseInt(mr.getParameter("category")))
				.boardOriginalFilename(mr.getOriginalFileName("upfile"))
				.boardRenamedFilename(mr.getFilesystemName("upfile"))
				.build();
		
		int result = new BoardService().insertBoard(b);
		
		String msg = "";
		String loc = "";
		if(result > 0) {
			msg = "게시글 등록 완료";
			loc = "/board/boardList.do";
		}else {
			msg = "게시물 등록 실패";
			loc = "/board/boardWrite.do";
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
