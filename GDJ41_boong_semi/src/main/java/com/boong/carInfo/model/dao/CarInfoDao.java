package com.boong.carInfo.model.dao;

import static com.boong.common.JDBCTemplate.close;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.boong.carInfo.model.vo.CarInfo;
import com.boong.carInfo.model.vo.ClassInfo;

public class CarInfoDao {
	
	public List<CarInfo> classList(Connection conn, String value) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<CarInfo> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement("SELECT EVCAR.MODEL_CLASS,EVCAR.MODEL_NAME,EVCAR.MODEL_BRAND,MODEL_MADE,MODEL_INFO FROM EVCAR LEFT OUTER JOIN EVCAR_CLASS ON EVCAR.MODEL_CLASS=EVCAR_CLASS.MODEL_CLASS WHERE MODEL_INFO=? AND MODEL_GRADE='STANDARD'");
			pstmt.setString(1, value);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				CarInfo ci=CarInfo.builder()
						.modelClass(rs.getString("model_class"))
						.modelName(rs.getString("model_name"))
						.modelBrand(rs.getString("model_brand"))
						.modelMade(rs.getString("model_made"))
						.modelInfo(rs.getString("model_info"))
						.build();
				list.add(ci);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rs);
		}
		return list;
	}
	public List scrollList(Connection conn, String select) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List list=new ArrayList();
		try {
			pstmt=conn.prepareStatement("SELECT DISTINCT MODEL_NAME FROM EVCAR WHERE MODEL_BRAND=?");
			pstmt.setString(1, select);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				String value=rs.getString("model_name");
				list.add(value);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}return list;
	}
	public List<CarInfo> searchModelClass(Connection conn, String val) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<CarInfo> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement("SELECT * FROM EVCAR WHERE MODEL_NAME=?");
			pstmt.setString(1, val);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				CarInfo ci=CarInfo.builder()
						.modelClass(rs.getString("model_class"))
						.modelName(rs.getString("model_name"))
						.modelBrand(rs.getString("model_brand"))
						.modelMade(rs.getString("model_made"))
						.modelInfo(rs.getString("model_info"))
						.build();
				list.add(ci);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}return list;
	}	
	public List<ClassInfo> modelInfoView(Connection conn, String mClass) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<ClassInfo> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement("SELECT EVCAR_CLASS.MODEL_CLASS,EVCAR.MODEL_BRAND,MODEL_GRADE,PRICE,SPEED,PER_KM,MILE,OUTPUT,DRIVE,FILE_NAME FROM EVCAR LEFT OUTER JOIN EVCAR_CLASS ON EVCAR.MODEL_CLASS=EVCAR_CLASS.MODEL_CLASS WHERE EVCAR.MODEL_CLASS=?");
			pstmt.setString(1, mClass);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				ClassInfo ci=ClassInfo.builder()
						.modelClass(rs.getString("model_class"))
						.modelBrand(rs.getString("model_brand"))
						.modelGrade(rs.getString("model_grade"))
						.price(rs.getString("price"))
						.speed(rs.getString("speed"))
						.perKm(rs.getString("per_km"))
						.mile(rs.getString("mile"))
						.output(rs.getString("output"))
						.drive(rs.getString("drive"))
						.fileName(rs.getString("file_Name"))
						.build();
					list.add(ci);			
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}return list;
	}
	public List<CarInfo> totalList(Connection conn,int cPage, int numPerpage) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<CarInfo> list = new ArrayList();
		try {
			pstmt=conn.prepareStatement("SELECT * FROM (SELECT ROWNUM AS RNUM, B.* FROM(SELECT * FROM EVCAR) B) WHERE RNUM BETWEEN ? AND ?");
			pstmt.setInt(1, (cPage-1)*numPerpage+1);
			pstmt.setInt(2, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				CarInfo ci=CarInfo.builder()
						.modelClass(rs.getString("model_class"))
						.modelName(rs.getString("model_name"))
						.modelBrand(rs.getString("model_brand"))
						.modelMade(rs.getString("model_made"))
						.modelInfo(rs.getString("model_info"))
						.build();
					list.add(ci);
			}
		
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}return list;
	}
	public int totalListCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement("SELECT COUNT(*) FROM EVCAR");
			rs=pstmt.executeQuery();
			if(rs.next()) result=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}return result;
	}
}
