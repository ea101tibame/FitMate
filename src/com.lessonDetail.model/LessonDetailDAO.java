package com.lessonDetail.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class LessonDetailDAO implements LessonDetailDAO_interface{
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "EA101G5";
	String passwd = "123456";
	
	private static final String INSERT_STMT="INSERT INTO LESSON_DETAIL VALUES (?,?)";
	@Override
	public void insert(Connection con, String next_lessNo, String next_ltime_no) {
PreparedStatement pstmt = null;
		
		try {
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setString(1,next_lessNo);
			pstmt.setString(2,next_ltime_no);
			pstmt.executeUpdate();
		} catch (SQLException se) {
			try {
				// 發生例外即進行rollback動作
				con.rollback();//新增時段失敗 撤回
			} catch (SQLException e) {
				e.printStackTrace();
			}
			se.printStackTrace();
			// Clean up JDBC resources
		} finally {//先不能關連線 還要用!
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
		}
		
	}
	@Override
	public void update(String lesson, String ltime_no) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void delete(String lesson, String ltime_no) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public LessonDetailVO findByPrimaryKey(String lessno) {
		// TODO Auto-generated method stub
		return null;
	}

	
}
