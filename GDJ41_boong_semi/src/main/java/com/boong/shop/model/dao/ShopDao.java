package com.boong.shop.model.dao;

import static com.boong.common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
		String sql="SELECT * FROM (SELECT ROWNUM AS RNUM, P.* FROM (SELECT * FROM SHOP_PRODUCT ORDER BY SHOP_PRODUCT_DATE ASC) P ) WHERE RNUM BETWEEN ? AND ?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage-1)*numPerpage+1);
			pstmt.setInt(2, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Product p=Product.builder()
						.shopProductId(rs.getInt("shop_product_id"))
						.shopProductName(rs.getString("shop_product_name"))
						.shopProductPrice(rs.getInt("shop_product_price"))
						.shopProductContent(rs.getString("shop_product_content"))
						.shopProductStock(rs.getInt("shop_product_stock"))
						.shopProductDate(rs.getDate("shop_product_date"))
						.shopProductSales(rs.getInt("shop_product_sales"))
						.shopProductImage(rs.getString("shop_product_image"))
						.shopProductImageRename(rs.getString("shop_product_imagerename"))
						.build();
				result.add(p);
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
				p=Product.builder()
						.shopProductId(rs.getInt("shop_product_id"))
						.shopProductName(rs.getString("shop_product_name"))
						.shopProductPrice(rs.getInt("shop_product_price"))
						.shopProductContent(rs.getString("shop_product_content"))
						.shopProductStock(rs.getInt("shop_product_stock"))
						.shopProductDate(rs.getDate("shop_product_date"))
						.shopProductSales(rs.getInt("shop_product_sales"))
						.shopProductImage(rs.getString("shop_product_image"))
						.shopProductImageRename(rs.getString("shop_product_imagerename"))
						.build();
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
			//default
			pstmt.setString(1, p.getShopProductName());
			pstmt.setInt(2, p.getShopProductPrice());
			pstmt.setString(3, p.getShopProductContent());
			pstmt.setInt(4, p.getShopProductStock());
			//default
			//default
			pstmt.setString(5, p.getShopProductImage());
			pstmt.setString(6, p.getShopProductImageRename());
			
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
			pstmt.setString(1, pc.getShopCommentContent());
			pstmt.setInt(2, pc.getShopCommentLevel());
			pstmt.setInt(3, pc.getShopCommentRef());
			pstmt.setString(4, pc.getMemberId());
			pstmt.setInt(5,pc.getShopProductId());
			
			
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
		String sql="SELECT * FROM SHOP_COMMENT WHERE SHOP_PRODUCT_ID=? START WITH SHOP_COMMENT_LEVEL=1 CONNECT BY PRIOR SHOP_COMMENT_ID=SHOP_COMMENT_REF";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, shopProductId);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				ProductComment pc=ProductComment.builder()
							.shopCommentId(rs.getInt("shop_comment_id"))
							.shopCommentContent(rs.getString("shop_comment_content"))
							.shopCommentDate(rs.getDate("shop_comment_date"))
							.shopCommentLevel(rs.getInt("shop_comment_level"))
							.shopCommentRef(rs.getInt("shop_comment_ref"))
							.memberId(rs.getString("member_id"))
							.shopProductId(rs.getInt("shop_product_id"))
							.build();
				
				list.add(pc);
				
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}

	public int updateProduct(Connection conn, Product p) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql="UPDATE SHOP_PRODUCT SET SHOP_PRODUCT_NAME=?,SHOP_PRODUCT_PRICE=?,SHOP_PRODUCT_CONTENT=?,SHOP_PRODUCT_STOCK=?,SHOP_PRODUCT_IMAGE=?,SHOP_PRODUCT_IMAGERENAME=? WHERE SHOP_PRODUCT_ID=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, p.getShopProductName());
			pstmt.setInt(2, p.getShopProductPrice());
			pstmt.setString(3, p.getShopProductContent());
			pstmt.setInt(4, p.getShopProductStock());
			pstmt.setString(5, p.getShopProductImage());
			pstmt.setString(6, p.getShopProductImageRename());
			pstmt.setInt(7, p.getShopProductId());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	
}
