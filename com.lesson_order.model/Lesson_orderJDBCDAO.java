package com.lesson_order.model;

import java.util.ArrayList;
import java.util.List;

//import com.emp.model.EmpJDBCDAO;
//import com.emp.model.EmpVO;

import java.sql.*;
//import com.student.model;
//import com.choah.model;

public class Lesson_orderJDBCDAO implements Lesson_orderDAO_interface{


	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "fitmate";
	String passwd = "123456";
	
	private static final String INSERT_STMT = "INSERT INTO Lesson_order (LORD_NO, STUNO, LESSNO, LORD_SC) VALUES ( SEQ_LESSON_ORDER.NEXTVAL, ?, ?, ?)";
	private static final String DELETE = "DELETE FROM Lesson_order WHERE lord_no = ?";
	private static final String GET_ALL_STMT = "SELECT * FROM Lesson_order";
	private static final String GET_Lessno_STMT = "SELECT STUNO FROM Lesson_order WHERE LESSNO = ? ";
	private static final String GET_Stuno_STMT = "SELECT LESSNO FROM Lesson_order WHERE STUNO = ?";
	
	@Override
	public void insert(Lesson_orderVO Lesson_orderVO) {
		
		Connection con = null;
		PreparedStatement pstmt =null;
		
		try {
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setString(1, Lesson_orderVO.getStuno());	
			pstmt.setString(2, Lesson_orderVO.getLessno());		
			pstmt.setString(3, Lesson_orderVO.getLord_no());		

			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
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
	public void delete(String lord_no) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);
			
			pstmt.setString(1, lord_no);
			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("找不到"
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
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
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}

	public List<Lesson_orderVO> getfindByLessno( String lessno) {
		
		
		List<Lesson_orderVO> list = new ArrayList<Lesson_orderVO>();
		Lesson_orderVO Lesson_orderVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {	
		Class.forName(driver);
		con = DriverManager.getConnection(url, userid, passwd);
		pstmt = con.prepareStatement(GET_Lessno_STMT);
		pstmt.setString(1, lessno);
		rs = pstmt.executeQuery();
	
		
		rs = pstmt.executeQuery();
		
		while (rs.next()) {					
				Lesson_orderVO = new Lesson_orderVO();
				Lesson_orderVO.setStuno(rs.getString("stuno"));
				//Lesson_orderVO.setLessno(rs.getString("lessno"));
				list.add(Lesson_orderVO);					
		}
		// Handle any driver errors
	} catch (ClassNotFoundException e) {
		throw new RuntimeException("找不到"
				+ e.getMessage());
		// Handle any SQL errors
	} catch (SQLException se) {
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
	
	@Override
	public List<Lesson_orderVO> getfindByStuno(String stuno) {
		List<Lesson_orderVO> list = new ArrayList<Lesson_orderVO>();
		Lesson_orderVO Lesson_orderVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {	
		Class.forName(driver);
		con = DriverManager.getConnection(url, userid, passwd);
		pstmt = con.prepareStatement(GET_Stuno_STMT);
		pstmt.setString(1, stuno);
	
		rs = pstmt.executeQuery();
		
		while (rs.next()) {					
				Lesson_orderVO = new Lesson_orderVO();
				//Lesson_orderVO.setStuno(rs.getString("stuno"));
				Lesson_orderVO.setLessno(rs.getString("lessno"));
				list.add(Lesson_orderVO);					
		}
		// Handle any driver errors
	} catch (ClassNotFoundException e) {
		throw new RuntimeException("找不到"
				+ e.getMessage());
		// Handle any SQL errors
	} catch (SQLException se) {
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
	
	@Override
	public List<Lesson_orderVO> getAll() {
		
		List<Lesson_orderVO> list = new ArrayList<Lesson_orderVO>();
		Lesson_orderVO Lesson_orderVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

	
		
		try {	
		Class.forName(driver);
		con = DriverManager.getConnection(url, userid, passwd);
		pstmt = con.prepareStatement(GET_ALL_STMT);
		
		rs = pstmt.executeQuery();

		while (rs.next()) {	
			Lesson_orderVO = new Lesson_orderVO();
			Lesson_orderVO.setLord_no(rs.getString("Lord_no"));
			Lesson_orderVO.setLessno(rs.getString("stuno"));
			Lesson_orderVO.setStuno(rs.getString("lessno"));
			Lesson_orderVO.setLord_sc(rs.getString("Lord_sc"));
			list.add(Lesson_orderVO);			
		}
		// Handle any driver errors
	} catch (ClassNotFoundException e) {
		throw new RuntimeException("找不到"+ e.getMessage());
		// Handle any SQL errors
	} catch (SQLException se) {
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
	
	
	@Override
	public Lesson_orderVO getfindByPrimaryKey(String Lord_no) {
		
		return null;
	}


	
	public static void main(String[] args) {
		Lesson_orderJDBCDAO dao = new Lesson_orderJDBCDAO();

//		// 新增OK
//		Lesson_orderVO Lesson_orderVO1 = new Lesson_orderVO();
//
//		Lesson_orderVO1.setStuno("S001");
//		Lesson_orderVO1.setLessno("L003");
//		Lesson_orderVO1.setLord_sc("0");
//		dao.insert(Lesson_orderVO1);
//		
//		
		// 刪除OK
//		dao.delete("21");
	
	
		
//
		// 查詢一個課程有多少學生OK
//		List<Lesson_orderVO> list = dao.getfindByLessno("L003");
//		for (Lesson_orderVO aLesson_orderVO1 : list) {
//		System.out.print(aLesson_orderVO1.getStuno() + ",");
//
//			//System.out.println("-------");
//		}
//		System.out.println("---------------------");
//		// 查詢一個學生有多少課程OK
//		List<Lesson_orderVO> list1 = dao.getfindByStuno("S001");
//		for (Lesson_orderVO aLesson_orderVO2 : list1) {
//		System.out.print(aLesson_orderVO2.getLessno() + ",");
//
//			System.out.println();
//		}
//		
//		
		
//
//		// 查詢
		List<Lesson_orderVO> list = dao.getAll();
		for (Lesson_orderVO aLesson_orderVO : list) {
			System.out.print(aLesson_orderVO.getLord_no() + ",");
			System.out.print(aLesson_orderVO.getStuno() + ",");
			System.out.print(aLesson_orderVO.getLessno() + ",");
			System.out.print(aLesson_orderVO.getLord_sc() + ",");
			System.out.println();
		}
	}




}
