package com.lessonTime.model;
import java.sql.Connection;
import java.util.*;

import org.json.JSONArray;

public interface LessonTimeDAO_inrterface {
	
	//課程新增同時(交易期 同CON) 同步新增多時段
	public void insert(Connection con,String next_lessNo,JSONArray Alldate);
	
	//改單筆時段 列出這個課程的所有時段 讓他選他要的改的時段
	public void update(String lessno);
	 
	//刪除用時段來刪  列出這個課程的所有時段 讓他選他刪掉的時段
	public void delete(String lessno);
	
	//查詢此教練 所有課程與所有時段 送JSONArray到servlet去比對
	public  JSONArray getCoachAllLesson(String coano);
	
	
}
