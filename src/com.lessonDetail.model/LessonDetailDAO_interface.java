package com.lessonDetail.model;

import java.sql.Connection;

public interface LessonDetailDAO_interface {
	
	//課程時段新增同時(交易期 同CON) 同步新增複合主鍵
	 public void insert(Connection con, String next_lessNo,String next_ltime_no);
	 
	 //修改某課程時段
     public void update(String lesson,String ltime_no);
     
     //刪除某課程時段
     public void delete(String lesson,String ltime_no);
	
	//查詢此課程所有時段
     public LessonDetailVO findByPrimaryKey(String lessno);
     
     
}
