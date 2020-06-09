package com.activity_order.model;

import java.util.*;


import java.sql.*;

public class Activity_orderJDBCDAO implements Acitivity_orderDAO_interface {

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "EA101G5";
	String passwd = "EA101G5";

	private static final String INSERT_PSTMT = "INSERT INTO　ACTIVITY_ORDER (aord_no,actno,stuno,aord_sc,aord_time)"
			+ "VALUES (to_char(sysdate,'yyyymmdd')||'-AO'||LPAD(to_char(ACTIVITY_ORDER_seq.NEXTVAL), 3, '0'), ?, ?, ?, CURRENT_TIMESTAMP)";
	private static final String GET_ALL_PSTMT = "SELECT aord_no,actno,stuno,aord_sc,aord_time FROM ACTIVITY_ORDER order by aord_no";
	private static final String GET_ONE_PSTMT = "SELECT aord_no,actno,stuno,aord_sc,aord_time FROM ACTIVITY_ORDER where aord_no = ?";
	private static final String DELETE = "DELETE　FROM ACTIVITY_ORDER where aord_no = ?";
	private static final String UPDATE = "UPDATE ACTIVITY_ORDER set actno=?, stuno=?,aord_sc=? where aord_no = ?";

	// 新增
	@Override
	public void insert(Activity_orderVO act_orderVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_PSTMT);

			pstmt.setString(1, act_orderVO.getActno());
			pstmt.setString(2, act_orderVO.getStuno());
			pstmt.setDouble(3, act_orderVO.getAord_sc());
			
			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
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

	// 修改
	@Override
	public void update(Activity_orderVO act_orderVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, act_orderVO.getActno());
			pstmt.setString(2, act_orderVO.getStuno());
			pstmt.setDouble(3, act_orderVO.getAord_sc());
			pstmt.setString(4, act_orderVO.getAord_no());

			pstmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException se) {
			se.printStackTrace();
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

	// 刪除
	@Override
	public void delete(String aord_no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);
			
			pstmt.setString(1, aord_no);
			pstmt.executeUpdate();
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException se) {
			se.printStackTrace();
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

	// 查詢單筆
	@Override
	public Activity_orderVO findByPrimaryKey(String aord_no) {
		
		Activity_orderVO act_orderVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_PSTMT);
			
			pstmt.setString(1, aord_no);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				act_orderVO = new Activity_orderVO();
				act_orderVO.setAord_no(rs.getString("aord_no"));
				act_orderVO.setActno(rs.getString("actno"));
				act_orderVO.setStuno(rs.getString("stuno"));
				act_orderVO.setAord_sc(rs.getDouble("aord_sc"));
				act_orderVO.setAord_time(rs.getTimestamp("aord_time"));
			}
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException se) {
			se.printStackTrace();
		}finally {
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
		
		return act_orderVO;
	}

	// 查詢多筆
	@Override
	public List<Activity_orderVO> getAll() {
		List<Activity_orderVO> list = new ArrayList<Activity_orderVO>();

		Activity_orderVO act_orderVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_PSTMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				act_orderVO = new Activity_orderVO();
				act_orderVO.setAord_no(rs.getString("aord_no"));
				act_orderVO.setActno(rs.getString("actno"));
				act_orderVO.setStuno(rs.getString("stuno"));
				act_orderVO.setAord_sc(rs.getDouble("aord_sc"));
				act_orderVO.setAord_time(rs.getTimestamp("aord_time"));
				list.add(act_orderVO);
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
		return list;
	}

	public static void main(String[] args) {
		Activity_orderJDBCDAO dao = new Activity_orderJDBCDAO();

		// 新增測試
		Activity_orderVO act_orVO1 = new Activity_orderVO();
		act_orVO1.setActno("A002");
		act_orVO1.setStuno("S005");
		act_orVO1.setAord_sc(4.2);
		dao.insert(act_orVO1);
		System.out.println("新增成功");

		// 修改測試
		Activity_orderVO act_orVO2 = new Activity_orderVO();
		act_orVO2.setActno("A008");
		act_orVO2.setStuno("S008");
		act_orVO2.setAord_sc(2.2);
		act_orVO2.setAord_no("20200607-AO008");
		dao.update(act_orVO2);
		System.out.println("修改成功");

		// 刪除測試
		dao.delete("20200608-AO012");
		System.out.println("刪除成功");

		// 查詢單筆測試
		Activity_orderVO act_orVO3 = dao.findByPrimaryKey("20200607-AO003");
		System.out.print(act_orVO3.getAord_no() + ",");
		System.out.print(act_orVO3.getActno() + ",");
		System.out.print(act_orVO3.getStuno() + ",");
		System.out.print(act_orVO3.getAord_sc() + ",");
		System.out.print(act_orVO3.getAord_time()+ ",");
		System.out.println("查詢單筆成功");

		// 查詢多筆測試
		List<Activity_orderVO> list = dao.getAll();
		for (Activity_orderVO act_orVO4 : list) {
			System.out.print(act_orVO4.getAord_no() + ",");
			System.out.print(act_orVO4.getActno() + ",");
			System.out.print(act_orVO4.getStuno() + ",");
			System.out.print(act_orVO4.getAord_sc() + ",");
			System.out.print(act_orVO4.getAord_time() + ",");
			System.out.println("查詢多筆成功");
		}
	}
}
