package com.lessonTime.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.Date;

import org.json.JSONArray;
import org.json.JSONException;

import com.lessonDetail.model.LessonDetailDAO;

public class LessonTimeDAO implements LessonTimeDAO_inrterface{
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "EA101G5";
	String passwd = "123456";
	
	private static final String INSERT_STMT="INSERT INTO LESSON_TIME VALUES ('LT'||LPAD(to_char(LTIME_NO_seq.NEXTVAL), 3, '0'),?,?)";
	private static final String Get_AcoachAlltimes = "SELECT LTIME_DATE,LTIME_SS FROM LESSON JOIN LESSON_DETAIL ON LESSON_DETAIL.LESSNO=LESSON.LESSNO JOIN LESSON_TIME ON LESSON_TIME.LTIME_NO=LESSON_DETAIL.LTIME_NO WHERE COANO=?";
	@Override
	public void insert(Connection con, String next_lessNo, JSONArray Alldate) {
		try {
			PreparedStatement pstmt = null;
		//前端傳進來的時間日期 與資料庫進行比對
			//要傳入教練時間才合理
			LessonTimeDAO dao = new LessonTimeDAO();
			JSONArray dbdates = dao.getCoachAllLesson(coano);
			//傳入教練VO 他登入就有 跟著走的
			
		    String strFromDB; 
		    String strFromFront;
		     
		 	for(int i = 0 ; i <dbdates.length(); i++) {
		 		for(int j = 0; j< Alldate.length() ; j++) {
		 			strFromDB = dbdates.get(i).toString();
		 			 
		 			strFromFront = Alldate.get(j).toString();
		 				if(strFromDB.equals(strFromFront)) {
		 				System.out.print(dbdates.get(i).toString());
		 				System.out.print("時間重複了 無法開課");
		 				}else {
		 					
		 					//把下面那段新增貼近來
		 					
		 					
		 				}
		 		}
		 		
		 	}
			
		
			String next_ltime_no = null;
			String daystr = null;
//			String day[]= {"2020-06-06","2020-06-07","2020-06-08","2020-06-06","2020-06-09"};
			for(int i = 0; i<Alldate.length() ;i++) {
				String cols[] = {"LTIME_NO"};
			
			pstmt = con.prepareStatement(INSERT_STMT,cols);
			try {
				daystr = Alldate.get(i).toString();
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			//想辦法把daystr拆開放回去 1 跟 2 內
			
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
				LessonDetailDAO LDdao = new LessonDetailDAO();
				LDdao.insert(con, next_lessNo, next_ltime_no);
//			addLessonDetail(con,next_lessNo,next_ltime_no);
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

	@Override
	public void update(String lessno) {
		
	}

	@Override
	public void delete(String lessno) {
		
	}

	@Override
	public JSONArray getCoachAllLesson(String coano) {
		
		return null;
	}

}
