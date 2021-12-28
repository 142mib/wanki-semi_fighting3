package com.boong.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boong.board.model.service.BoardService;
import com.boong.board.model.vo.Board;

/**
 * Servlet implementation class BoardListServlet
 */
@WebServlet("/board/boardList.do")
public class BoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// main 화면에서 게시판 목록(전체 카테고리)을 보여주는 화면으로 전환하는 Servlet
		
		// 페이징 처리
		int cPage; // 현재페이지
		int numPerpage; // 한 페이지에 보여줄 게시글 개수
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage = 1;
		}
		try {
			numPerpage = Integer.parseInt(request.getParameter("numPerpage"));
		}catch(NumberFormatException e) {
			numPerpage = 20;
		}
		
		// DB의 board테이블에서 전체 글 정보를 가져와야함
		List<Board>	list = new BoardService().selectBoardList(cPage, numPerpage);
		
		// 페이징 처리 2
		// 테이블의 데이터 전체 개수를 가져옴
		int totalData = new BoardService().selectBoardCount();
		int totalPage = (int)Math.ceil((double)totalData / numPerpage);
		int pageBarSize = 10;
		int pageNo = ((cPage - 1) / pageBarSize) * pageBarSize + 1; // 시작 페이지 번호 설정
		int pageEnd = pageNo + pageBarSize - 1; // 끝 페이지 번호 설정
		
		// 페이징 처리 3
		// 페이지 바 생성
		String pageBar = "";
		if(pageNo == 1) {
			pageBar += "<span>&nbsp;[이전]&nbsp;</span>";
		}else {
			pageBar += "<a href='" + request.getRequestURI() + "cPage=" + (pageNo - 1) + ">[이전]</a>";
		}
		
		while(!(pageNo > pageEnd || pageNo > totalPage)) {
			if(cPage == pageNo) {
				pageBar += "<span>" + pageNo + "</span>";
			}else {
				pageBar += "<a href='" + request.getRequestURL() + "?cPage=" + (pageNo) + "'>" + pageNo + "</a>";
			}
			pageNo++;
		}
		
		if(pageNo > totalPage) {
			pageBar += "<span>  [다음]  </span>";
		}else {
			pageBar += "<a href='" + request.getRequestURI() + "cPage=" + (pageNo) + ">[다음]</a>";
		}
		
		
		request.setAttribute("boardList", list);
		request.setAttribute("pageBar", pageBar);
		
		
		// 화면 전환
		request.getRequestDispatcher("/views/board/boardList.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
