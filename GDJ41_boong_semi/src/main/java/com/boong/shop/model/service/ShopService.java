package com.boong.shop.model.service;

import static com.boong.common.JDBCTemplate.close;
import static com.boong.common.JDBCTemplate.commit;
import static com.boong.common.JDBCTemplate.getConnection;
import static com.boong.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.boong.member.model.vo.Member;
import com.boong.shop.model.dao.ShopDao;
import com.boong.shop.model.vo.Basket;
import com.boong.shop.model.vo.Order;
import com.boong.shop.model.vo.OrderProduct;
import com.boong.shop.model.vo.Product;
import com.boong.shop.model.vo.ProductComment;

public class ShopService {
	private ShopDao dao=new ShopDao();
	
	public List<Product> selectProductList(int cPage, int numPerpage){
		Connection conn=getConnection();
		List<Product> result=dao.selectProductList(conn,cPage,numPerpage);
		close(conn);
		return result;
	}
	public int selectProductListCount() {
		Connection conn=getConnection();
		int result=dao.selectProductListCount(conn);
		close(conn);
		return result;
	}	
	public Product selectProduct(int shopProductId) {
		Connection conn=getConnection();
		//조회수증가로직을 추가
		Product p=dao.selectProduct(conn, shopProductId);		
		close(conn);
		return p;
	}	
	public int insertProduct(Product p) {
		Connection conn=getConnection();
		int result=dao.insertProduct(conn,p);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}	
	public int insertBoardComment(ProductComment pc) {
		Connection conn=getConnection();
		int result=dao.insertProductComment(conn,pc);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}	
	public List<ProductComment> selectProductCommentList(int shopProductId){
		Connection conn=getConnection();
		List<ProductComment> list=dao.selectProductCommentList(conn,shopProductId);
		close(conn);
		return list;
	}	
	public int updateProduct(Product p) {
		Connection conn=getConnection();
		int result=dao.updateProduct(conn,p);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	public int insertBasket(Basket b) {
		Connection conn=getConnection();
		int result=dao.insertBasket(conn,b);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;	
	}
	public List<Basket> selectBasket(String memberId) {
		Connection conn=getConnection();
		List<Basket> list=dao.selectBasket(conn,memberId);
		close(conn);
		return list;		
	}
	public int updateBasket(Basket b) {
		Connection conn=getConnection();
		int result=dao.updateBasket(conn,b);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;		
	}
	public int deleteBasket(Basket b) {
		Connection conn=getConnection();
		int result=dao.deleteBasket(conn,b);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	public int insertOrder(Member member) {
		Connection conn=getConnection();
		int result=dao.insertOrder(conn,member);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;		
	}
	public Order selectOrder(String memberId) {
		Connection conn=getConnection();
		Order o=dao.selectOrder(conn, memberId);		
		close(conn);
		return o;
	}
	public int insertOrderProduct(int orderId, Basket b) {
		Connection conn=getConnection();
		int result=dao.insertOrderProduct(conn,orderId,b);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	public int deleteBasket(String memberId) {
		Connection conn=getConnection();
		int result=dao.deleteBasket(conn,memberId);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	public List<OrderProduct> selectOrderProduct(int orderId) {
		Connection conn=getConnection();
		List<OrderProduct> list=dao.selectOrderProduct(conn,orderId);
		close(conn);
		return list;
	}
	public int updateOrder(OrderProduct op) {
		Connection conn=getConnection();
		int result=dao.updateOrder(conn,op);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	
	
	
	
	
	
}
