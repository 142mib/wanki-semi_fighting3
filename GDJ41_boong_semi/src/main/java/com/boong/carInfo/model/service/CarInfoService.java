package com.boong.carInfo.model.service;

import static com.boong.common.JDBCTemplate.close;
import static com.boong.common.JDBCTemplate.commit;
import static com.boong.common.JDBCTemplate.getConnection;
import static com.boong.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.boong.carInfo.model.dao.CarInfoDao;
import com.boong.carInfo.model.vo.CarInfo;
import com.boong.carInfo.model.vo.ClassInfo;
import com.boong.carInfo.model.vo.Comment;
import com.boong.carInfo.model.vo.ModelLike;

public class CarInfoService {

	private CarInfoDao dao = new CarInfoDao();
	
	public List<CarInfo> classList(String value) {
		Connection conn=getConnection();
		List<CarInfo> list=dao.classList(conn,value);
		close(conn);
		return list;
	}
	public List scrollList(String select) {
		Connection conn=getConnection();
		List list=dao.scrollList(conn,select);
		close(conn);
		return list;
	}
	public List<CarInfo> searchModelClass(String val) {
		Connection conn=getConnection();
		List<CarInfo> list=dao.searchModelClass(conn,val);
		close(conn);	
		return list;
	}
	public List<ClassInfo> modelInfoView(String mClass) {
		Connection conn=getConnection();
		List<ClassInfo> list=dao.modelInfoView(conn,mClass);
		close(conn);
		return list;
	}
	public List<CarInfo> totalList(int cPage, int numPerpage) {
		Connection conn=getConnection();
		List<CarInfo> list=dao.totalList(conn,cPage,numPerpage);
		close(conn);
		return list;
	}
	public int totalListCount() {
		Connection conn=getConnection();
		int result=dao.totalListCount(conn);
		close(conn);
		return result;
	}
	public List<Comment> commentList(String mClass) {
		Connection conn=getConnection();
		List<Comment> list=dao.commentList(conn,mClass);
		close(conn);
		return list;
	}
	public int insertComment(String mClass,String memberId,String content) {
		Connection conn=getConnection();
		int result=dao.insertComment(conn,mClass,memberId,content);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	public int deleteComment(int val, String mClass) {
		Connection conn=getConnection();
		int result=dao.deleteComment(conn,val,mClass);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	public List<CarInfo> priceAsc(int cPage,int numPerpage) {
		Connection conn=getConnection();
		List<CarInfo> list=dao.priceAsc(conn,cPage,numPerpage);
		close(conn);
		return list;
	}
	public List<CarInfo> priceDesc(int cPage,int numPerpage) {
		Connection conn=getConnection();
		List<CarInfo> list=dao.priceDesc(conn,cPage,numPerpage);
		close(conn);
		return list;
	}
	public int updateClassLike(ClassInfo ci) {
		Connection conn=getConnection();
		int result=dao.updateClassLike(conn,ci);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	public int insertLikeMember(ModelLike m) {
		Connection conn=getConnection();
		int result=dao.insertLikeMember(conn,m);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	public List<CarInfo> likeDesc(int cPage,int numPerpage) {
		Connection conn=getConnection();
		List<CarInfo> list=dao.likeDesc(conn,cPage,numPerpage);
		close(conn);
		return list;
	}
	public List<CarInfo> parsePrice(int val,int value,int cPage,int numPerpage) {
		Connection conn=getConnection();
		List<CarInfo> list=dao.parsePrice(conn,val,value,cPage,numPerpage);
		close(conn);
		return list;
	}
	
	
}
