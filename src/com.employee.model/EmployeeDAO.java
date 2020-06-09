package com.employee.model;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class EmployeeDAO implements EmployeeDAO_interface{
	
	//建立連線池
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
		//新增員工(含圖片)
		private static final String INSERT_STMT = "INSERT INTO EMPLOYEE VALUES ('E'||LPAD(to_char(EMPNO_SEQ.NEXTVAL),3,'0'),?,?,?,?,?)";
		//列出所有員工(密碼未亂數設定)
		private static final String GET_ALL_STMT = "SELECT EMPNO,ENAME,EACC,EPSW,ESTA FROM EMPLOYEE ORDER BY EMPNO";
		//列出單一員工(基本不用)
		private static final String GER_ONE_STMT = "SELECT EMPNO,ENAME,EACC,EPSW,ESTA FROM EMPLOYEE WHERE EMPNO = ?";
		//刪除員工(基本不用)
		private static final String DELETE = "DELETE FROM EMPLOYEE WHERE EMPNO = ? ";
		//修改員工資料(主要權限更動)
		private static final String UPDATE_STA = "UPDATE EMPLOYEE SET ENAME = ? , EACC = ? , EPSW = ? , ESTA = ?  WHERE EMPNO = ? ";
		
		@Override
		public void insertEmp(EmployeeVO EmployeeVO) {
			
			Connection con = null ;
			PreparedStatement pstmt = null ;
				
				try {		
					con = ds.getConnection();
					pstmt = con.prepareStatement(INSERT_STMT);
					
					pstmt.setString(1, EmployeeVO.getEname());
					pstmt.setString(2, EmployeeVO.getEacc());
					pstmt.setString(3, EmployeeVO.getEpsw());
					pstmt.setBytes(4, EmployeeVO.getEpic());
					pstmt.setString(5, EmployeeVO.getEsta());
					
					pstmt.executeUpdate();
				}  catch (SQLException se) {
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
				con = ds.getConnection();
				pstmt = con.prepareStatement(UPDATE_STA);
				
				pstmt.setString(1, EmployeeVO.getEname());
				pstmt.setString(2, EmployeeVO.getEacc());
				pstmt.setString(3, EmployeeVO.getEpsw());
				pstmt.setString(4, EmployeeVO.getEsta());
				pstmt.setString(5, EmployeeVO.getEmpno());
				
				pstmt.executeUpdate();
			}  catch (SQLException se) {
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
				con = ds.getConnection();
				pstmt = con.prepareStatement(DELETE);
				
				pstmt.setString(1, empno);
				pstmt.executeUpdate();
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
				con = ds.getConnection();
				pstmt = con.prepareStatement(GER_ONE_STMT);
				
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
			}  catch (SQLException se) {
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
				con = ds.getConnection();
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
			}  catch (SQLException se) {
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
	}

