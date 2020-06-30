package com.redemption.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RedemptionJDBCDAO implements RedemptionDAO_interface{

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "EA101G5";
	String passwd = "123456";
	
	//點數兌換
	private static final String INSERT_STMT = "INSERT INTO REDEMPTION VALUES (to_char(sysdate,'yyyymmdd')||'-RED'||LPAD(to_char(DEPOSIT_SEQ.nextval), 3, '0'),?,CURRENT_TIMESTAMP,?,?)";
	//查單一教練所有兌換紀錄
	private static final String SELECT_ALL_BYCOANO = "SELECT * FROM REDEMPTION WHERE COANO = ?";
	
	@Override
	public List<RedemptionVO> selectAllRed(String coano) {
		
		RedemptionVO redVO = null ;
		Connection con = null ;
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		List<RedemptionVO> redlist = new ArrayList<RedemptionVO>();
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url,userid,passwd);
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
		return redlist;
	}

	@Override
	public void insertRed(RedemptionVO redVO) {
		
		Connection con = null ;
		PreparedStatement pstmt = null ;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url,userid,passwd);
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setString(1, redVO.getCoano());
			pstmt.setInt(2, redVO.getRedprice());
			pstmt.setString(3, redVO.getRedsta());
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
	
	//JDBC TEST OK
	public static void main(String[] args) {
		RedemptionJDBCDAO dao = new RedemptionJDBCDAO();
//		RedemptionVO redVO = new RedemptionVO();
//		redVO.setCaono("C002");
//		redVO.setRedprice(2000);
//		redVO.setRedsta("未處理");
//		dao.insertRed(redVO);
//		System.out.println("新增成功");
		
		List<RedemptionVO>redlist = dao.selectAllRed("C002");
		for(RedemptionVO red : redlist) {
			System.out.println(red.getRedno());
			System.out.println(red.getCoano());
			System.out.println(red.getReddate());
			System.out.println(red.getRedprice());
			System.out.println(red.getRedsta());
		}
	}
}