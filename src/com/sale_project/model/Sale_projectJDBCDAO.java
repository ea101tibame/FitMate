package com.sale_project.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sale_project.model.Sale_projectDAO_interface;
import com.sale_project.model.Sale_projectVO;

public class Sale_projectJDBCDAO implements Sale_projectDAO_interface {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:49161:XE";
	String userid = "EA101G5";
	String passwd = "EA101G5";

	private static final String INSERT_STMT = "INSERT INTO sale_project(sapro_no,sapro_start,sapro_end)VALUES('SA'||LPAD(to_char(SALE_PROJECTseq.NEXTVAL), 3, '0'),?,?)";
	private static final String UPDATE = "UPDATE sale_project set sapro_start=?,sapro_end=? where sapro_no=?";
	private static final String DELETE = "DELETE FROM sale_project where sapro_no=?";
	private static final String GET_ONE_STMT = "SELECT sapro_no,sapro_start,sapro_end from sale_project where sapro_no=?";
	private static final String GET_ALL_STMT = "SELECT sapro_no,sapro_start,sapro_end from sale_project order by sapro_no";

	@Override
	public void insert(Sale_projectVO sale_projectVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setDate(1, sale_projectVO.getSapro_start());
			pstmt.setDate(2, sale_projectVO.getSapro_end());

			pstmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver." + e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured." + se.getMessage());
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
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
	public void update(Sale_projectVO sale_projectVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setDate(1, sale_projectVO.getSapro_start());
			pstmt.setDate(2, sale_projectVO.getSapro_end());
			pstmt.setString(3, sale_projectVO.getSapro_no());

			pstmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("couldn't load database driver." + e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured." + se.getMessage());
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
	public void delete(String sapro_no) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, sapro_no);
			pstmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver." + e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured." + se.getMessage());
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
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
	public Sale_projectVO findByPrimaryKey(String sapro_no) {
		Sale_projectVO spVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, sapro_no);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				spVO = new Sale_projectVO();
				spVO.setSapro_no(rs.getString("sapro_no"));
				spVO.setSapro_start(rs.getDate("sapro_start"));
				spVO.setSapro_end(rs.getDate("sapro_end"));
			}

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
		return spVO;
	}

	@Override
	public List<Sale_projectVO> getAll() {
		List<Sale_projectVO> list = new ArrayList<Sale_projectVO>();
		Sale_projectVO spVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				spVO = new Sale_projectVO();
				spVO.setSapro_no(rs.getString("sapro_no"));
				spVO.setSapro_start(rs.getDate("sapro_start"));
				spVO.setSapro_end(rs.getDate("sapro_end"));
				list.add(spVO);
			}
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
		Sale_projectJDBCDAO dao = new Sale_projectJDBCDAO();

//		Sale_projectVO spVO1 =new Sale_projectVO();
//		spVO1.setSapro_start(java.sql.Date.valueOf("2020-10-15"));
//		spVO1.setSapro_end(java.sql.Date.valueOf("2020-12-30"));
//		dao.insert(spVO1);

		Sale_projectVO spVO2 =new Sale_projectVO();
		spVO2.setSapro_no("SA018");
		spVO2.setSapro_start(java.sql.Date.valueOf("2020-08-15"));
		spVO2.setSapro_end(java.sql.Date.valueOf("2020-08-30"));
		
		dao.update(spVO2);

//		dao.delete("SA017");

//		Sale_projectVO spVO3=dao.findByPrimaryKey("SA001");
//		System.out.print(spVO3.getSapro_no()+" ");
//		System.out.print(spVO3.getSapro_start()+" ");
//		System.out.print(spVO3.getSapro_end()+" ");

//		List<Sale_projectVO> list = dao.getAll();
//		for (Sale_projectVO spVO4 : list) {
//			System.out.print(spVO4.getSapro_no() + " ");
//			System.out.print(spVO4.getSapro_start() + " ");
//			System.out.print(spVO4.getSapro_end() + " ");
//			System.out.println();
//		}

	}
}
