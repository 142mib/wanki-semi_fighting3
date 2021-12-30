package com.boong.member.model.dao;

import static com.boong.common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.boong.board.model.vo.Board;
import com.boong.member.model.vo.Member;
import com.boong.shop.model.vo.Order;
import com.boong.shop.model.vo.OrderProduct;

public class MemberDao {
	
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
	
	public int checkIdDuplicate(Connection conn, String memberId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		String sql="SELECT * FROM MEMBER WHERE MEMBER_ID=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,memberId);
			rs=pstmt.executeQuery();
			if(rs.next()||memberId.equals("")) {
				result=0;
			}else {
				result=1;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	public int insertMember(Connection conn, Member m) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql="INSERT INTO MEMBER VALUES(?,?,?,?,?,?,?,?,SYSDATE)";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, m.getMemberId());
			pstmt.setString(2, m.getMemberPw());
			pstmt.setString(3, m.getMemberName());
			pstmt.setString(4, m.getGender());
			pstmt.setString(5, m.getEmail());
			pstmt.setString(6, m.getPhone());
			pstmt.setString(7, m.getAddress());
			pstmt.setString(8, m.getCar());
			
			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
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
	
	public int editMember(Connection conn, Member m) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql="UPDATE MEMBER SET MEMBER_NAME=?, GENDER=?, EMAIL=?, PHONE=?, ADDRESS=?, CAR=? WHERE MEMBER_ID=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, m.getMemberName());
			pstmt.setString(2, m.getGender());
			pstmt.setString(3, m.getEmail());
			pstmt.setString(4, m.getPhone());
			pstmt.setString(5, m.getAddress());
			pstmt.setString(6, m.getCar());
			pstmt.setString(7, m.getMemberId());
			
			result=pstmt.executeUpdate();
					
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int changePassword(Connection conn, String memberId, String newMemberPw) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql="UPDATE MEMBER SET MEMBER_PW=? WHERE MEMBER_ID=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, newMemberPw);
			pstmt.setString(2, memberId);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public Member findId(Connection conn, String memberName, String email) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Member m=null;
		String sql="SELECT * FROM MEMBER WHERE MEMBER_NAME=? AND EMAIL=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, memberName);
			pstmt.setString(2, email);
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
	
	public Member findPw(Connection conn, String memberId, String memberName, String email) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Member m=null;
		String sql="SELECT * FROM MEMBER WHERE MEMBER_ID=? AND MEMBER_NAME=? AND EMAIL=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			pstmt.setString(2, memberName);
			pstmt.setString(3, email);
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
	
	
	public List<Board> viewBoardList(Connection conn, String memberId, int cPage, int numPerPage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Board> mList=new ArrayList();
		String sql="SELECT * FROM(SELECT ROWNUM AS RNUM, B.* FROM(SELECT * FROM(SELECT * FROM BOARD WHERE BOARD_WRITER=?)BOARD ORDER BY BOARD_DATE DESC) B) WHERE RNUM BETWEEN ? AND ?";
		try {
			pstmt=conn.prepareStatement(sql);			
			pstmt.setString(1, memberId);
			pstmt.setInt(2, (cPage-1)*numPerPage+1);
			pstmt.setInt(3, cPage*numPerPage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Board b = Board.builder()
						.boardCategory(rs.getInt("BOARD_CATEGORY"))
						.boardTitle(rs.getString("BOARD_TITLE"))
						.boardWriter(rs.getString("BOARD_TITLE"))
						.boardDate(rs.getDate("BOARD_DATE"))
						.boardViewCount(rs.getInt("BOARD_VIEW_COUNT"))
						.boardLike(rs.getInt("BOARD_LIKE"))
						.build();
					mList.add(b);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return mList;
		
	}
	
	
	public int selectCountAllBoard(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		String sql="SELECT COUNT(*) FROM BOARD";
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
	
	public List<OrderProduct> viewOrderList(Connection conn, String memberId, int cPage, int numPerPage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<OrderProduct> opList=new ArrayList();
		String sql="SELECT * FROM(SELECT ROWNUM AS RNUM, O.* FROM(SELECT * FROM(SELECT * FROM SHOP_ORDER JOIN SHOP_ORDER_PRODUCT USING (SHOP_ORDER_ID) WHERE MEMBER_ID=?)SHOP_ORDER ORDER BY SHOP_ORDER_DATE DESC) O) WHERE RNUM BETWEEN ? AND ?";
		try {
			pstmt=conn.prepareStatement(sql);			
			pstmt.setString(1, memberId);
			pstmt.setInt(2, (cPage-1)*numPerPage+1);
			pstmt.setInt(3, cPage*numPerPage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
//				Order o = Order.builder()
//						.orderId(rs.getInt("SHOP_ORDER_ID"))
//						.orderReceiver(rs.getString("SHOP_ORDER_RECEIVER"))
//						.orderReceiverAdd(rs.getString("SHOP_ORDER_RECEIVERADD"))
//						.orderRequest(rs.getString("SHOP_ORDER_REQUEST"))
//						.orderPrice(rs.getInt("SHOP_ORDER_PRICE"))
//						.orderDate(rs.getDate("SHOP_ORDER_DATE"))
//						.orderStatus(rs.getInt("SHOP_ORDER_STATUS"))
//						.shopProductId(rs.getInt("SHOP_PRODUCT_ID"))
//						.build();
//					oList.add(o);
				OrderProduct op=OrderProduct.builder()
						.shopProductId(rs.getInt("SHOP_PRODUCT_ID"))
						.orderId(rs.getInt("SHOP_ORDER_ID"))
						.orderProductNumber(rs.getInt("ORDER_PRODUCT_NUMBER"))
						.orderProductStatus(rs.getInt("ORDER_PRODUCT_STATUS"))
						.build();
				opList.add(op);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return opList;
		
	}
	
	
	public int selectCountAllOrder(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		String sql="SELECT COUNT(*) FROM SHOP_ORDER";
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
	
	
	
	
	
}
