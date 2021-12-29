package com.boong.board.model.dao;

import static com.boong.common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.boong.board.model.vo.Board;
import com.boong.board.model.vo.BoardComment;
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
		String sql = "update BOARD set BOARD_TITLE=?, BOARD_CONTENT=?, BOARD_CATEGORY=?, BOARD_ORIGINAL_FILENAME=?, BOARD_RENAMED_FILENAME=? where BOARD_NO=?";
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
	
	// 카테고리 별 글 개수를 알려주는 기능
	public int getCategoryCount(Connection conn, Board b) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int totalData = 0;
		String sql = "select count(*) from board where BOARD_CATEGORY=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b.getBoardCategory());
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
	
	// 카테고리 별 글의 데이터를 가져오는 기능
	public List<Board> selectBoardCategoryList(Connection conn, int cPage, int numPerpage, Board b) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Board> list = new ArrayList();
		String sql = "select * from(select rownum as rnum, b.* from(select * from(select * from board where board_category=?)board order by board_date desc) b) where rnum between ? and ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b.getBoardCategory());
			pstmt.setInt(2, (cPage-1) * numPerpage + 1);
			pstmt.setInt(3, numPerpage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Board tab = Board.builder()
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
				list.add(tab);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	
	// 게시글 댓글 전체 목록을 가져오는 서비스
	public List<BoardComment> selectCommentList(Connection conn, int boardNo){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<BoardComment> list = new ArrayList();
		String sql = "select * from BOARD_COMMENT where BOARD_REF=? start with BOARD_COMMENT_LEVEL=1 connect by prior BOARD_COMMENT_NO=BOARD_COMMENT_REF";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardComment bc = BoardComment.builder()
						.boardCommentNo(rs.getInt("board_comment_no"))
						.boardRef(rs.getInt("board_ref"))
						.boardCommentWriter(rs.getString("board_comment_writer"))
						.boardCommentContent(rs.getString("board_comment_content"))
						.boardCommentDate(rs.getDate("board_comment_date"))
						.boardCommentLevel(rs.getInt("board_comment_level"))
						.boardCommentRef(rs.getInt("board_comment_ref"))
						.build();
				list.add(bc);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	// 게시글 등록 서비스
	public int insertBoardComment(Connection conn, BoardComment bc) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "insert into BOARD_COMMENT values(board_comment_seq.nextval, ?, ?, ?, sysdate, ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bc.getBoardRef());
			pstmt.setString(2, bc.getBoardCommentWriter());
			pstmt.setString(3, bc.getBoardCommentContent());
			pstmt.setInt(4, bc.getBoardCommentLevel());
			pstmt.setInt(5, bc.getBoardCommentRef());
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	// 게시글 댓글 전체 개수 가져오기
	public int countBoardComment(Connection conn, BoardComment bc) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int total = 0;
		String sql = "select count(*) from BOARD_COMMENT where BOARD_REF=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bc.getBoardRef());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				total = rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return total;
	}
	
	// 댓글 삭제
	public int deleteComment(Connection conn, int boardComment) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "delete from BOARD_COMMENT where BOARD_COMMENT_NO=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardComment);
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	// 제목, 작성자, 내용으로 게시글 검색
	public List<Board> searchBoard(Connection conn, int cPage, int numPerpage, String searchType, String keyword){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Board> list = new ArrayList();
		String sql = "select * from (select rownum as rnum, B.* from (select * from BOARD where #COL like ?) B) where rnum between ? and ?";
		sql = sql.replace("#COL", searchType);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,"%"+keyword+"%");
			pstmt.setInt(2,(cPage-1)*numPerpage+1);
			pstmt.setInt(3, cPage*numPerpage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Board m = Board.builder()
						.boardNo(rs.getInt("board_no"))
						.boardTitle(rs.getString("board_title"))
						.boardContent(rs.getString("board_content"))
						.boardDate(rs.getDate("board_date"))
						.boardViewCount(rs.getInt("board_view_count"))
						.boardLike(rs.getInt("board_like"))
						.boardCategory(rs.getInt("board_category"))
						.boardWriter(rs.getString("board_writer"))
						.build();
				list.add(m);
			}			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	// 게시글 검색 시 개수 가져오기
	public int searchBoardCount(Connection conn, String searchType, String keyword) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = "select count(*) as count from BOARD where #COL like ?";
		sql = sql.replace("#COL",searchType);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+keyword+"%");
			rs = pstmt.executeQuery();
			if(rs.next()) result = rs.getInt("count");
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(conn);
		}return result;
	}
}

















