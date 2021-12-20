package com.boong.member.dao;

import static com.boong.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.boong.member.vo.Member;

public class MemberDao {
	
	private Properties prop=new Properties();
	public MemberDao() {}
	
	public Member login(Connection conn, String memberId, String memberPw) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Member m=null;
		String sql="SELECT * FROM MEMBER WHERE MEMBER_ID=? AND MEMBER_PW=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			pstmt.setString(2, memberPw);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m=Member.builder()
						.memberId(rs.getString("MEMBER_ID"))
						.memberPw(rs.getString("MEMBER_PW"))
						.memberName(rs.getString("MEMBER_NAME"))
						.gender(rs.getString("GENDER"))
						.email(rs.getString("EMAIL"))
						.phone(rs.getString("PHONE"))
						.address(rs.getString("ADDRESS"))
						.carPrefer(rs.getString("CAR"))
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
	
	public Member checkIdDuplicate(Connection conn, String memberId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Member m=null;
		String sql=prop.getProperty("selectId");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,memberId);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m=Member.builder()
						.memberId(rs.getString("MEMBER_ID"))
						.memberName(rs.getString("MEMBER_NAME"))
						.gender(rs.getString("GENDER"))
						.email(rs.getString("EMAIL"))
						.phone(rs.getString("PHONE"))
						.address(rs.getString("ADDRESS"))
						.carPrefer(rs.getString("CAR"))
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
	
}
