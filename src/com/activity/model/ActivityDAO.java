package com.activity.model;

import java.util.*;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.expertise.model.ExpertiseVO;

import java.sql.*;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

public class ActivityDAO implements ActivityDAO_interface {
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
	private static final String GET_TYPE_PSTMT = "SELECT * FROM expertise where expno=?";
	private static final String GET_CoachAllActivity_PSTMT = "SELECT actno,actname,actloc,to_char(actdate,'yyyy-mm-dd')actdate,actss,acttype,actprice,actcur,actdesc,actsta,stuno FROM activity where coano=?";

/*基本---------------------------------------*/	
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

/*變化---------------------------------------*/
// 全部查詢 由教練編號找到全部活動放入課表(轉JSON格式)
	@Override
	public JSONArray getAllToCoachTable(String coano) {
		JSONArray allActivityArray = new JSONArray();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_CoachAllActivity_PSTMT);
			pstmt.setString(1, coano);
			rs = pstmt.executeQuery();
			
			ResultSetMetaData metadata = (ResultSetMetaData) rs.getMetaData();
			int columncount = metadata.getColumnCount();
			while (rs.next()) {
				JSONObject oneActivity = new JSONObject();
				for (int i = 1; i <= columncount; i++) {
					
					oneActivity.put("actno", rs.getString("actno"));
					oneActivity.put("actname", rs.getString("actname"));
					oneActivity.put("actloc", rs.getString("actloc"));
					oneActivity.put("actdate", rs.getDate("actdate"));
					oneActivity.put("actss", rs.getString("actss"));
					oneActivity.put("acttype", rs.getString("acttype"));
					oneActivity.put("actprice", rs.getString("actprice"));
					oneActivity.put("actcur", rs.getString("actcur"));
					oneActivity.put("actdesc", rs.getString("actdesc"));
					oneActivity.put("actsta", rs.getString("actsta"));
					oneActivity.put("stuno", rs.getString("stuno"));
					allActivityArray.put(oneActivity);
					
				}
			}
			
		} catch (JSONException je) {
			je.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException se) {
			se.printStackTrace();
			
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
		return allActivityArray;
		
	}

// 單一查詢 由專長編號找到專長說明
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

			while (rs.next()) {
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

		return expVO;
	}

/*自定義方法-----------------------------------*/
//傳圖片進資料庫方法
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

}
