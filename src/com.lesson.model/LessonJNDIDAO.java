package com.lesson.model;

import java.io.*;
import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.json.*;

import test.expertise.model.ExpertiseVO;

public class LessonJNDIDAO implements LessonDAO_interface {
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

	private static final String INSERT_STMT = "INSERT INTO LESSON VALUES ('L'||LPAD(to_char(LESSNO_seq.NEXTVAL), 3, '0'),?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	private static final String UPDATE_STMT = "UPDATE LESSON SET LESSNAME=?,LESSMAX=?,LESSMIN=?,LESSTYPE=?,LESSLOC=?,LESSPRICE=?,LESSDESC=?,LESSSTART=?,LESSEND=?,LESSSTA=?,LESSTIMES=?,LESSPIC=? WHERE LESSNO=?";
	private static final String GET_TYPE_STMT = "SELECT * FROM LESSON WHERE LESSTYPE=?";
	private static final String Get_ExpByExpno_STMT = "SELECT * FROM EXPERTISE";
	private static final String GET_ALL = "SELECT * FROM LESSON ";
	private static final String GET_CoachAllLesson_STMT = "SELECT * FROM LESSON JOIN LESSON_DETAIL ON LESSON_DETAIL.LESSNO=LESSON.LESSNO JOIN LESSON_TIME ON LESSON_TIME.LTIME_NO=LESSON_DETAIL.LTIME_NO WHERE COANO=?";
	private static final String Get_CoachLesson = "SELECT * FROM LESSON WHERE COANO=?";
	private static final String Get_OneByPK = "SELECT * FROM LESSON WHERE LESSNO=?";

	@Override
	public void insert(LessonVO lessonVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, lessonVO.getCoano());
			pstmt.setString(2, lessonVO.getLessname());
			pstmt.setInt(3, lessonVO.getLessmax());
			pstmt.setInt(4, lessonVO.getLessmin());

			pstmt.setInt(5, lessonVO.getLesscur());
			pstmt.setString(6, lessonVO.getLesstype());
			pstmt.setString(7, lessonVO.getLessloc());
			pstmt.setInt(8, lessonVO.getLessprice());
			pstmt.setString(9, lessonVO.getLessdesc());

			pstmt.setDate(10, lessonVO.getLessstart());
			pstmt.setDate(11, lessonVO.getLessend());
			pstmt.setString(12, lessonVO.getLesssta());
			pstmt.setInt(13, lessonVO.getLesstimes());
			pstmt.setBytes(14, lessonVO.getLesspic());

			pstmt.executeUpdate();

			// Handle any driver errors
		
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

			con = ds.getConnection();
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

			pstmt.setString(13, lessonVO.getLessno());

			pstmt.executeUpdate();

			// Handle any driver errors

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
	public List<LessonVO> findLessonByLessonType(String lesstype) {
		List<LessonVO> list = new ArrayList<LessonVO>();
		LessonVO lessonVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
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
				list.add(lessonVO);

			}

			// Handle any driver errors

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

		return list;
	}

	@Override
	public List<ExpertiseVO> getAllExpByExpno() {

		List<ExpertiseVO> list = new ArrayList<ExpertiseVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {


			con = ds.getConnection();
			pstmt = con.prepareStatement(Get_ExpByExpno_STMT);
			pstmt = con.prepareStatement(Get_ExpByExpno_STMT);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ExpertiseVO expVO = new ExpertiseVO();
				expVO.setExpno(rs.getString("expno"));
				expVO.setExpdesc(rs.getString("expdesc"));
				list.add(expVO);
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
		return list;
	}

	@Override
	public List<LessonVO> getAll() {
		List<LessonVO> list = new ArrayList<LessonVO>();
		LessonVO lessonVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

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
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_CoachAllLesson_STMT);

			pstmt.setString(1, coano);
			rs = pstmt.executeQuery();

			ResultSetMetaData metaData = (ResultSetMetaData) rs.getMetaData();
			int columnCount = metaData.getColumnCount();

			// 教練一堂課程=一個JSONObject 再把全部塞進JSONArray
			while (rs.next()) {
				JSONObject oneLesson = new JSONObject();

				for (int i = 1; i <= columnCount; i++) {
					try {
						oneLesson.put("lesson", rs.getString("lessno"));
						oneLesson.put("lessname", rs.getString("lessname"));
						oneLesson.put("lesscur", rs.getString("lesscur"));
						oneLesson.put("lessprice", rs.getInt("lessprice"));
						oneLesson.put("lesssta", rs.getString("lesssta"));
						oneLesson.put("lesstimes", rs.getInt("lesstimes"));
						oneLesson.put("ltime_date", rs.getDate("ltime_date"));
						oneLesson.put("ltime_ss", rs.getInt("ltime_ss"));
					} catch (JSONException e) {
						e.printStackTrace();
					}
				}
				allLessonArray.put(oneLesson);
			}
			// Handle any driver errors

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
		LessonJNDIDAO dao = new LessonJNDIDAO();
//
//		// 新增 (測試不放 可空的描述)
//		LessonVO testInsert = new LessonVO();
//		// 自生LESSNO
//		testInsert.setCoano("C004");
//		testInsert.setLessname("MV舞蹈");
//		testInsert.setLessmax(20);
//		testInsert.setLessmin(5);
//
//		testInsert.setLesscur(0);// 改可空
//		testInsert.setLesstype("EXP004");
//		testInsert.setLessloc("大安森林公園");
//		testInsert.setLessprice(2000);
//		testInsert.setLessdesc(null);// 描述TEST
//
//		testInsert.setLessstart(java.sql.Date.valueOf("2020-07-01"));
//		testInsert.setLessend(java.sql.Date.valueOf("2020-07-10"));
//		testInsert.setLesssta("未成團");
//		testInsert.setLesstimes(10);
//		try {
//			byte[] pic = getPictureByteArray("WebContent/img/dance.jpg");
//			testInsert.setLesspic(pic);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//
//		dao.insert(testInsert);
//		System.out.println("新增成功");

		// 修改 (測試只改狀態為下架)
//		LessonVO testUpdate = new LessonVO();
//		testUpdate.setLessname("國標舞蹈");
//		testUpdate.setLessmax(10);
//		testUpdate.setLessmin(30);
//		testUpdate.setLesstype("EXP004");
//		testUpdate.setLessloc("春天舞蹈中心");
//		testUpdate.setLessprice(3000);
//		testUpdate.setLessdesc("國標舞蹈~~");
//		testUpdate.setLessstart(java.sql.Date.valueOf("2020-07-05"));
//		testUpdate.setLessend(java.sql.Date.valueOf("2020-07-15"));
//		testUpdate.setLesssta("成團拉");
//		testUpdate.setLesstimes(15);
//		testUpdate.setLessno("L011");
//		
//		dao.update(testUpdate);
//		System.out.println("修改成功");

		// 用類型查詢課程
//		List<LessonVO> testAll = dao.findLessonByLessonType("EXP003");
//		for(LessonVO allTypeLesson:testAll) {
//		System.out.println(allTypeLesson.getCoano());
//		System.out.println(allTypeLesson.getLessname());
//		System.out.println(allTypeLesson.getLesstype());
//		}

		// 用類型查出詳述描述
//		ExpertiseVO testGetTypeDesc = dao.getExpByExpno("EXP002");
//		System.out.println(testGetTypeDesc.getExpno());
//		System.out.println(testGetTypeDesc.getExpdesc());

		// 查詢全部課程
//		List<LessonVO> testAllLesson = dao.getAll();
//		for(LessonVO allLesson:testAllLesson) {
//			System.out.print(allLesson.getLessno()+",");
//			System.out.print(allLesson.getCoano()+",");
//			System.out.print(allLesson.getLessname()+",");
//			System.out.print(allLesson.getLesstype()+",");
//			System.out.println(allLesson.getLessprice()+",....");
//			System.out.println("----------------");
//		}				

		// 查詢某教練的課程資訊 印出JSONArray
//		JSONArray allLessonArray = dao.getCoachAllLesson("C002");
//		System.out.println(allLessonArray);

		List<LessonVO> CAllLesson = dao.getCoachLesson("C001");
		for(LessonVO allLesson:CAllLesson) {
			System.out.print(allLesson.getLessno()+",");
			System.out.print(allLesson.getCoano()+",");
			System.out.print(allLesson.getLessname()+",");
			System.out.print(allLesson.getLesstype()+",");
			System.out.println(allLesson.getLessprice()+",....");
			System.out.println("----------------");
		}			
		
	}

	public static byte[] getPictureByteArray(String path) throws IOException {
		File file = new File(path);// 傳進來的檔案路徑
		// 先把檔案讀進程式裡面
		FileInputStream fis = new FileInputStream(file);// 低階管相接
		ByteArrayOutputStream baos = new ByteArrayOutputStream();// BYTE陣列
		byte[] buffer = new byte[8192];
		int i;
		while ((i = fis.read(buffer)) != -1) {
			baos.write(buffer, 0, i);
		}
		baos.close();
		fis.close();

		return baos.toByteArray();// 就可以把圖片讀進來的位元資料 放進去BYTE陣列
	}

	@Override
	public List<LessonVO> getCoachLesson(String coano) {
		List<LessonVO> list = new ArrayList<LessonVO>();
		LessonVO lessonVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(Get_CoachLesson);
			pstmt.setString(1, coano);
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
	public LessonVO getOneByPK(String lessno) {
			LessonVO lessonVO = null;
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(Get_OneByPK);

				pstmt.setString(1, lessno);

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

}
