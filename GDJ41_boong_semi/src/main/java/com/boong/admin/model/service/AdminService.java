package com.boong.admin.model.service;

import static com.boong.common.JDBCTemplate.close;
import static com.boong.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.boong.admin.model.dao.AdminDao;
import com.boong.board.model.vo.Board;
import com.boong.member.model.vo.Member;

public class AdminService {
	
	private AdminDao dao = new AdminDao();
	
	public List<Member> viewMemberList(int cPage, int numPerPage){
		Connection conn=getConnection();
		List<Member> mList=dao.viewMemberList(conn, cPage, numPerPage);
		close(conn);
		return mList;
		
	}
	
	public int selectCountAllMember() {
		Connection conn=getConnection();
		int result=dao.selectCountAllMember(conn);
		close(conn);
		return result;
		
	}
	
	public List<Member> searchMember(int cPage, int numPerpage, String searchType, String keyword){
		Connection conn=getConnection();
		List<Member> mList=dao.searchMember(conn, cPage, numPerpage, searchType, keyword);
		close(conn);
		return mList;
	}
	public int searchMemberCount(String searchType, String keyword) {
		Connection conn=getConnection();
		int result=dao.searchMemberCount(conn,searchType,keyword);
		close(conn);
		return result;
		
	}
	
	public Member selectMember(String memberId) {
		Connection conn=getConnection();
		Member m=dao.selectMember(conn,memberId);
		close(conn);
		return m;
	}

	
	public List<Board> viewBoardList(String memberId, int cPage, int numPerPage){
		Connection conn=getConnection();
		List<Board> bList=dao.viewBoardList(conn, memberId, cPage, numPerPage);
		close(conn);
		return bList;
		
	}
	
	public int selectCountAllBoard() {
		Connection conn=getConnection();
		int result=dao.selectCountAllBoard(conn);
		close(conn);
		return result;
		
	}
	
	
}
