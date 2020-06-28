package com.activity_order.model;

import java.util.*;

import java.sql.*;

public class Activity_orderJDBCDAO {

	public static void main(String[] args) {
		Activity_orderDAO dao = new Activity_orderDAO();

		// 新增測試
		Activity_orderVO act_orVO1 = new Activity_orderVO();
		act_orVO1.setActno("A002");
		act_orVO1.setStuno("S005");
		act_orVO1.setAord_sc(4.8);
		act_orVO1.setAord_time(new Timestamp(System.currentTimeMillis()));
		dao.insert(act_orVO1);
		System.out.println("新增成功");

//		// 修改測試
//		Activity_orderVO act_orVO2 = new Activity_orderVO();
//		act_orVO2.setActno("A008");
//		act_orVO2.setStuno("S008");
//		act_orVO2.setAord_sc(2.2);
//		act_orVO2.setAord_no("20200611-AO013");
//		dao.update(act_orVO2);
//		System.out.println("修改成功");
//
//		// 刪除測試
//		dao.delete("20200611-AO014");
//		System.out.println("刪除成功");
//
//		// 查詢單筆測試
//		Activity_orderVO act_orVO3 = dao.findByPrimaryKey("20200611-AO013");
//		System.out.print(act_orVO3.getAord_no() + ",");
//		System.out.print(act_orVO3.getActno() + ",");
//		System.out.print(act_orVO3.getStuno() + ",");
//		System.out.print(act_orVO3.getAord_sc() + ",");
//		System.out.print(act_orVO3.getAord_time() + ",");
//		System.out.println("查詢單筆成功");
//
//		// 查詢多筆測試
//		List<Activity_orderVO> list = dao.getAll();
//		for (Activity_orderVO act_orVO4 : list) {
//			System.out.print(act_orVO4.getAord_no() + ",");
//			System.out.print(act_orVO4.getActno() + ",");
//			System.out.print(act_orVO4.getStuno() + ",");
//			System.out.print(act_orVO4.getAord_sc() + ",");
//			System.out.print(act_orVO4.getAord_time() + ",");
//			System.out.println("查詢多筆成功");
//		}
		// 單一查詢由活動編號查有多少學員報名
		List<Activity_orderVO> list1 = dao.findStudentByactno("A002");
		for (Activity_orderVO act_orVO5 : list1) {
			System.out.print(act_orVO5.getStuno() + ",");

		}
		// 單一查詢由學員編號查報名多少活動
		List<Activity_orderVO> list2 = dao.findActivityBystuno("S004");
		for (Activity_orderVO act_orVO6 : list2) {
			System.out.print(act_orVO6.getActno() + ",");
		}
	}
}
