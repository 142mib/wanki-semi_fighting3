package com.boong.board.model.dao;

import static com.boong.common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.boong.board.model.vo.Board;
import com.boong.board.model.vo.BoardLike;

public class BoardDao {
	
	public BoardDao() {
		// TODO Auto-generated constructor stub
	}
	
	// BOARD테이블 전체 데이터를 가져오는 메소드
	public List<Board> selectBoard(Connection conn, int cPage, int numPerpage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Board>	list = new ArrayList();
		String sql = "select * from(select rownum as rnum, b.* from(select * from board order by board_date desc) b) where rnum between ? and ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage-1) * numPerpage + 1);
			pstmt.setInt(2, numPerpage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Board b = Board.builder()
						.boardNo(rs.getInt("board_no"))
						.boardTitle(rs.getString("board_title"))
						.boardContent(rs.getString("board_content"))
						.boardDate(rs.getDate("board_date"))
						.boardViewCount(rs.getInt("board_view_count"))
						.boardLike(rs.getInt("board_like"))
						.boardCategory(rs.getInt("board_category"))
						.boardOriginalFilename(rs.getString("board_original_filename"))
						.boardRenamedFilename(rs.getString("board_renamed_filename"))
						.boardWriter(rs.getString("board_writer"))
						.build();
				list.add(b);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	// BOARD테이블 전체 데이터 개수를 반환하는 메소드
	public int selectBoardCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int totalData = 0;
		String sql = "select count(*) from board";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				totalData = rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return totalData;
	}
	
	// BOARD테이블에 게시글 insert하는 메소드
	public int insertBoard(Connection conn, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "insert into board values(BOARD_SEQ.NEXTVAL, ?, ?, SYSDATE, ?, ?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, b.getBoardTitle());
			pstmt.setString(2, b.getBoardContent());
			pstmt.setInt(3, b.getBoardViewCount());
			pstmt.setInt(4, b.getBoardLike());
			pstmt.setInt(5, b.getBoardCategory());
			pstmt.setString(6, b.getBoardOriginalFilename());
			pstmt.setString(7, b.getBoardRenamedFilename());
			pstmt.setString(8, b.getBoardWriter());
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	// BOARD테이블에서 board_no가 일치하는 데이터를 가져오는 기능
	public Board selectBoard(Connection conn, int boardNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Board b = null;
		String sql = "select * from board where board_no=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				b = Board.builder()
						.boardNo(rs.getInt("board_no"))
						.boardTitle(rs.getString("board_title"))
						.boardContent(rs.getString("board_content"))
						.boardDate(rs.getDate("board_date"))
						.boardViewCount(rs.getInt("board_view_count"))
						.boardLike(rs.getInt("board_like"))
						.boardCategory(rs.getInt("board_category"))
						.boardOriginalFilename(rs.getString("board_original_filename"))
						.boardRenamedFilename(rs.getString("board_renamed_filename"))
						.boardWriter(rs.getString("board_writer"))
						.build();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return b;
	}
	
	// BOARD테이블에서 board_ni가 일치하는 데이터의 값을 수정하는 기능
	public int updateBoard(Connection conn, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "update BOARD set BOARD_TITLE=?, BOARD_CONTETN=?, BOARD_CATEGORY=?, BOARD_ORIGINAL_FILENAME=?, BOARD_RENAMED_FILENAME=? where BOARD_NO=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, b.getBoardTitle());
			pstmt.setString(2, b.getBoardContent());
			pstmt.setInt(3, b.getBoardCategory());
			pstmt.setString(4, b.getBoardOriginalFilename());
			pstmt.setString(5, b.getBoardRenamedFilename());
			pstmt.setInt(6, b.getBoardNo());
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	// BOARD테이블에서 board_no가 일치하는 데이터 를 삭제한느 기능
	public int deleteBoard(Connection conn, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "delete from BOARD where board_no=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b.getBoardNo());
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	// 조회수 올리는 기능
	public int updateBoardReadCount(Connection conn,int boardNo) {
		PreparedStatement pstmt=null;
		int result= 0 ;
		String sql="UPDATE BOARD SET BOARD_VIEW_COUNT=BOARD_VIEW_COUNT+1 WHERE BOARD_NO=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			result=pstmt.executeUpdate();			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	// 추천수 올리는 기능
	public int updateBoardLike(Connection conn, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "update BOARD set BOARD_LIKE=BOARD_LIKE+1  where BOARD_NO=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b.getBoardNo());
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	// BOARD_LIKE 테이블에 게시글번호와 추천 누른 유저 아이디 저장
	public int insertBoardLikeMember(Connection conn, BoardLike bl) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "insert into BOARD_LIKE values(?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bl.getBoardLikeRef());
			pstmt.setString(2, bl.getBoardLikeMember());
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

}

















