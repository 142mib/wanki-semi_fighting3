package com.boong.member.service;

import static com.boong.common.JDBCTemplate.close;
import static com.boong.common.JDBCTemplate.getConnection;
import static com.boong.common.JDBCTemplate.commit;
import static com.boong.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.boong.member.dao.MemberDao;
import com.boong.member.vo.Member;

public class MemberService {
	
	private MemberDao dao=new MemberDao();
	
	public Member login(String memberId, String memberPw) {
		Connection conn=getConnection();
		Member m=dao.login(conn,memberId, memberPw);
		close(conn);
		return m;
	}
	
	public Member checkIdDuplicate(String memberId) {
		Connection conn=getConnection();
		Member m=dao.checkIdDuplicate(conn,memberId);
		close(conn);
		return m;
	}
	
	public int insertMember(Member m) {
		Connection conn=getConnection();
		int result=dao.insertMember(conn,m);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		
		return result;	
	}
	
}
