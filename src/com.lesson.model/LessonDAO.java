package com.lesson.model;

import java.io.*;
import java.sql.*;
import java.util.*;
import org.json.*;


import test.expertise.model.ExpertiseVO;
// 同時新增 時段跟明細
public class LessonDAO implements LessonDAO_interface {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "EA101G5";
	String passwd = "123456";

	private static final String INSERT_STMT = "INSERT INTO LESSON VALUES ('L'||LPAD(to_char(LESSNO_seq.NEXTVAL), 3, '0'),?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	private static final String UPDATE_STMT = "UPDATE LESSON SET LESSNAME=?,LESSMAX=?,LESSMIN=?,LESSTYPE=?,LESSLOC=?,LESSPRICE=?,LESSDESC=?,LESSSTART=?,LESSEND=?,LESSSTA=?,LESSTIMES=?,LESSPIC=? WHERE LESSNO=?";
	private static final String GET_TYPE_STMT = "SELECT * FROM LESSON WHERE LESSTYPE=?";
	private static final String GET_ExpByExpno_STMT= "SELECT * FROM EXPERTISE WHERE EXPNO=?";
	private static final String GET_ALL = "SELECT * FROM LESSON ";
	private static final String GET_CoachAllLesson_STMT = "SELECT * FROM LESSON JOIN LESSON_DETAIL ON LESSON_DETAIL.LESSNO=LESSON.LESSNO JOIN LESSON_TIME ON LESSON_TIME.LTIME_NO=LESSON_DETAIL.LTIME_NO WHERE COANO=?";
	private static final String INSERT_LessonTime_STMT="INSERT INTO LESSON_TIME VALUES ('LT'||LPAD(to_char(LTIME_NO_seq.NEXTVAL), 3, '0'),?,?)";
	private static final String INSERT_LessonDetail="INSERT INTO LESSON_DETAIL VALUES (?,?)";
	private static final String GET_ALessonByLessno_STMT="SELECT * FROM LESSON WHERE LESSNO=?";
	
	
	private static void addLessonTime(Connection con,String next_lessNo) {
		PreparedStatement pstmt = null;
		
		try {
/*
			//想拿到課程堂數 再用日期去判斷+7日 變成循環每周 但  這個新增的 東西但尚未COMMIT拿不到
//			LessonDAO dao = new LessonDAO();//新增完還未COMMIT 拿不到
//			LessonVO les = dao.getALessonByLessno(next_lessNo);
//			System.out.println("next_lessNo="+next_lessNo);
//			System.out.println("lestimes="+les.getLesstimes());
//			int Lesstimes = les.getLesstimes();
//			System.out.println("Lesstimes="+Lesstimes);
//			pstmt = con.prepareStatement(INSERT_LessonTime_STMT);
//			
//			for(int i=1;i<=Lesstimes;i++) {
//			Date firsttime = new Date(2020-07-01);
//			Long tmp = firsttime.getTime();
//			Long weeksec = 7*24*60*60*1000L;
//			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//			String AllClassDay = sdf.format(new Date(tmp));;
//				
//			pstmt.setString(1,AllClassDay);//上課程日期
//			
//			pstmt.setInt(2, 1);//時段
//			pstmt.executeUpdate();
//			
//			tmp =tmp+weeksec;
			// 清空裡面參數，重覆使用已取得的PreparedStatement物件
//			pstmt.clearParameters();
//			}
//			pstmt.setString(1,"2020-07-02");//上課程日期
//			pstmt.setInt(2, 2);//時段			
//			pstmt.executeUpdate();
*/	
			
			String next_ltime_no = null;
			String daystr = null;
			String day[]= {"2020-06-06","2020-06-07","2020-06-08","2020-06-06","2020-06-09"};
			for(int i = 0; i<day.length ;i++) {
				String cols[] = {"LTIME_NO"};
			
			pstmt = con.prepareStatement(INSERT_LessonTime_STMT,cols);
			daystr = day[i];
			pstmt.setDate(1,java.sql.Date.valueOf(daystr));//上課程日期
			pstmt.setInt(2, 1);//時段
			
			pstmt.executeUpdate();
			
			
			// 清空裡面參數，重覆使用已取得的PreparedStatement物件
			pstmt.clearParameters();

			
			// 取得對應的自增主鍵值
			ResultSet rs = pstmt.getGeneratedKeys();//拿出pstmt = con.prepareStatement(INSERT_ORDER, cols);剛剛新增的訂單編號
			ResultSetMetaData rsmd = rs.getMetaData();
			int columnCount = rsmd.getColumnCount();
			if (columnCount!=0) {//游標往下
				while (rs.next()){
					for (int j = 1; j <= columnCount; j++) {
					next_ltime_no = rs.getString(j);
					System.out.println("自增主鍵值 = " + next_ltime_no + "(剛新增成功的時段編號)");
					System.out.println("新增第"+(i+1)+"筆時間到"+next_ltime_no);
					}
				} 
			} else {
					System.out.println("未取得自增主鍵值");
			}
				rs.close();
			
				// 再同時新增課程明細		
			addLessonDetail(con,next_lessNo,next_ltime_no);
			}
			// Handle any SQL errors
		} catch (SQLException se) {
			try {
				// 發生例外即進行rollback動作
				con.rollback();//新增時段失敗 撤回
			} catch (SQLException e) {
				e.printStackTrace();
			}
			se.printStackTrace();
			// Clean up JDBC resources
		} finally {//先不能關連線  還要用!
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
		}
	}
	
	private static void addLessonDetail(Connection con, String next_lessNo,String next_ltime_no) {
		PreparedStatement pstmt = null;
		
		try {
			pstmt = con.prepareStatement(INSERT_LessonDetail);
			
			pstmt.setString(1,next_lessNo);
			pstmt.setString(2,next_ltime_no);
			pstmt.executeUpdate();
		} catch (SQLException se) {
			try {
				// 發生例外即進行rollback動作
				con.rollback();//新增時段失敗 撤回
			} catch (SQLException e) {
				e.printStackTrace();
			}
			se.printStackTrace();
			// Clean up JDBC resources
		} finally {//先不能關連線 還要用!
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
		}
	}
	
	@Override
	public void insert(LessonVO lessonVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String next_lessNo = null;
		
		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			// 1.設定於pstmt.executeUpdate()之前
			con.setAutoCommit(false);//開始交易
			// 先新增課程
			String cols[] = {"LESSNO"};
			pstmt = con.prepareStatement(INSERT_STMT,cols);
			
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
			
			// 取得對應的自增主鍵值 LESSNO
			ResultSet rs = pstmt.getGeneratedKeys();
			
			if (rs.next()) {
				next_lessNo = rs.getString(1);
				System.out.println("自增主鍵值 = " + next_lessNo + "(剛新增成功的課程編號)");
			} else {
				System.out.println("未取得自增主鍵值");
			}
			rs.close();
			
			// 再同時新增課程時段內容
			addLessonTime(con,next_lessNo);

			pstmt.close();
			con.commit();
			con.setAutoCommit(true);//交易結束
			System.out.println("Operation success!");
						
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

			pstmt.setString(13, lessonVO.getLessno());

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
	public LessonVO getALessonByLessno(String lessno) {
		
		LessonVO lessonVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALessonByLessno_STMT);

			pstmt.setString(1, lessno);
			rs = pstmt.executeQuery();
			while (rs.next()) {
			lessonVO = new LessonVO();
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
	public List<LessonVO> findLessonByLessonType(String lesstype) {
		List<LessonVO> list = new ArrayList<LessonVO>();
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
				list.add(lessonVO);

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

		return list;
	}
	
	@Override
	public ExpertiseVO getExpByExpno(String expno) {
		
		ExpertiseVO expVO=null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		try {
	
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ExpByExpno_STMT);
			pstmt.setString(1, expno);
			rs = pstmt.executeQuery();	
			
			while(rs.next()) {
				expVO = new ExpertiseVO();
				expVO.setExpno(rs.getString("expno"));
				expVO.setExpdesc(rs.getString("expdesc"));
			}
			
		}catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
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
		return expVO;
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
	
	public static byte[] getPictureByteArray(String path) throws IOException {
		File file = new File(path);//傳進來的檔案路徑 
		//先把檔案讀進程式裡面
		FileInputStream fis = new FileInputStream(file);//低階管相接
		ByteArrayOutputStream baos = new ByteArrayOutputStream();//BYTE陣列
		byte[] buffer = new byte[8192];
		int i;
		while ((i = fis.read(buffer)) != -1) {
			baos.write(buffer, 0, i);
		}
		baos.close();
		fis.close();

		return baos.toByteArray();//就可以把圖片讀進來的位元資料 放進去BYTE陣列
	}
	
	public static void main(String[] args) { 
		LessonDAO dao = new LessonDAO();
		
//		新增 (測試不放 可空的描述)
		LessonVO testInsert = new LessonVO();
		//自生LESSNO
		testInsert.setCoano("C004");
		testInsert.setLessname("MV舞蹈");
		testInsert.setLessmax(20);
		testInsert.setLessmin(5);
		
		testInsert.setLesscur(0);
		testInsert.setLesstype("EXP004");
		testInsert.setLessloc("大安森林公園");
		testInsert.setLessprice(2000);
		testInsert.setLessdesc(null);//描述TEST
		
		testInsert.setLessstart(java.sql.Date.valueOf("2020-07-01"));
		testInsert.setLessend(java.sql.Date.valueOf("2020-07-10"));
		testInsert.setLesssta("未成團");
		testInsert.setLesstimes(10);
		try {
			byte[] pic = getPictureByteArray("WebContent/imgs/dance.jpg");
			testInsert.setLesspic(pic);
		} catch (IOException e) {
			e.printStackTrace();
		}		
		dao.insert(testInsert);
		
		//修改 (測試只改狀態為下架)
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
//		testUpdate.setLessno("L013");
////		
//		dao.update(testUpdate);
//		System.out.println("修改成功");
		
		//用課程編號查課程
//		LessonVO test = dao.getALessonByLessno("L002");
//		System.out.println(test.getLesstimes());
		
		//用類型查詢課程
//		List<LessonVO> testAll = dao.findLessonByLessonType("EXP003");
//		for(LessonVO allTypeLesson:testAll) {
//		System.out.println(allTypeLesson.getCoano());
//		System.out.println(allTypeLesson.getLessname());
//		System.out.println(allTypeLesson.getLesstype());
//		}
		
		//用類型查出詳述描述
//		ExpertiseVO testGetTypeDesc = dao.getExpByExpno("EXP003");
//		System.out.println(testGetTypeDesc.getExpno());
//		System.out.println(testGetTypeDesc.getExpdesc());
		
		//查詢全部課程
//		List<LessonVO> testAllLesson = dao.getAll();
//		for(LessonVO allLesson:testAllLesson) {
//			System.out.print(allLesson.getLessno()+",");
//			System.out.print(allLesson.getCoano()+",");
//			System.out.print(allLesson.getLessname()+",");
//			System.out.print(allLesson.getLesstype()+",");
//			System.out.println(allLesson.getLessprice()+",....");
//			System.out.println("----------------");
//		}				
		
		//查詢某教練的課程資訊 印出JSONArray
//		JSONArray allLessonArray = dao.getCoachAllLesson("C002");
//		System.out.println(allLessonArray);
		
	}

}
