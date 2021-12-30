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
import com.boong.carInfo.model.vo.Comment;
import com.boong.carInfo.model.vo.ModelLike;

public class CarInfoDao {
	
	public List<CarInfo> classList(Connection conn, String value) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<CarInfo> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement("SELECT EVCAR.MODEL_CLASS,EVCAR.MODEL_NAME,EVCAR.MODEL_BRAND,MODEL_MADE,MODEL_INFO,EVCAR.FILE_NAME FROM EVCAR LEFT OUTER JOIN EVCAR_CLASS ON EVCAR.MODEL_CLASS=EVCAR_CLASS.MODEL_CLASS WHERE MODEL_INFO=? AND MODEL_GRADE='STANDARD'");
			pstmt.setString(1, value);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				CarInfo ci=CarInfo.builder()
						.modelClass(rs.getString("model_class"))
						.modelName(rs.getString("model_name"))
						.modelBrand(rs.getString("model_brand"))
						.modelMade(rs.getString("model_made"))
						.modelInfo(rs.getString("model_info"))
						.fileName(rs.getString("file_Name"))
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
						.fileName(rs.getString("file_name"))
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
			pstmt=conn.prepareStatement("SELECT EVCAR_CLASS.MODEL_CLASS,EVCAR.MODEL_BRAND,MODEL_GRADE,PRICE,SPEED,PER_KM,MILE,OUTPUT,DRIVE,LIKECOUNT,EVCAR_CLASS.FILE_NAME,FILE_RENAME FROM EVCAR LEFT OUTER JOIN EVCAR_CLASS ON EVCAR.MODEL_CLASS=EVCAR_CLASS.MODEL_CLASS WHERE EVCAR.MODEL_CLASS=?");
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
						.likeCount(rs.getInt("likeCount"))
						.fileName(rs.getString("file_Name"))
						.fileReName(rs.getString("file_rename"))
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
						.fileName(rs.getString("file_name"))
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
	public List<Comment> commentList(Connection conn,String mClass) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Comment> list = new ArrayList();
		try {
			pstmt=conn.prepareStatement("select * from evcar_comment where model_class=? ORDER BY comment_no desc");
			pstmt.setString(1, mClass);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Comment c=Comment.builder()
						.commentNo(rs.getInt("comment_no"))
						.modelClass(rs.getString("model_class"))
						.memberId(rs.getString("member_id"))
						.commentDate(rs.getDate("comment_date"))
						.content(rs.getString("comment_content"))
						.build();
					list.add(c);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return list;
	}
	public int insertComment(Connection conn, String mClass, String memberId, String content) {
		PreparedStatement pstmt = null;
		int result =0;
		try {
			pstmt=conn.prepareStatement("insert into evcar_comment values(evcar_comment_seq.nextval,?,?,sysdate,?)");
			pstmt.setString(1, mClass);
			pstmt.setString(2, memberId);
			pstmt.setString(3, content);
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public int deleteComment(Connection conn, int val,String mClass) {
		PreparedStatement pstmt = null;
		int result =0;
		try {
			pstmt=conn.prepareStatement("delete from evcar_comment where comment_no=? AND model_class=?");
			pstmt.setInt(1, val);
			pstmt.setString(2, mClass);
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public List<CarInfo> priceAsc(Connection conn,int cPage, int numPerpage) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<CarInfo> list = new ArrayList();
		try {
			pstmt=conn.prepareStatement("SELECT * FROM (SELECT ROWNUM AS RNUM, B.* FROM(SELECT * FROM EVCAR LEFT OUTER JOIN EVCAR_CLASS ON EVCAR.MODEL_CLASS=EVCAR_CLASS.MODEL_CLASS WHERE EVCAR_CLASS.MODEL_GRADE='STANDARD' ORDER BY EVCAR_CLASS.PRICE ASC) B) WHERE RNUM BETWEEN ? AND ?");
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
						.fileName(rs.getString("file_name"))
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
	public List<CarInfo> priceDesc(Connection conn,int cPage, int numPerpage) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<CarInfo> list = new ArrayList();
		try {
			pstmt=conn.prepareStatement("SELECT * FROM (SELECT ROWNUM AS RNUM, B.* FROM(SELECT * FROM EVCAR LEFT OUTER JOIN EVCAR_CLASS ON EVCAR.MODEL_CLASS=EVCAR_CLASS.MODEL_CLASS WHERE EVCAR_CLASS.MODEL_GRADE='STANDARD' ORDER BY EVCAR_CLASS.PRICE DESC) B) WHERE RNUM BETWEEN ? AND ?");
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
						.fileName(rs.getString("file_name"))
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
	public int updateClassLike(Connection conn, ClassInfo ci) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement("update evcar_class set likecount=likecount+1 where model_class=?");
			pstmt.setString(1, ci.getModelClass());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public int insertLikeMember(Connection conn, ModelLike m) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement("INSERT INTO evcar_recommand (model_class, member_id) SELECT ?, ? FROM DUAL WHERE NOT EXISTS (SELECT * FROM evcar_recommand WHERE model_class=? AND MEMBER_ID =?)");
			pstmt.setString(1, m.getModelClass());
			pstmt.setString(2, m.getMemberId());		
			pstmt.setString(3, m.getModelClass());
			pstmt.setString(4, m.getMemberId());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}
	public List<CarInfo> likeDesc(Connection conn,int cPage, int numPerpage) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<CarInfo> list = new ArrayList();
		try {
			pstmt=conn.prepareStatement("SELECT * FROM (SELECT ROWNUM AS RNUM, B.* FROM(SELECT * FROM EVCAR LEFT OUTER JOIN EVCAR_CLASS ON EVCAR.MODEL_CLASS=EVCAR_CLASS.MODEL_CLASS WHERE EVCAR_CLASS.MODEL_GRADE='STANDARD' ORDER BY EVCAR_CLASS.likeCount DESC) B) WHERE RNUM BETWEEN ? AND ?");
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
						.fileName(rs.getString("file_name"))
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
	public List<CarInfo> parsePrice(Connection conn,int val,int value,int cPage,int numPerpage) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<CarInfo> list = new ArrayList();
		try {
			pstmt=conn.prepareStatement("SELECT * FROM (SELECT ROWNUM AS RNUM, B.* FROM(SELECT * FROM EVCAR LEFT OUTER JOIN EVCAR_CLASS ON EVCAR.MODEL_CLASS=EVCAR_CLASS.MODEL_CLASS WHERE EVCAR_CLASS.MODEL_GRADE='STANDARD' AND EVCAR_CLASS.PRICE BETWEEN ? AND ?) B) WHERE RNUM BETWEEN ? AND ?");
			pstmt.setInt(1, val);
			pstmt.setInt(2, value);
			pstmt.setInt(3,(cPage-1)*numPerpage+1);
			pstmt.setInt(4, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				CarInfo ci=CarInfo.builder()
						.modelClass(rs.getString("model_class"))
						.modelName(rs.getString("model_name"))
						.modelBrand(rs.getString("model_brand"))
						.modelMade(rs.getString("model_made"))
						.modelInfo(rs.getString("model_info"))
						.fileName(rs.getString("file_name"))
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
	
	
}
