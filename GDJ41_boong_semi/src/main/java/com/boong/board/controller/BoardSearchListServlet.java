package com.boong.board.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boong.admin.model.service.AdminService;
import com.boong.board.model.service.BoardService;
import com.boong.board.model.vo.Board;

/**
 * Servlet implementation class BoardSearchListAjaxServlet
 */
@WebServlet("/board/searchBoardList.do")
public class BoardSearchListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardSearchListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//클라이언트가 보낸 검색타입(userId, userName, gender), 검색어를 받아와서
		//타입(컬럼)에 맞는 검색어가 있는지 확인하고 그 결과를 반환해주는 기능
		String searchType = request.getParameter("searchType");
		String keyword = request.getParameter("searchKeyword");


		//검색에 대한 페이지처리를 하자
		int cPage;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage = 1;
		}
		int numPerpage = 10;
		
		Map<String,Object> param=Map.of("cPage",cPage,"numPerPage",numPerpage,
				"serachType",searchType,"keyword",keyword);
		
		//List<Member> result=new AdminService().searchMember(param);
		List<Board> result = new BoardService().searchBoard(cPage, numPerpage, searchType, keyword);
		
		int totalData = new BoardService().searchBoardCount(searchType,keyword);
		int totalPage = (int)Math.ceil((double)totalData/numPerpage);
		int pageBarSize = 10;
		int pageNo = ((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd = pageNo+pageBarSize-1;
		
		String pageBar="";
		if(pageNo==1) {
			pageBar+="<span>[이전]</span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()
			+"/board/searchBoardList.do?cPage="+(pageNo-1)
			+"&searchType="+searchType
			+"&searchKeyword="+keyword+"'>[이전]</a>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar+="<span>"+pageNo+"</span>";
			}else {
				pageBar+="<a href='"+request.getContextPath()
				+"/board/searchBoardList.do?cPage="+pageNo
				+"&searchType="+searchType
				+"&searchKeyword="+keyword+"'>"
				+pageNo+"</a>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<span>[다음]</span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()
			+"/board/searchBoardList.do?cPage="+pageNo
			+"&searchType="+searchType
			+"&searchKeyword="+keyword+"'>[다음]</a>";
		}
		request.setAttribute("pageBar",pageBar);
		
		//저장하기
		request.setAttribute("boardSearchList", result);
		
		//출력할 화면선택
		//리스트출력하는 화면을 공용으로 사용~
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
