package com.lesson.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.mysql.jdbc.ResultSetMetaData;

public class LessonDAO implements LessonDAO_interface {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "FITMATE";
	String passwd = "123456";

	private static final String INSERT_STMT = "INSERT INTO LESSON"
			+ "VALUES ('L'||LPAD(to_char(LESSNO_seq.NEXTVAL), 3, '0'),?,?,?,? ,?,?,?,?,? ,?,?,?,?,?)";
	private static final String UPDATE_STMT = "UPDATE LESSON SET LESSNAME =?, LESSMAX =?, LESSMIN =?, LESSTYPE =?, LESSLOC =?, LESSPRICE =? ,LESSDESC =? , LESSSTART =?,LESSEND =?,LESSSTA =?,LESSTIMES=? LESSPIC=? WHERE LESSNO =?";
	private static final String GET_TYPE_STMT = "SELECT * FROM LESSON WHERE LESSTYPE=?";
	private static final String GET_ALL = "SELECT * FROM LESSON ";
	private static final String GET_CoachAllLesson_STMT = "SELECT *FROM LESSON "
			+ "JOIN LESSON_DETAIL ON LESSON_DETAIL.LESSNO=LESSON.LESSNO"
			+ "JOIN LESSON_TIME  ON LESSON_TIME.LTIME_NO=LESSON_DETAIL.LTIME_NO" + "WHERE COANO=?";

	@Override
	public void insert(LessonVO lessonVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			//pstmt.setString(1, lessonVO.getLessno()); 自動產生
			pstmt.setString(2, lessonVO.getCoano());
			pstmt.setString(3, lessonVO.getLessname());
			pstmt.setInt(4, lessonVO.getLessmax());
			pstmt.setInt(5, lessonVO.getLessmin());

			pstmt.setInt(6, lessonVO.getLesscur());
			pstmt.setString(7, lessonVO.getLesstype());
			pstmt.setString(8, lessonVO.getLessloc());
			pstmt.setInt(9, lessonVO.getLessprice());
			pstmt.setString(10, lessonVO.getLessdesc());

			pstmt.setDate(11, lessonVO.getLessstart());
			pstmt.setDate(12, lessonVO.getLessend());
			pstmt.setString(13, lessonVO.getLesssta());
			pstmt.setInt(14, lessonVO.getLesstimes());
			pstmt.setBytes(15, lessonVO.getLesspic());

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
	public void update(LessonVO lessonVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE_STMT);

			pstmt.setString(1, lessonVO.getLessname());
			pstmt.setInt(2, lessonVO.getLessmax());
			pstmt.setInt(3, lessonVO.getLessmin());
			pstmt.setString(4, lessonVO.getLesstype());
			pstmt.setString(5, lessonVO.getLessloc());
			pstmt.setInt(6, lessonVO.getLessprice());
			pstmt.setString(7, lessonVO.getLessdesc());
			pstmt.setDate(8, lessonVO.getLessstart());
			pstmt.setDate(9, lessonVO.getLessend());
			pstmt.setString(10, lessonVO.getLesssta());
			pstmt.setInt(11, lessonVO.getLesstimes());
			pstmt.setBytes(12, lessonVO.getLesspic());

			pstmt.setString(3, lessonVO.getLessno());

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
	public LessonVO findLessonByLessonType(String lesstype) {
		LessonVO lessonVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_TYPE_STMT);

			pstmt.setString(1, lesstype);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				lessonVO = new LessonVO();

				lessonVO.setLessno(rs.getString("lessno"));
				lessonVO.setCoano(rs.getString("coano"));
				lessonVO.setLessname(rs.getString("lessname"));
				lessonVO.setLessmax(rs.getInt("lessmax"));
				lessonVO.setLessmin(rs.getInt("lessmin"));

				lessonVO.setLesscur(rs.getInt("lesscur"));
				lessonVO.setLesstype(rs.getString("lesstype"));
				lessonVO.setLessloc(rs.getString("lessloc"));
				lessonVO.setLessprice(rs.getInt("lessprice"));
				lessonVO.setLessdesc(rs.getString("lessdesc"));

				lessonVO.setLessstart(rs.getDate("lessstart"));
				lessonVO.setLessend(rs.getDate("lessend"));
				lessonVO.setLesssta(rs.getString("lesssta"));
				lessonVO.setLesstimes(rs.getInt("lesstimes"));
				lessonVO.setLesspic(rs.getBytes("lesspic"));

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

		return lessonVO;
	}

	@Override
	public List<LessonVO> getAll() {
		List<LessonVO> list = new ArrayList<LessonVO>();
		LessonVO lessonVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				lessonVO = new LessonVO();

				lessonVO.setLessno(rs.getString("lessno"));
				lessonVO.setCoano(rs.getString("coano"));
				lessonVO.setLessname(rs.getString("lessname"));
				lessonVO.setLessmax(rs.getInt("lessmax"));
				lessonVO.setLessmin(rs.getInt("lessmin"));

				lessonVO.setLesscur(rs.getInt("lesscur"));
				lessonVO.setLesstype(rs.getString("lesstype"));
				lessonVO.setLessloc(rs.getString("lessloc"));
				lessonVO.setLessprice(rs.getInt("lessprice"));
				lessonVO.setLessdesc(rs.getString("lessdesc"));

				lessonVO.setLessstart(rs.getDate("lessstart"));
				lessonVO.setLessend(rs.getDate("lessend"));
				lessonVO.setLesssta(rs.getString("lesssta"));
				lessonVO.setLesstimes(rs.getInt("lesstimes"));
				lessonVO.setLesspic(rs.getBytes("lesspic"));

				list.add(lessonVO); // Store the row in the list
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
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

	@Override
	public JSONArray getCoachAllLesson(String coano) {
		JSONArray allLessonArray = new JSONArray();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_CoachAllLesson_STMT);

			pstmt.setString(1, coano);
			rs = pstmt.executeQuery();

			ResultSetMetaData metaData = (ResultSetMetaData) rs.getMetaData();
			int columnCount = metaData.getColumnCount();

			// 用字串接下全部資料 把每一筆JSONObject 塞進JSONArray
			while (rs.next()) {
				JSONObject oneLesson = new JSONObject();
				for (int i = 1; i <= columnCount; i++) {
					String columnName = metaData.getColumnLabel(i);
					String value = rs.getString(columnName);
					try {
						oneLesson.put(columnName, value);
					} catch (JSONException e) {
						e.printStackTrace();
					}
				}
				allLessonArray.put(oneLesson);
			}
			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
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

		return allLessonArray;
	}
	
	public static void main(String[] args) { 
		LessonDAO dao = new LessonDAO();
		
		//新增 (測試不放 可空的描述)
		LessonVO testInsert = new LessonVO();
		testInsert.setCoano("C004");
		testInsert.setLessname("MV舞蹈");
		testInsert.setLessmax(20);
		testInsert.setLessmin(5);
		testInsert.setLesscur(0);
		testInsert.setLesstype("EXP004");
		testInsert.setLessloc("大安森林公園");
		testInsert.setLessprice(2000);
		//testInsert.setLessdesc(null);
		testInsert.setLessstart(java.sql.Date.valueOf("2020-07-07"));
		
		
		//修改 (測試只改狀態為下架)
		
		//用類型查詢課程
		
		//查詢全部課程
		
		//查詢某教練的課程資訊 印出JSONArray
		
	}
}
