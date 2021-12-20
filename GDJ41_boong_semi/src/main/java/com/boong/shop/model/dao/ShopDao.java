package com.boong.shop.model.dao;

import static com.boong.common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.boong.board.model.vo.Board;
import com.boong.shop.model.vo.Product;
import com.boong.shop.model.vo.ProductComment;

public class ShopDao {

	public ShopDao() {
		/*
		 * try { String
		 * path=ShopDao.class.getResource("/sql/shop/shopsql.properties").getPath();
		 * Shop.load(new FileReader(path)); }catch(IOException e) { e.printStackTrace();
		 * }
		 */
	}
	
	public List<Product> selectProductList(Connection conn, int cPage, int numPerpage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Product> result=new ArrayList();
		String sql="SELECT * FROM (SELECT ROWNUM AS RNUM, P.* FROM (SELECT * FROM SHOP_PRODUCT ORDER BY SHOP_PRODUCT_DATE DESC) B ) WHERE RNUM BETWEEN ? AND ?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage-1)*numPerpage+1);
			pstmt.setInt(2, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				//추가해야함
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
		
	}
	
	public int selectProductListCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		String sql="SELECT COUNT(*) FROM SHOP_PRODUCT";
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) result=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
	}
	
	public Product selectProduct(Connection conn, int shopProductId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Product p=null;
		String sql="SELECT * FROM SHOP_PRODUCT WHERE SHOP_PRODUCT_ID=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, shopProductId);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				/*
				 * b=Board.builder() .boardNo(rs.getInt("board_no"))
				 * .boardTitle(rs.getString("board_title"))
				 * .boardWriter(rs.getString("board_writer"))
				 * .boardContent(rs.getString("board_content"))
				 * .boardOriginalFilename(rs.getString("board_original_filename"))
				 * .boardRenamedFilename(rs.getString("board_renamed_filename"))
				 * .boardDate(rs.getDate("board_date"))
				 * .boardReadCount(rs.getInt("board_readcount")) .build();
				 *///추가해야함
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return p;
	}
	
	
	
	public int insertProduct(Connection conn, Product p) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql="INSERT INTO SHOP_PRODUCT VALUES(DEFAULT,?,?,?,?,DEFAULT,DEFAULT,?,?)";
		try {
			pstmt=conn.prepareStatement(sql);
			/*
			 * pstmt.setString(1, b.getBoardTitle()); pstmt.setString(2,
			 * b.getBoardWriter()); pstmt.setString(3, b.getBoardContent());
			 * pstmt.setString(4, b.getBoardOriginalFilename()); pstmt.setString(5,
			 * b.getBoardRenamedFilename());
			 */
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}

	
	public int insertProductComment(Connection conn, ProductComment pc) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql="INSERT INTO SHOP_COMMENT VALUES(DEFAULT,?,DEFAULT,?,?,?,?)";
		try {
			pstmt=conn.prepareStatement(sql);
			/*
			 * pstmt.setInt(1, bc.getLevel()); pstmt.setString(2,
			 * bc.getBoardCommentWriter()); pstmt.setString(3, bc.getBoardCommentContent());
			 * pstmt.setInt(4, bc.getBoardRef()); //pstmt.setInt(5,
			 * bc.getBoardCommentRef()==0?null:bc.getBoardCommentRef()); pstmt.setString(5,
			 * bc.getBoardCommentRef()==0?null: String.valueOf(bc.getBoardCommentRef()));
			 *///추가해야함
			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	
	public List<ProductComment> selectProductCommentList(Connection conn,int shopProductId){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<ProductComment> list=new ArrayList();
		String sql="SELECT * FROM PRODUCT_COMMENT WHERE SHOP_COMMENT_REF=? START WITH SHOP_COMMENT_LEVEL=1 CONNECT BY PRIOR SHOP_COMMENT_ID=SHOP_COMMENT_REF";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, shopProductId);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				/*
				 * BoardComment bc=BoardComment.builder()
				 * .boardCommentNo(rs.getInt("board_comment_no"))
				 * .boardCommentContent(rs.getString("board_comment_content"))
				 * .boardCommentWriter(rs.getString("board_comment_writer"))
				 * .boardRef(rs.getInt("board_ref")) .level(rs.getInt("board_comment_level"))
				 * .boardCommentDate(rs.getDate("board_comment_date"))
				 * .boardCommentRef(rs.getInt("board_comment_ref")) .build(); list.add(bc);
				 */
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	
}
