package com.boong.board.model.service;

import static com.boong.common.JDBCTemplate.close;
import static com.boong.common.JDBCTemplate.commit;
import static com.boong.common.JDBCTemplate.getConnection;
import static com.boong.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.boong.board.model.dao.BoardDao;
import com.boong.board.model.vo.Board;
import com.boong.board.model.vo.BoardComment;
import com.boong.board.model.vo.BoardLike;

public class BoardService {

	BoardDao dao = new BoardDao();
	
	// board 테이블 전체 데이터를 가져오는 서비스
	public List<Board> selectBoardList(int cPage, int numPerpage){
		Connection conn = getConnection();
		List<Board> list = dao.selectBoard(conn, cPage, numPerpage);
		close(conn);
		return list;
	}
	
	// BOARD테이블 전체 데이터 개수가 몇개인지 확인하는 서비스
	public int selectBoardCount() {
		Connection conn = getConnection();
		int totalData = dao.selectBoardCount(conn);
		close(conn);
		return totalData;
	}
	
	// BOARD테이블에 게시글 등록하는 서비스
	public int insertBoard(Board b) {
		Connection conn = getConnection();
		int result = dao.insertBoard(conn, b);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	// BOARD테이블에서 board_no가 일치하는 데이터를 가져오는 서비스
	public Board selectBoard(int boardNo, boolean isRead) {
		Connection conn = getConnection();
		Board b = dao.selectBoard(conn, boardNo);
		if(b != null && !isRead) {
			int result = dao.updateBoardReadCount(conn, boardNo);
			if(result > 0) {
				commit(conn);
			}else {
				rollback(conn);
			}
		}
		close(conn);
		return b;
	}
	
	// BOARD테이블에 board_no가 일치하는 데이터를 찾아 update 해주는 서비스
	public int updateBoard(Board b) {
		Connection conn = getConnection();
		int result = dao.updateBoard(conn, b);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	// BOARD 테이블에 board_no가 일치하는 데이터를 찾아 삭제하는 서비스
	public int deleteBoard(Board b) {
		Connection conn = getConnection();
		int result = dao.deleteBoard(conn, b);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	// 게시글 추천수 올려주는 서비스
	public int updateBoardLike(Board b) {
		Connection conn = getConnection();
		int result = dao.updateBoardLike(conn, b);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	// BOARD_LIKE 테이블에 게시글번호와 추천 누른 유저 아이디 저장
	public int insertBoardLikeMember(BoardLike bl) {
		Connection conn = getConnection();
		int result = dao.insertBoardLikeMember(conn, bl);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int getCategoryCount(Board b) {
		Connection conn = getConnection();
		int result = dao.getCategoryCount(conn, b);
		close(conn);
		return result;
	}
	
	public List<Board> selectBoardCategoryList(int cPage, int numPerpage, Board b){
		Connection conn = getConnection();
		List<Board> list = dao.selectBoardCategoryList(conn, cPage, numPerpage, b);
		close(conn);
		return list;
	}
	
	// 게시글 댓글 전체 목록을 가져오는 서비스
	public List<BoardComment> selectCommentList(int boardNo){
		Connection conn = getConnection();
		List<BoardComment> list = dao.selectCommentList(conn, boardNo);
		close(conn);
		return list;
	}
	
	// 게시글 댓글 등록 서비스
	public int insertBoardComment(BoardComment bc) {
		Connection conn = getConnection();
		int result = dao.insertBoardComment(conn, bc);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	// 게시글 댓글 전체 개수를 가져오는 서비스
	public int countBoardComment(BoardComment bc) {
		Connection conn = getConnection();
		int total = dao.countBoardComment(conn, bc);
		close(conn);
		return total;
	}
	
	// 댓글 삭제하는 서비스
	public int deleteComment(int boardCommentNo) {
		Connection conn = getConnection();
		int result = dao.deleteComment(conn, boardCommentNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	// 제목, 작성자, 내용으로 검색할 때
	public List<Board> searchBoard(int cPage, int numPerpage, String searchType, String keyword){
		Connection conn = getConnection();
		List<Board> result = dao.searchBoard(conn,cPage,numPerpage, searchType, keyword);
		close(conn);
		return result;
	}
	
	// 게시글 검색 시 개수 가져오기
	public int searchBoardCount(String searchType, String keyword) {
		Connection conn = getConnection();
		int result = dao.searchBoardCount(conn,searchType, keyword);
		close(conn);
		return result;
	}
}




















