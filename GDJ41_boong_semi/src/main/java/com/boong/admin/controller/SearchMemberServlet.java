package com.boong.admin.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boong.admin.model.service.AdminService;
import com.boong.member.model.vo.Member;

/**
 * Servlet implementation class SearchMemberServlet
 */
@WebServlet("/admin/searchmember.do")
public class SearchMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String searchType=request.getParameter("searchType");
		String keyword=request.getParameter("searchKeyword");
		
		
		//검색 결과 페이지처리
				int cPage;
				try {
					cPage=Integer.parseInt(request.getParameter("cPage"));
				}catch(NumberFormatException e) {	//페이지에 0이 들어올 수 있으니까
					cPage=1;
				}
				int numPerpage=5; //5개의 자료씩 볼 수 있게
				
				List<Member> result= new AdminService().searchMember(cPage,numPerpage,searchType,keyword);
				System.out.println(result);
				int totalData=new AdminService().searchMemberCount(searchType,keyword);
				int totalPage=(int)Math.ceil((double)totalData/numPerpage);
				int pageBarSize=5;
				int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
				int pageEnd=pageNo+pageBarSize-1;
				
				String pageBar="";
				if(pageNo==1) {
					pageBar+="<span>[이전]<span>";
				}else {
					pageBar+="<a href='"+request.getContextPath()
							+"/admin/searchMember?cPage=?"+(pageNo-1)
							+"&searchType="+searchType
							+"&searchKeyword"+keyword+"'>[이전]</a>";
				}
				while(!(pageNo>pageEnd||pageNo>totalPage)) {
					if(cPage==pageNo) {
						//페이지번호가 같으면 안눌리게
						pageBar+="<span>"+pageNo+"</span>";
					}else {
						pageBar+="<a href='"+request.getContextPath()
						+"/admin/searchMember?cPage=?"+(pageNo-1)
						+"&searchType="+searchType
						+"&searchKeyword"+keyword+"'>"
						+pageNo+"</a>";
					}
					pageNo++;
				}
				
				if(pageNo>totalPage) {
					pageBar+="<span>[다음]</span>";
				}else {
					pageBar+="<a href='"+request.getContextPath()
					+"/admin/searchMember?cPage=?"+(pageNo-1)
					+"&searchType="+searchType
					+"&searchKeyword"+keyword+"'>[다음]</a>";
				}
				request.setAttribute("pageBar", pageBar);
				
				
				request.setAttribute("mList", result);
				request.getRequestDispatcher("/views/admin/adminpage.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
