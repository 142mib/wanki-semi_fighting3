package com.boong.admin.model.service;

import static com.boong.common.JDBCTemplate.close;
import static com.boong.common.JDBCTemplate.commit;
import static com.boong.common.JDBCTemplate.getConnection;
import static com.boong.common.JDBCTemplate.rollback;

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

	

	public int deleteMember(String memberId) {
		Connection conn=getConnection();
		int result=dao.deleteMember(conn, memberId);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	
}
