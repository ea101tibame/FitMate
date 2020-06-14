package com.deposit.model;


import java.sql.*;
import java.util.*;

public class DepJDBCDAO implements DepDAO_interface {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "EA101G5";
	String passwd = "EA101G5";

	private static final String INSERT_STMT = "INSERT INTO DEPOSIT VALUES (to_char(sysdate,'yyyymmdd')||'-DEP'||LPAD(to_char(deposit_seq.NEXTVAL), 3, '0'),?,CURRENT_TIMESTAMP,?)";
	private static final String GET_ONE_STMT = "SELECT depno,stuno,depdate,depprice FROM deposit where depno = ?";
	private static final String GET_ALL_STMT = "SELECT * FROM deposit order by depno";

	@Override
	public void insert(DepVO depVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);


			pstmt.setString(1, depVO.getStuno());

			pstmt.setInt(2, depVO.getDepprice());

			pstmt.executeUpdate();

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
	public DepVO findByPrimaryKey(String depno) {

		DepVO depVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, depno);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				depVO = new DepVO();
				depVO.setDepno(rs.getString("depno"));
				depVO.setStuno(rs.getString("stuno"));
				depVO.setDepdate(rs.getTimestamp("depdate"));
				depVO.setDepprice(rs.getInt("depprice"));

			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
		return depVO;
	}

	@Override
	public List<DepVO> getAll() {
		List<DepVO> list = new ArrayList<DepVO>();
		DepVO depVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				depVO = new DepVO();
				depVO.setDepno(rs.getString("depno"));
				depVO.setStuno(rs.getString("stuno"));
				depVO.setDepdate(rs.getTimestamp("depdate"));
				depVO.setDepprice(rs.getInt("depprice"));
				list.add(depVO); // Store the row in the list
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
		return list;
	}


	public static void main(String[] args) {

		DepJDBCDAO dao = new DepJDBCDAO();

		// insert
//		DepVO depVO1 = new DepVO();
//
//		depVO1.setStuno("S002");
//		depVO1.setDepprice(500);
//
//		dao.insert(depVO1);

		
		// find one
//		DepVO depVO3 = dao.findByPrimaryKey("20200609-DEP009");
//		System.out.print(depVO3.getDepno() + ",");
//		System.out.print(depVO3.getStuno() + ",");
//		System.out.print(depVO3.getDepdate() + ",");
//		System.out.print(depVO3.getDepprice());
		


///		System.out.println("---------------------");

		// find all
		List<DepVO> list = dao.getAll();
		for (DepVO aDep : list) {

			System.out.print(aDep.getDepno() + ",");
			System.out.print(aDep.getStuno() + ",");
			System.out.print(aDep.getDepdate() + ",");
			System.out.print(aDep.getDepprice());

			System.out.println();
		}
	}
}
