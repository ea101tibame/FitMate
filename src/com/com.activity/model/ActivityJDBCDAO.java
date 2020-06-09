package com.activity.model;

import java.util.*;

import com.expertise.model.ExpertiseVO;

import java.sql.*;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

public class ActivityJDBCDAO implements ActivityDAO_interface {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "EA101G5";
	String passwd = "EA101G5";

	private static final String INSERT_PSTMT = "INSERT INTO　ACTIVITY (actno,actname,actloc,actdate,actss,actstart,actend,acttype,actprice,actmin,actmax,actcur,actdesc,actsta,actpic,stuno,coano)"
			+ "VALUES ('A'||LPAD(to_char(ACTIVITY_seq.NEXTVAL), 3, '0'), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String GET_ALL_PSTMT = "SELECT actno,actname,actloc,to_char(actdate,'yyyy-mm-dd')actdate,actss,to_char(actstart,'yyyy-mm-dd')actstart,to_char(actend,'yyyy-mm-dd')actend,acttype,actprice,actmin,actmax,actcur,actdesc,actsta,actpic,stuno,coano FROM activity order by actno";
	private static final String GET_ONE_PSTMT = "SELECT actno,actname,actloc,to_char(actdate,'yyyy-mm-dd')actdate,actss,to_char(actstart,'yyyy-mm-dd')actstart,to_char(actend,'yyyy-mm-dd')actend,acttype,actprice,actmin,actmax,actcur,actdesc,actsta,actpic,stuno,coano FROM activity where actno = ?";
	private static final String DELETE = "DELETE　FROM activity where actno = ?";
	private static final String UPDATE = "UPDATE activity set actname=?,actloc=?,actdate=?,actss=?,actstart=?,actend=?,acttype=?,actprice=?,actmin=?,actmax=?,actcur=?,actdesc=?,actsta=?,actpic=?,stuno=?,coano=? where actno = ?";
	private static final String GET_TYPE_PSTMT = "select * from expertise where expno=?";
	
//	新增
	@Override
	public void insert(ActivityVO actVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_PSTMT);

			pstmt.setString(1, actVO.getActname());
			pstmt.setString(2, actVO.getActloc());
			pstmt.setDate(3, actVO.getActdate());
			pstmt.setString(4, actVO.getActss());
			pstmt.setDate(5, actVO.getActstart());
			pstmt.setDate(6, actVO.getActend());
			pstmt.setString(7, actVO.getActtype());
			pstmt.setDouble(8, actVO.getActprice());
			pstmt.setInt(9, actVO.getActmin());
			pstmt.setInt(10, actVO.getActmax());
			pstmt.setInt(11, actVO.getActcur());
			pstmt.setString(12, actVO.getActdesc());
			pstmt.setString(13, actVO.getActsta());
			pstmt.setBytes(14, actVO.getActpic());
			pstmt.setString(15, actVO.getStuno());
			pstmt.setString(16, actVO.getCoano());

			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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

//  修改
	@Override
	public void update(ActivityVO actVO) {

		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, actVO.getActname());
			pstmt.setString(2, actVO.getActloc());
			pstmt.setDate(3, actVO.getActdate());
			pstmt.setString(4, actVO.getActss());
			pstmt.setDate(5, actVO.getActstart());
			pstmt.setDate(6, actVO.getActend());
			pstmt.setString(7, actVO.getActtype());
			pstmt.setDouble(8, actVO.getActprice());
			pstmt.setInt(9, actVO.getActmin());
			pstmt.setInt(10, actVO.getActmax());
			pstmt.setInt(11, actVO.getActcur());
			pstmt.setString(12, actVO.getActdesc());
			pstmt.setString(13, actVO.getActsta());
			pstmt.setBytes(14, actVO.getActpic());
			pstmt.setString(15, actVO.getStuno());
			pstmt.setString(16, actVO.getCoano());
			pstmt.setString(17, actVO.getActno());

			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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

//	刪除
	@Override
	public void delete(String actno) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, actno);

			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Could't load database driver." + e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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

//  單一查詢	
	@Override
	public ActivityVO findByPrimaryKey(String actno) {

		ActivityVO actVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_PSTMT);

			pstmt.setString(1, actno);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				actVO = new ActivityVO();
				actVO.setActno(rs.getString("actno"));
				actVO.setActname(rs.getString("actname"));
				actVO.setActloc(rs.getString("actloc"));
				actVO.setActdate(rs.getDate("actdate"));
				actVO.setActss(rs.getString("actss"));
				actVO.setActstart(rs.getDate("actstart"));
				actVO.setActend(rs.getDate("actend"));
				actVO.setActtype(rs.getString("acttype"));
				actVO.setActprice(rs.getInt("actprice"));
				actVO.setActmin(rs.getInt("actmin"));
				actVO.setActmax(rs.getInt("actmax"));
				actVO.setActcur(rs.getInt("actcur"));
				actVO.setActdesc(rs.getString("actdesc"));
				actVO.setActsta(rs.getString("actsta"));
				actVO.setActpic(rs.getBytes("actpic"));
				actVO.setStuno(rs.getString("stuno"));
				actVO.setCoano(rs.getString("coano"));
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
		return actVO;
	}

//  全部查詢	
	@Override
	public List<ActivityVO> getAll() {
		List<ActivityVO> list = new ArrayList<ActivityVO>();

		ActivityVO actVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_PSTMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				actVO = new ActivityVO();
				actVO.setActno(rs.getString("actno"));
				actVO.setActname(rs.getString("actname"));
				actVO.setActloc(rs.getString("actloc"));
				actVO.setActdate(rs.getDate("actdate"));
				actVO.setActss(rs.getString("actss"));
				actVO.setActstart(rs.getDate("actstart"));
				actVO.setActend(rs.getDate("actend"));
				actVO.setActtype(rs.getString("acttype"));
				actVO.setActprice(rs.getInt("actprice"));
				actVO.setActmin(rs.getInt("actmin"));
				actVO.setActmax(rs.getInt("actmax"));
				actVO.setActcur(rs.getInt("actcur"));
				actVO.setActdesc(rs.getString("actdesc"));
				actVO.setActsta(rs.getString("actsta"));
				actVO.setActpic(rs.getBytes("actpic"));
				actVO.setStuno(rs.getString("stuno"));
				actVO.setCoano(rs.getString("coano"));
				list.add(actVO);
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
	//單一查詢 由專長編號找到專長描述
	@Override
	public ExpertiseVO findByExpertise(String expno) {
		ExpertiseVO expVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_TYPE_PSTMT);
			pstmt.setString(1, expno);
			
			
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				expVO = new ExpertiseVO();
				expVO.setExpno(rs.getString("expno"));
				expVO.setExpdesc(rs.getString("expdesc"));
			}
			
			
			expVO.getExpdesc();
			System.out.println(expVO.getExpdesc());
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
		

		return expVO;
	}
	
	@Override
	public List<ActivityVO> getAllToCoachTable() {
		
		return null;
	}
	

	public static byte[] getPictureByteArray(String path) throws IOException {
		File file = new File(path);
		FileInputStream fis = new FileInputStream(file);
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		byte[] buffer = new byte[8192];
		int i;
		while ((i = fis.read(buffer)) != -1) {
			baos.write(buffer, 0, i);
		}
		baos.close();
		fis.close();

		return baos.toByteArray();
	}

	public static void main(String[] args) {

		ActivityJDBCDAO dao = new ActivityJDBCDAO();

//		新增測試
//		ActivityVO actVO1 = new ActivityVO();
//		actVO1.setActname("離島潛水");
//		actVO1.setActloc("綠島");
//		actVO1.setActdate(java.sql.Date.valueOf("2020-06-05"));
//		actVO1.setActss("下午");
//		actVO1.setActstart(java.sql.Date.valueOf("2020-05-01"));
//		actVO1.setActend(java.sql.Date.valueOf("2020-06-01"));
//		actVO1.setActtype("戶外運動");
//		actVO1.setActprice(4500);
//		actVO1.setActmin(5);
//		actVO1.setActmax(20);
//		actVO1.setActcur(1);
//		actVO1.setActdesc("離島悠游潛水");
//		actVO1.setActsta("未上架");
//		try {
//			byte[] pic = getPictureByteArray("WebContent/image/PIC3.PNG");
//			actVO1.setActpic(pic);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		actVO1.setStuno("S010");
//		actVO1.setCoano("C010");
//		dao.insert(actVO1);
//		System.out.println("新增成功");

//		修改測試
//		ActivityVO actVO2 = new ActivityVO();
//		actVO2.setActno("A013");
//		actVO2.setActname("龍洞攀岩");
//		actVO2.setActloc("新北貢寮龍洞");
//		actVO2.setActdate(java.sql.Date.valueOf("2020-6-29"));
//		actVO2.setActss("下午");
//		actVO2.setActstart(java.sql.Date.valueOf("2020-6-8"));
//		actVO2.setActend(java.sql.Date.valueOf("2020-6-22"));
//		actVO2.setActtype("戶外運動");
//		actVO2.setActprice(1700);
//		actVO2.setActmin(6);
//		actVO2.setActmax(30);
//		actVO2.setActcur(1);
//		actVO2.setActdesc("東北角龍洞攀岩");
//		actVO2.setActsta("未上架");
//		actVO2.setStuno("S010");
//		actVO2.setCoano("C005");
//		dao.update(actVO2);
//		System.out.println("修改成功");

//		刪除測試
//		dao.delete("A018");
//		System.out.println("刪除成功");

//		查詢單筆測試
//		ActivityVO actVO3 = dao.findByPrimaryKey("A001");
//		System.out.print(actVO3.getActno() + ",");
//		System.out.print(actVO3.getActname() + ",");
//		System.out.print(actVO3.getActloc() + ",");
//		System.out.print(actVO3.getActdate() + ",");
//		System.out.print(actVO3.getActss() + ",");
//		System.out.print(actVO3.getActstart() + ",");
//		System.out.print(actVO3.getActend() + ",");
//		System.out.print(actVO3.getActtype() + ",");
//		System.out.print(actVO3.getActprice() + ",");
//		System.out.print(actVO3.getActmin() + ",");
//		System.out.print(actVO3.getActmax() + ",");
//		System.out.print(actVO3.getActcur() + ",");
//		System.out.print(actVO3.getActdesc() + ",");
//		System.out.print(actVO3.getActsta() + ",");
//		System.out.print(actVO3.getStuno() + ",");
//		System.out.println(actVO3.getCoano() + ",");
//		System.out.println("查詢單筆成功");

//		查詢多筆測試
//		List<ActivityVO> list = dao.getAll();
//		for (ActivityVO actVO4 : list) {
//			System.out.print(actVO4.getActno() + ",");
//			System.out.print(actVO4.getActname() + ",");
//			System.out.print(actVO4.getActloc() + ",");
//			System.out.print(actVO4.getActdate() + ",");
//			System.out.print(actVO4.getActss() + ",");
//			System.out.print(actVO4.getActstart() + ",");
//			System.out.print(actVO4.getActend() + ",");
//			System.out.print(actVO4.getActtype() + ",");
//			System.out.print(actVO4.getActprice() + ",");
//			System.out.print(actVO4.getActmin() + ",");
//			System.out.print(actVO4.getActmax() + ",");
//			System.out.print(actVO4.getActcur() + ",");
//			System.out.print(actVO4.getActdesc() + ",");
//			System.out.print(actVO4.getActsta() + ",");
//			System.out.print(actVO4.getStuno() + ",");
//			System.out.println(actVO4.getCoano() + ",");
//			System.out.println("查詢多筆成功");
//		}
		//單一查詢由專長編號找專長敘述
		ExpertiseVO expVO1 = dao.findByExpertise("EXP001");
		System.out.print(expVO1.getExpno());
		System.out.println("單一查詢由專長編號找專長敘述成功");
		
	}

}
