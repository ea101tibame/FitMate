package com.complaint.model;

import java.util.ArrayList;
import java.util.List;

//import com.emp.model.EmpJDBCDAO;
//import com.emp.model.EmpVO;

import java.sql.*;
//import com.student.model;
//import com.choah.model;

public class ComplaintJDBCDAO implements ComplaintDAO_interface{


	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "fitmate";
	String passwd = "123456";

	
	private static final String INSERT_STMT = "INSERT INTO COMPLAINT  (COMNO, STUNO, COANO, COMDESC, COMDATE, COMSTA) VALUES (SEQ_COMPLAINT.NEXTVAL, ?, ?, ?, ?, ?)";
	private static final String UPDATE = "UPDATE COMPLAINT SET COMDESC = ? , COMDATE = ? WHERE COMNO = ?";
	private static final String DELETE = "DELETE FROM COMPLAINT  WHERE COMNO = ?";
	private static final String GET_ALL_STMT = "SELECT * FROM COMPLAINT";
	private static final String GET_ONE_STMT = "SELECT * FROM COMPLAINT WHERE COMNO = ?";
	private static final String CHANGE_STATE_STMT = "UPDATE COMPLAINT SET COMSTA = '1' WHERE COMNO = ?";
	
	@Override
	public void insert(ComplaintVO complaintVO) {
		
		Connection con = null;
		PreparedStatement pstmt =null;
		
		try {
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setString(1, complaintVO.getStuno());
			pstmt.setString(2, complaintVO.getCoano());
			pstmt.setString(3, complaintVO.getComdesc());
			pstmt.setTimestamp(4, complaintVO.getComdate());
			pstmt.setString(5, complaintVO.getComsta());
			
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
	public void update(ComplaintVO complaintVO) {
		Connection con = null;
		PreparedStatement pstmt =null;
		//UPDATE = "UPDATE COMPLAINT SET COMDESC = ? , COMDATE = ? WHERE COMNO = ?";
		try {
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);
			
			pstmt.setString(1, complaintVO.getComdesc());			
			pstmt.setTimestamp(2, complaintVO.getComdate());
			pstmt.setString(3, complaintVO.getComno());
	
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
	public void delete(String comno) {
		Connection con = null;
		PreparedStatement pstmt = null;
	// DELETE = "DELETE FROM COMPLAINT  WHERE COMNO = ?";

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, comno);

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("找不到"+comno
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

	@Override
	public ComplaintVO findByPrimaryKey(String comno) {
		ComplaintVO complaintVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		//GET_ONE_STMT = "SELECT * FROM COMPLAINT WHERE COMNO = ?";
		
	try {	
		Class.forName(driver);
		con = DriverManager.getConnection(url, userid, passwd);
		pstmt = con.prepareStatement(GET_ONE_STMT);

		pstmt.setString(1, comno);
		
		rs = pstmt.executeQuery();

		while (rs.next()) {	
			complaintVO = new ComplaintVO();
			complaintVO.setComno(rs.getString("comno"));
			complaintVO.setStuno(rs.getString("STUNO"));
			complaintVO.setCoano(rs.getString("COANO"));
			complaintVO.setComdesc(rs.getString("COMDESC"));
			complaintVO.setComdate(rs.getTimestamp("COMDATE"));
			complaintVO.setComsta(rs.getString("COMSTA"));
			
		}
		// Handle any driver errors
	} catch (ClassNotFoundException e) {
		throw new RuntimeException("找不到"+comno
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
		
		return complaintVO;
	
	}

	@Override
	public List<ComplaintVO> getALL() {
		
		List<ComplaintVO> list = new ArrayList<ComplaintVO>();
		ComplaintVO complaintVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		//GET_ALL_STMT = "SELECT * FROM COMPLAINT";		
		
		try {	
		Class.forName(driver);
		con = DriverManager.getConnection(url, userid, passwd);
		pstmt = con.prepareStatement(GET_ALL_STMT);
		
		rs = pstmt.executeQuery();

		while (rs.next()) {	
			complaintVO = new ComplaintVO();
			complaintVO.setComno(rs.getString("comno"));
			complaintVO.setStuno(rs.getString("STUNO"));
			complaintVO.setCoano(rs.getString("COANO"));
			complaintVO.setComdesc(rs.getString("COMDESC"));
			complaintVO.setComdate(rs.getTimestamp("COMDATE"));
			complaintVO.setComsta(rs.getString("COMSTA"));
			list.add(complaintVO);
			
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
	public void updatecomsta(ComplaintVO complaintVO) {
		Connection con = null;
		PreparedStatement pstmt =null;
		//CHANGE_STATE_STMT = "UPATE COMPLAINT SET COMSTA = '1' WHERE COMNO = ?";
		try {
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(CHANGE_STATE_STMT);
						
			pstmt.setString(1, complaintVO.getComno());
	
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
	
	public static void main(String[] args) {
		ComplaintJDBCDAO dao = new ComplaintJDBCDAO();

//
//		// 新增OK
//		ComplaintVO complaintVO1 = new ComplaintVO();
//		complaintVO1.setStuno("S001");
//		complaintVO1.setCoano("C001");
//		String timmme = "1591538928685";
//		System.out.println(timmme);
//		
//		complaintVO1.setComdate(new java.sql.Timestamp(Long.parseLong(timmme)));
//		
//		complaintVO1.setComdesc("qqqqqweqweqwe");
//		complaintVO1.setComsta("0");
//	
//		dao.insert(complaintVO1);
		// 修改OK
//		
//		String timmme = "1591538928685";
//		
//		ComplaintVO complaintVO2 = new ComplaintVO();
//		complaintVO2.setComno("122");
//		complaintVO2.setComdesc("testestestestestestesttttttsetes");
//		complaintVO2.setComdate(new java.sql.Timestamp(Long.parseLong(timmme)));	
//		dao.update(complaintVO2);
		
//		// 修改STA
//		ComplaintVO complaintVO4 = new ComplaintVO();
//		complaintVO4.setComno("135");
//		dao.updatecomsta(complaintVO4);
		
		
		
//		// 刪除OK
//		dao.delete("117");

//		// 查詢OK
//		ComplaintVO ComplaintVO3 = dao.findByPrimaryKey("122");
//		System.out.print(ComplaintVO3.getComno() + ",");
//		System.out.print(ComplaintVO3.getStuno() + ",");
//		System.out.print(ComplaintVO3.getCoano() + ",");
//		System.out.print(ComplaintVO3.getComdesc() + ",");
//		System.out.print(ComplaintVO3.getComdate() + ",");
//		System.out.print(ComplaintVO3.getComsta() + ",");
//		System.out.println("---------------------");
//
//		// 查詢
//		List<ComplaintVO> list = dao.getALL();
//		for (ComplaintVO aComplaint : list) {
//			System.out.print(aComplaint.getComno() + ",");
//			System.out.print(aComplaint.getStuno() + ",");
//			System.out.print(aComplaint.getCoano() + ",");
//			System.out.print(aComplaint.getComdesc() + ",");
//			System.out.print(aComplaint.getComdate() + ",");
//			System.out.print(aComplaint.getComsta() + ",");
//	
//			System.out.println();
//		}
	}
}
