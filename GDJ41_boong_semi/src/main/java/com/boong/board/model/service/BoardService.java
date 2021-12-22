package com.boong.board.model.service;

import java.sql.Connection;
import java.util.List;

import com.boong.board.model.dao.BoardDao;
import com.boong.board.model.vo.Board;

import static com.boong.common.JDBCTemplate.getConnection;
import static com.boong.common.JDBCTemplate.close;
import static com.boong.common.JDBCTemplate.commit;
import static com.boong.common.JDBCTemplate.rollback;

public class BoardService {

	BoardDao dao = new BoardDao();
	
	// board 테이블 전체 데이터를 가져오는 서비스
	public List<Board> selectBoardList(int cPage, int numPerpage){
		Connection conn = getConnection();
		List<Board> list = dao.selectBoard(conn, cPage, numPerpage);
		close(conn);
		return list;
	}
	
	// BOARD테이블 데이터 개수가 몇개인지 확인하는 서비스
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
	public Board selectBoard(int boardNo) {
		Connection conn = getConnection();
		Board b = dao.selectBoard(conn, boardNo);
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
			close(conn);
		}
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
		return result;
	}
}




















