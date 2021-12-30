package com.boong.admin.model.dao;

import static com.boong.common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.boong.board.model.vo.Board;
import com.boong.member.model.vo.Member;


public class AdminDao {
	public AdminDao() {}

	public List<Member> viewMemberList(Connection conn, int cPage, int numPerPage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Member> mList=new ArrayList();
		String sql="SELECT * FROM (SELECT ROWNUM AS RNUM, M.* FROM(SELECT * FROM MEMBER) M) WHERE RNUM BETWEEN ? AND ?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Member m = Member.builder()
						.memberId(rs.getString("MEMBER_ID"))
						.memberName(rs.getString("MEMBER_NAME"))
						.gender(rs.getString("GENDER"))
						.email(rs.getString("EMAIL"))
						.phone(rs.getString("PHONE"))
						.address(rs.getString("ADDRESS"))
						.car(rs.getString("CAR"))
						.enrollDate(rs.getDate("ENROLLDATE"))
						.build();
				mList.add(m);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return mList;
		
	}
	
	
	public int selectCountAllMember(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		String sql="SELECT COUNT(*) FROM MEMBER";
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result=rs.getInt(1);	
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	
	public List<Member> searchMember(Connection conn, int cPage, int numPerpage, String searchType, String keyword){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Member> mList=new ArrayList();
		String sql="SELECT * FROM (SELECT ROWNUM AS RNUM, M. * FROM(SELECT * FROM MEMBER WHERE #COL LIKE ?) M) WHERE RNUM BETWEEN ? AND ?";
		
		sql=sql.replace("#COL", searchType);
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, "%"+keyword+"%");
			pstmt.setInt(2, (cPage-1)*numPerpage+1);
			pstmt.setInt(3, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Member m = Member.builder()
						.memberId(rs.getString("MEMBER_ID"))
						.memberName(rs.getString("MEMBER_NAME"))
						.gender(rs.getString("GENDER"))
						.email(rs.getString("EMAIL"))
						.phone(rs.getString("PHONE"))
						.address(rs.getString("ADDRESS"))
						.car(rs.getString("CAR"))
						.enrollDate(rs.getDate("ENROLLDATE"))
						.build();
				mList.add(m);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return mList;
	}
	
	public int searchMemberCount(Connection conn, String searchType, String keyword) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		String sql="SELECT COUNT(*) AS COUNT FROM MEMBER WHERE #COL LIKE ?";
		sql=sql.replace("#COL", searchType);
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,"%"+keyword+"%");
			rs=pstmt.executeQuery();
			if(rs.next()) result=rs.getInt("count");
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(conn);
		}
		return result;
		
	}
	
	public Member selectMember(Connection conn, String memberId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Member m=null;
		String sql="SELECT * FROM MEMBER WHERE MEMBER_ID=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m=Member.builder()
						.memberId(rs.getString("MEMBER_ID"))
						.memberName(rs.getString("MEMBER_NAME"))
						.gender(rs.getString("GENDER"))
						.email(rs.getString("EMAIL"))
						.phone(rs.getString("PHONE"))
						.address(rs.getString("ADDRESS"))
						.car(rs.getString("CAR"))
						.enrollDate(rs.getDate("ENROLLDATE"))
						.build();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return m;
	}
	
	

	
	
	public int deleteMember(Connection conn, String memberId) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql="DELETE FROM MEMBER WHERE MEMBER_ID=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	
}
