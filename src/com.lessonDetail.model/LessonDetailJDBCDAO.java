package com.lessonDetail.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lesson.model.LessonVO;
import com.lessonTime.model.LessonTimeVO;

public class LessonDetailJDBCDAO implements LessonDetailDAO_interface{
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "EA101G5";
	String passwd = "123456";
	
	private static final String INSERT="INSERT INTO LESSON_DETAIL VALUES (?,?)";
	private static final String GETONE_LessonAllTimes="SELECT lesson_detail.ltime_no,lesson_time.ltime_date,lesson_time.ltime_ss FROM LESSON_DETAIL JOIN LESSON_TIME ON LESSON_DETAIL.LTIME_NO=LESSON_TIME.LTIME_NO	WHERE LESSNO=?";
	private static final String GETALL_LessonAllTimes="SELECT * FROM LESSON_DETAIL";
	
	
	@Override
	public void insert(LessonVO LessonVO, List<LessonTimeVO> list) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			System.out.println(list.size());
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT);
			for(LessonTimeVO LessonTimeVO:list) {
				pstmt.setString(1,LessonVO.getLessno());
				pstmt.setString(2,LessonTimeVO.getLtime_no());
				pstmt.executeUpdate();
			}
			

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
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

	}
	@Override
	public LessonDetailVO findAllTimesBylessno(String lessno) {
		LessonDetailVO LessonDetailVO = null;
		LessonTimeVO LessonTimeVO = null;
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
				LessonTimeVO= new LessonTimeVO();
				LessonDetailVO.setLessno(rs.getString("lessno"));
				LessonTimeVO.setLtime_date(rs.getDate("ltime_date"));
				LessonTimeVO.setLtime_ss(rs.getInt(ltime_ss));
				
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
	public static void main(String[] args) {
		LessonDetailJDBCDAO dao = new LessonDetailJDBCDAO();
		
		//失敗 無法一次增四筆
//		LessonVO LessonVO = new LessonVO();
//		LessonVO.setLessno("L002");
//		
//		List<LessonTimeVO> list = new ArrayList<LessonTimeVO>();
//		LessonTimeVO LessonTimeVO = new LessonTimeVO();
//		LessonTimeVO.setLtime_no("LT010");
//		LessonTimeVO LessonTimeVO1 = new LessonTimeVO();
//		LessonTimeVO1.setLtime_no("LT011");
//		LessonTimeVO LessonTimeVO2 = new LessonTimeVO();
//		LessonTimeVO2.setLtime_no("LT012");
//		LessonTimeVO LessonTimeVO3 = new LessonTimeVO();
//		LessonTimeVO3.setLtime_no("LT013");
//		
//		list.add(LessonTimeVO);
//		list.add(LessonTimeVO1);
//		list.add(LessonTimeVO2);
//		list.add(LessonTimeVO3);
//		
//		
//		dao.insert(LessonVO, list);
//		System.out.println("新增成功");
		
		LessonDetailVO testFind = dao.findAllTimesBylessno("L001");
		System.out.println(testFind.getLessno());
		System.out.println(testFind.getLtime_no());

	}

}
