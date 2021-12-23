package com.boong.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boong.board.model.service.BoardService;
import com.boong.board.model.vo.Board;
import com.google.gson.Gson;

/**
 * Servlet implementation class BoardListAjaxServlet
 */
@WebServlet("/board/boardListAjax.do")
public class BoardListAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardListAjaxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int tabNo = Integer.parseInt(request.getParameter("tabNo"));
//		System.out.println(tabNo);
		
		// 페이징 처리 //
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
		
		Board b = Board.builder()
				.boardCategory(Integer.parseInt(request.getParameter("tabNo")))
				.build();
		
		// 카테고리별 글 전체 개수와 데이터를 가져온다.
		List<Board> list = new ArrayList();
		int totalData = 0;
		if(tabNo == 0) {
			list = new BoardService().selectBoardList(cPage, numPerpage);
			totalData = new BoardService().selectBoardCount();
		}else {
			list = new BoardService().selectBoardCategoryList(cPage, numPerpage, b);
			totalData = new BoardService().getCategoryCount(b);
		}
		int totalPage = (int)Math.ceil((double)totalData / numPerpage);
		int pageBarSize = 10;
		int pageNo = ((cPage -1) / pageBarSize) * pageBarSize + 1;
		int pageEnd = pageNo + pageBarSize - 1;
		
//		System.out.println(list);
		
		String pageBar = "";
		if(pageNo == 1) {
			pageBar += "<span>[이전]</span>";
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
			pageBar += "<span>[다음]</span>";
		}else {
			pageBar += "<a href='" + request.getRequestURI() + "cPage=" + (pageNo) + ">[다음]</a>";
		}
		
//		System.out.println(list);
		response.setContentType("application/json;charset=utf-8");
		new Gson().toJson(list, response.getWriter());

		
		// 화면 전환
//		request.getRequestDispatcher("/views/board/boardList.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
