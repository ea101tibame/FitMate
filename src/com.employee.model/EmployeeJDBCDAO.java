package com.employee.model;

import java.io.*;
import java.sql.*;
import java.util.*;

public class EmployeeJDBCDAO implements EmployeeDAO_interface{
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "EA101G5";
	String passwd = "123456";
	
	//新增員工(含圖片)
	private static final String INSERT_STMT = "INSERT INTO EMPLOYEE VALUES ('E'||LPAD(to_char(EMPNO_SEQ.NEXTVAL),3,'0'),?,?,?,?,?)";
	//列出所有員工(密碼未亂數設定)
	private static final String GET_ALL_STMT = "SELECT EMPNO,ENAME,EACC,EPSW,ESTA FROM EMPLOYEE ORDER BY EMPNO";
	//列出單一員工(基本不用)
	private static final String GET_ONE_STMT = "SELECT EMPNO,ENAME,EACC,EPSW,ESTA FROM EMPLOYEE WHERE EMPNO = ?";
	//刪除員工(基本不用)
	private static final String DELETE = "DELETE FROM EMPLOYEE WHERE EMPNO = ? ";
	//修改員工資料(主要權限更動)
	private static final String UPDATE_STA = "UPDATE EMPLOYEE SET ENAME = ? , EACC = ? , EPSW = ? , ESTA = ?  WHERE EMPNO = ? ";
	
	@Override
	public void insertEmp(EmployeeVO EmployeeVO) {
		
		Connection con = null ;
		PreparedStatement pstmt = null ;
			
			try {
				
				Class.forName(driver);
				con = DriverManager.getConnection(url,userid,passwd);
				pstmt = con.prepareStatement(INSERT_STMT);
				
				pstmt.setString(1, EmployeeVO.getEname());
				pstmt.setString(2, EmployeeVO.getEacc());
				pstmt.setString(3, EmployeeVO.getEpsw());
				pstmt.setBytes(4, EmployeeVO.getEpic());
				pstmt.setString(5, EmployeeVO.getEsta());
				
				pstmt.executeUpdate();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				throw new RuntimeException("Couldn't load database driver. "
						+ e.getMessage());
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
	
	public void modifyEmpSta(EmployeeVO EmployeeVO) {
		
		Connection con = null ;
		PreparedStatement pstmt = null ;
			
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url,userid,passwd);
			pstmt = con.prepareStatement(UPDATE_STA);
			
			pstmt.setString(1, EmployeeVO.getEname());
			pstmt.setString(2, EmployeeVO.getEacc());
			pstmt.setString(3, EmployeeVO.getEpsw());
			pstmt.setString(4, EmployeeVO.getEsta());
			pstmt.setString(5, EmployeeVO.getEmpno());
			
			pstmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
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
	public void deleteEmp(String empno) {
		
		Connection con = null ;
		PreparedStatement pstmt = null ;
			
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url,userid,passwd);
			pstmt = con.prepareStatement(DELETE);
			
			pstmt.setString(1, empno);
			pstmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
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
	public EmployeeVO selectByEmpno(String empno) {
		
		EmployeeVO EmployeeVO = null ;
		Connection con = null ;
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url,userid,passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);
			
			pstmt.setString(1, empno);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				EmployeeVO = new EmployeeVO();
				EmployeeVO.setEmpno(rs.getString("empno"));
				EmployeeVO.setEname(rs.getString("ename"));
				EmployeeVO.setEacc(rs.getString("eacc"));
				EmployeeVO.setEpsw(rs.getString("epsw"));
				EmployeeVO.setEsta(rs.getString("esta"));
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
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
		return null;
	}
	@Override
	public List<EmployeeVO> selectAllEmp() {
		
		List<EmployeeVO>emplist = new ArrayList<EmployeeVO>() ;	//宣告list存放所有EmployeeVo物件
		EmployeeVO EmployeeVO = null ;
		Connection con = null ;
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url,userid,passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				EmployeeVO = new EmployeeVO();
				EmployeeVO.setEmpno(rs.getString("empno"));
				EmployeeVO.setEname(rs.getString("ename"));
				EmployeeVO.setEacc(rs.getString("eacc"));
				EmployeeVO.setEpsw(rs.getString("epsw"));
				EmployeeVO.setEsta(rs.getString("esta"));
				emplist.add(EmployeeVO);
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
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
		return emplist;
	}
	
	//PIC存入DB function
	
	public static byte[ ] getEmployeePicture(String path) throws IOException{
		File file = new File(path);
		FileInputStream fis = new FileInputStream(file);
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		byte[ ] buffer = new byte [8192] ;
		int i ;
		while((i = fis.read(buffer)) != -1) {
			baos.write(buffer, 0, i);
		}
		baos.close();
		fis.close();
		return baos.toByteArray();
	}
	
	//JDBC TEST OK
	public static void main(String[] args) {
		
		EmployeeJDBCDAO dao = new EmployeeJDBCDAO();
		
		EmployeeVO empVO1 = new EmployeeVO();
		empVO1.setEname("大西亞玖璃");
		empVO1.setEacc("AGURI");
		empVO1.setEpsw("123456");
		try {
		  byte [ ] pic = getEmployeePicture("WebContent/images/E010.jpg") ;
		  empVO1.setEpic(pic);
		} catch (IOException e) {
			e.printStackTrace();
		}
		empVO1.setEsta("一般管理員");
		dao.insertEmp(empVO1);
		
		System.out.println("新增成功");
		
//		List<EmployeeVO>list = dao.selectAllEmp();
//		for(EmployeeVO emp : list) {
//			System.out.print(emp.getEmpno()+",");
//			System.out.print(emp.getEname()+",");
//			System.out.print(emp.getEacc()+",");
//			System.out.print(emp.getEpsw()+",");
//			System.out.print(emp.getEsta());
//			System.out.println();
//		}
	}
}
