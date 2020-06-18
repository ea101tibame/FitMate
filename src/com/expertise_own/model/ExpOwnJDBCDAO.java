package com.expertise_own.model;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ProjectConfig;

public class ExpOwnJDBCDAO implements ExpOwnDAO_interface {

	private static final String INSERT_STMT = "INSERT INTO expertise_own (coano,expno,expown) VALUES (?,?,?)";
	private static final String UPDATE = "UPDATE expertise_own set expown=? where coano=? and expno =?";
	private static final String DELETE = "DELETE FROM expertise_own where coano=? and expno = ?";
	private static final String GET_ONE_STMT = "SELECT coano, expno FROM expertise_own where coano=? and expno = ?";
	private static final String GET_ALL_STMT = "SELECT * FROM expertise_own order by expno";
	private static final String GET_BY_CAONO_STMT = "SELECT * FROM expertise_own WHERE coano = ? order by expno";
	private static final String GET_BY_EXPNO_STMT = "SELECT * FROM expertise_own WHERE expno = ? order by coano";

	@Override
	public void insert(ExpOwnVO expownVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(ProjectConfig.JDBC_DRIVER);
			con = DriverManager.getConnection(ProjectConfig.JDBC_URL, ProjectConfig.JDBC_USER_ID,
					ProjectConfig.JDBC_USER_PW);
			pstmt = con.prepareStatement(INSERT_STMT);

			System.out.println("a: " + expownVO.getCoano());
			System.out.println("b: " + expownVO.getExpno());
			System.out.println("c: " + expownVO.getExpown());

			pstmt.setString(1, expownVO.getCoano());
			pstmt.setString(2, expownVO.getExpno());
			pstmt.setBytes(3, expownVO.getExpown());

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
	public void update(ExpOwnVO expownVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(ProjectConfig.JDBC_DRIVER);
			con = DriverManager.getConnection(ProjectConfig.JDBC_URL, ProjectConfig.JDBC_USER_ID,
					ProjectConfig.JDBC_USER_PW);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setBytes(1, expownVO.getExpown());
			pstmt.setString(2, expownVO.getCoano());
			pstmt.setString(3, expownVO.getExpno());

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
	public void delete(String coano, String expno) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(ProjectConfig.JDBC_DRIVER);
			con = DriverManager.getConnection(ProjectConfig.JDBC_URL, ProjectConfig.JDBC_USER_ID,
					ProjectConfig.JDBC_USER_PW);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, coano);
			pstmt.setString(2, expno);

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
	public ExpOwnVO findByPrimaryKey(String coano, String expno) {

		ExpOwnVO expownVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(ProjectConfig.JDBC_DRIVER);
			con = DriverManager.getConnection(ProjectConfig.JDBC_URL, ProjectConfig.JDBC_USER_ID,
					ProjectConfig.JDBC_USER_PW);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, coano);
			pstmt.setString(2, expno);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				expownVO = new ExpOwnVO();
				expownVO.setCoano(rs.getString("coano"));
				expownVO.setExpno(rs.getString("expno"));

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
		return expownVO;
	}

	@Override
	public List<ExpOwnVO> getAll() {
		List<ExpOwnVO> list = new ArrayList<ExpOwnVO>();
		ExpOwnVO expownVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(ProjectConfig.JDBC_DRIVER);
			con = DriverManager.getConnection(ProjectConfig.JDBC_URL, ProjectConfig.JDBC_USER_ID,
					ProjectConfig.JDBC_USER_PW);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				expownVO = new ExpOwnVO();
				expownVO.setCoano(rs.getString("coano"));
				expownVO.setExpno(rs.getString("expno"));
				list.add(expownVO); // Store the row in the list
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

	@Override
	public List<ExpOwnVO> getCoachesByExpno(String expno) {
		List<ExpOwnVO> list = new ArrayList<ExpOwnVO>();
		ExpOwnVO expownVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(ProjectConfig.JDBC_DRIVER);
			con = DriverManager.getConnection(ProjectConfig.JDBC_URL, ProjectConfig.JDBC_USER_ID,
					ProjectConfig.JDBC_USER_PW);
			pstmt = con.prepareStatement(GET_BY_CAONO_STMT);
			pstmt.setString(1, expno);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				expownVO = new ExpOwnVO();
				expownVO.setCoano(rs.getString("expno"));
				expownVO.setExpno(rs.getString("coano"));
				list.add(expownVO); // Store the row in the list
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

	@Override
	public List<ExpOwnVO> getExpOwnsByCoano(String coano) {
		List<ExpOwnVO> list = new ArrayList<ExpOwnVO>();
		ExpOwnVO expownVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(ProjectConfig.JDBC_DRIVER);
			con = DriverManager.getConnection(ProjectConfig.JDBC_URL, ProjectConfig.JDBC_USER_ID,
					ProjectConfig.JDBC_USER_PW);
			pstmt = con.prepareStatement(GET_BY_CAONO_STMT);
			pstmt.setString(1, coano);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				expownVO = new ExpOwnVO();
				expownVO.setCoano(rs.getString("coano"));
				expownVO.setExpno(rs.getString("expno"));
				list.add(expownVO); // Store the row in the list
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

	public static byte[] getPicByteArray(String path) throws IOException {
		File pic = new File(path);
		FileInputStream fis = new FileInputStream(pic);
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		byte[] eachBuffer = new byte[4096];// 一次送多少出去
		int currentBytes;// 當前送多少bytes出去 (ex:總共有200 bytes，一次送150
							// bytes，所以會送三次，每次currentBytes分別為150，150，50)
		while ((currentBytes = fis.read(eachBuffer)) != -1) {
			baos.write(eachBuffer, 0, currentBytes);
		}
		baos.close();
		fis.close();
		return baos.toByteArray();// 回傳管子內建的byte陣列，取得裝有位元資料的byte陣列 陣列
	}

	public static void main(String[] args) {

		ExpOwnJDBCDAO dao = new ExpOwnJDBCDAO();

		// insert
//		ExpOwnVO expownVO1 = new ExpOwnVO();
//		expownVO1.setCoano("C001");
//		expownVO1.setExpno("EXP007");
//		try {
//			byte[] pic = getPicByteArray("WebContent/certification-image/EXP007.jpg");
//			expownVO1.setExpown(pic);
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		dao.insert(expownVO1);

		// update
//		
//		ExpOwnVO expownVO2 = new ExpOwnVO();
//		
//
//
//		try {
//			byte[] pic = getPicByteArray("WebContent/certification-image/EXP007.jpg");
//			expownVO2.setExpown(pic);
//
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		expownVO2.setCoano("C001");
//		expownVO2.setExpno("EXP008");
//
//		dao.update(expownVO2);

//
//		//delete
//		dao.delete("C001","EXP008");

//		// find one
//		ExpOwnVO expownVO3 = dao.findByPrimaryKey("C001", "EXP001");
//		System.out.print(expownVO3.getCoano() + ",");
//		System.out.print(expownVO3.getExpno());
//		
//
//
////		System.out.println("---------------------");
/////
////		// find all
		List<ExpOwnVO> list = dao.getAll();
		for (ExpOwnVO aExpOwn : list) {

			System.out.print(aExpOwn.getCoano() + ",");
			System.out.print(aExpOwn.getExpno());

			System.out.println();
		}
	}

}
