package com.boong.carInfo.model.service;

import static com.boong.common.JDBCTemplate.close;
import static com.boong.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.boong.carInfo.model.dao.CarInfoDao;
import com.boong.carInfo.model.vo.CarInfo;
import com.boong.carInfo.model.vo.ClassInfo;

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

	
}
