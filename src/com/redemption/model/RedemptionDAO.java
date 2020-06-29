package com.redemption.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class RedemptionDAO implements RedemptionDAO_interface{
	
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

		//點數兌換
		private static final String INSERT_STMT = "INSERT INTO REDEMPTION VALUES (to_char(sysdate,'yyyymmdd')||'-RED'||LPAD(to_char(DEPOSIT_SEQ.nextval), 3, '0'),?,CURRENT_TIMESTAMP,?,'審核中')";
		//查單一教練所有兌換紀錄(for教練)
		private static final String SELECT_ALL_BYCOANO = "SELECT * FROM REDEMPTION WHERE COANO = ?";
		//查教練所有兌換紀錄(for後台)
		private static final String SELECT_ALL = "SELECT * FROM REDEMPTION ORDER BY REDDATE DESC";
		//更改兌換狀態
		private static final String UPDATE_STA = "UPDATE REDEMPTION SET REDSTA = '已審核' WHERE REDNO = ?";
		
		@Override
		public List<RedemptionVO> selectAllRed(String coano) {
			
			RedemptionVO redVO = null ;
			Connection con = null ;
			PreparedStatement pstmt = null ;
			ResultSet rs = null ;
			List<RedemptionVO> redlist = new ArrayList<RedemptionVO>();
			
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(SELECT_ALL_BYCOANO);
				pstmt.setString(1, coano);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					redVO = new RedemptionVO();
					redVO.setRedno(rs.getString("redno"));
					redVO.setCoano(rs.getString("coano"));
					redVO.setReddate(rs.getTimestamp("reddate"));
					redVO.setRedprice(rs.getInt("redprice"));
					redVO.setRedsta(rs.getString("redsta"));
					redlist.add(redVO);
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
			return redlist;
		}

		@Override
		public void insertRed(RedemptionVO redVO) {
			
			Connection con = null ;
			PreparedStatement pstmt = null ;
			
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(INSERT_STMT);
				
				pstmt.setString(1, redVO.getCoano());
				pstmt.setInt(2, redVO.getRedprice());
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
		public List<RedemptionVO> selectAll() {
			
			RedemptionVO redVO = null ;
			Connection con = null ;
			PreparedStatement pstmt = null ;
			ResultSet rs = null ;
			List<RedemptionVO> redlist = new ArrayList<RedemptionVO>();
			
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(SELECT_ALL);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					redVO = new RedemptionVO();
					redVO.setRedno(rs.getString("redno"));
					redVO.setCoano(rs.getString("coano"));
					redVO.setReddate(rs.getTimestamp("reddate"));
					redVO.setRedprice(rs.getInt("redprice"));
					redVO.setRedsta(rs.getString("redsta"));
					redlist.add(redVO);
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
			return redlist;
		}

		@Override
		public void updateSta(String redno) {
			
			Connection con = null ;
			PreparedStatement pstmt = null ;
			
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(UPDATE_STA);
				pstmt.setString(1, redno);
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
	
	
}
