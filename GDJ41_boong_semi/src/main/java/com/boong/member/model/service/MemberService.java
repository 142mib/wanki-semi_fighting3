package com.boong.member.model.service;

import static com.boong.common.JDBCTemplate.close;
import static com.boong.common.JDBCTemplate.commit;
import static com.boong.common.JDBCTemplate.getConnection;
import static com.boong.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.boong.board.model.vo.Board;
import com.boong.member.model.dao.MemberDao;
import com.boong.member.model.vo.Member;
import com.boong.shop.model.vo.Order;

public class MemberService {
	
	private MemberDao dao=new MemberDao();
	
	public Member login(String memberId, String memberPw) {
		Connection conn=getConnection();
		Member m=dao.login(conn,memberId, memberPw);
		close(conn);
		return m;
	}
	
	public int checkIdDuplicate(String memberId) {
		Connection conn=getConnection();
		int result=dao.checkIdDuplicate(conn,memberId);
		close(conn);
		return result;
	}
	
	public int insertMember(Member m) {
		Connection conn=getConnection();
		int result=dao.insertMember(conn,m);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;	
	}
	public int deleteMember(String memberId) {
		Connection conn=getConnection();
		int result=dao.deleteMember(conn, memberId);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public int editMember(Member m) {
		Connection conn=getConnection();
		int result=dao.editMember(conn,m);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	
	
	public int changePassword(String memberId, String newMemberPw) {
		Connection conn=getConnection();
		int result=dao.changePassword(conn, memberId, newMemberPw);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public Member findId(String memberName, String email) {
		Connection conn=getConnection();
		Member m=dao.findId(conn,memberName, email);
		close(conn);
		return m;
	}
	public Member findPw(String memberId, String memberName, String email) {
		Connection conn=getConnection();
		Member m=dao.findPw(conn,memberId, memberName, email);
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
	
	//주문내역
	public List<Order> viewOrderList(String memberId, int cPage, int numPerPage){
		Connection conn=getConnection();
		List<Order> bList=dao.viewOrderList(conn, memberId, cPage, numPerPage);
		close(conn);
		return bList;
		
	}
	
	public int selectCountAllOrder() {
		Connection conn=getConnection();
		int result=dao.selectCountAllOrder(conn);
		close(conn);
		return result;
		
	}
	
	
	
	
}
