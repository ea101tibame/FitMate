package com.redemption.model;


import java.sql.*;
import java.util.*;

public class RedJDBCDAO implements RedDAO_interface {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "EA101G5";
	String passwd = "EA101G5";

	private static final String INSERT_STMT = "INSERT INTO Redemption VALUES (to_char(sysdate,'yyyymmdd')||'-RED'||LPAD(to_char(redemption_seq.NEXTVAL), 3, '0'),?,CURRENT_TIMESTAMP,?)";
	private static final String GET_ONE_STMT = "SELECT redno,coano,reddate,redprice FROM redemption where redno = ?";
	private static final String GET_ALL_STMT = "SELECT * FROM redemption order by redno";

	@Override
	public void insert(RedVO redVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);


			pstmt.setString(1, redVO.getCoano());

			pstmt.setInt(2, redVO.getRedprice());

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
	public RedVO findByPrimaryKey(String redno) {

		RedVO redVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, redno);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				redVO = new RedVO();
				redVO.setRedno(rs.getString("redno"));
				redVO.setCoano(rs.getString("coano"));
				redVO.setReddate(rs.getTimestamp("reddate"));
				redVO.setRedprice(rs.getInt("redprice"));

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
		return redVO;
	}

	@Override
	public List<RedVO> getAll() {
		List<RedVO> list = new ArrayList<RedVO>();
		RedVO redVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				redVO = new RedVO();
				redVO.setRedno(rs.getString("redno"));
				redVO.setCoano(rs.getString("coano"));
				redVO.setReddate(rs.getTimestamp("reddate"));
				redVO.setRedprice(rs.getInt("redprice"));
				list.add(redVO); // Store the row in the list
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

		RedJDBCDAO dao = new RedJDBCDAO();

		// insert
//		RedVO redVO1 = new RedVO();
//
//		redVO1.setCoano("C002");
//		redVO1.setRedprice(5000);
//
//		dao.insert(redVO1);

		
		// find one
//		RedVO redVO3 = dao.findByPrimaryKey("20200612-RED013");
//		System.out.print(redVO3.getRedno() + ",");
//		System.out.print(redVO3.getCoano() + ",");
//		System.out.print(redVO3.getReddate() + ",");
//		System.out.print(redVO3.getRedprice());
		


///		System.out.println("---------------------");

		// find all
		List<RedVO> list = dao.getAll();
		for (RedVO aRed : list) {

			System.out.print(aRed.getRedno() + ",");
			System.out.print(aRed.getCoano() + ",");
			System.out.print(aRed.getReddate() + ",");
			System.out.print(aRed.getRedprice());

			System.out.println();
		}
	}
}
