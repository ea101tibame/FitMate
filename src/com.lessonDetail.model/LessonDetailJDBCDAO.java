package com.lessonDetail.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lesson.model.LessonVO;

public class LessonDetailJDBCDAO implements LessonDetailDAO_interface{
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "EA101G5";
	String passwd = "123456";
	
	private static final String INSERT="INSERT INTO LESSON_DETAIL VALUES (?,?)";
	private static final String GETONE_LessonAllTimes="SELECT * FROM LESSON_DETAIL WHERE LESSNO =?";
	private static final String GETALL_LessonAllTimes="SELECT * FROM LESSON_DETAIL";
	
	@Override
	public void insert2(LessonDetailVO LessonDetailVO, Connection con) {
		
		PreparedStatement pstmt = null;

		try {
			LessonVO LessonVO = new LessonVO();
     		pstmt = con.prepareStatement(INSERT);

			pstmt.setString(1, LessonVO.getLessno());
			pstmt.setString(2, LessonDetailVO.getLtime_no());
			

			pstmt.executeUpdate();

			// Handle any SQL errors
		} catch (SQLException se) {
			if (con != null) {
				try {
					// 3●設定於當有exception發生時之catch區塊內
					System.err.print("Transaction is being ");
					System.err.println("rolled back-由-lessonTime");
					con.rollback();
				} catch (SQLException excep) {
					throw new RuntimeException("rollback error occured. "
							+ excep.getMessage());
				}
			}
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
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
	public LessonDetailVO findAllTimesBylessno(String lessno) {
		LessonDetailVO LessonDetailVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GETONE_LessonAllTimes);

			pstmt.setString(1, lessno);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				LessonDetailVO = new LessonDetailVO();
				LessonDetailVO.setLessno(rs.getString("lessno"));
				
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return LessonDetailVO;
		
	}

	@Override
	public List<LessonDetailVO> getAll() {
		 List<LessonDetailVO> list = new  ArrayList<LessonDetailVO>();
		 LessonDetailVO LessonDetailVO= null;
		 Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {

				Class.forName(driver);
				con = DriverManager.getConnection(url, userid, passwd);
				pstmt = con.prepareStatement(GETALL_LessonAllTimes);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					LessonDetailVO = new LessonDetailVO();
					LessonDetailVO.setLessno(rs.getString("lessno"));
					LessonDetailVO.setLtime_no(rs.getString("ltime_no"));
					list.add(LessonDetailVO); // Store the row in the list
				}

				// Handle any driver errors
			} catch (ClassNotFoundException e) {
				throw new RuntimeException("Couldn't load database driver. "
						+ e.getMessage());
				// Handle any SQL errors
			} catch (SQLException se) {
				throw new RuntimeException("A database error occured. "
						+ se.getMessage());
			} finally {
				if (rs != null) {
					try {
						rs.close();
					} catch (SQLException se) {
						se.printStackTrace(System.err);
					}
				}
				if (pstmt != null) {
					try {
						pstmt.close();
					} catch (SQLException se) {
						se.printStackTrace(System.err);
					}
				}
				if (con != null) {
					try {
						con.close();
					} catch (Exception e) {
						e.printStackTrace(System.err);
					}
				}
			}
		 return list;
	}
}
