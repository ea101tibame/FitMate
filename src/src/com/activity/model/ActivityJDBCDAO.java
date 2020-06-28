package com.activity.model;

import java.util.*;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.expertise.model.ExpVO;

import java.sql.*;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

public class ActivityJDBCDAO {
	// 傳圖片進資料庫方法
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

		ActivityDAO dao = new ActivityDAO();

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
//		ActivityVO actVO3 = dao.findByPrimaryKey("A022");
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
//		System.out.print(actVO3.getActpic() + ",");
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
//			System.out.println(actVO4.getActpic() + ",");
//			System.out.print(actVO4.getStuno() + ",");
//			System.out.println(actVO4.getCoano() + ",");
//			System.out.println("查詢多筆成功");
//		}
		// 單一查詢由專長編號找專長敘述
//		ExpertiseVO expVO1 = dao.findByExpertise("EXP001");
//		System.out.print(expVO1.getExpno());
//		System.out.println("單一查詢由專長編號找專長說明成功");

		// 由教練編號找到全部活動放入課表(轉JSON格式)測試
//		JSONArray allActivityArray = dao.getAllToCoachTable("C001");
//		System.out.println(allActivityArray);
//		System.out.println("由教練編號找到全部活動放入課表(轉JSON格式)成功");
		
		// 活動狀態更新 教練預約更新活動狀態開放報名
		List<ActivityVO> list = dao.update_sta_bycoach("C003");
		System.out.println("預約成功");
		
		//預約失敗或人數不足系統自動更新活動狀態
//		dao.update_sta_auto("A009");
//		System.out.println("下架成功");
	
	

		
	}
}
