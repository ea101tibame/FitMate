package com.information.model;

import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class InformationDAO implements InformationDAO_interface {
	
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
		
		//新增消息
		public static final String INSERT_STMT = "INSERT INTO INFORMATION VALUES ('IN'||LPAD(to_char(INNO_SEQ.NEXTVAL),3,'0'),?,?)";
		//列出所有消息
		private static final String GET_ALL_STMT = "SELECT INNO , INDATE , INDESC FROM INFORMATION ORDER BY INNO";
		//列出單一消息(基本不用)
		private static final String GET_ONE_STMT = "SELECT INNO , INDATE , INDESC FROM INFORMATION WHERE INNO = ?";
		//刪除消息
		private static final String DELETE = "DELETE FROM INFORMATION WHERE INNO = ? ";
		//更新消息(配合排程)
		private static final String UPDATE = "UPDATE INFORMATION SET INDATE = ? , INDESC = ? WHERE INNO = ? ";
		
		@Override
		public void insertInfo(InformationVO InformationVO) {
			
			Connection con = null ;
			PreparedStatement pstmt = null ;
				
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(INSERT_STMT);
				
				pstmt.setDate(1, InformationVO.getIndate());
				pstmt.setString(2, InformationVO.getIndesc());
				
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
		public void modifyInfo(InformationVO InformationVO) {
			
			Connection con = null ;
			PreparedStatement pstmt = null ;
			
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(UPDATE);
				
				pstmt.setDate(1, InformationVO.getIndate());
				pstmt.setString(2, InformationVO.getIndesc());
				pstmt.setString(3, InformationVO.getInno());
				
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
		public void deleteInfo(String inno) {
			
			Connection con = null ;
			PreparedStatement pstmt = null ;
			
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(DELETE);
				
				pstmt.setString(1, inno);
				
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
		public InformationVO selectByInno(String inno) {
			
			Connection con = null ;
			PreparedStatement pstmt = null ;
			ResultSet rs = null ;
			InformationVO infVO = null ;
			
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(GET_ONE_STMT);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					infVO = new InformationVO();
					infVO.setInno(rs.getString("Inno"));
					infVO.setIndate(rs.getDate("Indate"));
					infVO.setIndesc(rs.getString("Indesc"));		
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
		public List<InformationVO> selectAllInfo() {
			
			List<InformationVO>inflist = new ArrayList<InformationVO>();
			Connection con = null ;
			PreparedStatement pstmt = null ;
			ResultSet rs = null ;
			InformationVO infVO = null ;
			
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(GET_ALL_STMT);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					infVO = new InformationVO();
					infVO.setInno(rs.getString("Inno"));
					infVO.setIndate(rs.getDate("Indate"));
					infVO.setIndesc(rs.getString("Indesc"));
					inflist.add(infVO);
				}
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
			return inflist;
		}
}