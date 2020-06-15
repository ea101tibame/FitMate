package com.activity_fav.model;

import java.sql.*;
import java.util.*;

import com.activity_order.model.Activity_orderVO;

public class Activity_favJDBCDAO {

	public static void main(String[] args) {
		Activity_favDAO dao = new Activity_favDAO();
		// 新增測試
		Activity_favVO act_favVO1 = new Activity_favVO();
		act_favVO1.setActno("A002");
		act_favVO1.setStuno("S003");
		dao.insert(act_favVO1);
		System.out.println("新增成功");

		// 修改測試
		Activity_favVO act_favVO2 = new Activity_favVO();
		act_favVO2.setActno("A007");
		act_favVO2.setStuno("S008");
		dao.update(act_favVO2);
		System.out.println("修改成功");

		// 刪除測試
		dao.delete("A002","S003");
		System.out.println("刪除成功");

		// 活動單一查詢找學員測試
		List<Activity_favVO> list1 = dao.findStudentByPrimaryKey("A007");
		for (Activity_favVO act_favVO3 : list1) {
		System.out.println(act_favVO3.getStuno());
		System.out.println("活動單一查詢找學員成功");
		}
		
		// 學員單一查詢找活動
		List<Activity_favVO> list2 = dao.findActivityByPrimaryKey("S002");
		for (Activity_favVO act_favVO4 : list2) {
		System.out.println(act_favVO4.getActno());
		System.out.println("學員單一查詢找活動成功");
		}
		
		//全部查詢
		List<Activity_favVO> list3 = dao.getAll();
		for (Activity_favVO act_favVO5 : list3) {
			System.out.print(act_favVO5.getActno() + ",");
			System.out.print(act_favVO5.getStuno() + ",");
			System.out.println("查詢多筆成功");
		}
	}

}
