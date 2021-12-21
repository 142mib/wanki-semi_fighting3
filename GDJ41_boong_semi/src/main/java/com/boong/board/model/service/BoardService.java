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
	public List<Board> selectBoard(int cPage, int numPerpage){
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
}
