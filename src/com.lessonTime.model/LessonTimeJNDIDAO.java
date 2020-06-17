package com.lessonTime.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.lessonDetail.model.LessonDetailJDBCDAO;
import com.lessonDetail.model.LessonDetailVO;



public class LessonTimeJNDIDAO implements LessonTimeDAO_inrterface{
	// 一個應用程式中,針對一個資料庫 ,共用一個DataSource即可
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private static final String INSERT="INSERT INTO LESSON_TIME VALUES ('LT'||LPAD(to_char(LTIME_NO_seq.NEXTVAL), 3, '0'),?,?)";
	private static final String UPDATE = "UPDATE LESSON_TIME set LTIME_DATE =?, LTIME_SS=? where LTIME_NO =? ";
	private static final String DELETE_LessonDetail = "DELETE FROM LESSON_DETAIL where LTIME_NO =?";
	private static final String DELETE_LessonTime = "DELETE FROM LESSON_TIME where LTIME_NO =?";	
	private static final String GET_ONE="SELECT * FROM LESSON_TIME where LTIME_NO =?";
	private static final String GET_ALL="SELECT * FROM LESSON_TIME";
	private static final String GET_CoachAlltimes = "SELECT LTIME_DATE,LTIME_SS FROM LESSON JOIN LESSON_DETAIL ON LESSON_DETAIL.LESSNO=LESSON.LESSNO JOIN LESSON_TIME ON LESSON_TIME.LTIME_NO=LESSON_DETAIL.LTIME_NO WHERE COANO=?";

	@Override
	public void insert(LessonTimeVO LessonTimeVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT);
						
			pstmt.setDate(1, LessonTimeVO.getLtime_date());
			pstmt.setString(2, LessonTimeVO.getLtime_ss());

			pstmt.executeUpdate();

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
	public void update(LessonTimeVO LessonTimeVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setDate(1, LessonTimeVO.getLtime_date());
			pstmt.setString(2, LessonTimeVO.getLtime_ss());
			pstmt.setString(3, LessonTimeVO.getLtime_no());

			pstmt.executeUpdate();
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
	public void delete(String ltime_no) {
		int updateCount_ltime_no = 0;

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();

			// 1●設定於 pstm.executeUpdate()之前
			con.setAutoCommit(false);

			// 先刪除明細
			pstmt = con.prepareStatement(DELETE_LessonDetail);
			pstmt.setString(1, ltime_no);
			updateCount_ltime_no = pstmt.executeUpdate();
			// 再刪除時段
			pstmt = con.prepareStatement(DELETE_LessonTime);
			pstmt.setString(1, ltime_no);
			pstmt.executeUpdate();

			// 2●設定於 pstm.executeUpdate()之後
			con.commit();
			con.setAutoCommit(true);
			System.out.println("刪除時段編號" +ltime_no + ",共有明細" + updateCount_ltime_no
					+ "筆數同時被刪除");
			
			// Handle any SQL errors
		} catch (SQLException se) {
			if (con != null) {
				try {
					// 3●設定於當有exception發生時之catch區塊內
					con.rollback();
				} catch (SQLException excep) {
					throw new RuntimeException("rollback error occured. "
							+ excep.getMessage());
				}
			}
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
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
	public LessonTimeVO findByPrimaryKey(String ltime_no) {
		LessonTimeVO LessonTimeVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE);

			pstmt.setString(1, ltime_no);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				LessonTimeVO = new LessonTimeVO();
				LessonTimeVO.setLtime_no(rs.getString("ltime_no"));
				LessonTimeVO.setLtime_date(rs.getDate("ltime_date"));
				LessonTimeVO.setLtime_ss(rs.getString("ltime_ss"));
			}

			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
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
		return LessonTimeVO;
	}
	@Override
	public List<LessonTimeVO> getAll() {
		List<LessonTimeVO> list= new ArrayList<LessonTimeVO>();
		LessonTimeVO LessonTimeVO =null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				LessonTimeVO = new LessonTimeVO();
				LessonTimeVO.setLtime_no(rs.getString("ltime_no"));
				LessonTimeVO.setLtime_date(rs.getDate("ltime_date"));
				LessonTimeVO.setLtime_ss(rs.getString("ltime_ss"));
				list.add(LessonTimeVO); // Store the row in the list
			}


			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
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
		JSONArray allLessonTimeArray = new JSONArray();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = con.prepareStatement(GET_CoachAlltimes);

			pstmt.setString(1, coano);
			rs = pstmt.executeQuery();

			ResultSetMetaData metaData = (ResultSetMetaData) rs.getMetaData();
			int columnCount = metaData.getColumnCount();

			// 教練一堂課程=一個JSONObject 再把全部塞進JSONArray
			while (rs.next()) {
				JSONObject oneTime = new JSONObject();
				
				for (int i = 1; i <= columnCount; i++) {
					try {
						oneTime.put("ltime_date", rs.getDate("ltime_date"));
						oneTime.put("ltime_ss", rs.getString("ltime_ss"));
					} catch (JSONException e) {
						e.printStackTrace();
					}
				}
				allLessonTimeArray.put(oneTime);
			}
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

		return allLessonTimeArray;
	}

	public static void main(String[] args) {
	LessonTimeJNDIDAO dao = new LessonTimeJNDIDAO();
//	
	LessonTimeVO testInsert = new LessonTimeVO();
	
	testInsert.setLtime_date(java.sql.Date.valueOf("2020-07-01"));
	testInsert.setLtime_ss("早上");
	dao.insert(testInsert);
	
	testInsert.setLtime_date(java.sql.Date.valueOf("2020-07-02"));
	testInsert.setLtime_ss("早上");
	dao.insert(testInsert);
	
	testInsert.setLtime_date(java.sql.Date.valueOf("2020-07-03"));
	testInsert.setLtime_ss("早上");
	dao.insert(testInsert);
	
	System.out.println("新增成功");
	
	LessonTimeVO testUpdate = new LessonTimeVO();
	testUpdate.setLtime_date(java.sql.Date.valueOf("2020-07-02"));
	testUpdate.setLtime_ss("下午");
	testUpdate.setLtime_no("LT033");
	dao.update(testUpdate);
	System.out.println("修改成功");
	
	//同時刪除
	dao.delete("LT010");
	System.out.println("刪除成功");

	List<LessonTimeVO> list = dao.getAll();
		for (LessonTimeVO aLT : list) {
			System.out.print(aLT.getLtime_no() + ",");
			System.out.print(aLT.getLtime_date() + ",");
			System.out.print(aLT.getLtime_ss());
			System.out.println();
		}
	
	LessonTimeVO testFindOne =dao.findByPrimaryKey("LT001");
	System.out.println(testFindOne.getLtime_no());
	System.out.println(testFindOne.getLtime_date());
	System.out.println(testFindOne.getLtime_ss());
	
	JSONArray allLessonTimeArray = dao.getCoachAllLesson("C001");
	System.out.println(allLessonTimeArray);
	}


	
}
